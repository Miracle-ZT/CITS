package sfw.xmut.controller.user;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.mysql.cj.jdbc.MysqlDataSource;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.pojo.*;
import sfw.xmut.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/16 15:44
 **/
@Controller
@RequestMapping("/home")
public class HomeController {

    private long oneDayTime = 1000*60*60*24L;                   // 一天的毫秒数

    @Autowired
    private MovieService movieService;

    @Autowired
    private BannerService bannerService;

    @Autowired
    private CinemaService cinemaService;

    @Autowired
    private BrandService brandService;

    @Autowired
    private ScreeningService screeningService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request) throws TasteException {
        User user = (User) request.getSession().getAttribute("logined_user");
        List<Banner> bannerList = bannerService.findAll();

        Integer colNum = 7;                                 // 一排展示的电影数
        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("movieStatus",1);
        PageInfo<Movie> moviePageInfoBeing = movieService.findMovieList(queryMap);
        if (moviePageInfoBeing.getList().size() > colNum) moviePageInfoBeing.setList(moviePageInfoBeing.getList().subList(0,colNum));

        queryMap.put("movieStatus",0);
        PageInfo<Movie> moviePageInfoSoon = movieService.findMovieList(queryMap);
        if (moviePageInfoSoon.getList().size() > colNum) moviePageInfoSoon.setList(moviePageInfoSoon.getList().subList(0,colNum));

        // 今日热映部分数据
        queryMap.clear();
//        queryMap.put("today","today");
        // 需要一天内 有足够多个的电影订单 才能填满列表
        List<Map> movieListWithBO = movieService.findMovieListWithBO(queryMap);

        ModelAndView mv = new ModelAndView();                       // 登录成功
        mv.setViewName("user/home/index");                          // 进入首页     --直接跳转拼接后的 admin/index.jsp
        mv.addObject("user",user);
        mv.addObject("bannerList",bannerList);
        if (user != null){                                          // 已登录才获取推荐列表
            List<RecommendedItem> recommendedItemList = userCF(user.getId(),20);
            List<Movie> recommendedMovieList = new ArrayList<>();
            for(RecommendedItem recommendation:recommendedItemList){
                Movie movie = movieService.findMovieById((int) recommendation.getItemID());
                // 若为热映中的影片 才加入推荐
                if (movie.getMovieStatus() == 1) recommendedMovieList.add(movie);
            }
            if (recommendedMovieList.size() > colNum) recommendedMovieList = recommendedMovieList.subList(0,colNum);
            mv.addObject("recommendedMovieList",recommendedMovieList);
        }

        mv.addObject("moviePageInfoBeing",moviePageInfoBeing);
        mv.addObject("moviePageInfoSoon",moviePageInfoSoon);
        mv.addObject("movieListWithBO",movieListWithBO);
        mv.addObject("ac_home","active");
//        mv.addObject("include","welcome.jsp");          // 设置主页区域显示内容(被包含)
        return mv;
    }

    @RequestMapping(value = "/search_content")
    public ModelAndView search_content(HttpServletRequest request){
        String keyWord = request.getParameter("keyWord");

        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("keyWord","%" + keyWord + "%");
        queryMap.put("pageSize",Integer.MAX_VALUE);

        PageInfo<Movie> moviePageInfo = movieService.findMovieList(queryMap);
        List<Cinema> cinemaList = cinemaService.findCinemaList(queryMap);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/home/search_content");
        mv.addObject("keyWord",keyWord);
        mv.addObject("movieList",moviePageInfo.getList());
        mv.addObject("cinemaList",cinemaList);
        return mv;
    }

    @RequestMapping(value = "/movie")
    public ModelAndView index_movie(HttpServletRequest request,
                                    @RequestParam(name = "currPage",defaultValue = "1") Integer currPage,
                                    @RequestParam(name = "pageSize",defaultValue = "14") Integer pageSize,
                                    @RequestParam(name = "typeId",defaultValue = "0") Integer typeId,
                                    @RequestParam(name = "year",defaultValue = "0") Integer year
                                    ){
        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("currPage",currPage);
        queryMap.put("pageSize",pageSize);
        if (typeId != 0) queryMap.put("typeId",typeId);
        if (year != 0){
            queryMap.put("beginYear",year + "-01-01 00:00:00");
            queryMap.put("endYear",year + "-12-31 23:59:59");
        }
        PageInfo<Movie> moviePageInfo = movieService.findMovieList(queryMap);

        List<Type> typeList = typeService.findTypeList(new HashMap<>());

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/movie/index");
        mv.addObject("moviePageInfo",moviePageInfo);
        mv.addObject("nowTypeId",typeId);
        mv.addObject("nowYear",year);
        mv.addObject("typeList",typeList);
        mv.addObject("ac_movie","active");
        return mv;
    }

    @RequestMapping(value = "/cinema")
    public ModelAndView index_cinema(HttpServletRequest request,
                                     @RequestParam(name = "brandId",defaultValue = "0") Integer brandId

    ){
        Map<String,Object> queryMap = new HashMap<>();
        List<Brand> brandList = brandService.findBrandList(queryMap);
        if (brandId != 0) queryMap.put("brandId",brandId);
        List<Cinema> cinemaList = cinemaService.findCinemaList(queryMap);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/cinema/index");
        mv.addObject("nowBrandId",brandId);
        mv.addObject("brandList",brandList);
        mv.addObject("cinemaList",cinemaList);
        mv.addObject("ac_cinema","active");
        return mv;
    }

    @RequestMapping(value = "/cinema_detail")
    public ModelAndView cinema_detail(HttpServletRequest request,
                                      @RequestParam(name = "cinemaId",defaultValue = "0") Integer cinemaId){

        Map<String, Object> queryMap = new HashMap<>();
        Cinema cinema = cinemaService.findCinemaById(cinemaId);
        queryMap.put("cinemaId",cinemaId);

        LinkedHashMap<String,String> dateTextMap = new LinkedHashMap<>();   // 后七天的日期元素的文本
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
        Date date = new Date();
        for (int i = 0;i < 7;i++){
            String week = "";
            switch (i){
                case 0:
                    week = "今天";
                    break;
                case 1:
                    week = "明天";
                    break;
                case 2:
                    week = "后天";
                    break;
                case 3:
                    week = sdf.format(date);
                    break;
                case 4:
                    week = sdf.format(date);
                    break;
                case 5:
                    week = sdf.format(date);
                    break;
                case 6:
                    week = sdf.format(date);
                    break;
            }
            String eachDate = DateFormatUtils.format(date,"yyyy-MM-dd");
            dateTextMap.put(week ,eachDate);
            date.setTime(date.getTime()+oneDayTime);
        }

        // 只显示七天内有场次的电影
        // 从当前日期开始
        queryMap.put("startTime",DateFormatUtils.format(new Date(),"yyyy-MM-dd"));
        // 从七天后日期结束 借用上一步求七日文本的过程中的Date对象来获取
        queryMap.put("endTime",DateFormatUtils.format(date,"yyyy-MM-dd"));
        List<Movie> movieList = movieService.findMovieWithList(queryMap);

        date = new Date();
        String startTime = DateFormatUtils.format(date,"yyyy-MM-dd HH:mm:ss");  // 默认起始时间(当天)
        queryMap.put("startTime",startTime);
        date.setTime(date.getTime()+oneDayTime);
        String endTime = DateFormatUtils.format(date,"yyyy-MM-dd") + " 00:00:00";  // 默认结束时间(当天)
        queryMap.put("endTime",endTime);
        // Fixed error in home_cinema when enter a cinema_detail which haven't the screening
        queryMap.put("movieId",movieList.size()>0 ? movieList.get(0).getMovieId() : 0);          // 默认场次列表显示的是存在电影列表的第一个电影的场次
        List<Screening> screeningList = screeningService.findScreeningList(queryMap);
//        for (Screening screening:screeningList){
//            System.out.println("getLanName=" + screening.getLanguage().getLanName());
//        }
//        System.out.println("screeningList" + screeningList);
//        System.out.println("queryMap:" + queryMap);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/cinema/cinema_detail");
        mv.addObject("cinema",cinema);
        mv.addObject("movieList",movieList);
        mv.addObject("screeningList",screeningList);
        mv.addObject("dateTextMap",dateTextMap);
        return mv;
    }

    @RequestMapping(value = "/top")
    public ModelAndView index_top(HttpServletRequest request){
        // 限制条数
        Integer colNum = 10;

        // 牛犇啊家人们
        List<Map> movieAvgScoreMapList = movieService.findMovieListWithAvgScore();
        List<Map> movieListWithBO = movieService.findMovieListWithBO(new HashMap<>());
        if (movieAvgScoreMapList.size() > colNum) movieAvgScoreMapList = movieAvgScoreMapList.subList(0,colNum);
        if (movieListWithBO.size() > colNum) movieListWithBO = movieListWithBO.subList(0,colNum);
//        System.out.println(movieAvgScoreMapList);
//        System.out.println(movieListWithBO);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/top/index");
        mv.addObject("movieAvgScoreMapList",movieAvgScoreMapList);
        mv.addObject("movieListWithBO",movieListWithBO);
        mv.addObject("ac_top","active");
        return mv;
    }

    @RequestMapping(value = "/news")
    public ModelAndView index_news(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/home/index");
        mv.addObject("ac_news","active");
        return mv;
    }

    @RequestMapping(value = "/movie_detail")
    public ModelAndView movie_detail(HttpServletRequest request){
        Integer movieId = Integer.valueOf(request.getParameter("movieId"));
        Movie movie = movieService.findMovieById(movieId);
        // 累计票房数
        Long movieBO = movieService.findBOWithMovieId(movieId);
        // 手动改值 持久层查询结果为N/A 赋给Long(不能是long--报错)的结果为null
        if (movieBO == null) movieBO = 0L;

        // 格式化Double为一位小数的字符串
        double movieAvgScore = movieService.findAvgScoreWithMovieId(movieId);
        BigDecimal bd = new BigDecimal(movieAvgScore);
        movieAvgScore = bd.setScale(1, RoundingMode.HALF_UP).doubleValue();

        if (movie == null){
            ModelAndView mv = new ModelAndView();
            mv.setViewName("common/error");
            return mv;
        }

        // 获取 "相关电影" 列表
        List<Movie> relevantMovieList = new ArrayList<>();
        Map<String, Object> queryMap = new HashMap<>();
        for(Type tempType:movie.getTypeList()){
            // 每轮查询一个类型的电影
//            queryMap.clear();
            queryMap.put("typeId",tempType.getTypeId());
            List<Movie> tempMovieList = movieService.findMovieList(queryMap).getList();
            // 打乱顺序
            Collections.shuffle(tempMovieList);
            // 取部分
//            if (tempMovieList.size() > 3) tempMovieList=tempMovieList.subList(0,3);
            // 循环加入
            for (Movie tempMovie:tempMovieList){
                // 判断是否重复或为其本身
                if (!relevantMovieList.contains(tempMovie) && (tempMovie.getMovieId()!=movie.getMovieId())){
                    relevantMovieList.add(tempMovie);
                }
            }
        }
        Collections.shuffle(relevantMovieList);                     // 乱序
        if (relevantMovieList.size() > 9) relevantMovieList=relevantMovieList.subList(0,9);

        // 获取 "热门短评" 列表
        List<Comment> commentList = commentService.findCommentListByMovieId(movieId);
        if (commentList.size() > 6) commentList=commentList.subList(0,6);

        // 标记是否为发布评论后再次刷新进入 影响是否显示toast通知
        String isRefresh = request.getParameter("isRefresh");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/movie/movie_detail");
        mv.addObject("movie",movie);
        mv.addObject("movieBO",movieBO);
        mv.addObject("movieAvgScore",movieAvgScore);
        mv.addObject("relevantMovieList",relevantMovieList);
        mv.addObject("commentList",commentList);
        if ((isRefresh != null) && isRefresh.equals("true")){
            mv.addObject("isRefresh",1);
        }else{
            mv.addObject("isRefresh",0);
        }
        return mv;
    }

    @RequestMapping(value = "/purchase")
    public ModelAndView movie_purchase(HttpServletRequest request){
        Integer movieId = Integer.valueOf(request.getParameter("movieId"));
        Movie movie = movieService.findMovieById(movieId);
        if (movie == null){                                 // 未查询到指定movie
            ModelAndView mv = new ModelAndView();
            mv.setViewName("common/error");
            return mv;
        }
        Map<String, Object> queryMap = new HashMap<String, Object>();
        Date date = new Date();                             // 当前时间

        String startTime = DateFormatUtils.format(date,"yyyy-MM-dd HH:mm:ss");  // 起始时间
        queryMap.put("startTime",startTime);
        date.setTime(date.getTime()+oneDayTime);
        String endTime = DateFormatUtils.format(date,"yyyy-MM-dd") + " 00:00:00";  // 结束时间
        queryMap.put("endTime",endTime);
        queryMap.put("movieId",movie.getMovieId());
        List<Cinema> cinemaList = cinemaService.findCinemaListWithScreening(queryMap);

        String movieDate = DateFormatUtils.format(movie.getReleaseDate(),"yyyy-MM-dd");
        LinkedHashMap<String,String> dateTextMap = new LinkedHashMap<>();   // 后七天的日期元素的文本
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
        date = new Date();                                                  // 重置为当前时间
        for (int i = 0;i < 7;i++){
            String week = "";
            switch (i){
                case 0:
                    week = "今天";
                    break;
                case 1:
                    week = "明天";
                    break;
                case 2:
                    week = "后天";
                    break;
                case 3:
                    week = sdf.format(date);
                    break;
                case 4:
                    week = sdf.format(date);
                    break;
                case 5:
                    week = sdf.format(date);
                    break;
                case 6:
                    week = sdf.format(date);
                    break;
            }
            String eachDate = DateFormatUtils.format(date,"yyyy-MM-dd");
            dateTextMap.put(week ,eachDate);
            date.setTime(date.getTime()+oneDayTime);
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/movie/cinema_list");
        mv.addObject("movieDate",movieDate);
        mv.addObject("dateTextMap",dateTextMap);
        mv.addObject("movie",movie);
        mv.addObject("cinemaList",cinemaList);
        return mv;
    }

    // 刷新符合条件的影院列表
    @RequestMapping(value = "/refresh_cinema_list",method = RequestMethod.POST)
    @ResponseBody
    public Map refresh_cinema(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer movieId = Integer.valueOf(request.getParameter("movieId"));
        Integer spanDate = Integer.valueOf(map.get("spanDate"));
        Map<String, Object> queryMap = new HashMap<String, Object>();   // 请求Map
        Date date = new Date();                                         // 刷新日期

        if(spanDate == 0){
            String startTime = DateFormatUtils.format(date,"yyyy-MM-dd HH:mm:ss");  // 起始时间
            queryMap.put("startTime",startTime);

            date.setTime(date.getTime()+oneDayTime);
            String endTime = DateFormatUtils.format(date,"yyyy-MM-dd") + " 00:00:00";  // 结束时间
            queryMap.put("endTime",endTime);
        }else{
            date.setTime(date.getTime()+oneDayTime*spanDate);
            String startTime = DateFormatUtils.format(date,"yyyy-MM-dd") + " 00:00:00";  // 起始时间
            queryMap.put("startTime",startTime);
            date.setTime(date.getTime()+oneDayTime);
            String endTime = DateFormatUtils.format(date,"yyyy-MM-dd") + " 00:00:00";  // 结束时间
            queryMap.put("endTime",endTime);
        }

        queryMap.put("movieId",movieId);
        List<Cinema> cinemaList = cinemaService.findCinemaListWithScreening(queryMap);
//        System.out.println(cinemaList);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("cinemaList",cinemaList);
        return resultMap;
    }

    // 刷新符合条件的场次列表
    @RequestMapping(value = "/refresh_screening_list",method = RequestMethod.POST)
    @ResponseBody
    public Map refresh_screening(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));
        Integer movieId = Integer.valueOf(map.get("movieId"));
        Integer spanDate = Integer.valueOf(map.get("spanDate"));

        Map<String, Object> queryMap = new HashMap<String, Object>();   // 请求Map
        Date date = new Date();                                         // 刷新日期

        if(spanDate == 0){
            String startTime = DateFormatUtils.format(date,"yyyy-MM-dd HH:mm:ss");  // 起始时间
            queryMap.put("startTime",startTime);

            date.setTime(date.getTime()+oneDayTime);
            String endTime = DateFormatUtils.format(date,"yyyy-MM-dd") + " 00:00:00";  // 结束时间
            queryMap.put("endTime",endTime);
        }else{
            date.setTime(date.getTime()+oneDayTime*spanDate);
            String startTime = DateFormatUtils.format(date,"yyyy-MM-dd") + " 00:00:00";  // 起始时间
            queryMap.put("startTime",startTime);
            date.setTime(date.getTime()+oneDayTime);
            String endTime = DateFormatUtils.format(date,"yyyy-MM-dd") + " 00:00:00";  // 结束时间
            queryMap.put("endTime",endTime);
        }
        queryMap.put("movieId",movieId);
        queryMap.put("cinemaId",cinemaId);

        List<Screening> screeningList = screeningService.findScreeningList(queryMap);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("screeningList",screeningList);
        return resultMap;
    }

    // 新增留言
    @RequestMapping(value = "/add_message",method = RequestMethod.POST)
    @ResponseBody
    public Map add_message(HttpServletRequest request, @RequestParam Map<String,String> map){
        User logined_user = (User) request.getSession().getAttribute("logined_user");
        Integer cinemaId = Integer.valueOf(map.get("cinemaId"));
        String msgStr = map.get("msgStr");

        System.out.println(msgStr);
        System.out.println(cinemaId);
        Message message = new Message(null,cinemaId,logined_user.getId(),msgStr,new Date(),0);
        if (messageService.add(message) > 0){
            System.out.println("添加成功");
        }
        else {
            System.out.println("添加失败");
        }

        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }

    // 协同过滤推荐
    public List<RecommendedItem> userCF(long userId,int recommendNum) throws TasteException {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName("localhost");
        dataSource.setUser("root");
        dataSource.setPassword("root");
        dataSource.setDatabaseName("cits");
        // 实例化DataModel并将数据传入其内
        DataModel dataModel = new MySQLJDBCDataModel(dataSource,"preference",
                "user_id","movie_id",
                "preference_val",null);

        // userCF
        // 计算相似度
        UserSimilarity similarity=new PearsonCorrelationSimilarity(dataModel);
//        System.out.println("similarity = " + similarity);
        UserNeighborhood neighborhood=new NearestNUserNeighborhood(30,similarity,dataModel);
//        UserNeighborhood neighborhood = new ThresholdUserNeighborhood(3.0, similarity, dataModel);
        // 构建推荐器，使用基于用户的协同过滤推荐
        Recommender recommender=new GenericUserBasedRecommender(dataModel,neighborhood,similarity);
        // the Recommender.recommend() method's arguments:  first one is the user id;
        //                                                  the second one is the number recommended
        List<RecommendedItem> recommendations=recommender.recommend(userId,recommendNum);
        System.out.println("size=" + recommendations.size());
        for(RecommendedItem recommendation:recommendations){
            System.out.println(recommendation);
        }

        return recommendations;
    }

    // 前端的ajax请求 获取用户的登录状态
    @RequestMapping(value = "/isLogin",method = RequestMethod.POST)
    @ResponseBody
    public Map isLogin(HttpServletRequest request, @RequestParam Map<String,String> map){
        Map<String, Object> resultMap = new HashMap<>();

        Object user = request.getSession().getAttribute("logined_user");
        if (user != null){
            resultMap.put("isLogin","true");
            resultMap.put("userId",((User)user).getId());
        }
        else{
            resultMap.put("isLogin","false");
        }
        return resultMap;
    }

    @RequestMapping(value = "/public_comment")
    public void public_comment(HttpServletRequest request, HttpServletResponse response,
                               @RequestParam("score") Integer score,
                               @RequestParam("comment-content") String commentContent
    ) throws IOException {
        Integer movieId = Integer.valueOf(request.getParameter("movieId"));
        Integer userId = Integer.valueOf(request.getParameter("userId"));

        Comment comment = new Comment(null,movieId,userId,new Date(),score,commentContent,0,0);

        if (commentService.add(comment) > 0){
            System.out.println("添加成功");
        }
        else {
            System.out.println("添加失败");
        }

        response.sendRedirect(request.getContextPath() + "/home/movie_detail?movieId=" + movieId + "&isRefresh=true");
    }


    // 前端用户单击点赞按钮后的操作
    @RequestMapping(value = "/clickLike",method = RequestMethod.POST)
    @ResponseBody
    public Map clickLike(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer userId = Integer.valueOf(map.get("userId"));
        Integer commentId = Integer.valueOf(map.get("commentId"));
        Map<String, Object> queryMap = new HashMap<String, Object>();
        queryMap.put("userId",userId);
        queryMap.put("commentId",commentId);

        // 操作结束后 图标应该有的样式 交由前端据此去渲染
        // 0 = 未赞   1 = 赞
        int actionSign = commentService.clickLike(queryMap);

        Comment comment = commentService.findCommentById(commentId);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("comment",comment);
        resultMap.put("actionSign",actionSign);
        return resultMap;
    }

    // 判断用户是否对某一条评论进行点赞
    @RequestMapping(value = "/checkLike",method = RequestMethod.POST)
    @ResponseBody
    public Map checkLike(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer userId = Integer.valueOf(map.get("userId"));
        Integer commentId = Integer.valueOf(map.get("commentId"));
        Map<String, Object> queryMap = new HashMap<String, Object>();
        queryMap.put("userId",userId);
        queryMap.put("commentId",commentId);

        Integer isLike = commentService.checkLike(queryMap);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("isLike",isLike);
        return resultMap;
    }

}

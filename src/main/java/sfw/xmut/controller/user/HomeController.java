package sfw.xmut.controller.user;

import com.fasterxml.jackson.databind.ObjectMapper;
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

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request) throws TasteException {
        User user = (User) request.getSession().getAttribute("logined_user");
        List<Banner> bannerList = bannerService.findAll();
        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("movieStatus",1);
        List<Movie> movieListBeing = movieService.findMovieList(queryMap);
        queryMap.put("movieStatus",0);
        List<Movie> movieListSoon = movieService.findMovieList(queryMap);

        // 今日热映部分数据
        queryMap.clear();
//        queryMap.put("today","today");
        List<Map> movieListWithBO = movieService.findMovieListWithBO(queryMap);

//        List<RecommendedItem> recommendedItemList = userCF(user.getId(),7);
//        List<Movie> recommendedMovieList = new ArrayList<>();
//        for(RecommendedItem recommendation:recommendedItemList){
//            recommendedMovieList.add(movieService.findMovieById((int) recommendation.getItemID()));
//        }

        ModelAndView mv = new ModelAndView();                       // 登录成功
        mv.setViewName("user/home/index");                          // 进入首页     --直接跳转拼接后的 admin/index.jsp
        mv.addObject("user",user);
        mv.addObject("bannerList",bannerList);
        mv.addObject("recommendedMovieList",movieListBeing);
        mv.addObject("movieListBeing",movieListBeing);
        mv.addObject("movieListSoon",movieListSoon);
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

        List<Movie> movieList = movieService.findMovieList(queryMap);
        List<Cinema> cinemaList = cinemaService.findCinemaList(queryMap);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/home/search_content");
        mv.addObject("keyWord",keyWord);
        mv.addObject("movieList",movieList);
        mv.addObject("cinemaList",cinemaList);
        return mv;
    }

    @RequestMapping(value = "/movie")
    public ModelAndView index_movie(HttpServletRequest request){

        List<Type> typeList = typeService.findTypeList(new HashMap<>());

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/movie/index");
        mv.addObject("typeList",typeList);
        mv.addObject("ac_movie","active");
        return mv;
    }

    @RequestMapping(value = "/cinema")
    public ModelAndView index_cinema(HttpServletRequest request){
        Map<String,Object> queryMap = new HashMap<>();
        List<Brand> brandList = brandService.findBrandList(queryMap);
        List<Cinema> cinemaList = cinemaService.findCinemaListWithScreening(queryMap);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/cinema/index");
        mv.addObject("brandList",brandList);
        mv.addObject("cinemaList",cinemaList);
        mv.addObject("ac_cinema","active");
        return mv;
    }

    @RequestMapping(value = "/cinema_detail")
    public ModelAndView cinema_detail(HttpServletRequest request){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));
        Map<String, Object> queryMap = new HashMap<>();
        Cinema cinema = cinemaService.findCinemaById(cinemaId);
        queryMap.put("cinemaId",cinemaId);
        List<Movie> movieList = movieService.findMovieWithList(queryMap);

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

        date = new Date();
        String startTime = DateFormatUtils.format(date,"yyyy-MM-dd HH:mm:ss");  // 默认起始时间(当天)
        queryMap.put("startTime",startTime);
        date.setTime(date.getTime()+oneDayTime);
        String endTime = DateFormatUtils.format(date,"yyyy-MM-dd") + " 00:00:00";  // 默认结束时间(当天)
        queryMap.put("endTime",endTime);
        queryMap.put("movieId",movieList.get(0).getMovieId());          // 默认场次列表显示的是存在电影列表的第一个电影的场次
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
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/home/index");
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
        System.out.println(movieId);
        Movie movie = movieService.findMovieById(movieId);
        if (movie == null){
            ModelAndView mv = new ModelAndView();
            mv.setViewName("common/error");
            return mv;
        }
        String movieDate = DateFormatUtils.format(movie.getReleaseDate(),"yyyy-MM-dd");      // 单独获取上映时间并格式化
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/movie/movie_detail");
        mv.addObject("movieDate",movieDate);
        mv.addObject("movie",movie);
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

    public List<RecommendedItem> userCF(long userId,int recommendNum) throws TasteException {
        System.out.println("111111111");
        MysqlDataSource dataSource = new MysqlDataSource();
        System.out.println("222222222");
        dataSource.setServerName("localhost");
        System.out.println("333333333");
        dataSource.setUser("root");
        dataSource.setPassword("root");
        dataSource.setDatabaseName("cits");
        System.out.println("==========");

        // 实例化DataModel并将数据传入其内
        DataModel dataModel = new MySQLJDBCDataModel(dataSource,"preference","user_id","movie_id","preference_val",null);

        // userCF
        UserSimilarity similarity=new PearsonCorrelationSimilarity(dataModel);
//        System.out.println("similarity = " + similarity);
        UserNeighborhood neighborhood=new NearestNUserNeighborhood(30,similarity,dataModel);
//        UserNeighborhood neighborhood = new ThresholdUserNeighborhood(3.0, similarity, dataModel);
        Recommender recommender=new GenericUserBasedRecommender(dataModel,neighborhood,similarity);
        // the Recommender.recommend() method's arguments: first one is the user id;
        //     the second one is the number recommended
        List<RecommendedItem> recommendations=recommender.recommend(userId,recommendNum);
        System.out.println("size=" + recommendations.size());
        for(RecommendedItem recommendation:recommendations){
            System.out.println(recommendation);
        }

        return recommendations;
    }
}

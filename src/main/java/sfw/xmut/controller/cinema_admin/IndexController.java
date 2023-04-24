package sfw.xmut.controller.cinema_admin;

import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.pojo.*;
import sfw.xmut.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/13 0:55
 **/
@Controller
@RequestMapping("/cinema_admin")
public class IndexController {
    // 此controller中所有方法 获取指定页面中需要的元素
    // 将之统一传递至menu_bar.jsp
    // 并通过 include 指定 content区 中的展示页面
    // 也就是说 通过mv传递的参数 在view中的<jsp:include>页面 可以直接使用 即便无关键字提示
    // controller -> menu_bar.jsp(include -> xxx.jsp)

    private long oneDayTime = 1000*60*60*24L;                   // 一天的毫秒数

    @Autowired
    CinemaService cinemaService;

    @Autowired
    BrandService brandService;

    @Autowired
    MovieService movieService;

    @Autowired
    RoomService roomService;

    @Autowired
    ScreeningService screeningService;

    @Autowired
    OrdersService ordersService;

    @Autowired
    MessageService messageService;

    @Autowired
    LanguageService languageService;

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));
        Cinema cinema = cinemaService.findCinemaById(cinemaId);

        ModelAndView mv = new ModelAndView();
        getMessageListAndPutIn(cinemaId,mv);
        mv.setViewName("cinema_admin/menu_bar");
        mv.addObject("cinema",cinema);
        mv.addObject("include","cinema_info.jsp");
        return mv;
    }

    // 图表数据
    @RequestMapping(value = "/chart_data",method = RequestMethod.POST)
    @ResponseBody
    public Map chart_data(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));

        List<Long> eachPerson = new ArrayList<>();                   // 人数List
        List<Long> eachPrice = new ArrayList<>();                    // 人数List
        List<String> eachDateText = new ArrayList<>();                  // 后七天的日期元素的文本

        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("cinemaId",cinemaId);
        Date date = new Date();
        date.setTime(date.getTime()-oneDayTime*6);
        String week = "";
        for (int i = 0;i < 7;i++){
            eachDateText.add(DateFormatUtils.format(date,"MM-dd"));

            queryMap.put("orderFrom",DateFormatUtils.format(date,"yyyy-MM-dd"));
            date.setTime(date.getTime()+oneDayTime);
            queryMap.put("orderTo",DateFormatUtils.format(date,"yyyy-MM-dd"));
            eachPerson.add(ordersService.countPerson(queryMap));
            eachPrice.add(ordersService.countPrice(queryMap));
        }

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("eachDateText",eachDateText);
        resultMap.put("eachPerson",eachPerson);
        resultMap.put("eachPrice",eachPrice);
        return resultMap;
    }

    // 统计数据
    @RequestMapping(value = "/stats_data",method = RequestMethod.POST)
    @ResponseBody
    public Map stats_data(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));

        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("cinemaId",cinemaId);

        Long totalScreening = screeningService.totalNumByCinemaId(cinemaId);
        Long totalPerson = ordersService.countPerson(queryMap);
        Long totalPrice = ordersService.countPrice(queryMap);
        Integer runTime = cinemaService.runTime(cinemaId);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("totalScreening",totalScreening);
        resultMap.put("totalPerson",totalPerson);
        resultMap.put("totalPrice",totalPrice);
        resultMap.put("runTime",runTime);
        return resultMap;
    }

    @RequestMapping(value = "/cinema_info_edit")
    public ModelAndView cinema_info_edit(HttpServletRequest request){
        Cinema cinema = cinemaService.findCinemaById(Integer.valueOf(request.getParameter("cinemaId")));
        List<Brand> brandList = brandService.findBrandList(new HashMap<>());

        ModelAndView mv = new ModelAndView();
        mv.setViewName("cinema_admin/menu_bar");
        getMessageListAndPutIn(cinema.getCinemaId(),mv);
        mv.addObject("cinema",cinema);
        mv.addObject("brandList",brandList);
        mv.addObject("include","cinema_info_edit.jsp");
        return mv;
    }

    // 更新影院基本信息
    @RequestMapping(value = "/cinema_info_update")
    public void cinema_info_update(HttpServletRequest request, HttpServletResponse response,
                                           @RequestParam("name") String name,
                                           @RequestParam("address") String address,
                                           @RequestParam("brandId") Integer brandId,
                                           @RequestParam("acname") String acname,
                                           @RequestParam("acemail") String acemail,
                                           @RequestParam("city") String city,
                                           @RequestParam("phone") String phone) throws IOException {
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));

        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("name",name);
        queryMap.put("acemail",acemail);
        queryMap.put("address",address);
        queryMap.put("brandId",brandId);
        queryMap.put("acname",acname);
        queryMap.put("city",city);
        queryMap.put("phone",phone);
        queryMap.put("cinemaId",cinemaId);

        if (cinemaService.edit(queryMap) > 0){
            System.out.println("更新成功");
        }
        else {
            System.out.println("更新失败");
        }
        response.sendRedirect(request.getContextPath() + "/cinema_admin/index?cinemaId=" + cinemaId);
    }

    @RequestMapping(value = "/movie_list")
    public ModelAndView movie_list(HttpServletRequest request){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));
        Cinema cinema = cinemaService.findCinemaById(cinemaId);
        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("cinemaId",cinemaId);
        List<Movie> movieList = movieService.findMovieWithList(queryMap);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("cinema_admin/menu_bar");
        getMessageListAndPutIn(cinemaId,mv);
        mv.addObject("movieList",movieList);
        mv.addObject("cinema",cinema);
        mv.addObject("include","movie_list.jsp");
        return mv;
    }


    @RequestMapping(value = "/room_list")
    public ModelAndView room_list(HttpServletRequest request){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));
        Cinema cinema = cinemaService.findCinemaById(cinemaId);
        String keyWord = "";

        Map<String,Object> queryMap = new HashMap<>();
        // 查询 所属此影院的所有影厅
        queryMap.put("cinemaId",cinemaId);
        if (request.getParameter("searchText") != null){        // keyWord为有效值才加入queryMap
            keyWord = request.getParameter("searchText");
            queryMap.put("keyWord","%" + keyWord + "%");
        }

        List<Room> roomList = roomService.findRoomList(queryMap);
        ModelAndView mv = new ModelAndView();
        getMessageListAndPutIn(cinemaId,mv);
        mv.setViewName("cinema_admin/menu_bar");
        mv.addObject("roomList",roomList);
        mv.addObject("cinema",cinema);
        mv.addObject("include","room_list.jsp");
        return mv;
    }

    // model-dialog显示影厅详情
    @RequestMapping(value = "/layout_detail",method = RequestMethod.POST)
    @ResponseBody
    public Map layout_detail(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer roomId = Integer.valueOf(map.get("roomId"));
        Room room = roomService.findRoomById(roomId);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("room",room);
        return resultMap;
    }

    // 根据前端提交的布局字符串 更新数据库中的值 并刷新当前页面的旧资料
    @RequestMapping(value = "/submit_update_room",method = RequestMethod.POST)
    @ResponseBody
    public Map submit_update_room(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer roomId = Integer.valueOf(request.getParameter("roomId"));
        String newSeats = map.get("newSeats");
        String roomName = map.get("roomName");
        String roomRow = map.get("roomRow");
        String roomCol = map.get("roomCol");

        // room的dao层方法，修改数据库
        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("roomId",roomId);
        queryMap.put("roomName",roomName);
        queryMap.put("roomRow",roomRow);
        queryMap.put("roomCol",roomCol);
        queryMap.put("newSeats",newSeats);

        if (roomService.updateLayout(queryMap) > 0){
            System.out.println("更新成功");
        }
        else {
            System.out.println("更新失败");
        }

        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }

    // 根据前端提交的布局字符串 新增影厅
    @RequestMapping(value = "/add_room",method = RequestMethod.POST)
    @ResponseBody
    public Map add_room(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));
        String newSeats = map.get("newSeats");
        String roomName = map.get("roomName");
        Integer roomRow = Integer.valueOf(map.get("roomRow"));
        Integer roomCol = Integer.valueOf(map.get("roomCol"));

        System.out.println("cinemaId=" + cinemaId);
        System.out.println("newSeats=" + newSeats);
        System.out.println("roomName=" + roomName);
        System.out.println("roomRow=" + roomRow);
        System.out.println("roomCol=" + roomCol);

        //room的dao层方法，新增
        Room room = new Room(null,roomName,roomRow,roomCol,newSeats,cinemaId);

        if (roomService.add(room) > 0){
            System.out.println("新增成功");
        }
        else {
            System.out.println("新增失败");
        }

        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }

    @RequestMapping(value = "/screening_list")
    public ModelAndView screening_list(HttpServletRequest request,
                                       @RequestParam(name = "currPage",defaultValue = "1") Integer currPage,
                                       @RequestParam(name = "pageSize",defaultValue = (Integer.MAX_VALUE + "")) Integer pageSize
    ){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));
        Cinema cinema = cinemaService.findCinemaById(cinemaId);

        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("cinemaId",cinemaId);
        List<Screening> screeningList = screeningService.findScreeningList(queryMap);

        queryMap.put("movieStatus",1);
        queryMap.put("currPage",currPage);
        queryMap.put("pageSize",pageSize);
        PageInfo<Movie> moviePageInfo = movieService.findMovieList(queryMap);

        List<Room> roomList = roomService.findRoomList(queryMap);
        List<Language> languageList = languageService.findLanguageList(queryMap);


        ModelAndView mv = new ModelAndView();
        mv.setViewName("cinema_admin/menu_bar");
        getMessageListAndPutIn(cinemaId,mv);
        mv.addObject("screeningList",screeningList);
        mv.addObject("movieList",moviePageInfo.getList());
        mv.addObject("roomList",roomList);
        mv.addObject("languageList",languageList);
        mv.addObject("cinema",cinema);
        mv.addObject("include","screening_list.jsp");
        return mv;
    }

    // 新增场次
    @RequestMapping("/add_screening")
    public void add_screening(HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam("add-movie-id") Integer movieId,
                                  @RequestParam("add-room-id") Integer roomId,
                                  @RequestParam("add-language-id") Integer languageId,
                                  @RequestParam("add-screening-date") String screeningDate,
                                  @RequestParam("add-startTime") String start,
                                  @RequestParam("add-endTime") String end,
                                  @RequestParam("add-price") float price
    ) throws IOException {
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));

        Room room = roomService.findRoomById(roomId);
        Seat seat = new Seat(room.getRoomRow(),room.getRoomCol(),room.getLayout());
        if (screeningService.generateSeat(seat) > 0){
            System.out.println("布局新增成功");
        }
        else {
            System.out.println("布局新增失败");
        }

        Date startTime = new Date();
        Date endTime = new Date();
        String startTimeText = screeningDate + " " + start;
        String endTimeText = screeningDate + " " + end;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            startTime = format.parse(startTimeText);
            endTime = format.parse(endTimeText);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Screening screening = new Screening(cinemaId,movieId,languageId,price,roomId,startTime,endTime,seat.getSeatId());

        if (screeningService.add(screening) > 0){
            System.out.println("新增成功");
        }
        else {
            System.out.println("新增失败");
        }
        response.sendRedirect(request.getContextPath() + "/cinema_admin/screening_list?cinemaId=" + cinemaId);
    }

    @RequestMapping(value = "/order_list")
    public ModelAndView order_list(HttpServletRequest request){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));
        Cinema cinema = cinemaService.findCinemaById(cinemaId);
        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("cinemaId",cinemaId);
        List<Orders> ordersList = ordersService.findOrdersList(queryMap);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("cinema_admin/menu_bar");
        getMessageListAndPutIn(cinemaId,mv);
        mv.addObject("ordersList",ordersList);
        mv.addObject("cinema",cinema);
        mv.addObject("include","order_list.jsp");
        return mv;
    }

    // 根据前端提交的条件值 搜索数据库中符合条件的值 并刷新当前页面的旧订单列表
    @RequestMapping(value = "/refresh_order_list",method = RequestMethod.POST)
    @ResponseBody
    public Map refresh_order_list(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));
        String order_num = map.get("order_num");
        String order_username = map.get("order_username");
        String order_status = map.get("order_status");
        String order_from = map.get("order_from");
        String order_to = map.get("order_to");

        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("cinemaId",cinemaId);
        if (!order_num.equals("")){
            queryMap.put("orderNum",order_num);
        }
        if (!order_username.equals("")){
            queryMap.put("username",order_username);
        }
        if (!order_status.equals("-1")){
            queryMap.put("status",order_status);
        }
        if (!order_from.equals("")){
            String[] temp = order_from.split("/");
            order_from = temp[2] + "-" + temp[1] + "-" + temp[0];
            queryMap.put("orderFrom",order_from);
        }
        if (!order_to.equals("")){
            String[] temp = order_to.split("/");
            order_to = temp[2] + "-" + temp[1] + "-" + temp[0] + " 23:59:59";   // 使得 天数层面的 "右闭"
            queryMap.put("orderTo",order_to);
        }
        List<Orders> ordersList = ordersService.findOrdersList(queryMap);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("ordersList",ordersList);
        return resultMap;
    }

    // 修改消息是否已读
    @RequestMapping(value = "/update_message_status",method = RequestMethod.POST)
    @ResponseBody
    public Map update_message_status(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer messageId = Integer.valueOf(map.get("messageId"));
        Message msg = messageService.findMessageById(messageId);

        if (messageService.updateStatus(messageId) > 0){
            System.out.println("更新成功");
        }
        else {
            System.out.println("更新失败");
        }
        Integer notReadCnt = messageService.notReadCnt();

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("msg",msg);
        resultMap.put("notReadCnt",notReadCnt);
        return resultMap;
    }

    // 抽象出来的方法 用于在需要messageList及其中未读message数的页面 方便使用
    public void getMessageListAndPutIn(Integer cinemaId,ModelAndView mv){
        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("cinemaId",cinemaId);
        List<Message> messageList = messageService.findMessageList(queryMap);
        Integer notReadCnt = messageService.notReadCnt();               // 未读记录条数
        mv.addObject("messageList",messageList);
        if (notReadCnt >= 1){                                           // 存在才传至前端
            mv.addObject("notReadCnt",notReadCnt);
        }
    }
}

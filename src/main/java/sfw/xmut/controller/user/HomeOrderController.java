package sfw.xmut.controller.user;

import cn.hutool.core.io.FileUtil;
import cn.hutool.extra.qrcode.QrCodeUtil;
import com.alipay.api.AlipayApiException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
import sfw.xmut.util.JSONFileUtils;
import sfw.xmut.util.OrderNumProducer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/11 12:03
 **/

@Controller
@RequestMapping("/home/order")
public class HomeOrderController {

    @Autowired
    private MovieService movieService;

    @Autowired
    private CinemaService cinemaService;

    @Autowired
    private ScreeningService screeningService;

    @Autowired
    private OrdersService ordersService;

    Map<String,Object> tempMap = new HashMap<>();

    // 选座
    @RequestMapping(value = "/select_seat")
    public ModelAndView select_seat(HttpServletRequest request,
                                    @RequestParam(name = "movieId") Integer movieId,
                                    @RequestParam(name = "cinemaId") Integer cinemaId,
                                    @RequestParam(name = "screeningId") Integer screeningId,
                                    @RequestParam(name = "isRefresh",defaultValue = "0") Integer isRefresh
                                    ){
//        Integer movieId = Integer.valueOf(request.getParameter("movieId"));
//        Integer cinemaId = Integer.valueOf(request.getParameter("cinemaId"));
//        Integer screeningId = Integer.valueOf(request.getParameter("screeningId"));
        Movie movie = movieService.findMovieById(movieId);
        Cinema cinema = cinemaService.findCinemaById(cinemaId);
        Screening screening = screeningService.findScreeningById(screeningId);

        // 获取本场座位信息
        int row = screening.getSeat().getRow(),col = screening.getSeat().getCol();
        String seat_str = screening.getSeat().getSeats();
//        String[] seat_str_arr = new String[row];
//        for(int i = 0;i < row;i++){
//            seat_str_arr[i] =seat_str.substring(i*col,(i+1)*col);
//        }
//        System.out.println(Arrays.toString(seat_str_arr));
//        Map<String,Object> seatMap = new HashMap<>();     // 尝试使用map封装未果
//        seatMap.put("row",2);
//        seatMap.put("col",5);
//        seatMap.put("seat_str_arr",seat_str_arr);

        User logined_user = (User) request.getSession().getAttribute("logined_user");
        String old_seat_str = screeningService.findOldSeatStrByMap(screening.getSeatId(),logined_user.getId());

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/ticket/select_seat");
        mv.addObject("movie",movie);
        mv.addObject("cinema",cinema);
        mv.addObject("screening",screening);
        mv.addObject("row",row);
        mv.addObject("col",col);
        mv.addObject("seat_str",seat_str);
        mv.addObject("isRefresh",isRefresh);
        mv.addObject("old_seat_str",old_seat_str);
        return mv;
    }

    // 判断并锁定用户所选座位
    @RequestMapping(value = "/checkSeats",method = RequestMethod.POST)
    @ResponseBody
    public Map checkSeats(HttpServletRequest request,Integer screeningId,Integer[] SeatsArray){
        // 'a'--available     'o'--occupy     's'--sold     '_'--null
        Map<String, Object> resultMap = new HashMap<>();

        User logined_user = (User) request.getSession().getAttribute("logined_user");
        Screening screening = screeningService.findScreeningById(screeningId);
        if (screeningService.lockSeat(screening,SeatsArray,logined_user.getId())){
            System.out.println("座位锁定成功");
            resultMap.put("msg","success");
        }
        else {
            System.out.println("座位锁定失败");
            resultMap.put("msg","error");
        }
        resultMap.put("msg","success");
        return resultMap;
    }

    // 确认订单
    @RequestMapping(value = "/ack_order")
    public ModelAndView ack_order(HttpServletRequest request){
        // 获取被选中的座位号列表      使用ajax时 ----  已弃用
//        String strSeatList = map.get("SeatsArray");
//        String[] strSeats = strSeatList.substring(1,strSeatList.length()-1).split(",");
//        List<Integer> SeatsNumList = Arrays.stream(strSeats).map(Integer::valueOf).collect(Collectors.toList());

        Integer screeningId = Integer.valueOf(request.getParameter("screeningId"));
        Screening screening = screeningService.findScreeningById(screeningId);


        List<Integer> SeatsNumList = new ArrayList<>();
        for (int i = 0;i < Integer.MAX_VALUE;i++){                  // 获取GET链接中的选中座位列表
            String seat_temp = request.getParameter("seat" + i);
            if (seat_temp == null) break;
            else {
                SeatsNumList.add(Integer.valueOf(seat_temp));
            }
        }

        User logined_user = (User) request.getSession().getAttribute("logined_user");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/ticket/submit_order");
        mv.addObject("SeatsNumList",SeatsNumList);
        mv.addObject("screening",screening);
        mv.addObject("logined_user",logined_user);
        return mv;
    }

    @RequestMapping(value = "/submit_order")
    public void submit_order(HttpServletRequest request,HttpServletResponse response) throws IOException {
        List<Integer> SeatsNumList = new ArrayList<>();
        for (int i = 0;i < Integer.MAX_VALUE;i++){                  // 获取GET链接中的选中座位列表
            String seat_temp = request.getParameter("seat" + i);
            if (seat_temp == null) break;
            else {
                SeatsNumList.add(Integer.valueOf(seat_temp));
            }
        }
        Integer screeningId = Integer.valueOf(request.getParameter("screeningId"));
        User logined_user = (User) request.getSession().getAttribute("logined_user");
        Screening screening = screeningService.findScreeningById(screeningId);

        String seatNums = "";               // 存入数据库的字符串 用 0/1 标记此订单内包含的座位
        // 遍历此场次的影厅大小范围内的位置 将属于此订单中的位置进行标记
        for (int i = 0;i < screening.getRoom().getRoomRow();i++){           // 行
            for (int j = 0;j < screening.getRoom().getRoomCol();j++){       // 列
                int num = i*screening.getRoom().getRoomCol() + j;
                if (SeatsNumList.contains(num)){                // 订单包含此座位
                    seatNums += "1";
                }
                else {                                          // 订单不包含此座位
                    seatNums += "0";
                }
            }
        }

        Orders order = new Orders();
        order.setScreeningId(screeningId);
        order.setUserId(logined_user.getId());
        order.setCreateTime(new Date());
        order.setTotalPrice(screening.getPrice()*SeatsNumList.size());
        order.setTotalNOP(SeatsNumList.size());
        order.setStatus(0);             // 此时还未支付
        order.setSeatNums(seatNums);
        order.setOrderNum(new OrderNumProducer().OrderNum());
        order.setIsCommented(0);

        // 此时本应该先锁定相关位置
        // 在支付成功后 正式修改数据库中的位置

        if (ordersService.add(order) <= 0){
            System.out.println("订单创建失败");
        }else {
            System.out.println("订单创建成功");
        }

        // 跳转 AliPay 的接口
        // 以及最终修改数据库中本场次对应的座位情况
        // 预先缓存数据 用于成功回调之后修改数据库
        tempMap.clear();
        tempMap.put("SeatsNumList",SeatsNumList);
        tempMap.put("screening",screening);
        response.sendRedirect(request.getContextPath() + "/alipay/pay?out_trade_no=" + order.getOrderNum() + "&total_amount=" + order.getTotalPrice());
    }

    // 用户在支付过程中 因特殊情况未能支付成功或中途关闭支付页面 可以继续支付订单
    // 传递out_trade_no和total_amount至支付宝沙箱接口
    // 由于tempMap为全局变量 若此处发起的支付成功后 success中修改的场次信息为最近一次因未支付成功而将数据存入tempMap的场次 所以当有订单未支付时应避免继续生成新订单
    @RequestMapping(value = "/continueToPay")
    public void continueToPay(HttpServletRequest request,HttpServletResponse response,
                              @RequestParam(name = "out_trade_no",defaultValue = "0") String orderNum,
                              @RequestParam(name = "total_amount",defaultValue = "0") float totalPrice
                              ) throws IOException {
        response.sendRedirect(request.getContextPath() + "/alipay/pay?out_trade_no=" + orderNum + "&total_amount=" + totalPrice);
    }

    //支付成功回调函数
    //http://localhost:8080/alipay/pay
    @RequestMapping("/success")
    public void success(@RequestParam Map<String, String> map, HttpServletResponse response,HttpServletRequest request) throws Exception {
        String seller_id = map.get("seller_id");
        String trade_no = map.get("trade_no");
        String out_trade_no = map.get("out_trade_no");
        String total_amount = map.get("total_amount");

        List<Integer> SeatsNumList = (List<Integer>) tempMap.get("SeatsNumList");
        Screening screening = (Screening) tempMap.get("screening");

        char[] newSeatsChar = screening.getSeat().getSeats().toCharArray();     // 转换为字符数组进行更新指定位置的值
        for (Integer integer : SeatsNumList) {
            newSeatsChar[integer] = 's';                            // sold
        }
        String newSeats = new String(newSeatsChar);                 // 更新后的座位信息

        // 支付成功 修改数据库
        Map<String, Object> queryMap = new HashMap<>();
        queryMap.put("seats", newSeats);
        queryMap.put("screening_id", screening.getScreeningId());
        if (screeningService.updateSeats(queryMap) > 0) {
            System.out.println("座位信息修改成功");                     // 表示该座位已被购买
        } else {
            System.out.println("座位信息修改失败");
        }

        // 付款成功后修改订单状态
        queryMap.clear();
        queryMap.put("status",1);
        queryMap.put("orderNum",out_trade_no);
        queryMap.put("QRCode",uploadQRCode(request,out_trade_no));
        if (ordersService.updateStatus(queryMap) > 0) {
            System.out.println("订单状态修改成功");                     // 修改订单为已支付
        } else {
            System.out.println("订单状态修改失败");
        }
        if (ordersService.updateQRCode(queryMap) > 0) {
            System.out.println("订单QR生成成功");                     // 更新QRCode
        } else {
            System.out.println("订单QR生成失败");
        }

//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("user/home/center/index?type=1");
//        modelAndView.addObject("total_amount",total_amount);
//        modelAndView.addObject("out_trade_no",out_trade_no);
//        modelAndView.addObject("trade_no",trade_no);
//        modelAndView.addObject("seller_id",seller_id);
//        return modelAndView;
        response.sendRedirect(request.getContextPath() + "/home/center/index?type=1");
    }

    public String uploadQRCode(HttpServletRequest request,String out_trade_no) throws Exception {
        // 图片存储位置
        String upPath = request.getServletContext().getRealPath("/") + "/resources/upload/qrcode/";
        ObjectMapper om = new ObjectMapper();

        // 需更新的pojo对象 orders

        // 生成二维码文件
        String filename = out_trade_no + ".jpg";
        QrCodeUtil.generate(out_trade_no, 300, 300, FileUtil.file(upPath + filename));

        // 对象化的现有文件列表
        List<Resource> fileList = new ArrayList<>();

        // json记录文件的路径
        String jsonFilePath = request.getServletContext().getRealPath("/") + "/WEB-INF/views/utils/fileList.json";
        String fileNamesJson = JSONFileUtils.readFile(jsonFilePath);
        if (fileNamesJson.length() > 0){
            // 已存在文件 需判断名字是否重复
            fileList = om.readValue(fileNamesJson,new TypeReference<List<Resource>>(){});
        }

        // 保存至 现有文件列表
        fileList.add(new Resource(filename));
        fileNamesJson = om.writeValueAsString(fileList);        // 更新用于记录文件列表的json文件
        JSONFileUtils.writeFile(fileNamesJson,request.getServletContext().getRealPath("/") + "/WEB-INF/views/utils/fileList.json");

        return "/resources/upload/qrcode/" + filename;
    }
}

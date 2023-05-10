package sfw.xmut.controller.user;

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
import sfw.xmut.service.CommentService;
import sfw.xmut.service.MovieService;
import sfw.xmut.service.OrdersService;
import sfw.xmut.service.UserService;
import sfw.xmut.util.JSONFileUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/6 14:19
 **/
@Controller
@RequestMapping("/home/center")
public class HomeCenterController {

    @Autowired
    UserService userService;

    @Autowired
    OrdersService ordersService;

    @Autowired
    CommentService commentService;

    @Autowired
    MovieService movieService;

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request,
                              @RequestParam(name = "type",defaultValue = "0") Integer type
                              ){
        User user = (User) request.getSession().getAttribute("logined_user");

        // 标记是否为发布评论后再次刷新进入 影响是否显示toast通知
        String isRefresh = request.getParameter("isRefresh");
//        System.out.println("isRefresh = null :" + (isRefresh==null));
//        System.out.println("isRefresh=" + isRefresh);

        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("userId",user.getId());
        List<Orders> ordersList = ordersService.findOrdersList(queryMap);

        List<Movie> movieList = movieService.findCollectMovieListByUserId(user.getId());
        List<Comment> commentList = commentService.findCommentListByUserId(user.getId());

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/home/center");
        mv.addObject("user",user);
        mv.addObject("ordersList",ordersList);
        mv.addObject("movieList",movieList);
        mv.addObject("commentList",commentList);
        mv.addObject("type",type);
        if ((isRefresh != null) && isRefresh.equals("true")){
            mv.addObject("isRefresh",1);
        }else{
            mv.addObject("isRefresh",0);
        }
        return mv;
    }

    @RequestMapping("/update_info")
    public ModelAndView update_info(MultipartFile file, HttpServletRequest request,
                                    @RequestParam("username") String username,
                                    @RequestParam("password") String password,
                                    @RequestParam("email-account") String account,
                                    @RequestParam("email-server") String server,
                                    @RequestParam("phone") String phone,
                                    @RequestParam("sex") Integer sex
    ) throws Exception{

        String upPath = request.getServletContext().getRealPath("/") + "/resources/upload/head/";
        ObjectMapper om = new ObjectMapper();

        // 放在外部 使得内外都可用 图片文件不必每次强制更新
        User user = userService.findUserById(Integer.valueOf(request.getParameter("userId")));

        if (!file.isEmpty()){
            // 对象化的现有文件列表
            List<Resource> fileList = new ArrayList<>();

            String filename = file.getOriginalFilename();

            // json记录文件的路径
            String jsonFilePath = request.getServletContext().getRealPath("/") + "/WEB-INF/views/utils/fileList.json";
            String fileNamesJson = JSONFileUtils.readFile(jsonFilePath);
            if (fileNamesJson.length() > 0){
                // 已存在文件 需判断名字是否重复
                fileList = om.readValue(fileNamesJson,new TypeReference<List<Resource>>(){});
            }

            for (Resource resource:fileList){
                if (resource.getName().equals(filename)){       // 文件重名
                    String[] temp = filename.split("\\.");
                    filename = temp[0] + "(1)." + temp[1];
                }
            }

            // 保存 --- 实现上传
            file.transferTo(new File(upPath + filename));   // 上传
            fileList.add(new Resource(filename));
            fileNamesJson = om.writeValueAsString(fileList);        // 更新用于记录文件列表的json文件
            JSONFileUtils.writeFile(fileNamesJson,request.getServletContext().getRealPath("/") + "/WEB-INF/views/utils/fileList.json");

            // 文件上传成功 存入其余信息数据库
            // 只有当存在图片文件时 才更新文件路径
            user.setPhoto("/resources/upload/head/" + filename);
        }
        // 上为文件部分
        // 更新user实体
        // 下为其余文本信息部分
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(account+ "@" +server);
        user.setPhone(phone);
        user.setSex(sex);

        if (userService.edit(user) > 0){
            System.out.println("更新成功");
        }
        else {
            System.out.println("更新失败");
        }

        user = userService.findUserById(Integer.valueOf(request.getParameter("userId")));
        request.getSession().setAttribute("logined_user", user);
        Integer type = 0;                           // 更新完依旧显示在基本设置界面
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/home/center");
        mv.addObject("user",user);
        mv.addObject("type",type);
        return mv;
    }


    @RequestMapping(value = "/public_comment")
    public void public_comment(HttpServletRequest request, HttpServletResponse response,
                               @RequestParam("score") Integer score,
                               @RequestParam("comment-content") String commentContent
                               ) throws IOException {
        Integer movieId = Integer.valueOf(request.getParameter("movieId"));
        Integer userId = Integer.valueOf(request.getParameter("userId"));
        String orderNum = request.getParameter("orderNum");

        Comment comment = new Comment(null,movieId,userId,new Date(),score,commentContent,0,1);

        if (commentService.add(comment) > 0){
            System.out.println("添加成功");
            Map<String,Object> queryMap = new HashMap<>();
            queryMap.put("isCommented",1);
            queryMap.put("orderNum",orderNum);
            if (ordersService.updateIsComment(queryMap) > 0){
                System.out.println("该订单评论成功");
            }
        }
        else {
            System.out.println("添加失败");
        }

        response.sendRedirect(request.getContextPath() + "/home/center/index?type=" + 1 + "&isRefresh=true");
    }

    // 返回指定订单实体
    @RequestMapping(value = "/findOrderById",method = RequestMethod.POST)
    @ResponseBody
    public Map findOrderById(HttpServletRequest request, @RequestParam Map<String,String> map){
        Orders orders = ordersService.findOrderById(Integer.valueOf(map.get("orderId")));
        List<Integer> SeatsNumList = new ArrayList<>();
        for (int i = 0;i < orders.getSeatNums().length();i++){
            if (orders.getSeatNums().charAt(i) == '1'){
                SeatsNumList.add(i);
            }
        }

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("orders",orders);
        resultMap.put("SeatsNumList",SeatsNumList);
        return resultMap;
    }

    // 返回指定订单实体
    @RequestMapping(value = "/deleteComment",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteComment(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer commentId = Integer.valueOf(map.get("commentId"));
        if (commentService.delete(commentId) > 0){
            System.out.println("删除成功");
        }
        else {
            System.out.println("删除失败");
        }

        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }
}

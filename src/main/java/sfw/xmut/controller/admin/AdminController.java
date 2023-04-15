package sfw.xmut.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.pojo.Admin;
import sfw.xmut.pojo.Movie;
import sfw.xmut.service.AdminService;
import sfw.xmut.service.MovieService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/10 16:32
 **/

//用户管理控制器
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private MovieService movieService;

//    @RequestMapping(value = "/login",method = RequestMethod.GET)
//    public ModelAndView login(){
//        ModelAndView mv = new ModelAndView();
//        mv.setViewName("admin/temp/login");
//        return mv;
//    }

//    @RequestMapping(value = "/login",method = RequestMethod.POST)                 // 网址不改变为 admin/user/index 的版本
//    public ModelAndView loginAct(Admin user, HttpServletRequest request){
//        Admin user1 = userService.login(user);
//        if (user1 == null){                                         // 登录失败
//            ModelAndView mv = new ModelAndView();
//            mv.setViewName("admin/login");
//            mv.addObject("msg","邮箱或密码错误，请重新输入。");
//            return mv;
//        }
//        ModelAndView mv = new ModelAndView();                       // 登录成功
//        mv.setViewName("admin/index");                              // 进入首页     --直接跳转拼接后的 admin/index.jsp
//        mv.addObject("admin",user1);
//        mv.addObject("include","welcome.jsp");          // 设置主页区域显示内容(被包含)
//        request.getSession().setAttribute("logined_admin", user1);
//        System.out.println("已登录的用户：" + request.getSession().getAttribute("logined_admin"));
//        return mv;
//    }

//    @RequestMapping(value = "/login",method = RequestMethod.POST)
//    public void loginAct(Admin admin, HttpServletRequest request, HttpServletResponse response) throws IOException {
//        Admin admin1 = adminService.login(admin);
//        System.out.println("admin1:" + admin1 + "来自loginAct:POST");
//        if (admin1 == null){                                         // 登录失败
//            request.getSession().setAttribute("msg","邮箱或密码错误，请重新输入。");
//            response.sendRedirect(request.getContextPath() + "/admin/user/login");
//        }
//        else {
//            request.getSession().setAttribute("logined_admin", admin1);
//            System.out.println("已登录的用户：" + request.getSession().getAttribute("logined_admin") + "来自loginAct:登录成功后");
//            response.sendRedirect(request.getContextPath() + "/admin/user/index");
//        }
//    }

//    @RequestMapping(value = "/logout")
//    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        request.getSession().invalidate();
//        System.out.println("logined_admin:" + request.getSession().getAttribute("logined_admin"));
//
//    }
//
//    @RequestMapping(value = "/index")
//    public ModelAndView index(HttpServletRequest request){
//        Admin admin = (Admin) request.getSession().getAttribute("logined_admin");
//        ModelAndView mv = new ModelAndView();                       // 登录成功
//        mv.setViewName("admin/temp/index");                              // 进入首页     --直接跳转拼接后的 admin/index.jsp
//        mv.addObject("admin",admin);
//        mv.addObject("include","welcome.jsp");          // 设置主页区域显示内容(被包含)
//        return mv;
//    }


    // ==========================================================  ↑↑↑↑↑↑↑↑↑ 旧版controller部分 =========================
    // -----------------------------------------------------------------------------------------------------------------
    // ==========================================================  ↓↓↓↓↓↓↓↓↓ 新版controller部分 =========================

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/index");
        return mv;
    }
    @RequestMapping(value = "/welcome")
    public ModelAndView welcome(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/welcome");
        return mv;
    }

    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/login");
        return mv;
    }

    @RequestMapping(value = "/demo")
    public ModelAndView demo(HttpServletRequest request){

        Movie movie = movieService.findMovieByIdDemo(2);
        System.out.println(movie);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/demo");
        return mv;
    }

}

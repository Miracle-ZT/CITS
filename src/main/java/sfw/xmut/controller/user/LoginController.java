package sfw.xmut.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.pojo.User;
import sfw.xmut.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/16 15:43
 **/
@Controller
@RequestMapping("/user")
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public ModelAndView login(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/login");
        return mv;
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public void loginAct(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user1 = userService.login(user);
        System.out.println("user1:" + user1 + "来自loginAct:POST");
        if (user1 == null){                                         // 登录失败
            request.getSession().setAttribute("msg","邮箱或密码错误，请重新输入。");
            response.sendRedirect(request.getContextPath() + "/user/login");
        }
        else {
            request.getSession().setAttribute("logined_user", user1);
            System.out.println("已登录的用户：" + request.getSession().getAttribute("logined_user") + "来自loginAct:登录成功后");
            response.sendRedirect(request.getContextPath() + "/home/index");
        }
    }

    @RequestMapping(value = "/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        System.out.println("logined_user:" + request.getSession().getAttribute("logined_user") + "已退出登录");
        response.sendRedirect(request.getContextPath() + "/home/index");
    }
}

package sfw.xmut.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.pojo.Orders;
import sfw.xmut.pojo.User;
import sfw.xmut.service.UserService;
import sfw.xmut.util.EmailUtils;
import sfw.xmut.util.VerificationCodeUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        mv.setViewName("user/login/login");
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

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public ModelAndView register(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/login/register");
        return mv;
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public void registerAct(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("user:" + user + "registerAct:POST");
        user.setPhoto("/resources/img/default_user_head.png");
        if (userService.add(user) > 0){
            System.out.println("添加成功");
            response.sendRedirect(request.getContextPath() + "/user/login");
        }
        else {
            System.out.println("添加失败");
        }
    }

    @RequestMapping(value = "/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        System.out.println("logined_user:" + request.getSession().getAttribute("logined_user") + "已退出登录");
        response.sendRedirect(request.getContextPath() + "/home/index");
    }

    // 发送验证码
    @RequestMapping(value = "/sendEmail",method = RequestMethod.POST)
    @ResponseBody
    public Map sendEmail(HttpServletRequest request, @RequestParam Map<String,String> map) throws Exception {
        //QQ邮箱测试
        String userName = "2632687880@qq.com"; // 发件人邮箱
        String password = "nbyfiulewgeiebdh"; // 发件人密码，其实不一定是邮箱的登录密码，对于QQ邮箱来说是SMTP服务的授权文本
        String smtpHost = "smtp.qq.com"; // 邮件服务器

        String VCode = VerificationCodeUtils.VerificationCode(6);
        String to = map.get("to"); // 收件人，多个收件人以半角逗号分隔
        String cc = ""; // 抄送，多个抄送以半角逗号分隔
        String subject = "XLMovie - 一次性验证"; // 主题
        String body = "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title></title>\n" +
                "</head>\n" +
                "<body>\n" +
                "<h3>" + to + "，你好!</h3>\n" +
                "\n" +
                "<h3>我们已收到你要求获得 XLMovie 帐户所用的一次性代码的申请。</h3>\n" +
                "\n" +
                "<span style=\"font-size: 30px\">你的一次性代码为: </span>\n" +
                "<span style=\"font-size: 40px;color: #b92222;border-radius: 5px;border: 1px #d3d3d3 solid\">" + VCode + "</span>\n" +
                "<br>\n" +
                "<h3>如果你没有请求此代码，可放心忽略这封电子邮件。别人可能错误地键入了你的电子邮件地址。</h3>\n" +
                "<br>\n" +
                "<br>\n" +
                "<h4>谢谢! </h4>\n" +
                "<h4>XLMovie 帐户团队</h4>\n" +
                "<br>\n" +
                "</body>\n" +
                "</html>"; // 正文，可以用html格式
//        List<String> attachments = Arrays.asList("D:\\files.pdf", "D:\\安装包\\权限控制优化需求.docx"); // 附件的路径，多个附件也不怕
        List<String> attachments = null;

        EmailUtils emailUtils = EmailUtils.entity(smtpHost, userName, password, to, cc, subject, body, attachments);

        emailUtils.send(); // 发送！

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("VCode",VCode);
        return resultMap;
    }
}

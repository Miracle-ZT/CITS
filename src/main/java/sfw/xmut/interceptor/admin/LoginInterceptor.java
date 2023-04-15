package sfw.xmut.interceptor.admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class LoginInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        if (requestURI.indexOf("/admin/user/login") > 0){
            // 直接放行
            return true;
        }

        Object admin = request.getSession().getAttribute("logined_admin");
        System.out.println("已登录的用户：" + admin + "来自拦截器");
        if(admin != null){
            // 登录成功不拦截
            return true;
        }
        // 表示未登录或者登录失效
        // 拦截后进入登录页面
//        request.getRequestDispatcher("/admin/user/login").forward(request,response);
//        response.sendRedirect(request.getServletContext().getContextPath() + "/admin/user/login");
        System.out.println("拦截成功");
        response.sendRedirect(request.getContextPath() + "/admin/user/login");
        return false;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//        System.out.println("interceptor post");
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//        System.out.println("interceptor after");
    }
}

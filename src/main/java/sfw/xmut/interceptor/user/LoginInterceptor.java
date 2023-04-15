package sfw.xmut.interceptor.user;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        if (requestURI.indexOf("/user/login") > 0 || requestURI.indexOf("/home/order/") > 0){
            return true;
        }
        Object user = request.getSession().getAttribute("logined_user");
        if(user != null){
            return true;
        }
        response.sendRedirect(request.getContextPath() + "/user/login");
        return false;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//        System.out.println("interceptor post");
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//        System.out.println("interceptor after");
    }
}

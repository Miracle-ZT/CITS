/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2023-04-10 17:20:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.utils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import sfw.xmut.pojo.User;

public final class nav_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<nav class=\"navbar navbar-expand-lg\" style=\"background: rgba(239,239,239,0.2)\">\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("    <div class=\"container-fluid\">\r\n");
      out.write("        <a class=\"navbar-brand\" style=\"font-size: 35px;margin-right: 35px\" href=\"/home/index\">\r\n");
      out.write("            <img src=\"../../../resources/img/logo.png\" alt=\"Logo\" width=\"50px\" height=\"50px\"\r\n");
      out.write("                 class=\"d-inline-block align-text-top\" style=\"margin-top: -4px\">\r\n");
      out.write("            <font color=\"#6495ed\">XiaoLan Movie</font>\r\n");
      out.write("        </a>\r\n");
      out.write("        <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\"\r\n");
      out.write("                data-bs-target=\"#navbarSupportedContent\"\r\n");
      out.write("                aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("            <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("        </button>\r\n");
      out.write("        <button class=\"btn btn-outline-primary btn-sm\" style=\"border-radius: 40px\" data-bs-toggle=\"modal\"\r\n");
      out.write("                data-bs-target=\"#exampleModal\">\r\n");
      out.write("            福州市\r\n");
      out.write("        </button>\r\n");
      out.write("        <!-- Modal -->\r\n");
      out.write("        <div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("            <div class=\"modal-dialog\">\r\n");
      out.write("                <div class=\"modal-content\">\r\n");
      out.write("                    <div class=\"modal-header\">\r\n");
      out.write("                        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"modal-body\">\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"modal-footer\">\r\n");
      out.write("                        <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">取消</button>\r\n");
      out.write("                        <button type=\"button\" class=\"btn btn-primary\">确定</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("            <ul class=\"nav nav-pills me-auto\">\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                <li class=\"nav-item\" style=\"font-size: 20px;padding: 10px\">\r\n");
      out.write("                    <a class=\"nav-link ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ac_home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" aria-current=\"page\" href=\"/home/index\">首页</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item\" style=\"font-size: 20px;padding: 10px\">\r\n");
      out.write("                    <a class=\"nav-link ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ac_movie}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" href=\"/home/movie\">电影</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item\" style=\"font-size: 20px;padding: 10px\">\r\n");
      out.write("                    <a class=\"nav-link ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ac_cinema}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" href=\"/home/cinema\">影院</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item\" style=\"font-size: 20px;padding: 10px\">\r\n");
      out.write("                    <a class=\"nav-link ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ac_top}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" href=\"/home/top\">榜单</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item\" style=\"font-size: 20px;padding: 10px\">\r\n");
      out.write("                    <a class=\"nav-link ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ac_news}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" href=\"/home/news\">资讯</a>\r\n");
      out.write("                </li>\r\n");
      out.write("\r\n");
      out.write("                ");

                    if (session.getAttribute("logined_user") != null) {                // 头像下拉框
                        User logined_user = (User) request.getSession().getAttribute("logined_user");
                
      out.write("\r\n");
      out.write("                <li class=\"nav-item dropdown\" style=\"font-size: 20px;padding: 5px;margin-left: 100px\">\r\n");
      out.write("                    <!-- 已登录 -->\r\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\"\r\n");
      out.write("                       aria-expanded=\"false\">\r\n");
      out.write("                        <img src=\"../../../..");
      out.print(logined_user.getPhoto());
      out.write("\"\r\n");
      out.write("                             style=\";width: 40px;height: 40px;border-radius: 50%;overflow: hidden\">\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\">\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"/home/center/index?type=0\">基本设置</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"/home/center/index?type=1\">我的订单</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"/home/center/index?type=2\">我的收藏</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"/home/center/index?type=3\">我的评论</a></li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <hr class=\"dropdown-divider\">\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"/user/logout\">退出登录</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                ");
} else {
      out.write("                                                             <!-- 未登录 -->\r\n");
      out.write("                <li class=\"nav-item dropdown\" style=\"font-size: 20px;padding: 5px;margin-left: 100px\">\r\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"/user/login\" role=\"button\"\r\n");
      out.write("                       aria-expanded=\"false\">\r\n");
      out.write("                        <img src=\"../../../resources/img/default_user_head.png\"\r\n");
      out.write("                             style=\";width: 40px;height: 40px;border-radius: 50%;overflow: hidden\">\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("                ");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("            </ul>\r\n");
      out.write("            <form action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/home/search_content\"\r\n");
      out.write("                  class=\"d-flex\" role=\"search\" style=\"margin-top: 15px\">\r\n");
      out.write("                <input name=\"keyWord\" class=\"form-control me-2\" type=\"search\" placeholder=\"影视剧、影人、影院\"\r\n");
      out.write("                       aria-label=\"Search\" value=\"\">\r\n");
      out.write("                <button id=\"submit-keyword\" class=\"btn btn-outline-primary\" type=\"submit\">\r\n");
      out.write("                    <?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n");
      out.write("                    <svg width=\"24\" height=\"24\" viewBox=\"0 0 48 48\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\r\n");
      out.write("                        <path d=\"M21 38C30.3888 38 38 30.3888 38 21C38 11.6112 30.3888 4 21 4C11.6112 4 4 11.6112 4 21C4 30.3888 11.6112 38 21 38Z\"\r\n");
      out.write("                              fill=\"none\" stroke=\"#2196f3\" stroke-width=\"4\" stroke-linejoin=\"round\"/>\r\n");
      out.write("                        <path d=\"M26.657 14.3431C25.2093 12.8954 23.2093 12 21.0001 12C18.791 12 16.791 12.8954 15.3433 14.3431\"\r\n");
      out.write("                              stroke=\"#2196f3\" stroke-width=\"4\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\r\n");
      out.write("                        <path d=\"M33.2216 33.2217L41.7069 41.707\" stroke=\"#2196f3\" stroke-width=\"4\"\r\n");
      out.write("                              stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\r\n");
      out.write("                    </svg>\r\n");
      out.write("                </button>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</nav>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

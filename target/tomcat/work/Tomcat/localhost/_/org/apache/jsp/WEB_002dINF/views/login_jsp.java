/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2023-01-14 01:04:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <title>Login</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../resources/plugins/bootstrap-5.1.3/css/bootstrap.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../resources/plugins/bootstrap-3.4.1/bootstrap-3.4.1-dist/css/bootstrap.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../resources/css/form.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<section class=\"h-100\">\r\n");
      out.write("    <div class=\"container h-100\" style=\"margin-top: 200px\">\r\n");
      out.write("        <div class=\"row justify-content-sm-center h-100\">\r\n");
      out.write("            <div class=\"col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9\">\r\n");
      out.write("                <div class=\"card shadow-lg\">\r\n");
      out.write("                    <div class=\"card-body p-5\">\r\n");
      out.write("                        <h1 class=\"fs-2 card-title fw-bold mb-5\" style=\"margin-left: 115px\">影院智能购票系统</h1>\r\n");
      out.write("                        <form method=\"post\" action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/admin/user/login/\" class=\"needs-validation\" autocomplete=\"off\">\r\n");
      out.write("                            <div class=\"mb-3\">\r\n");
      out.write("                                <label class=\"mb-2 text-muted\" for=\"email\">邮箱：</label>\r\n");
      out.write("                                <input id=\"email\" type=\"text\" class=\"form-control\" name=\"email\" value=\"\" required autofocus>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"mb-3\">\r\n");
      out.write("                                <div class=\"mb-2 w-100\">\r\n");
      out.write("                                    <label class=\"text-muted\" for=\"pwd\">密码：</label>\r\n");
      out.write("                                    <a href=\"#\" class=\"float-end\">\r\n");
      out.write("                                        忘记密码?\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <input id=\"pwd\" type=\"password\" class=\"form-control\" name=\"password\" required>\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"d-flex align-items-center\">\r\n");
      out.write("                                <div class=\"form-check\">\r\n");
      out.write("                                    <input type=\"checkbox\" name=\"remember\" id=\"remember\" class=\"form-check-input\">\r\n");
      out.write("                                    <label for=\"remember\" class=\"form-check-label\">自动登录</label>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-success ms-auto\">\r\n");
      out.write("                                    登录\r\n");
      out.write("                                </button>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"card-footer py-3 border-0\">\r\n");
      out.write("                        <div style=\"text-align: center\">Copyright &copy; 2112114236 &mdash; XMUT</div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</section>\r\n");
      out.write("<script src=\"js/login.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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

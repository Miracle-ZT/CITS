/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2023-02-19 03:38:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class table_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <title>H+ 后台主题UI框架 - 数据表格</title>\r\n");
      out.write("    <meta name=\"keywords\" content=\"H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台\">\r\n");
      out.write("    <meta name=\"description\" content=\"H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术\">\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"shortcut icon\" href=\"../../../resources/plugins/admin_assets/img/favicon.ico\"> <link href=\"../../../resources/plugins/admin_assets/css/bootstrap.min.css?v=3.3.5\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"../../../resources/plugins/admin_assets/css/font-awesome.min.css?v=4.4.0\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Data Tables -->\r\n");
      out.write("    <link href=\"../../../resources/plugins/admin_assets/css/plugins/dataTables/dataTables.bootstrap.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("    <link href=\"../../../resources/plugins/admin_assets/css/animate.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"../../../resources/plugins/admin_assets/css/style.min.css?v=4.0.0\" rel=\"stylesheet\"><base target=\"_blank\">\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"gray-bg\">\r\n");
      out.write("<div class=\"wrapper wrapper-content animated fadeInRight\">\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("        <div class=\"col-sm-12\">\r\n");
      out.write("            <div class=\"ibox float-e-margins\">\r\n");
      out.write("                <div class=\"ibox-title\">\r\n");
      out.write("                    <h5>基本 <small>分类，查找</small></h5>\r\n");
      out.write("                    <div class=\"ibox-tools\">\r\n");
      out.write("                        <a class=\"collapse-link\">\r\n");
      out.write("                            <i class=\"fa fa-chevron-up\"></i>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"table_data_tables.html#\">\r\n");
      out.write("                            <i class=\"fa fa-wrench\"></i>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul class=\"dropdown-menu dropdown-user\">\r\n");
      out.write("                            <li><a href=\"table_data_tables.html#\">选项1</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li><a href=\"table_data_tables.html#\">选项2</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                        <a class=\"close-link\">\r\n");
      out.write("                            <i class=\"fa fa-times\"></i>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"ibox-content\">\r\n");
      out.write("\r\n");
      out.write("                    <table class=\"table table-striped table-bordered table-hover dataTables-example\">\r\n");
      out.write("                        <thead>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th><input type=\"checkbox\" class=\"i-checks\" name=\"input[]\"></th>\r\n");
      out.write("                            <th>渲染引擎</th>\r\n");
      out.write("                            <th>浏览器</th>\r\n");
      out.write("                            <th>平台</th>\r\n");
      out.write("                            <th>引擎版本</th>\r\n");
      out.write("                            <th>CSS等级</th>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        </thead>\r\n");
      out.write("                        <tbody>\r\n");
      out.write("                        <tr class=\"gradeX\">\r\n");
      out.write("                            <th><input type=\"checkbox\" class=\"i-checks\" name=\"input[]\"></th>\r\n");
      out.write("                            <td>Trident</td>\r\n");
      out.write("                            <td>Internet Explorer 4.0\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td>Win 95+</td>\r\n");
      out.write("                            <td class=\"center\">4</td>\r\n");
      out.write("                            <td class=\"center\">X</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeC\">\r\n");
      out.write("                            <th><input type=\"checkbox\" class=\"i-checks\" name=\"input[]\"></th>\r\n");
      out.write("                            <td>Trident</td>\r\n");
      out.write("                            <td>Internet Explorer 5.0\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td>Win 95+</td>\r\n");
      out.write("                            <td class=\"center\">5</td>\r\n");
      out.write("                            <td class=\"center\">C</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeA\">\r\n");
      out.write("                            <th><input type=\"checkbox\" class=\"i-checks\" name=\"input[]\"></th>\r\n");
      out.write("                            <td>Trident</td>\r\n");
      out.write("                            <td>Internet Explorer 5.5\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td>Win 95+</td>\r\n");
      out.write("                            <td class=\"center\">5.5</td>\r\n");
      out.write("                            <td class=\"center\">A</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        </tbody>\r\n");
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("                    </table>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("        <div class=\"col-sm-12\">\r\n");
      out.write("            <div class=\"ibox float-e-margins\">\r\n");
      out.write("                <div class=\"ibox-title\">\r\n");
      out.write("                    <h5>可编辑表格</h5>\r\n");
      out.write("                    <div class=\"ibox-tools\">\r\n");
      out.write("                        <a class=\"collapse-link\">\r\n");
      out.write("                            <i class=\"fa fa-chevron-up\"></i>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"table_data_tables.html#\">\r\n");
      out.write("                            <i class=\"fa fa-wrench\"></i>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul class=\"dropdown-menu dropdown-user\">\r\n");
      out.write("                            <li><a href=\"table_data_tables.html#\">选项1</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li><a href=\"table_data_tables.html#\">选项2</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                        <a class=\"close-link\">\r\n");
      out.write("                            <i class=\"fa fa-times\"></i>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"ibox-content\">\r\n");
      out.write("                    <div class=\"\">\r\n");
      out.write("                        <a onclick=\"fnClickAddRow();\" href=\"javascript:void(0);\" class=\"btn btn-primary \">添加行</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <table class=\"table table-striped table-bordered table-hover \" id=\"editable\">\r\n");
      out.write("                        <thead>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th>渲染引擎</th>\r\n");
      out.write("                            <th>浏览器</th>\r\n");
      out.write("                            <th>平台</th>\r\n");
      out.write("                            <th>引擎版本</th>\r\n");
      out.write("                            <th>CSS等级</th>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        </thead>\r\n");
      out.write("                        <tbody>\r\n");
      out.write("                        <tr class=\"gradeX\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>Lynx</td>\r\n");
      out.write("                            <td>Text only</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">X</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeC\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>IE Mobile</td>\r\n");
      out.write("                            <td>Windows Mobile 6</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">C</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeC\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>PSP browser</td>\r\n");
      out.write("                            <td>PSP</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">C</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeU\">\r\n");
      out.write("                            <td>Other browsers</td>\r\n");
      out.write("                            <td>All others</td>\r\n");
      out.write("                            <td>-</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">U</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeX\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>Lynx</td>\r\n");
      out.write("                            <td>Text only</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">X</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeC\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>IE Mobile</td>\r\n");
      out.write("                            <td>Windows Mobile 6</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">C</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeC\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>PSP browser</td>\r\n");
      out.write("                            <td>PSP</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">C</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeU\">\r\n");
      out.write("                            <td>Other browsers</td>\r\n");
      out.write("                            <td>All others</td>\r\n");
      out.write("                            <td>-</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">U</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeX\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>Lynx</td>\r\n");
      out.write("                            <td>Text only</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">X</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeC\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>IE Mobile</td>\r\n");
      out.write("                            <td>Windows Mobile 6</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">C</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeC\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>PSP browser</td>\r\n");
      out.write("                            <td>PSP</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">C</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeU\">\r\n");
      out.write("                            <td>Other browsers</td>\r\n");
      out.write("                            <td>All others</td>\r\n");
      out.write("                            <td>-</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">U</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeX\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>Lynx</td>\r\n");
      out.write("                            <td>Text only</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">X</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeC\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>IE Mobile</td>\r\n");
      out.write("                            <td>Windows Mobile 6</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">C</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeC\">\r\n");
      out.write("                            <td>Misc</td>\r\n");
      out.write("                            <td>PSP browser</td>\r\n");
      out.write("                            <td>PSP</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">C</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr class=\"gradeU\">\r\n");
      out.write("                            <td>Other browsers</td>\r\n");
      out.write("                            <td>All others</td>\r\n");
      out.write("                            <td>-</td>\r\n");
      out.write("                            <td class=\"center\">-</td>\r\n");
      out.write("                            <td class=\"center\">U</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        </tbody>\r\n");
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("                    </table>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<script src=\"../../../resources/plugins/admin_assets/js/jquery.min.js?v=2.1.4\"></script>\r\n");
      out.write("<script src=\"../../../resources/plugins/admin_assets/js/bootstrap.min.js?v=3.3.5\"></script>\r\n");
      out.write("<script src=\"../../../resources/plugins/admin_assets/js/plugins/jeditable/jquery.jeditable.js\"></script>\r\n");
      out.write("<script src=\"../../../resources/plugins/admin_assets/js/plugins/dataTables/jquery.dataTables.js\"></script>\r\n");
      out.write("<script src=\"../../../resources/plugins/admin_assets/js/plugins/dataTables/dataTables.bootstrap.js\"></script>\r\n");
      out.write("<script src=\"../../../resources/plugins/admin_assets/js/content.min.js?v=1.0.0\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("    $(document).ready(function(){$(\".dataTables-example\").dataTable();var oTable=$(\"#editable\").dataTable();oTable.$(\"td\").editable(\"../example_ajax.php\",{\"callback\":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},\"submitdata\":function(value,settings){return{\"row_id\":this.parentNode.getAttribute(\"id\"),\"column\":oTable.fnGetPosition(this)[2]}},\"width\":\"90%\",\"height\":\"100%\"})});function fnClickAddRow(){$(\"#editable\").dataTable().fnAddData([\"Custom row\",\"New row\",\"New row\",\"New row\",\"New row\"])};\r\n");
      out.write("</script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://tajs.qq.com/stats?sId=9051096\" charset=\"UTF-8\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
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

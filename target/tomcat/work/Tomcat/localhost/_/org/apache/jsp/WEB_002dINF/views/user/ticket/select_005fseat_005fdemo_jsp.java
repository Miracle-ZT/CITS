/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2023-02-07 17:02:43 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.user.ticket;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class select_005fseat_005fdemo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Title</title>\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../../utils/bootstrap5.1.1.jsp", out, true);
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("        .scope {                                /* 整个选座区域 */\r\n");
      out.write("            width:900px;\r\n");
      out.write("            min-height: 500px;\r\n");
      out.write("            margin-left: auto;\r\n");
      out.write("            margin-right: auto;\r\n");
      out.write("            border: 1px #d3d3d3 solid;\r\n");
      out.write("            border-radius: 5px;\r\n");
      out.write("        }\r\n");
      out.write("        .screen {\r\n");
      out.write("            width: 300px;\r\n");
      out.write("            background-color: #f0f0f0;\r\n");
      out.write("            color: #666;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            border-radius: 5px;\r\n");
      out.write("            margin-left: auto;\r\n");
      out.write("            margin-right: auto;\r\n");
      out.write("        }\r\n");
      out.write("        .title {\r\n");
      out.write("            margin: 5px 20px;\r\n");
      out.write("            font-size: 20px;\r\n");
      out.write("            color: #a84c10;\r\n");
      out.write("            border-bottom: 1px solid #d3d3d3;\r\n");
      out.write("        }\r\n");
      out.write("        .seat-scope {                                   /* 左边布局 */\r\n");
      out.write("            padding: 30px 30px 40px 30px;               /* 上-右-下-左  顺时针 */\r\n");
      out.write("            width: 400px;\r\n");
      out.write("            margin: auto;\r\n");
      out.write("        }\r\n");
      out.write("        .info-scope {                                   /* 右边信息布局 */\r\n");
      out.write("            border-left: 1px solid #d3d3d3;\r\n");
      out.write("            padding: 40px;\r\n");
      out.write("        }\r\n");
      out.write("        .seat {\r\n");
      out.write("            padding: 40px 40px 40px 20px;\r\n");
      out.write("        }\r\n");
      out.write("        .seat-row {\r\n");
      out.write("            height: 35px;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            padding: 0;\r\n");
      out.write("            border: 0;\r\n");
      out.write("            font-size: 100%;\r\n");
      out.write("            vertical-align: baseline;\r\n");
      out.write("            background: transparent;\r\n");
      out.write("        }\r\n");
      out.write("        .seat-cell {\r\n");
      out.write("            height: 25px;\r\n");
      out.write("            width: 25px;\r\n");
      out.write("            /*line-height: 25px;*/\r\n");
      out.write("            margin: 3px;\r\n");
      out.write("            float: left;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            outline: none;\r\n");
      out.write("            font-size: 13px;\r\n");
      out.write("        }\r\n");
      out.write("        .seatCharts-seat {                               /* 单个座位的基本样式*/\r\n");
      out.write("            color: #fff;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            -webkit-border-radius: 5px;\r\n");
      out.write("            -moz-border-radius: 5px;\r\n");
      out.write("            border-radius: 5px;\r\n");
      out.write("            height: 25px;\r\n");
      out.write("            width: 25px;\r\n");
      out.write("            line-height: 25px;\r\n");
      out.write("            margin: 3px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            outline: none;\r\n");
      out.write("            font-size: 13px;\r\n");
      out.write("        }\r\n");
      out.write("        .seat-up {                               /* 单个座位 -- 悬停*/\r\n");
      out.write("            background-color: #76B474;\r\n");
      out.write("        }\r\n");
      out.write("        .seat-available {                               /* 单个座位 -- 可用*/\r\n");
      out.write("            background-color: #B9DEA0;\r\n");
      out.write("        }\r\n");
      out.write("        .seat-unavailable {                               /* 单个座位 -- 不可用*/\r\n");
      out.write("            background-color: #000;\r\n");
      out.write("        }\r\n");
      out.write("        .seat-selected {                               /* 单个座位 -- 被选中*/\r\n");
      out.write("            background-color: #E6CAC4;\r\n");
      out.write("        }\r\n");
      out.write("        .seat-empty {                               /* 单个座位 -- 不显示*/\r\n");
      out.write("            background-color: #fff;\r\n");
      out.write("        }\r\n");
      out.write("        .tag {\r\n");
      out.write("            color: #000;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            -webkit-border-radius: 5px;\r\n");
      out.write("            -moz-border-radius: 5px;\r\n");
      out.write("            border-radius: 5px;\r\n");
      out.write("            height: 25px;\r\n");
      out.write("            width: 25px;\r\n");
      out.write("            line-height: 25px;\r\n");
      out.write("            margin: 3px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            outline: none;\r\n");
      out.write("            font-size: 13px;\r\n");
      out.write("            background-color: #fff;\r\n");
      out.write("            float: left;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body onload=\"creatSeats(3,4)\">\r\n");
      out.write("<div style=\"margin:100px auto;width: 1400px;margin-top: 0px\">\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../../utils/nav.jsp", out, true);
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("电影：");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${movie.chineseName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("影院：");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cinema.name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("开始时间：");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${screening.startTime}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("票价：");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${screening.price}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("\r\n");
      out.write("进行选座\r\n");
      out.write("\r\n");
      out.write("<div id=\"seat-demo\" class=\"seat-available seatCharts-seat\">5</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"scope\">\r\n");
      out.write("    <div class=\"title\">选座</div>\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("        <div class=\"col-8 seat-scope\">\r\n");
      out.write("            <div class=\"screen align-items-center\">屏幕</div>\r\n");
      out.write("            <div id=\"seats\" class=\"seat\">\r\n");
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col-4 info-scope\">2</div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script src=\"../../../../resources/js/jquery-3.6.3.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("    function creatSeats(row,col) {\r\n");
      out.write("        var eachSeatText = '';\r\n");
      out.write("        for (var i = 0;i < row;i++){                        // 每一行\r\n");
      out.write("            eachSeatText = '<div class=\"seat-row\" id=\"seat-row-' + i + '\">\\n';\r\n");
      out.write("            $(\"#seats\").append(eachSeatText);\r\n");
      out.write("            for (var j = 0;j < col;j++){\r\n");
      out.write("                if (j == 0){                                // 标记列\r\n");
      out.write("                    eachSeatText = '<div id=\"seat-tag\" class=\"seat-available seatCharts-seat tag\">' + (i+1) + '</div>\\n'\r\n");
      out.write("                    $(\"#seats\").append(eachSeatText);\r\n");
      out.write("                }\r\n");
      out.write("                eachSeatText = '<div id=\"seat-col-' + i + '-' + j + '\" class=\"seat-available seatCharts-seat seat-cell\">' + (j+1) + '</div>\\n'\r\n");
      out.write("                $(\"#seats\").append(eachSeatText);\r\n");
      out.write("            }\r\n");
      out.write("            eachSeatText = '</div>\\n';\r\n");
      out.write("            $(\"#seats\").append(eachSeatText);\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("<script>\r\n");
      out.write("    $(document).ready(function(){\r\n");
      out.write("        $('body').on('mouseenter', \"div[id^='seat-col-']\", function() {          // 鼠标光标经过\r\n");
      out.write("            if ($(this).hasClass('seat-available')){             // 若为可用状态\r\n");
      out.write("                $(this).removeClass('seat-available');\r\n");
      out.write("                $(this).addClass('seat-up');\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        $('body').on('mouseleave', \"div[id^='seat-col-']\", function () {          // 鼠标光标离开\r\n");
      out.write("            if ($(this).hasClass('seat-up')) {\r\n");
      out.write("                $(this).removeClass('seat-up');\r\n");
      out.write("                $(this).addClass('seat-available');\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        $('body').on('click', \"div[id^='seat-col-']\", function () {         // 单击\r\n");
      out.write("            var hasUpClass = $(this).hasClass('seat-up');                   // 是否鼠标在上方\r\n");
      out.write("            var hasSelectedClass = $(this).hasClass('seat-selected');       // 是否已被选择\r\n");
      out.write("            var hasAvailableClass = $(this).hasClass('seat-available');     // 是否可用\r\n");
      out.write("            if (hasUpClass) {                        // 本为可用状态\r\n");
      out.write("                $(this).removeClass('seat-up');\r\n");
      out.write("                $(this).addClass('seat-selected');\r\n");
      out.write("            } else if (hasSelectedClass) {          // 已为不可用状态\r\n");
      out.write("                $(this).removeClass('seat-selected');\r\n");
      out.write("                $(this).addClass('seat-available');\r\n");
      out.write("            } else if (hasAvailableClass) {\r\n");
      out.write("                $(this).removeClass('seat-available');\r\n");
      out.write("                $(this).addClass('seat-selected');\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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

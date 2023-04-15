<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/1/14
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>影院智能购票后台管理系统</title>

    <link href="../../../../resources/plugins/template/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="../../../../resources/plugins/template/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

    <!-- Morris -->
    <link href="../../../../resources/plugins/template/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

    <link href="../../../../resources/plugins/template/css/animate.css" rel="stylesheet">
    <link href="../../../../resources/plugins/template/css/style.css?v=2.2.0" rel="stylesheet">
    <script type="text/javascript" src="https://assets.pyecharts.org/assets/echarts.min.js"></script>

</head>

<body class="fixed-navigation">
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="../../../../resources/plugins/template/img/profile_small.jpg"/>
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                                <span class="clear"> <span class="block m-t-xs"> <strong
                                        class="font-bold">2112114236-ZT-${admin.username}</strong>
                             </span>  <span class="text-muted text-xs block">超级管理员 <b class="caret"></b></span> </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="form_avatar.html">修改头像</a>
                            </li>
                            <li><a href="profile.html">个人资料</a>
                            </li>
                            <li><a href="contacts.html">联系我们</a>
                            </li>
                            <li><a href="mailbox.html">信箱</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="/admin/user/logout">注销</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        H+
                    </div>

                </li>
                <li class="active">
                    <a href="/admin/user/index"><i class="fa fa-th-large"></i> <span class="nav-label">主页</span> <span
                            class=""></span></a>
                </li>
                <li>
                    <a href="index.html#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">用户管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="/index/price">用户列表</a></li>
                    </ul>
                </li>
                <li>
                    <a href="index.html#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">电影管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="/index/price">电影列表</a></li>
                    </ul>
                </li>
                <li>
                    <a href="index.html#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">轮播管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="/index/price">轮播列表</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/index/conclusion"><i class="fa fa-bar-chart-o"></i> <span
                            class="nav-label">新闻资讯</span><span
                            class=""></span></a>
                </li>

            </ul>
        </div>
    </nav>
    <div id="page-wrapper" class="gray-bg sidebar-content">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="index_3.html#"><i
                            class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search"
                                   id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="/admin/user/index" title="返回首页"><i
                                class="fa fa-home"></i></a>首页</span>
                    </li>

                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-qq fa-fw"></i> 3条新回复
                                        <span class="pull-right text-muted small">12分钟钱</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="notifications.html">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="/admin/user/login">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <jsp:include page="${include}" flush="true"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="pull-right">
                </div>
                <div>
                    <strong>Copyright</strong> XMUT &copy; 2023
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Mainly scripts -->
<script src="../../../../resources/plugins/template/js/jquery-2.1.1.min.js"></script>
<script src="../../../../resources/plugins/template/js/bootstrap.min.js?v=3.4.0"></script>
<script src="../../../../resources/plugins/template/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../../../../resources/plugins/template/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="../../../../resources/plugins/template/js/plugins/flot/jquery.flot.js"></script>
<script src="../../../../resources/plugins/template/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../../../../resources/plugins/template/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="../../../../resources/plugins/template/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../../../../resources/plugins/template/js/plugins/flot/jquery.flot.pie.js"></script>
<script src="../../../../resources/plugins/template/js/plugins/flot/jquery.flot.symbol.js"></script>
<script src="../../../../resources/plugins/template/js/plugins/flot/curvedLines.js"></script>

<!-- Peity -->
<script src="../../../../resources/plugins/template/js/plugins/peity/jquery.peity.min.js"></script>
<script src="../../../../resources/plugins/template/js/demo/peity-demo.js"></script>

<!-- Custom and plugin javascript -->
<script src="../../../../resources/plugins/template/js/hplus.js?v=2.2.0"></script>
<script src="../../../../resources/plugins/template/js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="../../../../resources/plugins/template/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- Jvectormap -->
<script src="../../../../resources/plugins/template/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../../../resources/plugins/template/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- EayPIE -->
<script src="../../../../resources/plugins/template/js/plugins/easypiechart/jquery.easypiechart.js"></script>

<!-- Sparkline -->
<script src="../../../../resources/plugins/template/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="../../../../resources/plugins/template/js/demo/sparkline-demo.js"></script>

<%-- jquery --%>
<%--<script src="../../../../resources/js/jquery-3.6.3.js"></script>--%>

<script>
    var chart_c1948eec9d7d4d6ebb7ad7d8545ba785 = echarts.init(
        document.getElementById('c1948eec9d7d4d6ebb7ad7d8545ba785'), 'white', {renderer: 'canvas'});
    var option_c1948eec9d7d4d6ebb7ad7d8545ba785 = {
        "animation": true,
        "animationThreshold": 2000,
        "animationDuration": 1000,
        "animationEasing": "cubicOut",
        "animationDelay": 0,
        "animationDurationUpdate": 300,
        "animationEasingUpdate": "cubicOut",
        "animationDelayUpdate": 0,
        "color": [
            "#c23531",
            "#2f4554",
            "#61a0a8",
            "#d48265",
            "#749f83",
            "#ca8622",
            "#bda29a",
            "#6e7074",
            "#546570",
            "#c4ccd3",
            "#f05b72",
            "#ef5b9c",
            "#f47920",
            "#905a3d",
            "#fab27b",
            "#2a5caa",
            "#444693",
            "#726930",
            "#b2d235",
            "#6d8346",
            "#ac6767",
            "#1d953f",
            "#6950a1",
            "#918597"
        ],
        "series": [
            {
                "type": "map",
                "name": "\u5e7f\u5dde\u7701",
                "label": {
                    "show": true,
                    "position": "top",
                    "margin": 8
                },
                "mapType": "\u5e7f\u5dde",
                "data": [
                    {
                        "name": "\u4ece\u5316\u533a",
                        "value": 1476
                    },
                    {
                        "name": "\u5357\u6c99\u533a",
                        "value": 1274
                    },
                    {
                        "name": "\u589e\u57ce\u533a",
                        "value": 1691
                    },
                    {
                        "name": "\u5929\u6cb3\u533a",
                        "value": 1959
                    },
                    {
                        "name": "\u6d77\u73e0\u533a",
                        "value": 1594
                    },
                    {
                        "name": "\u756a\u79ba\u533a",
                        "value": 1712
                    },
                    {
                        "name": "\u767d\u4e91\u533a",
                        "value": 1814
                    },
                    {
                        "name": "\u82b1\u90fd\u533a",
                        "value": 1398
                    },
                    {
                        "name": "\u8354\u6e7e\u533a",
                        "value": 1458
                    },
                    {
                        "name": "\u8d8a\u79c0\u533a",
                        "value": 1152
                    },
                    {
                        "name": "\u9ec4\u57d4\u533a",
                        "value": 1683
                    }
                ],
                "roam": true,
                "aspectScale": 0.75,
                "nameProperty": "name",
                "selectedMode": false,
                "zoom": 1,
                "mapValueCalculation": "sum",
                "showLegendSymbol": true,
                "emphasis": {}
            }
        ],
        "legend": [
            {
                "data": [
                    "\u5e7f\u5dde\u7701"
                ],
                "selected": {
                    "\u5e7f\u5dde\u7701": true
                },
                "show": true,
                "padding": 5,
                "itemGap": 10,
                "itemWidth": 25,
                "itemHeight": 14
            }
        ],
        "tooltip": {
            "show": true,
            "trigger": "item",
            "triggerOn": "mousemove|click",
            "axisPointer": {
                "type": "line"
            },
            "showContent": true,
            "alwaysShowContent": false,
            "showDelay": 0,
            "hideDelay": 100,
            "textStyle": {
                "fontSize": 14
            },
            "borderWidth": 0,
            "padding": 5
        },
        "title": [
            {
                "text": "\u5e7f\u5dde\u90e8\u5206\u4e8c\u624b\u623f\u5404\u533a\u5206\u5e03",
                "padding": 5,
                "itemGap": 10
            }
        ],
        "visualMap": {
            "show": true,
            "type": "continuous",
            "min": 0,
            "max": 3000,
            "inRange": {
                "color": [
                    "#50a3ba",
                    "#eac763",
                    "#d94e5d"
                ]
            },
            "calculable": true,
            "inverse": false,
            "splitNumber": 5,
            "orient": "vertical",
            "showLabel": true,
            "itemWidth": 20,
            "itemHeight": 140,
            "borderWidth": 0
        }
    };
    chart_c1948eec9d7d4d6ebb7ad7d8545ba785.setOption(option_c1948eec9d7d4d6ebb7ad7d8545ba785);
</script>
</body>
</html>

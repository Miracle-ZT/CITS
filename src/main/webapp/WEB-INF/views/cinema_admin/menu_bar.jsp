<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/13
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="utf-8">
    <jsp:include page="../utils/bootstrap5.1.1.jsp" flush="true"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>XLMovie-Cinema</title>
    <link rel="shortcut icon" href="../../../resources/img/logo.png">       <%-- 网页标签图标 --%>
    <link rel="stylesheet" type="text/css" href="../../../resources/plugins/cinema_manage_assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/plugins/cinema_manage_assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/plugins/cinema_manage_assets/css/select2.min.css">
    <link href="../../../resources/plugins/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../../resources/plugins/cinema_manage_assets/css/style.css">
    <link href="../../../resources/css/seat.css" type="text/css" rel="stylesheet"/>
    <link href="../../../resources/plugins/bootstrap-select-1.13.14/dist/css/bootstrap-select.min.css" rel="stylesheet"/>

    <!--[if lt IE 9]>
    <script src="../../../resources/plugins/cinema_manage_assets/js/html5shiv.min.js"></script>
    <script src="../../../resources/plugins/cinema_manage_assets/js/respond.min.js"></script>
    <![endif]-->
    <link href="../../../resources/plugins/admin_assets/css/plugins/toastr/toastr.min.css" rel="stylesheet">
</head>
<body>
<div class="main-wrapper">
    <div class="header">
        <div class="header-left">
            <a href="/cinema_admin/index?cinemaId=${cinema.cinemaId}" class="logo">
                <img src="../../../resources/img/logo.png" width="35" height="35" alt=""> <span>小蓝影视</span>
            </a>
        </div>
        <a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars" style="margin-top: 13px"></i></a>
        <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
        <ul class="nav user-menu float-right">
<%--            <li class="nav-item dropdown d-none d-sm-block">--%>
<%--                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"><i class="fa fa-bell-o"></i> <span class="badge badge-pill bg-danger float-right">3</span></a>--%>
<%--                <div class="dropdown-menu notifications">--%>
<%--                    <div class="topnav-dropdown-header">--%>
<%--                        <span>Notifications</span>--%>
<%--                    </div>--%>
<%--                    <div class="drop-scroll">--%>
<%--                        <ul class="notification-list">--%>
<%--                            <li class="notification-message">--%>
<%--                                <a href="activities.html">--%>
<%--                                    <div class="media">--%>
<%--											<span class="avatar">--%>
<%--												<img alt="John Doe" src="../../../resources/plugins/cinema_manage_assets/img/user.jpg" class="img-fluid">--%>
<%--											</span>--%>
<%--                                        <div class="media-body">--%>
<%--                                            <p class="noti-details"><span class="noti-title">John Doe</span> added new task <span class="noti-title">Patient appointment booking</span></p>--%>
<%--                                            <p class="noti-time"><span class="notification-time">4 mins ago</span></p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li class="notification-message">--%>
<%--                                <a href="activities.html">--%>
<%--                                    <div class="media">--%>
<%--                                        <span class="avatar">V</span>--%>
<%--                                        <div class="media-body">--%>
<%--                                            <p class="noti-details"><span class="noti-title">Tarah Shropshire</span> changed the task name <span class="noti-title">Appointment booking with payment gateway</span></p>--%>
<%--                                            <p class="noti-time"><span class="notification-time">6 mins ago</span></p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li class="notification-message">--%>
<%--                                <a href="activities.html">--%>
<%--                                    <div class="media">--%>
<%--                                        <span class="avatar">L</span>--%>
<%--                                        <div class="media-body">--%>
<%--                                            <p class="noti-details"><span class="noti-title">Misty Tison</span> added <span class="noti-title">Domenic Houston</span> and <span class="noti-title">Claire Mapes</span> to project <span class="noti-title">Doctor available module</span></p>--%>
<%--                                            <p class="noti-time"><span class="notification-time">8 mins ago</span></p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li class="notification-message">--%>
<%--                                <a href="activities.html">--%>
<%--                                    <div class="media">--%>
<%--                                        <span class="avatar">G</span>--%>
<%--                                        <div class="media-body">--%>
<%--                                            <p class="noti-details"><span class="noti-title">Rolland Webber</span> completed task <span class="noti-title">Patient and Doctor video conferencing</span></p>--%>
<%--                                            <p class="noti-time"><span class="notification-time">12 mins ago</span></p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li class="notification-message">--%>
<%--                                <a href="activities.html">--%>
<%--                                    <div class="media">--%>
<%--                                        <span class="avatar">V</span>--%>
<%--                                        <div class="media-body">--%>
<%--                                            <p class="noti-details"><span class="noti-title">Bernardo Galaviz</span> added new task <span class="noti-title">Private chat module</span></p>--%>
<%--                                            <p class="noti-time"><span class="notification-time">2 days ago</span></p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                    <div class="topnav-dropdown-footer">--%>
<%--                        <a href="activities.html">View all Notifications</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </li>--%>
            <li class="nav-item dropdown d-none d-sm-block">
                <a href="javascript:void(0);" id="open_msg_box" class="hasnotifications nav-link"><i class="fa fa-comment-o"></i> <span id="notReadCnt" class="badge badge-pill bg-danger float-right">${notReadCnt}</span></a>
            </li>
            <li class="nav-item dropdown has-arrow">
                <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img"><img class="rounded-circle" src="../../../resources/plugins/cinema_manage_assets/img/user.jpg" width="40" alt="Admin">
<%--						<span class="status online"></span>	--%>
                        </span>
                    <span>2112114236-ZT</span>
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="profile.html">个人资料</a>
                    <a class="dropdown-item" href="edit-profile.html">编辑资料</a>
                    <a class="dropdown-item" href="settings.html">设置</a>
                    <a class="dropdown-item" href="login.html">退出登录</a>
                </div>
            </li>
        </ul>
        <div class="dropdown mobile-user-menu float-right">
            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="profile.html">My Profile</a>
                <a class="dropdown-item" href="edit-profile.html">Edit Profile</a>
                <a class="dropdown-item" href="settings.html">Settings</a>
                <a class="dropdown-item" href="login.html">Logout</a>
            </div>
        </div>
    </div>
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul>
                    <li class="menu-title">后台功能</li>
                    <li class="active">
                        <a href="/cinema_admin/index?cinemaId=${cinema.cinemaId}"><i class="fa fa-home"></i> <span>首页</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-video-camera"></i> <span> 电影管理 </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="/cinema_admin/movie_list?cinemaId=${cinema.cinemaId}">电影列表</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-building"></i> <span> 影厅管理 </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="/cinema_admin/room_list?cinemaId=${cinema.cinemaId}">影厅列表</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-calendar"></i> <span> 排片管理 </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="/cinema_admin/screening_list?cinemaId=${cinema.cinemaId}">场次列表</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-book"></i> <span> 订单管理 </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="/cinema_admin/order_list?cinemaId=${cinema.cinemaId}">订单列表</a></li>
                        </ul>
                    </li>
<%--                    <li class="submenu">--%>
<%--                        <a href="#"><i class="fa fa-comments"></i> <span> 留言管理 </span> <span class="menu-arrow"></span></a>--%>
<%--                        <ul style="display: none;">--%>
<%--                            <li><a href="employees.html">留言列表</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="/cinema_admin/service?cinemaId=${cinema.cinemaId}"><i class="fa fa-cog"></i> <span>权益服务管理</span></a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="calendar.html"><i class="fa fa-cog"></i> <span>影院资料管理</span></a>--%>
<%--                    </li>--%>
<%--                    <li class="submenu">--%>
<%--                        <a href="#"><i class="fa fa-cog"></i> <span> 影院资料管理(备选) </span> <span class="menu-arrow"></span></a>--%>
<%--                        <ul style="display: none;">--%>
<%--                            <li><a href="employees.html">留言列表</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
                </ul>
            </div>
        </div>
    </div>
    <div class="page-wrapper">
        <div class="content">
            <jsp:include page="${include}" flush="true"/>
        </div>
        <div class="notification-box">
            <div class="msg-sidebar notifications msg-noti">
                <div class="topnav-dropdown-header">
                    <span>消息</span>
                </div>
                <div class="drop-scroll msg-list-scroll" id="msg_list">
                    <ul class="list-box">
                        <c:forEach var="msg" items="${messageList}" varStatus="status">
                            <li>
                                <div class="list-item" id="message-list-${msg.messageId}" messageId="${msg.messageId}">
                                    <div class="list-left">
                                        <img src="../../..${msg.msgUser.photo}" style="width: 40px;height: 40px;border-radius: 20px">
<%--                                        <span id="status-${status}" messageId="${msg.messageId}" class="status away" style="margin-top: -8px"></span>--%>
                                        <c:if test="${msg.status eq 0}">
                                            <span id="status-${msg.messageId}" messageId="${msg.messageId}" class="status away" style="margin-top: -8px"></span>
                                        </c:if>
                                    </div>
                                    <div class="list-body">
                                        <span class="message-author" style="width: 150px">${msg.msgUser.username}</span>
                                        <span class="message-time">
                                                <fmt:formatDate value="${msg.createTime}" pattern="MM-dd HH:mm"/>
                                            </span>
                                        <div class="clearfix"></div>
                                        <span class="message-content">${msg.msgStr}</span>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="topnav-dropdown-footer">
                    <a href="#">查看所有</a>
                </div>
            </div>
        </div>
    </div>
    <div id="delete_doctor" class="modal fade delete-modal" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <img src="../../../resources/plugins/cinema_manage_assets/img/sent.png" alt="" width="50" height="46">
                    <h3>Are you sure want to delete this Doctor?</h3>
                    <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="sidebar-overlay" data-reff=""></div>
<script src="../../../resources/plugins/cinema_manage_assets/js/jquery-3.2.1.min.js"></script>
<script src="../../../resources/plugins/cinema_manage_assets/js/popper.min.js"></script>
<script src="../../../resources/plugins/cinema_manage_assets/js/bootstrap.min.js"></script>
<script src="../../../resources/plugins/cinema_manage_assets/js/jquery.slimscroll.js"></script>
<script src="../../../resources/plugins/cinema_manage_assets/js/select2.min.js"></script>
<script src="../../../resources/plugins/cinema_manage_assets/js/moment.min.js"></script>
<script src="../../../resources/plugins/cinema_manage_assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="../../../resources/plugins/cinema_manage_assets/js/app.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/toastr/toastr.min.js"></script>
<script src="../../../resources/plugins/bootstrap-select-1.13.14/dist/js/bootstrap-select.min.js"></script>



<%-- 消息 --%>
<script>
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "progressBar": true,
        "positionClass": "toast-top-center",
        "onclick": null,
        "showDuration": "400",
        "hideDuration": "1000",
        "timeOut": "7000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    $(document).ready(function () {
        $('body').on('click', "div[id^='message-list-']", function() {
            let messageId = $(this).attr("messageId");
            $("span[id^='status-']").each(function () {             //隐藏未读标志
                if ($(this).attr("messageId") == messageId){
                    $(this).prop("hidden", true);
                }
            });
            $.ajax({
                url:"update_message_status",
                async:false,
                data:{
                    "messageId":messageId,
                },
                type:"POST",
                dataType:"json",
                // contentType : "application/json;charset=UTF-8",
                success:function (data){
                    let msg = data["msg"];
                    let notReadCnt = data["notReadCnt"];
                    toastr.info(msg.msgStr);
                    if (notReadCnt == 0){
                        $("#notReadCnt").prop("hidden", true);
                    }
                    else{
                        $("#notReadCnt").prop("hidden", false);
                        $("#notReadCnt").text(notReadCnt);
                    }
                },
                error:function (){
                    alert("ajax请求错误");
                }
            });

        });
    });
</script>




</body>
</html>

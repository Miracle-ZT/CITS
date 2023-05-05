<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/21
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>XLMovie - 影院列表</title>

    <link rel="shortcut icon" href="favicon.ico"> <link href="../../../resources/plugins/admin_assets/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="../../../resources/plugins/admin_assets/css/animate.min.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

    <!-- Sweet Alert -->
    <link href="../../../resources/plugins/admin_assets/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/chosen/chosen.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-sm-8">
            <div class="ibox">
                <div class="ibox-content">
<%--                    <span class="text-muted small pull-right">最后更新：<i class="fa fa-clock-o"></i> 2015-09-01 12:00</span>--%>
                    <h2>影院管理</h2>
                    <p>
                        所有影院必须通过验证
                    </p>
                    <div class="input-group">
                        <input type="text" id="keyWord" placeholder="查找 影院/负责人" class="input form-control" autocomplete="off">
                        <span class="input-group-btn">
                                        <button type="button" id="search-btn" class="btn btn btn-primary"> <i class="fa fa-search"></i> 搜索</button>
                                </span>
                    </div>
                    <div class="clients-list">
                        <ul class="nav nav-tabs">
                            <span id="cnt-cinema" class="pull-right small text-muted">${cinemaList.size()} 个影院</span>
                            <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-briefcase"></i> 影院</a>
                            </li>
                            <li class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-user"></i> 负责人</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <%-- 影院列表 --%>
                            <div id="tab-1" class="tab-pane active">
                                <div class="full-height-scroll">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-hover">
                                            <tbody id="cinemaList">
                                            <c:forEach var="cinema" items="${cinemaList}" varStatus="status">
                                                <tr>
                                                    <td><a data-toggle="tab" href="#company-1" class="client-link">${cinema.name}</a>
                                                    </td>
                                                    <td>${cinema.phone}</td>
                                                    <td><i class="fa fa-flag"></i> ${cinema.city}</td>
                                                    <c:if test="${cinema.cinemaStatus == 1}">
                                                    <td class="client-status"><span class="label label-warning">已认证</span>
                                                    </c:if>
                                                    <c:if test="${cinema.cinemaStatus == 0}">
                                                    <td class="client-status"><span class="label label-info">未认证</span>
                                                    </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <%-- 负责人列表 --%>
                            <div id="tab-2" class="tab-pane">
                                <div class="full-height-scroll">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-hover">
                                            <tbody id="accinemaList">
                                            <c:forEach var="cinema" items="${cinemaList}" varStatus="status">
                                                <tr>
                                                    <td><a data-toggle="tab" href="#contact-1" class="client-link">${cinema.adminCinema.name}</a>
                                                    </td>
                                                    <td> ${cinema.phone}</td>
                                                    <td class="contact-type"><i class="fa fa-envelope"> </i>
                                                    </td>
                                                    <td> ${cinema.adminCinema.email}</td>
                                                    <c:if test="${cinema.cinemaStatus == 1}">
                                                    <td class="client-status"><span class="label label-warning">已认证</span>
                                                    </c:if>
                                                    <c:if test="${cinema.cinemaStatus == 0}">
                                                    <td class="client-status"><span class="label label-info">未认证</span>
                                                    </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="ibox ">
                <div id="cinema-detail" class="ibox-content">
                    <c:if test="${not empty cinemaList}">
                        <div class="tab-content">
                            <div id="contact-1" class="tab-pane active">
                                <div class="m-b-lg">
                                    <div class=" text-center">
                                        <div class="m-b-sm">
                                            <img alt="image" class="img-shadow" src="../../..${cinemaList.get(0).photo}" style="width: 400px">
                                        </div>
                                    </div>
                                </div>
                                <div class="client-detail">
                                    <div class="full-height-scroll">
                                        <strong>影院详情</strong>
                                        <ul class="list-group clear-list">
                                            <li class="list-group-item fist-item">
                                                <span class="pull-right"> ${cinemaList.get(0).address}</span> 详细地址
                                            </li>
                                            <li class="list-group-item">
                                                <span class="pull-right"> ${cinemaList.get(0).phone} </span> 联系电话
                                            </li>
                                            <li class="list-group-item">
                                                <span class="pull-right"> ${cinemaList.get(0).adminCinema.name} </span> 负责人
                                            </li>
                                            <li class="list-group-item">
                                                <span class="pull-right"> ${cinemaList.get(0).brand.brandName} </span> 品牌方
                                            </li>
                                        </ul>
                                        
                                        <c:if test="${cinemaList.get(0).cinemaStatus == 0}">
                                            <strong>操作</strong>
                                            <p style="text-align: center">
                                                <a id="confirm-yes-btn" cinemaId="${cinemaList.get(0).cinemaId}" class="btn btn-primary">
                                                    <?xml version="1.0" encoding="UTF-8"?><svg width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M43 11L16.875 37L5 25.1818" stroke="#ffffff" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/></svg>
                                                </a>
                                                &nbsp;&nbsp;&nbsp;
                                                <a id="confirm-no-btn" cinemaId="${cinemaList.get(0).cinemaId}" class="btn btn-outline-primary" style="border: 1px solid #d3d3d3">
                                                    <?xml version="1.0" encoding="UTF-8"?><svg width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M8 8L40 40" stroke="#1ab394" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M8 40L40 8" stroke="#1ab394" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/></svg>
                                                </a>
                                            </p>
                                            <hr/>
                                        </c:if>
                                        <c:if test="${cinemaList.get(0).cinemaStatus == 1}">
                                            <strong>备注</strong>
                                            <p>
                                                ----------------------------------------------------------------------------------------- 暂无
                                            </p>
                                            <hr/>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../../../resources/plugins/admin_assets/js/jquery.min.js?v=2.1.4"></script>
<script src="../../../resources/plugins/admin_assets/js/bootstrap.min.js?v=3.3.5"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../../resources/plugins/admin_assets/js/content.min.js?v=1.0.0"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    $(function(){$(".full-height-scroll").slimScroll({height:"100%"})});
</script>


<%-- 搜索按钮查询事件 --%>
<script>
    $(document).ready(function () {
        $('body').on('click', "#search-btn", function () {
            let keyWord = $("#keyWord").val();
            $.ajax({
                url: "refresh_list",
                async: false,
                data: {
                    "keyWord": keyWord,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let cinemaList = data["cinemaList"];
                    $("#cnt-cinema").text(cinemaList.length + " 个影院");
                    $("#cinemaList").empty();
                    if (cinemaList.length > 0) {                        // 有结果
                        refresh_list(cinemaList);
                    }
                    // else {
                    //     $("#cinema-detail").empty();
                    // }
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    })
</script>

<%-- 搜索框内容变化 实时更新影院列表 以及相关 负责人列表 --%>
<script>
    $(document).ready(function () {
        // input propertychange --- input的实时内容更新事件
        $('body').on('input propertychange', "#keyWord", function () {
            let keyWord = $("#keyWord").val();
            $.ajax({
                url: "refresh_list",
                async: false,
                data: {
                    "keyWord": keyWord,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let cinemaList = data["cinemaList"];
                    $("#cnt-cinema").text(cinemaList.length + " 个影院");
                    $("#cinemaList").empty();
                    $("#accinemaList").empty();
                    if (cinemaList.length > 0) {                        // 有结果
                        refresh_list(cinemaList);
                    }
                    // else {
                    //     $("#cinema-detail").empty();
                    // }
                    // alert("ajax请求成功");
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    })

</script>

<%-- 对影院状态进行更改 --%>
<script>
    $(document).ready(function () {
        $('body').on('click', "#confirm-yes-btn", function () {
            let cinemaId = $(this).attr("cinemaId");
            $.ajax({
                url:"findCinemaById",
                async:false,
                data:{
                    "cinemaId":cinemaId,
                },
                type:"POST",
                dataType:"json",
                // contentType : "application/json;charset=UTF-8",
                success:function (data){
                    let cinema = data["cinema"];
                    swal({
                        title: "确定通过认证？",
                        text: cinema.name,
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "通过",
                        closeOnConfirm: false,
                        cancelButtonText:"取消",
                    }, function () {
                        //后台执行删除
                        $.ajax({
                            url: "update_message_status",
                            async: false,
                            data: {
                                "cinemaId": cinemaId,
                            },
                            type: "POST",
                            dataType: "json",
                            // contentType : "application/json;charset=UTF-8",
                            success: function (data) {
                                let cinema = data["cinema"];
                                let cinemaList = data["cinemaList"];
                                swal("已认证！", cinema.name + "已通过验证。", "success");

                                refresh_list(cinemaList);
                            },
                            error: function () {
                                swal("未认证！", cinema.name + "未通过验证。", "error");
                            }
                        });
                    });
                },
                error:function (){
                    alert("ajax请求错误");
                }
            });
        });
    });
</script>

<%-- 刷新影院/负责人列表 --%>
<script>
    function refresh_list(cinemaList) {
        $("#cinemaList").empty();
        $("#accinemaList").empty();
        for (let i = 0; i < cinemaList.length; i++) {
            // 影院列表
            let eachText =
                '                                                <tr>\n' +
                '                                                    <td><a data-toggle="tab" href="#company-1" class="client-link">' + cinemaList[i].name + '</a>\n' +
                '                                                    </td>\n' +
                '                                                    <td>' + cinemaList[i].phone + '</td>\n' +
                '                                                    <td><i class="fa fa-flag"></i> ' + cinemaList[i].city + '</td>\n';
            if (cinemaList[i].cinemaStatus == 0) {
                eachText += '                                                    <td class="client-status"><span class="label label-info">未认证</span>\n';
            } else if (cinemaList[i].cinemaStatus == 1) {
                eachText += '                                                    <td class="client-status"><span class="label label-warning">已认证</span>\n';
            }
            eachText +=
                '                                                    </td>\n' +
                '                                                </tr>'
            ;
            $("#cinemaList").append(eachText);

            // 负责人列表
            eachText =
                '                                                <tr>\n' +
                '                                                    <td><a data-toggle="tab" href="#contact-1" class="client-\n' +
                'link">' + cinemaList[i].adminCinema.name + '</a>\n' +
                '                                                    </td>\n' +
                '                                                    <td> ' + cinemaList[i].phone + '</td>\n' +
                '                                                    <td class="contact-type"><i class="fa fa-envelope"> </i>\n' +
                '                                                    </td>\n' +
                '                                                    <td> ' + cinemaList[i].adminCinema.email + '</td>\n';
            if (cinemaList[i].cinemaStatus == 0) {
                eachText += '                                                    <td class="client-status"><span class="label label-info">未认证</span>\n';
            } else if (cinemaList[i].cinemaStatus == 1) {
                eachText += '                                                    <td class="client-status"><span class="label label-warning">已认证</span>\n';
            }
            eachText +=
                '                                                    </td>\n' +
                '                                                </tr>\n'
            ;
            $("#accinemaList").append(eachText);
        }

    }
</script>


</body>
</html>

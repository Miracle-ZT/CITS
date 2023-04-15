<%@ page import="sfw.xmut.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/1
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
    <style>
        .box{
            background-image:url(../../../../resources/img/bg_detail.jpg);
            height: 400px;
            width: 2534px;
        }
        .nav.nav-tabs {
            overflow-x: auto;
            overflow-y: hidden;
            flex-wrap: nowrap;
        }
    </style>
    <link href="../../../../resources/plugins/admin_assets/css/plugins/toastr/toastr.min.css" rel="stylesheet">
</head>
<body>
<div style="margin:100px auto;width: 1400px;margin-top: 0px">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
</div>

<div class="row box" style="width: 100%;margin-top: -84px;">
    <div class="col-1"></div>
    <div class="col-3">
        <div>
            <img src="../../../../resources/img/default_cinema_pic.png" class="mx-auto d-block border-white border border-3" style="width: 292px;height: 292px;margin-top: 50px;">
        </div>
    </div>
    <div class="col-4" style="margin-top: 40px">
        <div class="text-white">                <!-- 白色文字信息部分 -->
            <h1 style="font-weight: bold;margin-top: 5px">${cinema.name}</h1>
            <h5 style="margin-top: -5px;">${cinema.address}</h5>
            <h5 style="margin-top: -5px;">${cinema.phone}</h5>

            <%
                if (session.getAttribute("logined_user") != null) {                // 登录才能留言
                    User logined_user = (User) request.getSession().getAttribute("logined_user");
            %>
            <button class="btn btn-outline-info"
                    data-bs-toggle="modal"
                    data-bs-target="#message">
                留言反馈
            </button>
            <%} else {%>                                                             <!-- 未登录 -->
            <button class="btn btn-outline-info" id="not-login-message">
                留言反馈
            </button>
            <%}%>
        </div>
        <div class="row">                                   <!-- 服务介绍 -->
            <div class="col-3 text-white">影院服务</div>
            <div class="col-9">         <!-- 分割线 -->
                <div style="height: 2px;background-color: grey;margin-top: 12px;margin-left: -60px">
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 20px;height: 20px">
            <div class="col-2 text-white">                         <!-- 影院服务名 -->
                <span class="border border-1 border-white align-items-center"
                      style="min-width: 80px;display: inline-block;text-align: center">
                    改签
                </span>
            </div>
            <div class="col-10 text-white">                         <!-- 影院服务详情 -->
                <p style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis">
                    未取票用户放映前60分钟可改签
                </p>
            </div>
        </div>
    </div>
    <div class="col-4 text-white"></div>
</div>

<div class="card card-body" style="transform: translateX(10%);width: 1400px;margin-top: 10px">
    <div style="width:1360px">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <c:forEach var="movie" items="${movieList}" varStatus="status">
                <c:if test="${status.first}">
                    <li class="nav-item" role="presentation">
                        <img src="../../../..${movie.imgUrl}" class="nav-link active" style="width: 232px;height: 322px"
                             id="movieId-${movie.movieId}-tab" movieId="${movie.movieId}"
                             data-bs-toggle="tab" data-bs-target="#movieId-${movie.movieId}-id" role="tab" aria-controls="movieId-${movie.movieId}-id" aria-selected="true">
                    </li>
                </c:if>
                <c:if test="${!status.first}">
                    <li class="nav-item" role="presentation">
                        <img src="../../../..${movie.imgUrl}" class="nav-link" style="width: 232px;height: 322px"
                             id="movieId-${movie.movieId}-tab" movieId="${movie.movieId}"
                             data-bs-toggle="tab" data-bs-target="#movieId-${movie.movieId}-id" role="tab" aria-controls="movieId-${movie.movieId}-id" aria-selected="false">
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <div class="tab-content" id="myTabContent" style="height: 40px">             <!-- 对应的电影名的文本 用于标识当前所选电影 -->
        <c:forEach var="movie" items="${movieList}" varStatus="status">
            <c:if test="${status.first}">
                <div class="tab-pane fade active show" id="movieId-${movie.movieId}-id" role="tabpanel" aria-labelledby="movieId-${movie.movieId}-tab">
                    <div class="row">
                        <div class="col-4"><h2>${movie.chineseName}</h2></div>
                        <div class="col-2"></div>
                        <div class="col-1">${movie.timeLen}min</div>
                        <div class="col-1">
                            <c:forEach var="type" items="${movie.typeList}" varStatus="status">
                                ${type.typeName}&nbsp;
                            </c:forEach>
                        </div>
                        <div class="col-4">${movie.actors}</div>
                    </div>
                </div>
            </c:if>
            <c:if test="${!status.first}">
                <div class="tab-pane fade" id="movieId-${movie.movieId}-id" role="tabpanel" aria-labelledby="movieId-${movie.movieId}-tab">
                    <div class="row">
                        <div class="col-4"><h2>${movie.chineseName}</h2></div>
                        <div class="col-2"></div>
                        <div class="col-1">${movie.timeLen}min</div>
                        <div class="col-1">
                            <c:forEach var="type" items="${movie.typeList}" varStatus="status">
                                ${type.typeName}&nbsp;
                            </c:forEach>
                        </div>
                        <div class="col-4">${movie.actors}</div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<div class="card card-body" style="transform: translateX(10%);width: 1400px;">
    <div>
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <h5 class="align-self-center text-muted" style="padding: 5px;margin-top: 7px">日期：</h5>
            <c:forEach var="dateText" items="${dateTextMap}" varStatus="status">
                <c:if test="${status.first}">
                    <li class="nav-item" role="presentation" style="padding: 5px">
                        <button class="nav-link active" name="spanDate" value="${status.index}" data-bs-toggle="pill"
                                data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                aria-selected="true" id="spanDate-${status.index}">${dateText.key}&nbsp;&nbsp;${dateText.value}</button>
                    </li>
                </c:if>
                <c:if test="${!status.first}">
                    <li class="nav-item" role="presentation" style="padding: 5px">
                        <button class="nav-link" name="spanDate" value="${status.index}" data-bs-toggle="pill"
                                data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                aria-selected="false" id="spanDate-${status.index}">${dateText.key}&nbsp;&nbsp;${dateText.value}</button>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="card card-body" style="transform: translateX(10%);width: 1400px;">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">放映时间</th>
            <th scope="col">语言版本</th>
            <th scope="col">放映厅</th>
            <th scope="col">售价（元）</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody id="screeningList">
        <c:if test="${not empty screeningList}">
            <c:forEach var="screening" items="${screeningList}" varStatus="status">
                <tr>
                    <td>
                        <div><strong>${screening.startTime.hours}:${screening.startTime.minutes}</strong></div>
                        <div style="font-size: 13px">${screening.endTime.hours}:${screening.endTime.minutes}散场</div>
                    </td>
                    <td>${screening.language.lanName}</td>
                    <td>${screening.roomId}</td>
                    <td>${screening.price}</td>
                    <td>                                                                                                <!-- 初始展示为movieList第一个元素的movieId 与后端的Dao层逻辑一致 -->
                        <a href="${pageContext.request.contextPath}/home/order/select_seat?cinemaId=${cinema.cinemaId}&movieId=${movieList[0].movieId}&screeningId=${screening.screeningId}">
                            <button class="btn btn-outline-primary btn-sm" style="border-radius: 40px">
                                选座购票
                            </button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty screeningList}">
            <tr>
                <td>
                    <div>
                        <h5>抱歉，没有找到相关结果，请尝试用其他条件筛选。</h5>
                    </div>
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="message" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4>反馈内容</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="message-text" class="col-form-label">详情:</label>
                    <textarea class="form-control" id="message-text" autocomplete="off"></textarea>
                    <div id="str-cnt" style="text-align: right">0/100</div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary disabled" data-bs-dismiss="modal" id="add-message">提交</button>
            </div>
        </div>
    </div>
</div>


<script src="../../../../resources/js/jquery-3.6.3.js"></script>
<script src="../../../../resources/plugins/admin_assets/js/plugins/toastr/toastr.min.js"></script>

<%-- 日期对象格式化 --%>
<script>
    function transferTime(cTime) {     //将json串的一串数字进行解析
        var jsonDate = new Date(parseInt(cTime));
        //       alert(jsonDate);
        //为Date对象添加一个新属性，主要是将解析到的时间数据转换为我们熟悉的“yyyy-MM-dd hh:mm:ss”样式
        Date.prototype.format = function(format) {
            var o = {
                //获得解析出来数据的相应信息，可参考js官方文档里面Date对象所具备的方法
                "y+": this.getFullYear(), //得到对应的年信息
                "M+": this.getMonth() + 1, //得到对应的月信息，得到的数字范围是0~11，所以要加一
                "d+": this.getDate(), //得到对应的日信息
                "h+": this.getHours(), //得到对应的小时信息
                "m+": this.getMinutes(), //得到对应的分钟信息
                "s+": this.getSeconds(), //得到对应的秒信息
            }
            //将年转换为完整的年形式
            if(/(y+)/.test(format)) {
                format = format.replace(RegExp.$1,    (this.getFullYear() + "") .substr(4 - RegExp.$1.length));
            }
            //连接得到的年月日 时分秒信息
            for(var k in o) {
                if(new RegExp("(" + k + ")").test(format)) {
                    format = format.replace(RegExp.$1,  RegExp.$1.length == 1 ? o[k] : ("00" + o[k]) .substr(("" + o[k]).length));
                }
            }
            return format;
        }
        // var newDate = jsonDate.format("yyyy-MM-dd hh:mm:ss");
        var newDate = jsonDate.format("hh:mm");                     // 设置时间格式
        return newDate;
    }
</script>

<%-- 刷新场次列表 --%>
<script>
    $("button[id^='spanDate-']").on("click",function (e){               // 监听spanDate-开头的id的button
        let movieId = $("img[id^='movieId-'].active").attr("movieId")   // 当前被选中active的img控件
        let spanDate = $(e.target).val()
        // alert("movieId" + movieId + "\nspanDate" + spanDate);
        $.ajax({
            url:"refresh_screening_list?cinemaId=${cinema.cinemaId}",
            async:false,
            data:{
                "spanDate":spanDate,
                "movieId":movieId,
            },
            type:"POST",
            dataType:"json",
            // contentType : "application/json;charset=UTF-8",
            success:function (data){
                var screeningList = data["screeningList"];
                $("#screeningList").empty();
                if (screeningList.length > 0){
                    for (var i = 0;i < screeningList.length;i++){
                        var eachText = '<tr>\n' +
                            '                <td>\n' +
                            '                    <div><strong>' + transferTime(screeningList[i].startTime) + '</strong></div>\n' +
                            '                    <div style="font-size: 13px">' + transferTime(screeningList[i].endTime) + '散场</div>\n' +
                            '                </td>\n' +
                            '                <td>' + screeningList[i].language.lanName + '</td>\n' +
                            '                <td>' + screeningList[i].roomId + '</td>\n' +
                            '                <td>' + screeningList[i].price + '</td>\n' +
                            '                <td>\n' +
                            '                    <a href="/home/order/select_seat?cinemaId=${cinema.cinemaId}&movieId=' + movieId + '&screeningId=' + screeningList[i].screeningId + '">\n' +
                            '                        <button class="btn btn-outline-primary btn-sm" style="border-radius: 40px">\n' +
                            '                            选座购票\n' +
                            '                        </button>\n' +
                            '                    </a>\n' +
                            '                </td>\n' +
                            '            </tr>\n';
                        $("#screeningList").append(eachText);
                    }
                }else{
                    var noResultText = '            <tr>\n' +
                        '                <td>\n' +
                        '                    <div>\n' +
                        '                        <h5>抱歉，没有找到相关结果，请尝试用其他条件筛选。</h5>\n' +
                        '                    </div>\n' +
                        '                </td>\n' +
                        '            </tr>\n';
                    $("#screeningList").append(noResultText);
                }
            },
            error:function (){
                alert("ajax请求错误");
            }
        });
    });

    $("img[id^='movieId-']").on("click",function (e){               // 监听movieId-开头的id的img
        let spanDate = $("button[id^='spanDate-'].active").val()    // 当前被选中active的button控件
        let movieId = $(e.target).attr("movieId")
        // alert("movieId" + movieId + "\nspanDate" + spanDate);
        $.ajax({
            url:"refresh_screening_list?cinemaId=${cinema.cinemaId}",
            async:false,
            data:{
                "spanDate":spanDate,
                "movieId":movieId,
            },
            type:"POST",
            dataType:"json",
            // contentType : "application/json;charset=UTF-8",
            success:function (data){
                var screeningList = data["screeningList"];
                $("#screeningList").empty();
                if (screeningList.length > 0){
                    for (var i = 0;i < screeningList.length;i++){
                        var eachText = '<tr>\n' +
                            '                <td>\n' +
                            '                    <div><strong>' + transferTime(screeningList[i].startTime) + '</strong></div>\n' +
                            '                    <div style="font-size: 13px">' + transferTime(screeningList[i].endTime) + '散场</div>\n' +
                            '                </td>\n' +
                            '                <td>' + screeningList[i].language.lanName + '</td>\n' +
                            '                <td>' + screeningList[i].roomId + '</td>\n' +
                            '                <td>' + screeningList[i].price + '</td>\n' +
                            '                <td>\n' +
                            '                    <a href="/home/order/select_seat?cinemaId=${cinema.cinemaId}&movieId=' + movieId + '&screeningId=' + screeningList[i].screeningId + '">\n' +
                            '                        <button class="btn btn-outline-primary btn-sm" style="border-radius: 40px">\n' +
                            '                            选座购票\n' +
                            '                        </button>\n' +
                            '                    </a>\n' +
                            '                </td>\n' +
                            '            </tr>\n';
                        $("#screeningList").append(eachText);
                    }
                }else{
                    var noResultText = '            <tr>\n' +
                        '                <td>\n' +
                        '                    <div>\n' +
                        '                        <h5>抱歉，没有找到相关结果，请尝试用其他条件筛选。</h5>\n' +
                        '                    </div>\n' +
                        '                </td>\n' +
                        '            </tr>\n';
                    $("#screeningList").append(noResultText);
                }
            },
            error:function (){
                alert("ajax请求错误");
            }
        });
    });
</script>

<%-- 未登录时点击留言反馈按钮 --%>
<script>
    $("#not-login-message").on("click",function (e){
        alert("请先登录！");
        window.location = "/user/login";
    });
</script>

<%-- 限制textarea存在有效文本 --%>
<script>
    $(document).ready(function () {
        $('body').on('input propertychange', "#message-text", function () {
            let str_cnt = $("#message-text").val().length;
            $("#str-cnt").text(str_cnt + "/100");

            if (str_cnt > 0 && str_cnt <= 100){
                $("#add-message").removeClass("disabled");
            }
            else if (str_cnt == 0 || str_cnt > 100){
                $("#add-message").addClass("disabled");
            }
        });
    });
</script>

<%-- 提交Message --%>
<script>
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
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

    $("#add-message").on("click",function (e){
        let cinemaId = ${cinema.cinemaId};
        let msgStr = $("#message-text").val();
        $.ajax({
            url:"add_message",
            async:false,
            data:{
                "cinemaId":cinemaId,
                "msgStr":msgStr,
            },
            type:"POST",
            dataType:"json",
            // contentType : "application/json;charset=UTF-8",
            success:function (data){
                toastr.success("发送成功，感谢您的反馈！");
            },
            error:function (){
                alert("ajax请求错误");
            }
        });
    });
</script>


</body>
</html>

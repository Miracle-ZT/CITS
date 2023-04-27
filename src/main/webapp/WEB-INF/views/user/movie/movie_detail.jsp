<%@ page import="org.apache.commons.lang.time.DateFormatUtils" %><%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/1/18
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${movie.chineseName}_XiaoLanMovie</title>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
    <style>
        .box{
            background-image:url(../../../../resources/img/bg_detail.jpg);
            height: 400px;
            width: 2534px;
        }
        /* 标题前添加小竖杠 */
        .part-title::before {
            float: left;
            content: "";
            display: inline-block;
            width: 4px;
            height: 30px;
            margin-right: 6px;
            background-color: #0d6efd;
            border-radius: 5px;
        }
        .part-title {
            color: #333;
            margin-bottom: 60px;
        }
    </style>
    <link href="../../../../resources/plugins/admin_assets/css/plugins/toastr/toastr.min.css" rel="stylesheet">
</head>
<body>
<div style="margin:100px auto;width: 1400px;margin-top: 0px">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
</div>

<div class="row box" style="width: 100%;margin-top: -100px;">
    <div class="col-2"></div>
    <div class="col-2">
        <div>
            <img src="../../../..${movie.imgUrl}" class="mx-auto d-block border-white border border-3" style="width: 232px;height: 322px;margin-top: 40px">
        </div>
    </div>
    <div class="col-4" style="margin-top: 40px">
        <div class="text-white">                <!-- 白色文字信息部分 -->
            <h1 style="font-weight: bold;margin-top: 5px">${movie.chineseName}</h1>
            <h4 style="margin-top: -10px;">${movie.englishName}</h4>
            <div style="margin-top: 20px">
                <h5>
                    <c:forEach var="type" items="${movie.typeList}" varStatus="status">
                        ${type.typeName}&nbsp;
                    </c:forEach>
                </h5>
                <h5>${movie.country} / ${movie.timeLen}分钟</h5>
                <h5><fmt:formatDate value="${movie.releaseDate}" pattern="yyyy-MM-dd"/> 中国大陆上映</h5>
            </div>
        </div>
        <div class="row" style="padding: 12px;margin-top: 30px">                                   <!-- 按钮部分 -->
            <button type="button" class="btn btn-outline-danger text-white" style="width: 145px">
                <img src="../../../../resources/img/mark_white_0.png" style="width: 20px;height: 20px">
                收藏
            </button>
            <button type="button" class="btn btn-outline-danger text-white" style="width: 145px;margin-left: 10px">
                <img src="../../../../resources/img/rating_white_0.png" style="width: 20px;height: 20px">
                评分
            </button>
            <p>
                <a href="/home/purchase?movieId=${movie.movieId}">
                    <button type="button" class="btn btn-danger" style="width: 300px;margin-left: -12px;margin-top: 10px">立即购票</button>
                </a>
            </p>
        </div>
    </div>
    <div class="col-4 text-white">
        <div class="col" style="height: 200px;width: 100%"></div>
        <div class="col">
            小蓝口碑
            <div class="row">
                <div class="col-2">
                    x.x
                </div>
                <div class="col-3">
                    ※※※※※
                </div>
                <div class="col-7"></div>
            </div>
        </div>
        <div class="col">
            累计票房
            <div class="row">
                <div class="col-3">
                    xx.xx亿
                </div>
                <div class="col-7"></div>
            </div>
        </div>
    </div>
</div>

<div style="height: 50px"></div>
<div class="row" style="margin: 0px auto 0px auto;width: 1400px">
    <%-- 左版面 --%>
    <div class="col-8" style="padding-right: 100px">        <%-- 两个大列之间的间距 --%>
        <%-- 剧情简介 --%>
        <div class="part-title">
            <h4>剧情简介</h4>
            <div style="margin-top: 20px;color: #333;font-size: 17px;text-indent: 2em">
                ${movie.introduction}
            </div>
        </div>
        <%-- 演职人员 --%>
        <div class="part-title">
            <h4>演职人员</h4>
            <div style="margin-top: 20px">
                导演：${movie.director}<br>
                演员：${movie.actors}
            </div>
        </div>
        <%-- 热门短评 --%>
        <div class="part-title">
            <div style="display: flex;justify-content: space-between;margin-bottom: 10px">
                <div><h4>热门短评</h4></div>
                <div>
                    <button class="btn btn-sm btn-outline-secondary" style="border-radius: 20px"
                            data-bs-toggle="modal" data-bs-target="#commentModal"
                    id="send-comment">写影评</button>
                </div>
            </div>
            <c:forEach var="comment" items="${commentList}" varStatus="status">
                <div style="margin-top: 20px">
                    <div class="row">
                        <div class="col-1">
                            <img src="../../../..${comment.user.photo}"
                                 style=";width: 50px;height: 50px;border-radius: 50%;border: 1px #d3d3d3 solid;overflow: hidden">
                        </div>
                        <div class="col-6">
                            <div style="font-weight: bold">${comment.user.username}&nbsp;&nbsp;
                                <%-- 是否购票 --%>

                            </div>
                            <div style="color:#868686;">
                                <fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd"/>
                                &nbsp;&nbsp;
                                <%-- 循环评分star样式 --%>
                                <c:forEach var="i" begin="1" end="5">
                                    <c:if test="${i <= comment.commentScore}">
                                        <svg width="20" height="20" viewBox="0 0 58 58" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#ffc600" stroke="#ffc600" stroke-width="4" stroke-linejoin="round"/></svg>
                                    </c:if>
                                    <c:if test="${i > comment.commentScore}">
                                        <svg width="20" height="20" viewBox="0 0 58 58" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-2 text-center" style="color:#d3d3d3;display: flex;justify-content: flex-end;align-items: center">
                            <a href="#" style="text-decoration: none;color:#d3d3d3;">举报</a>
                        </div>
                        <div class="col-3 text-right" style="display: flex;justify-content: flex-end;align-items: center">
                            <div id="area-like-${comment.commentId}" commentId="${comment.commentId}"
                                 style="cursor:pointer;pointer-events: auto" >
                                <a id="ico-like-${comment.commentId}" commentId="${comment.commentId}">
                                    <svg width="20" height="20" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M27.6002 18.5998V11.3998C27.6002 8.41743 25.1826 5.99977 22.2002 5.99977L15.0002 22.1998V41.9998H35.9162C37.7113 42.0201 39.2471 40.7147 39.5162 38.9398L42.0002 22.7398C42.1587 21.6955 41.8506 20.6343 41.1576 19.8373C40.4645 19.0403 39.4564 18.5878 38.4002 18.5998H27.6002Z" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/><path d="M15 22.0001H10.194C8.08532 21.9628 6.2827 23.7095 6 25.7994V38.3994C6.2827 40.4894 8.08532 42.0367 10.194 41.9994H15V22.0001Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                                </a>
                                <span style="color:#a1a1a1;">${comment.commentLikeCnt}</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-11" style="margin-top: 15px;padding-bottom: 25px;border-bottom: 1px solid #e5e5e5">
                            ${comment.commentContent}
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <%-- 右版面 --%>
    <div class="col-4">
        <div class="part-title">
            <h4>相关电影</h4>
            <div id="relevantMovieList" style="margin: 0px auto 0px auto;width: 450px;">
                <c:forEach var="movie" items="${relevantMovieList}" varStatus="status">
                    <div class="text-center" style="display: inline-block;margin: 15px 0px 20px 0px">
                        <div>
                            <a href="/home/movie_detail?movieId=${movie.movieId}"><img src="../../../..${movie.imgUrl}" style="height: 161px;width: 116px"></a>
                        </div>
                        <div style="font-size: 17px;height: 35px;width: 139px;line-height: 35px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
                                ${movie.chineseName}
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>







<%-- 评论弹窗 --%>
<div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="comment" action="#" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-2 text-center"
                             style="font-weight: bold;font-size: 22px;display: inline-block;vertical-align: middle">评分
                        </div>
                        <div class="col-10" style="display: flex;justify-content: space-between">
                            <input id="score" name="score" type="text" value="0" hidden>
                            <div id="star" style="display: flex;justify-content: flex-end;align-items: center">
                                <svg id="star-1" star="1" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                                <svg id="star-2" star="2" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                                <svg id="star-3" star="3" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                                <svg id="star-4" star="4" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                                <svg id="star-5" star="5" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                            </div>
                            <span id="score-display" style="display: flex;justify-content: flex-end;align-items: center;color: #ffc600;font-size: 20px">
                                0.0
                            </span>
                        </div>
                    </div>
                    <div style="height: 25px"></div>
                    <div>
                        <textarea id="comment-content" name="comment-content" class="form-control" rows="5" placeholder="大家都在问：剧情怎么样，画面好吗，演技如何？"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" style="width: 100px">发布</button>
                </div>
            </form>
        </div>
    </div>
</div>



<%-- jquery --%>
<script src="../../../../resources/js/jquery-3.6.3.js"></script>
<%-- toastr --%>
<script src="../../../../resources/plugins/admin_assets/js/plugins/toastr/toastr.min.js"></script>

<%-- 点击短评按钮时 判断是否登录 手动拦截器--%>
<%-- 未登录跳转登录界面 已登录更新form的action链接 --%>
<script>
    $(document).ready(function () {
        $(document).on("click", "#send-comment", function(){
            $.ajax({
                url: "/home/isLogin",
                async: false,
                data: {
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let sign = data["isLogin"];
                    if (sign == "true"){
                        let userId = data["userId"];
                        $("#comment").attr("action","/home/public_comment?userId=" + userId + "&movieId=${movie.movieId}");
                        $("#comment-content").val("");
                    }
                    else{
                        window.location = "/user/login";
                    }
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        });
    });
</script>

<%-- 评分窗口的打分动效 --%>
<script>
    $(document).ready(function () {
        $(document).on("click", "svg[id^='star-']", function(){
            $("#star").empty();
            let score = $(this).attr("star");
            $("#score-display").text(score + ".0");
            $("#score").attr("value",score);
            for (let i = 0;i < 5;i++){
                if (i < score){
                    $("#star").append('<svg id="star-' + (i+1) + '" star="' + (i+1) + '" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#ffc600" stroke="#ffc600" stroke-width="4" stroke-linejoin="round"/></svg>');
                }
                else{
                    $("#star").append('<svg id="star-' + (i+1) + '" star="' + (i+1) + '" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>');
                }
            }
        });
    });
</script>

<%-- 判断是否为发布评论后的重新进入 若是则要显示toast显示 --%>
<script>
    $(document).ready(function () {
        let isRefresh = ${isRefresh};
        if (isRefresh == 1){
            toastr.success("评论成功！");
        }
    });
</script>

<%-- 点赞区域被点击 的事件 --%>
<script>
    $(document).ready(function () {
        $(document).on("click", "div[id^='area-like-']", function(){
            let ajaxSign = 0;
            let userId = 0;
            let commentId = $(this).attr("commentId");
            let nowDiv = $(this);

            // 获取userId
            $.ajax({
                url: "/home/isLogin",
                async: false,
                data: {
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let sign = data["isLogin"];
                    if (sign == "true"){                        // 已登录
                        userId = data["userId"];
                        // 通知后续ajax请求 当前请求成功
                        ajaxSign = 1;
                    }
                    else{                                       // 未登录 返回登录界面
                        window.location = "/user/login";
                    }
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });

            if (ajaxSign == 1){
                $.ajax({
                    url: "/home/clickLike",
                    async: false,
                    data: {
                        "userId": userId,
                        "commentId": commentId,
                    },
                    type: "POST",
                    dataType: "json",
                    // contentType : "application/json;charset=UTF-8",
                    success: function (data) {
                        let comment = data["comment"];
                        let actionSign = data["actionSign"];

                        // 点赞图标的样式变化
                        let svgText = '';
                        nowDiv.empty();
                        if (actionSign == 1){
                            svgText = '<svg width="20" height="20" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M27.6002 18.5998V11.3998C27.6002 8.41743 25.1826 5.99977 22.2002 5.99977L15.0002 22.1998V41.9998H35.9162C37.7113 42.0201 39.2471 40.7147 39.5162 38.9398L42.0002 22.7398C42.1587 21.6955 41.8506 20.6343 41.1576 19.8373C40.4645 19.0403 39.4564 18.5878 38.4002 18.5998H27.6002Z" stroke="#0d6efd" stroke-width="4" stroke-linejoin="round"/><path d="M15 22.0001H10.194C8.08532 21.9628 6.2827 23.7095 6 25.7994V38.3994C6.2827 40.4894 8.08532 42.0367 10.194 41.9994H15V22.0001Z" fill="#0d6efd" stroke="#0d6efd" stroke-width="4" stroke-linejoin="round"/></svg>';
                        }
                        else if (actionSign == 0){
                            svgText = '<svg width="20" height="20" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M27.6002 18.5998V11.3998C27.6002 8.41743 25.1826 5.99977 22.2002 5.99977L15.0002 22.1998V41.9998H35.9162C37.7113 42.0201 39.2471 40.7147 39.5162 38.9398L42.0002 22.7398C42.1587 21.6955 41.8506 20.6343 41.1576 19.8373C40.4645 19.0403 39.4564 18.5878 38.4002 18.5998H27.6002Z" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/><path d="M15 22.0001H10.194C8.08532 21.9628 6.2827 23.7095 6 25.7994V38.3994C6.2827 40.4894 8.08532 42.0367 10.194 41.9994H15V22.0001Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>';
                        }
                        nowDiv.append(svgText);
                        let spanText = '<span style="color:#a1a1a1;">' + comment.commentLikeCnt+ '</span>';
                        nowDiv.append(spanText);
                    },
                    error: function () {
                        alert("ajax请求错误");
                    }
                });
            }
        });
    });
</script>

<%-- 获取用户登录状态 若已登录则渲染各个点赞ico --%>
<script>
    $(document).ready(function () {
        let isLogin = '';
        let userId = 0;
        $.ajax({
            url: "/home/isLogin",
            async: false,
            data: {
            },
            type: "POST",
            dataType: "json",
            // contentType : "application/json;charset=UTF-8",
            success: function (data) {
                isLogin = data["isLogin"];
                if (isLogin == "true"){
                    userId = data["userId"];
                }
            },
            error: function () {
                alert("ajax请求错误");
            }
        });
        if (isLogin == "true"){                        // 已登录 才需要单独渲染按钮样式
            $("a[id^='ico-like-']").each(function (){
                let ico = $(this);          // 对应的点赞按钮图标
                let commentId = ico.attr("commentId");
                ico.empty();
                $.ajax({
                    url: "/home/checkLike",
                    async: false,
                    data: {
                        "userId": userId,
                        "commentId": commentId,
                    },
                    type: "POST",
                    dataType: "json",
                    // contentType : "application/json;charset=UTF-8",
                    success: function (data) {
                        let isLike = data["isLike"];
                        if (isLike == 1){               // 已点赞
                            ico.append('<svg width="20" height="20" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M27.6002 18.5998V11.3998C27.6002 8.41743 25.1826 5.99977 22.2002 5.99977L15.0002 22.1998V41.9998H35.9162C37.7113 42.0201 39.2471 40.7147 39.5162 38.9398L42.0002 22.7398C42.1587 21.6955 41.8506 20.6343 41.1576 19.8373C40.4645 19.0403 39.4564 18.5878 38.4002 18.5998H27.6002Z" stroke="#0d6efd" stroke-width="4" stroke-linejoin="round"/><path d="M15 22.0001H10.194C8.08532 21.9628 6.2827 23.7095 6 25.7994V38.3994C6.2827 40.4894 8.08532 42.0367 10.194 41.9994H15V22.0001Z" fill="#0d6efd" stroke="#0d6efd" stroke-width="4" stroke-linejoin="round"/></svg>');
                        }
                        else if (isLike == 0){          // 未点赞
                            ico.append('<svg width="20" height="20" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M27.6002 18.5998V11.3998C27.6002 8.41743 25.1826 5.99977 22.2002 5.99977L15.0002 22.1998V41.9998H35.9162C37.7113 42.0201 39.2471 40.7147 39.5162 38.9398L42.0002 22.7398C42.1587 21.6955 41.8506 20.6343 41.1576 19.8373C40.4645 19.0403 39.4564 18.5878 38.4002 18.5998H27.6002Z" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/><path d="M15 22.0001H10.194C8.08532 21.9628 6.2827 23.7095 6 25.7994V38.3994C6.2827 40.4894 8.08532 42.0367 10.194 41.9994H15V22.0001Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>');
                        }
                    },
                    error: function () {
                        alert("ajax请求错误");
                    }
                });
            });
        }
    });
</script>

</body>
</html>

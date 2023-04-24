<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/1/16
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../../../../resources/img/logo.png">       <%-- 网页标签图标 --%>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
    <title>用户首页</title>
</head>
<body>


<div style="width: 1400px;margin: 0px auto 100px;">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>

    <%--轮播--%>
    <div class="row">
        <div id="carouselExampleAutoplaying" class="carousel slide col-8" style="width: 945px;height: 495px"
             data-bs-ride="carousel">
            <div class="carousel-indicators">
                <!-- 被替代的静态轮播图下方指示标 -->
                <%--                        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="0"--%>
                <%--                                class="active" aria-current="true" aria-label="Slide 1"></button>--%>
                <%--                        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="1"--%>
                <%--                                aria-label="Slide 2"></button>--%>
                <%--                        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="2"--%>
                <%--                                aria-label="Slide 3"></button>--%>
                <c:forEach var="ban" items="${bannerList}" varStatus="status">
                    <c:if test="${status.first}"> <!-- 第一个indicator -->
                        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="0"
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                    </c:if>
                    <c:if test="${!status.first}"> <!-- 非第一个indicator -->
                        <button type="button" data-bs-target="#carouselExampleAutoplaying"
                                data-bs-slide-to="${status.index}"
                                aria-label="Slide ${status.count}"></button>
                    </c:if>
                </c:forEach>
            </div>
            <div class="carousel-inner">
                <c:forEach var="ban" items="${bannerList}" varStatus="status">
                    <c:if test="${status.first}"> <!-- 第一个元素 class中需要有active 表明初始默认展示哪一个-->
                        <div class="carousel-item active" data-bs-interval="3000">
                            <a href="/home/movie_detail?movieId=${ban.movieId}">
                                <img src="../../../..${ban.path}" class="d-block w-100" alt="...">
                            </a>
                        </div>
                    </c:if>
                    <c:if test="${!status.first}"> <!-- 但多个内容也仅需设置一个active -->
                        <div class="carousel-item" data-bs-interval="3000">
                            <a href="/home/movie_detail?movieId=${ban.movieId}">
                                <img src="../../../..${ban.path}" class="d-block w-100" alt="...">
                            </a>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="col-4">
            <div class="list-group">
                <div style="font-size: 33px;font-weight: 450;display:inline;color: #0d6efd;">今日热映</div>
                <c:forEach items="${movieListWithBO}" var="movie" varStatus="status">
                    <c:if test="${status.first}">
                        <a href="/home/movie_detail?movieId=${movie['movie_id']}" class="list-group-item list-group-item-action" style="border: 0px">
                            <div class="row">
                                <div class="col-1">
                                    <span class="badge" style="color:red;background:lightcoral;">${status.count}</span>
                                </div>
                                <div class="col-4">
                                    <img src="../../../..${movie['img_url']}" style="height: 72px;width: 128px">
                                </div>
                                <div class="col-4">
                                    <div style="font-weight: bold;font-size: 20px;width: 120px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
                                            ${movie['movie_name']}
                                    </div>
                                    <div style="font-size: 15px;margin-top: 15px;width: 120px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
                                            ${movie['actors']}
                                    </div>
                                </div>
                                <div class="col-3 text-center">
                                        ${movie['bo']}&nbsp;
                                </div>
                            </div>
                        </a>
                    </c:if>
                    <c:if test="${!status.first}">
                        <a href="/home/movie_detail?movieId=${movie['movie_id']}" class="list-group-item list-group-item-action" style="padding: 0.7rem 1rem;border: 0px">
                            <div class="row">
                                <div class="col-1">
                                    <span id="cube-${movie['movie_id']}" class="badge" onload="getColor(this)">${status.count}</span>
                                </div>
                                <div class="col-4" style="font-weight: bold;width: 147.55px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
                                        ${movie['movie_name']}
                                </div>
                                <div class="col-4" style="width: 147.55px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
                                        ${movie['actors']}
                                </div>
                                <div class="col-3 text-center">${movie['bo']}&nbsp;</div>
                            </div>
                        </a>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>

    <%-- 为你推荐 --%>
    <c:if test="${not empty recommendedMovieList}">
        <div style="padding: 40px 10px 15px 10px;border-bottom: 1px #d3d3d3 dashed;">
            <div class="row" style="border-bottom: 1px #d3d3d3 solid">
                <div class="col-3">
                    <h3 style="padding: 0px 15px 5px 0px;color: #0d6efd">为你推荐</h3>
                </div>
                <div class="col-8"></div>
                <div class="col-1" style="color: #0d6efd;"><a href="/home/movie" style="text-decoration: none"></a></div>
            </div>
            <div>
                <c:forEach var="movie" items="${recommendedMovieList}" varStatus="status">
                    <div class="text-center" style="display: inline-block;margin: 15px 47px 20px 5px">
                        <div>
                            <a href="/home/movie_detail?movieId=${movie.movieId}"><img src="../../../..${movie.imgUrl}" style="height: 193.2px;width: 139.2px"></a>
                        </div>
                        <div style="height: 35px;width: 139px;line-height: 35px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
                                ${movie.chineseName}
                        </div>
                        <a href="/home/movie_detail?movieId=${movie.movieId}">
                            <button class="btn btn-outline-info btn-sm text-center" style="vertical-align: middle"
                                    movieId="${movie.movieId}">
                                立即购票
                            </button>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>

    <%-- 正在热映 --%>
    <div style="padding: 40px 10px 15px 10px;border-bottom: 1px #d3d3d3 dashed;">
        <div class="row" style="border-bottom: 1px #d3d3d3 solid">
            <div class="col-3">
                <h3 style="padding: 0px 15px 5px 0px;color: #0d6efd">正在热映</h3>
            </div>
            <div class="col-8"></div>
            <div class="col-1"><a href="/home/movie" style="text-decoration: none">全部 >></a></div>
        </div>
        <div>
            <c:forEach var="movie" items="${moviePageInfoBeing.list}" varStatus="status">
                <div class="text-center" style="display: inline-block;margin: 15px 47px 20px 5px">
                    <div>
                        <a href="/home/movie_detail?movieId=${movie.movieId}"><img src="../../../..${movie.imgUrl}" style="height: 193.2px;width: 139.2px"></a>
                    </div>
                    <div style="height: 35px;width: 139px;line-height: 35px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
                            ${movie.chineseName}
                    </div>
                    <a href="/home/movie_detail?movieId=${movie.movieId}">
                        <button class="btn btn-outline-info btn-sm text-center" style="vertical-align: middle"
                                movieId="${movie.movieId}">
                            立即购票
                        </button>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <%-- 即将上映 --%>
    <div style="padding: 40px 10px 15px 10px;border-bottom: 1px #d3d3d3 dashed;">
        <div class="row" style="border-bottom: 1px #d3d3d3 solid">
            <div class="col-3">
                <h3 style="padding: 0px 15px 5px 0px;color: #0d6efd">即将上映</h3>
            </div>
            <div class="col-8"></div>
            <div class="col-1"><a href="/home/movie" style="text-decoration: none">全部 >></a></div>
        </div>
        <div>
            <c:forEach var="movie" items="${moviePageInfoSoon.list}" varStatus="status">
                <div class="text-center" style="display: inline-block;margin: 15px 47px 20px 5px">
                    <div>
                        <a href="/home/movie_detail?movieId=${movie.movieId}"><img src="../../../..${movie.imgUrl}" style="height: 193.2px;width: 139.2px"></a>
                    </div>
                    <div style="height: 35px;width: 139px;line-height: 35px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
                            ${movie.chineseName}
                    </div>
                    <a href="/home/movie_detail?movieId=${movie.movieId}">
                        <button class="btn btn-outline-info btn-sm text-center" style="vertical-align: middle"
                                movieId="${movie.movieId}">
                            立即购票
                        </button>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script src="../../../../resources/js/jquery-3.6.3.js"></script>

<%-- 今日热映部分 序号-随机样式 --%>
<script>
    $(document).ready(function(){
        let colorArrayText = [
            'green',
            'red',
            'green',
            'green',
        ];
        let backgroundArrayText = [
            'lightgreen',
            'lightsalmon',
            'lightgray',
            'lightblue',
            'pink',
            'pink',
        ];

        $("span[id^='cube-']").each(function (){
            $(this).css('color',colorArrayText[Math.floor((Math.random()*3))]);
            $(this).css('background',backgroundArrayText[Math.floor((Math.random()*5))]);
        })
        // $("span[id^='cube-']").css('color',colorArrayText[Math.floor((Math.random()*4))]);
        // $("span[id^='cube-']").css('background',backgroundArrayText[Math.floor((Math.random()*5))]);
    });

</script>



</body>
</html>



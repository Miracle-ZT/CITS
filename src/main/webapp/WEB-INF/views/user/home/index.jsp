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
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--         integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">--%>
    <%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"--%>
    <%--            integrity="sha384-/mhDoLbDldZc3qpsJHpLogda//BVZbgYuw6kof4u2FrCedxOtgRZDTHgHUhOCVim"--%>
    <%--            crossorigin="anonymous"></script>--%>
    <title>用户首页</title>
</head>
<body>

<div style="width: 1400px;margin: 0px auto 100px;">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
    <%--    <main>--%>                                 <!-- 备选导航栏 -->
    <%--        <div class="container">--%>
    <%--            <header class="d-flex justify-content-center py-3">--%>
    <%--                <ul class="nav nav-pills">--%>
    <%--                    <li class="nav-item"><a href="/user/index" class="nav-link ${ac_home}">Home</a></li>--%>
    <%--                    <li class="nav-item"><a href="/user/Features" class="nav-link ${ac_Features}">Features</a></li>--%>
    <%--                    <li class="nav-item"><a href="#" class="nav-link ${ac_Pricing}">Pricing</a></li>--%>
    <%--                    <li class="nav-item"><a href="#" class="nav-link ${ac_FAQs}">FAQs</a></li>--%>
    <%--                    <li class="nav-item"><a href="#" class="nav-link ${ac_About}">About</a></li>--%>
    <%--                </ul>--%>
    <%--            </header>--%>
    <%--        </div>--%>
    <%--    </main>--%>
    <div class="container-fluid mt-3">
        <div class="row">
            <div class="col-4 text-black" style="height: 495px">
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action"><h1>今日热映</h1></a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-danger"
                       style="height: 70px;line-height: 55px">
                        <div class="row">
                            <div class="col-1">1.</div>
                            <div class="col-7">阿凡达：水之道</div>
                            <div class="col-4">591.63万</div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-secondary"
                       style="height: 60px;line-height: 45px">
                        <div class="row">
                            <div class="col-1">2.</div>
                            <div class="col-7">想见你</div>
                            <div class="col-4">153.33万</div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-info"
                       style="height: 50px;line-height: 35px;">
                        <div class="row">
                            <div class="col-1">3.</div>
                            <div class="col-7">绝望主夫</div>
                            <div class="col-4">136.78万</div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <div class="row">
                            <div class="col-1">4.</div>
                            <div class="col-7">穿靴子的猫2</div>
                            <div class="col-4">71.41万</div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <div class="row">
                            <div class="col-1">5.</div>
                            <div class="col-7">航海王：红发歌姬</div>
                            <div class="col-4">33.34万</div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <div class="row">
                            <div class="col-1">6.</div>
                            <div class="col-7">航海王：红发歌姬</div>
                            <div class="col-4">33.34万</div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <div class="row">
                            <div class="col-1">7.</div>
                            <div class="col-7">航海王：红发歌姬</div>
                            <div class="col-4">33.34万</div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <div class="row">
                            <div class="col-1">8.</div>
                            <div class="col-7">航海王：红发歌姬</div>
                            <div class="col-4">33.34万</div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <div class="row">
                            <div class="col-1">9.</div>
                            <div class="col-7">航海王：红发歌姬</div>
                            <div class="col-4">33.34万</div>
                        </div>
                    </a>
                </div>
            </div>
            <div id="carouselExampleAutoplaying" class="carousel slide" style="width: 880px;height: 495px"
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
        </div>
    </div>

    <%-- 第二大行块 --%>
    <div class="row">
        <div class="col-8" style="border-right: 1px #d3d3d3 solid">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist" style="margin: 15px">
                    <button class="nav-link active" id="nav-being-tab" data-bs-toggle="tab" data-bs-target="#nav-being" type="button" role="tab" aria-controls="nav-being" aria-selected="true">正在热映</button>
                    <button class="nav-link" id="nav-soon-tab" data-bs-toggle="tab" data-bs-target="#nav-soon" type="button" role="tab" aria-controls="nav-soon" aria-selected="false">即将上映</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <%-- 正在热映 --%>
                <div class="tab-pane fade show active" id="nav-being" role="tabpanel" aria-labelledby="nav-being-tab" tabindex="0">
                    <c:forEach var="movie" items="${movieListBeing}" varStatus="status">
                        <div class="text-center" style="float: left;margin: 15px">
                            <div>
                                <a href="/home/movie_detail?movieId=${movie.movieId}"><img src="../../../..${movie.imgUrl}" style="height: 193.2px;width: 139.2px"></a>
                            </div>
                            <div style="height: 35px;line-height: 35px">
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
                <%-- 即将上映 --%>
                <div class="tab-pane fade" id="nav-soon" role="tabpanel" aria-labelledby="nav-soon-tab" tabindex="0">
                    <c:forEach var="movie" items="${movieListSoon}" varStatus="status">
                        <div class="text-center" style="float: left;margin: 15px">
                            <div>
                                <a href="/home/movie_detail?movieId=${movie.movieId}"><img src="../../../..${movie.imgUrl}" style="height: 193.2px;width: 139.2px"></a>
                            </div>
                            <div style="height: 35px;line-height: 35px">
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
        <div class="col-4">111</div>
    </div>
</div>


</body>
</html>



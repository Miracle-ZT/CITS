<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/3/10
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>搜索结果</title>
    <link rel="shortcut icon" href="../../../../resources/img/logo.png">       <%-- 网页标签图标 --%>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
</head>
<body>
<div style="margin:0px auto 100px auto;width: 1400px;">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
</div>

<div>
    <div style="width: 1400px;text-align: center;margin: auto">
        <form action="${pageContext.request.contextPath}/home/search_content"
              class="d-flex" role="search" style="margin-top: 15px">
            <input name="keyWord" class="form-control me-2" type="search" placeholder="影视剧、影人、影院"
                   aria-label="Search" value="${keyWord}"
            style="border-radius: 50px" autocomplete="off">
            <button id="submit-keyword" class="btn btn-outline-primary" type="submit">
                <?xml version="1.0" encoding="UTF-8"?>
                <svg width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M21 38C30.3888 38 38 30.3888 38 21C38 11.6112 30.3888 4 21 4C11.6112 4 4 11.6112 4 21C4 30.3888 11.6112 38 21 38Z"
                          fill="none" stroke="#2196f3" stroke-width="4" stroke-linejoin="round"/>
                    <path d="M26.657 14.3431C25.2093 12.8954 23.2093 12 21.0001 12C18.791 12 16.791 12.8954 15.3433 14.3431"
                          stroke="#2196f3" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M33.2216 33.2217L41.7069 41.707" stroke="#2196f3" stroke-width="4"
                          stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </button>
        </form>
    </div>
    <div class="mt-5">                              <!-- 电影列表 -->
        <div class="row" style="margin: auto;width: 1400px;">
            <div class="col-4" style="align-items: center">
                <img src="../../../../resources/img/pic_movie_list.png" width="20px" height="20px"
                     class="d-inline-block align-text-top" style="margin-top: 1px">
                <h7>电影列表</h7>
            </div>
            <div class="col-7"></div>
            <div class="col-1" style="text-align: right">
                <img src="../../../../resources/img/filter.png" width="20px" height="20px"
                     class="d-inline-block align-text-top" style="margin-top: 1px">
                <h7>筛选</h7>
            </div>
        </div>
        <div style="height: 20px"></div>

        <!-- 电影列表 -->
        <div id="movieList">
            <div class="card card-body" style="margin: auto;width: 1400px;flex-direction: unset;display: flex;overflow:hidden;flex-wrap: wrap">
                <c:if test="${not empty movieList}">
                    <c:forEach var="movie" items="${movieList}" varStatus="status">
                        <div class="text-center" style="float: left;margin: 15px">
                            <div>
                                <a href="/home/movie_detail?movieId=${movie.movieId}"><img src="../../../..${movie.imgUrl}" style="height: 193.2px;width: 139.2px"></a>
                            </div>
                            <div style="height: 35px;line-height: 35px;width: 139px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
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
                </c:if>
                <c:if test="${empty movieList}">
                    <h5>抱歉，没有找到相关结果，请尝试更换关键词查找。</h5>
                </c:if>
            </div>
        </div>
    </div>



    <div class="mt-5">                              <!-- 影院列表 -->
        <div class="row" style="margin: auto;width: 1400px;">
            <div class="col-4" style="align-items: center">
                <img src="../../../../resources/img/pic_movie_list.png" width="20px" height="20px"
                     class="d-inline-block align-text-top" style="margin-top: 1px">
                <h7>影院列表</h7>
            </div>
            <div class="col-7"></div>
            <div class="col-1" style="text-align: right">
                <img src="../../../../resources/img/filter.png" width="20px" height="20px"
                     class="d-inline-block align-text-top" style="margin-top: 1px">
                <h7>筛选</h7>
            </div>
        </div>
        <div style="height: 20px"></div>

        <!-- 影院列表 -->
        <div id="cinemaList">
            <c:if test="${not empty cinemaList}">
                <c:forEach var="cinema" items="${cinemaList}" varStatus="status">
                    <div class="card card-body" style="margin: auto;width: 1400px;">
                        <div class="row">
                            <div class="col-10">
                                <a style="text-decoration: none" href="/home/cinema_detail?cinemaId=${cinema.cinemaId}"><div>${cinema.name}</div></a>
                                <div class="text-muted">${cinema.address}</div>
                            </div>
                            <div class="col-1">

                            </div>
                            <div class="col-1">
                                <a href="/home/cinema_detail?cinemaId=${cinema.cinemaId}">
                                    <button class="btn btn-outline-danger" style="border-radius: 300px" name="spanDate"
                                            type="button">购票
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty cinemaList}">
                <div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px">
                    <h5>抱歉，没有找到相关结果，请尝试更换关键词查找。</h5>
                </div>
            </c:if>
        </div>
    </div>
</div>



</body>
</html>

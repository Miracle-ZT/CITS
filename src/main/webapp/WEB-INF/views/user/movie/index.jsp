<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/3/25
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
    <title>Title</title>
</head>
<body>
<div style="margin:100px auto;width: 1400px;margin-top: 0px">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
</div>

<div class="card card-body" style="transform: translateX(10%);width: 1400px;margin-top: -50px">
    <div class="row">                       <!-- 类型 -->
        <div class="col-1">
            <h7 class="align-self-center text-muted" style="padding: 5px;margin-top: 8px">类型：</h7>
        </div>
        <div class="col-11">
            <ul class="nav nav-pills" id="pills-tab-1" role="tablist">
                <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">
                    <button class="nav-link btn-sm active" name="types" value="0" data-bs-toggle="pill"
                            type="button" id="types-0"
                            style="border-radius: 50px;padding-block: 4px">
                        全部
                    </button>
                </li>
                <c:forEach var="type" items="${typeList}" varStatus="status">
                    <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">
                        <button class="nav-link btn-sm" name="spanDate" value="${status.index}" data-bs-toggle="pill"
                                type="button" id="types-${status.index}"
                                style="border-radius: 50px;padding-block: 4px">
                                ${type.typeName}
                        </button>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<div class="card card-body" style="transform: translateX(10%);width: 1400px">
    <div class="row">                       <!-- 年代 -->
        <div class="col-1">
            <h7 class="align-self-center text-muted" style="padding: 5px;margin-top: 8px">年代：</h7>
        </div>
        <div class="col-11">
            <ul class="nav nav-pills" id="pills-tab-2" role="tablist">
                <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">
                    <button class="nav-link btn-sm active"
                            data-bs-toggle="pill"
                            type="button"
                            style="border-radius: 50px;padding-block: 4px">
                        全部
                    </button>
                </li>
                <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">
                    <button class="nav-link btn-sm"
                            data-bs-toggle="pill"
                            type="button" id="refund"
                            style="border-radius: 50px;padding-block: 4px">
                        可退票
                    </button>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="mt-5">                              <!-- 电影列表 -->
    <div class="row" style="transform: translateX(10%);width: 1400px;">
        <div class="col-4" style="align-items: center">
            <img src="../../../../resources/img/pic_movie_list.png" width="20px" height="20px"
                 class="d-inline-block align-text-top" style="margin-top: 1px">
            <h7>电影列表</h7>
        </div>
        <div class="col-7"></div>
        <div class="col-1" style="align-items: center">
            <img src="../../../../resources/img/filter.png" width="20px" height="20px"
                 class="d-inline-block align-text-top" style="margin-top: 1px">
            <h7>筛选</h7>
        </div>
    </div>
    <div style="height: 20px"></div>

    <!-- 电影列表 -->
    <div id="cinemaList">
        <c:if test="${not empty movieList}">
            <c:forEach var="movie" items="${movieList}" varStatus="status">
                <div class="card card-body" style="transform: translateX(10%);width: 1400px">
                    <div class="row">
                        <div class="col-10">
                            <div>${cinema.name}</div>
                            <div class="text-muted">${cinema.address}</div>
                        </div>
                        <div class="col-1">
                            <div>￥xx元 起</div>
                            <div>x.x km</div>
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
            <div class="card card-body" style="transform: translateX(10%);width: 1400px">
                <h5>抱歉，没有找到相关结果，请尝试用其他条件筛选。</h5>
            </div>
        </c:if>
    </div>
</div>

</body>
</html>

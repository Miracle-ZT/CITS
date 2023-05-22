<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/4/29
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
    <title>榜单 - XLMovie</title>
    <link rel="shortcut icon" href="../../../../resources/img/logo.png">
</head>
<body>
<div style="margin:100px auto;width: 1400px;margin-top: 0px">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
</div>



<nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist" style="margin: 15px;padding-left: 750px">
        <button class="nav-link active" id="nav-being-tab" data-bs-toggle="tab" data-bs-target="#nav-being" type="button" role="tab" aria-controls="nav-being" aria-selected="true">最佳评分榜</button>
        <button class="nav-link" id="nav-soon-tab" data-bs-toggle="tab" data-bs-target="#nav-soon" type="button" role="tab" aria-controls="nav-soon" aria-selected="false">热映票房榜</button>
    </div>
</nav>

<div class="tab-content" id="nav-tabContent">
    <%-- 最佳评分榜 --%>
    <div class="tab-pane fade show active" id="nav-being" role="tabpanel" aria-labelledby="nav-being-tab" tabindex="0">
        <c:forEach var="movie" items="${movieAvgScoreMapList}" varStatus="status">
            <div style="width: 950px;margin: 0 auto;">
                <div class="row" style="margin-top: 30px">
                    <div class="col-1" style="display: flex;justify-content: center;align-items: center;">
                        <div style="width: 50px;height: 50px;background: #0d6efd;color:#ffffff;font-size: 30px;display: flex;justify-content: center;align-items: center;border-radius: 10px">${status.count}</div>
                    </div>
                    <div class="col-2">
                        <a href="/home/movie_detail?movieId=${movie['movie'].movieId}"><img src="../../../..${movie['movie'].imgUrl}" style="height: 193.2px;width: 139.2px"></a>
                    </div>
                    <div class="col-5" style="border-bottom: 1px solid #d3d3d3;display: flex;justify-content: start;align-items: center">
                        <div style="margin-left: 25px">
                            <div style="font-size: 30px;font-weight: bold;width: 405px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">${movie['movie'].chineseName}</div>
                            <div style="font-size: 20px;font-weight: bold;width: 405px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">${movie['movie'].englishName}</div>
                            <div style="margin-top: 10px;width: 405px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">主演：${movie['movie'].actors}</div>
                            <div style="color: #999;margin-top: 10px">上映时间：<fmt:formatDate value="${movie['movie'].releaseDate}" pattern="yyyy-MM-dd"/></div>
                        </div>
                    </div>
                    <div class="col-4" style="border-bottom: 1px solid #d3d3d3;display: flex;justify-content: end;align-items: center;font-size: 40px;color:#ffb400;font-style: italic;font-weight: bold">
                            ${movie['avgScore']}
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <%-- 热映票房榜 --%>
    <div class="tab-pane fade" id="nav-soon" role="tabpanel" aria-labelledby="nav-soon-tab" tabindex="0">
        <c:forEach var="movie" items="${movieListWithBO}" varStatus="status">
            <div style="width: 950px;margin: 0 auto;">
                <div class="row" style="margin-top: 30px">
                    <div class="col-1" style="display: flex;justify-content: center;align-items: center;">
                        <div style="width: 50px;height: 50px;background: #ef4238;color:#ffffff;font-size: 30px;display: flex;justify-content: center;align-items: center;border-radius: 10px">${status.count}</div>
                    </div>
                    <div class="col-2">
                        <a href="/home/movie_detail?movieId=${movie['movie'].movieId}"><img src="../../../..${movie['movie'].imgUrl}" style="height: 193.2px;width: 139.2px"></a>
                    </div>
                    <div class="col-5" style="border-bottom: 1px solid #d3d3d3;display: flex;justify-content: start;align-items: center">
                        <div style="margin-left: 25px">
                            <div style="font-size: 30px;font-weight: bold;width: 405px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">${movie['movie'].chineseName}</div>
                            <div style="font-size: 20px;font-weight: bold;width: 405px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">${movie['movie'].englishName}</div>
                            <div style="margin-top: 10px;width: 405px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">主演：${movie['movie'].actors}</div>
                            <div style="color: #999;margin-top: 10px;width: 405px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">上映时间：<fmt:formatDate value="${movie['movie'].releaseDate}" pattern="yyyy-MM-dd"/></div>
                        </div>
                    </div>
                    <div class="col-4" style="border-bottom: 1px solid #d3d3d3;display: flex;justify-content: end;align-items: center;font-size: 40px;color:#ffb400;font-style: italic;font-weight: bold">
                            ${movie['bo']}
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>




</body>
</html>

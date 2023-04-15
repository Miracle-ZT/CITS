<%@ page import="org.apache.commons.lang.time.DateFormatUtils" %><%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/1/18
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    </style>
</head>
<body>
<div style="margin:100px auto;width: 1400px;margin-top: 0px">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
</div>

<div class="row box" style="width: 100%;margin-top: -84px;">
    <div class="col-2"></div>
    <div class="col-2">
        <div>
            <img src="../../../..${movie.imgUrl}" class="mx-auto d-block border-white border border-3" style="width: 232px;height: 322px;margin-top: 40px">
        </div>
    </div>
    <div class="col-3" style="margin-top: 40px">
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
                <h5>${movieDate} 中国大陆上映</h5>
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
    <div class="col-5 text-white">
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

</body>
</html>

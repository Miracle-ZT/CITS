<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/1/30
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>影院 - XLMovie</title>
    <link rel="shortcut icon" href="../../../../resources/img/logo.png">       <%-- 网页标签图标 --%>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
    <style>
        .box {
            background-image: url(../../../../resources/img/bg_detail.jpg);
            height: 400px;
            width: 2534px;
        }
    </style>
</head>
<body>
<div style="margin:100px auto;width: 1400px;margin-top: 0px">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
</div>

<div class="card card-body" style="margin: -50px auto 0px auto;width: 1400px;">
    <div class="row">                       <!-- 品牌 -->
        <div class="col-1">
            <h7 class="align-self-center text-muted" style="padding: 5px;margin-top: 8px">品牌：</h7>
        </div>
        <div class="col-11">
            <ul class="nav nav-pills" id="pills-tab-1" role="tablist">
                <%-- 判断"全部"是否被选中 --%>
                <c:if test="${nowBrandId == 0}">
                    <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">
                        <button class="nav-link btn-sm active" name="brand" value="0" data-bs-toggle="pill"
                                type="button" id="brand-0" brandId="0"
                                style="border-radius: 50px;padding-block: 4px">
                            全部
                        </button>
                    </li>
                </c:if>
                <c:if test="${nowBrandId != 0}">
                    <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">
                        <button class="nav-link btn-sm" name="brand" value="0" data-bs-toggle="pill"
                                type="button" id="brand-0" brandId="0"
                                style="border-radius: 50px;padding-block: 4px">
                            全部
                        </button>
                    </li>
                </c:if>
                <%-- 与当前选中的brandId比较 判断各个品牌名是否有被选中样式 --%>
                <c:forEach var="brand" items="${brandList}" varStatus="status">
                    <c:if test="${brand.brandId == nowBrandId}">
                        <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">
                            <button class="nav-link btn-sm active" name="brandName" value="${status.index}" data-bs-toggle="pill"
                                    type="button" id="brand-${status.index}" brandId="${brand.brandId}"
                                    style="border-radius: 50px;padding-block: 4px">
                                    ${brand.brandName}
                            </button>
                        </li>
                    </c:if>
                    <c:if test="${brand.brandId != nowBrandId}">
                        <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">
                            <button class="nav-link btn-sm" name="brandName" value="${status.index}" data-bs-toggle="pill"
                                    type="button" id="brand-${status.index}" brandId="${brand.brandId}"
                                    style="border-radius: 50px;padding-block: 4px">
                                    ${brand.brandName}
                            </button>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<%--<div class="card card-body" style="width: 1400px;margin: 0px auto 0px auto">--%>
<%--    <div class="row">                       <!-- 影厅服务 -->--%>
<%--        <div class="col-1">--%>
<%--            <h7 class="align-self-center text-muted" style="padding: 5px;margin-top: 8px">影厅服务：</h7>--%>
<%--        </div>--%>
<%--        <div class="col-11">--%>
<%--            <ul class="nav nav-pills" id="pills-tab-2" role="tablist">--%>
<%--                <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">--%>
<%--                    <button class="nav-link btn-sm active"--%>
<%--                            data-bs-toggle="pill"--%>
<%--                            type="button"--%>
<%--                            style="border-radius: 50px;padding-block: 4px">--%>
<%--                        全部--%>
<%--                    </button>--%>
<%--                </li>--%>
<%--                <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">--%>
<%--                    <button class="nav-link btn-sm"--%>
<%--                            data-bs-toggle="pill"--%>
<%--                            type="button" id="rebook"--%>
<%--                            style="border-radius: 50px;padding-block: 4px">--%>
<%--                        可改签--%>
<%--                    </button>--%>
<%--                </li>--%>
<%--                <li class="nav-item" role="presentation" style="padding: 5px;margin-top: -7px">--%>
<%--                    <button class="nav-link btn-sm"--%>
<%--                            data-bs-toggle="pill"--%>
<%--                            type="button" id="refund"--%>
<%--                            style="border-radius: 50px;padding-block: 4px">--%>
<%--                        可退票--%>
<%--                    </button>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<div class="mt-5">                              <!-- 影院列表 -->
    <div class="row" style="margin: 0px auto 0px auto;width: 1400px;">
        <div class="col-4" style="align-items: center">
            <img src="../../../../resources/img/pic_movie_list.png" width="20px" height="20px"
                 class="d-inline-block align-text-top" style="margin-top: 1px">
            <h7>影院列表</h7>
        </div>
        <div class="col-7"></div>
        <div class="col-1" style="align-items: center">
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
                <div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px">
                    <div class="row">               <!-- 10+1+1 -->
                        <div class="col-10">
                            <div><a href="/home/cinema_detail?cinemaId=${cinema.cinemaId}" style="text-decoration: none">${cinema.name}</a></div>
                            <div class="text-muted">${cinema.address}</div>
                        </div>
                        <div class="col-1">
<%--                            <div>￥xx元 起</div>--%>
<%--                            <div>x.x km</div>--%>
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
                <h5>抱歉，没有找到相关结果，请尝试用其他条件筛选。</h5>
            </div>
        </c:if>
    </div>
</div>




<script src="../../../../resources/js/jquery-3.6.3.js"></script>

<%-- 传递currPage和pageSize 跳转指定分页函数 --%>
<%--<script type="text/javascript">--%>
<%--    //分页相关内容--%>
<%--    function gotoPage(currPage) {--%>
<%--        let pageSize = $("#pageSize").attr("pageSize");--%>
<%--        //判断控制页码范围--%>
<%--        if (currPage < 1) {--%>
<%--            return;//终止代码执行--%>
<%--        }--%>
<%--        if (currPage >${moviePageInfo.total}) {--%>
<%--            return;//终止代码执行--%>
<%--        }--%>
<%--        location.href = "${pageContext.request.contextPath}/home/movie?currPage=" + currPage + "&pageSize=" + pageSize;--%>
<%--    }--%>
<%--</script>--%>


<%-- 选择 品牌 刷新列表 --%>
<script>
    // 监听类型选择
    $("button[id^='brand-']").on("click",function (e){              // 监听brand-开头的id的button
        console.log("===");
        let brandId = $(e.target).attr("brandId");

        window.location = "/home/cinema?brandId=" + brandId;
    });
</script>





</body>
</html>

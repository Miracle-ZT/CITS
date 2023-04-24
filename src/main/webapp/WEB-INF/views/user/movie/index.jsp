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

<div class="card card-body" style="margin: -50px auto 0px auto;width: 1400px;">
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
<div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px">
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
    <div class="row" style="margin: 0px auto 0px auto;width: 1400px;">
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
    <div id="movieList" style="margin: 0px auto 0px auto;width: 1400px;">
        <c:if test="${not empty moviePageInfo.list}">
            <c:forEach var="movie" items="${moviePageInfo.list}" varStatus="status">
                <div class="text-center" style="display: inline-block;margin: 15px 28px 20px 28px">
                    <div>
                        <a href="/home/movie_detail?movieId=${movie.movieId}"><img src="../../../..${movie.imgUrl}" style="height: 193.2px;width: 139.2px"></a>
                    </div>
                    <div style="font-size: 17px;height: 35px;width: 139px;line-height: 35px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
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
        <c:if test="${empty moviePageInfo}">
            <div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px">
                <h5>抱歉，没有找到相关结果，请尝试用其他条件筛选。</h5>
            </div>
        </c:if>
    </div>

    <div style="margin: 10px auto 0px auto;width: 1400px;">
        <div id="pageSize" pageSize="${moviePageInfo.pageSize}" hidden></div>
        <nav aria-label="Page navigation example">
            <ul id="pageList" class="pagination justify-content-end">
                <li class="page-item"><a class="page-link" href="javascript:gotoPage(${moviePageInfo.prePage})">&laquo;</a></li>
                <c:forEach begin="${moviePageInfo.navigateFirstPage}" end="${moviePageInfo.navigateLastPage}" var="i">
                    <%--如果不是当前页 则无选中样式active --%>
                    <c:if test="${moviePageInfo.pageNum != i}">
                        <li class="page-item"><a class="page-link" href="javascript:gotoPage(${i})">${i}</a></li>
                    </c:if>
                    <%--如果是当前页 则有选中样式active --%>
                    <c:if test="${moviePageInfo.pageNum == i}">
                        <li class="page-item active"><a class="page-link" href="javascript:gotoPage(${i})">${i}</a></li>
                    </c:if>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="javascript:gotoPage(${moviePageInfo.nextPage})">&raquo;</a></li>
            </ul>
        </nav>
    </div>
</div>

<script src="../../../../resources/js/jquery-3.6.3.js"></script>

<%-- 传递currPage和pageSize 跳转指定分页函数 --%>
<script type="text/javascript">
    //分页相关内容
    function gotoPage(currPage) {
        let pageSize = $("#pageSize").attr("pageSize");
        //判断控制页码范围
        if (currPage < 1) {
            return;//终止代码执行
        }
        if (currPage >${moviePageInfo.total}) {
            return;//终止代码执行
        }
        location.href = "${pageContext.request.contextPath}/home/movie?currPage=" + currPage + "&pageSize=" + pageSize;
    }
</script>


</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/14
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--content--%>

<div class="row">
    <div class="col-sm-4 col-3">
        <h4 class="page-title">电影列表</h4>
    </div>
    <div class="col-sm-8 col-9 text-right m-b-20">
        <a href="add-doctor.html" class="btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> 添加电影</a>
    </div>
</div>
<div class="row doctor-grid">
    <c:forEach var="movie" items="${movieList}" varStatus="status">
        <div class="col-md-4 col-sm-4  col-lg-3">
            <div class="profile-widget">
                <div class="doctor-img">
                    <a class="avatar" href=""><img alt="" src="../../..${movie.imgUrl}"></a>
                </div>
                <div class="dropdown profile-action">
                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i
                            class="fa fa-ellipsis-v"></i></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="edit-doctor.html"><i class="fa fa-pencil m-r-5"></i> 编辑</a>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_doctor"><i
                                class="fa fa-trash-o m-r-5"></i> 删除</a>
                    </div>
                </div>
                <h4 class="doctor-name text-ellipsis"><a href="profile.html">${movie.chineseName}</a></h4>
                <div class="doc-prof">${movie.englishName}</div>
                <div class="user-country">
                    <i class="fa fa-caret-right"></i>
                    <c:forEach var="type" items="${movie.typeList}" varStatus="status">
                        ${type.typeName}&nbsp;
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

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
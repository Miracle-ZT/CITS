<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/13
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--content--%>

<div class="row">
    <div class="col-sm-12">
        <h4 class="page-title">编辑</h4>
    </div>
</div>
<form method="post" action="/cinema_admin/cinema_info_update?cinemaId=${cinema.cinemaId}">
    <div class="card-box">
        <h3 class="card-title">基础资料</h3>
        <div class="row">
            <div class="col-md-12">
                <div class="profile-img-wrap">
                    <img class="inline-block" src="../../..${cinema.photo}" alt="user">
                    <div class="fileupload btn">
                        <span class="btn-text">上传</span>
                        <input class="upload" type="file">
                    </div>
                </div>
                <div class="profile-basic">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group form-focus">
                                <label class="focus-label">名称</label>
                                <input name="name" type="text" class="form-control floating" value="${cinema.name}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-focus">
                                <label class="focus-label">详细地址</label>
                                <input name="address" type="text" class="form-control floating" value="${cinema.address}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-focus select-focus">
                                <label class="focus-label">品牌</label>
                                <select name="brandId" class="select form-control floating">
                                    <c:forEach var="brand" items="${brandList}" varStatus="status">
                                        <option value="${brand.brandId}">${brand.brandName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-focus">
                                <label class="focus-label">加入日期</label>
                                <input type="text" class="form-control floating" disabled
                                       value="<fmt:formatDate value="${cinema.joinDate}" pattern="yyyy-MM-dd"/>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card-box">
        <h3 class="card-title">更多资料</h3>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group form-focus">
                    <label class="focus-label">负责人名称</label>
                    <input name="acname" type="text" class="form-control floating" value="${cinema.adminCinema.name}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-focus">
                    <label class="focus-label">邮箱</label>
                    <input name="acemail" type="text" class="form-control floating" value="${cinema.adminCinema.email}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-focus">
                    <label class="focus-label">所属城市</label>
                    <input name="city" type="text" class="form-control floating" value="福建 福州">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group form-focus">
                    <label class="focus-label">电话号码</label>
                    <input name="phone" type="text" class="form-control floating" value="${cinema.phone}">
                </div>
            </div>
        </div>
    </div>
    <div class="text-center m-t-20">
        <button class="btn btn-primary submit-btn" type="submit">Save</button>
    </div>
</form>
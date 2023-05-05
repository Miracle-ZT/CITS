<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/18
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>XLMovie - 电影列表</title>

    <link href="../../../resources/plugins/admin_assets/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/animate.min.css" rel="stylesheet">

    <link href="../../../resources/plugins/admin_assets/css/plugins/cropper/cropper.min.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/switchery/switchery.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/nouslider/jquery.nouislider.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/ionRangeSlider/ion.rangeSlider.css"
          rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css"
          rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/style.min.css?v=4.0.0" rel="stylesheet">

    <!-- Sweet Alert -->
    <link href="../../../resources/plugins/admin_assets/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <link href="../../../resources/plugins/admin_assets/css/plugins/chosen/chosen.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>电影列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a data-toggle="modal" href="#type-manage">类型管理</a></li>
                        <li><a data-toggle="modal" href="#language-manage">语种管理</a></li>
                    </ul>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-3 m-b-xs">
                        <div data-toggle="buttons" class="btn-group">
                            <label class="btn btn-sm btn-white active" id="btn-option-1" value="-1">
                                <input type="radio" name="options">全部</label>
                            <label class="btn btn-sm btn-white" id="btn-option-2" value="1">
                                <input type="radio" name="options">热映中</label>
                            <label class="btn btn-sm btn-white" id="btn-option-3" value="0">
                                <input type="radio" name="options">已下架</label>
                        </div>
                    </div>
                    <div class="col-sm-2 m-b-xs">
                        <button type="button" id="loading-example-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
                    </div>
                    <div class="col-sm-4 m-b-xs">
                        <div class="input-group">
                            <button id="add-btn" type="button"
                                    class="btn btn-sm btn-primary"
                                    data-toggle="modal" href="#add-form">     <%-- 关键实现弹出关联表单的属性 --%>
                                新增
                            </button>
                            <button id="update-btn" type="button"
                                    class="btn btn-sm btn-primary" style="margin-left: 10px"
                                    data-toggle="modal" href="#update-form" disabled> 编辑
                            </button>
                            <button id="delete-btn" type="button"
                                    class="btn btn-sm btn-primary" style="margin-left: 10px" disabled> 删除
                            </button>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <input id="keyWord" type="text" placeholder="请输入关键词" class="input-sm form-control" autocomplete="off">
                            <span class="input-group-btn">
                            <button id="search-text" type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th><input id="main-checkbox" type="checkbox" name="input[]"></th>
                            <th>主题图</th>
                            <th>电影名</th>
                            <th>类型</th>
                            <th>导演</th>
                            <th>主演</th>
                            <th>时长</th>
                            <th>上映时间</th>
                            <th>添加日期</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tbody id="movieList">
                        <c:forEach var="movie" items="${moviePageInfo.list}" varStatus="status">
                            <tr>
                                <td>
                                    <input id="checkbox-${movie.movieId}" movieId="${movie.movieId}" type="checkbox" name="input[]">
                                </td>
                                <td><img src="../../..${movie.imgUrl}" style="width: 36px;height: 50px"></td>
                                <td>
                                    <div>${movie.chineseName}</div>
                                    <div>${movie.englishName}</div>
                                </td>
                                <td>
                                    <c:forEach var="type" items="${movie.typeList}" varStatus="status">
                                        ${type.typeName}
                                    </c:forEach>
                                </td>
                                <td>${movie.director}</td>
                                <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${movie.actors}</td>
                                <td>${movie.timeLen}分钟</td>
                                <td><fmt:formatDate value="${movie.releaseDate}" pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatDate value="${movie.addDate}" pattern="yyyy-MM-dd"/></td>
                                <td><span class="label label-warning pull-right" id="movieStatus-${movie.movieId}" status="${movie.movieStatus}"></span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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
        </div>
    </div>
</div>

<%-- ================================================================ 电影的新增/编辑 --%>

<%-- 弹出的添加表单 --%>
<div id="add-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%-- 表单实际内容部分 --%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>添加电影 <small>详细信息</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form action="/admin/movie/add_movie" enctype="multipart/form-data"
                                      method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">封面</label>
                                        <div class="col-sm-10">
                                            <input type="file" name="file" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">中文名</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="chineseName" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">En Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="englishName" class="form-control">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">类型</label>
                                        <div class="col-sm-10">
                                            <c:forEach var="type" items="${typeList}" varStatus="status">
                                                <div class="form-check" id="type-id-${type.typeId}" typeId="${type.typeId}" typeName="${type.typeName}" style="display: inline-block;margin-right: 1rem;min-height: 1.5rem;padding-left: 1.5em;margin-bottom: 0.125rem;">
                                                    <input class="form-check-input" name="update-types" value="${type.typeId}" type="checkbox" id="inlineCheckbox-${type.typeId}" typeId="${type.typeId}">
                                                    <label class="form-check-label" for="inlineCheckbox-${type.typeId}">${type.typeName}</label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">时长</label>
                                        <div class="col-sm-10">
                                            <div class="input-group m-b">
                                                <input type="text" class="form-control" name="timeLen">
                                                <span class="input-group-addon">分钟</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">导演</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="director" class="form-control"> <span class="help-block m-b-none">多名导演以空格"  "分开</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">主演</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="actors" class="form-control"> <span class="help-block m-b-none">多名主演以空格"  "分开</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">国家</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="country" class="form-control">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">上映日期</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="releaseDate" class="form-control" data-mask="9999-99-99" placeholder="">
                                            <span class="help-block">yyyy-mm-dd</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">简介</label>
                                        <div class="col-sm-10">
                                            <textarea id="intro" name="introduction" class="form-control" required="" aria-required="true"></textarea>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">保存内容</button>
                                            <button class="btn btn-white" type="button">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%-- 弹出的编辑表单 --%>
<div id="update-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%-- 表单实际内容部分 --%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>编辑电影 <small>详细信息</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form id="edit-form" action="" enctype="multipart/form-data"
                                      method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">封面</label>
                                        <div class="col-sm-10">
                                            <input type="file" name="file" class="form-control">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">中文名</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="update-chineseName" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">En Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="update-englishName" class="form-control">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">类型</label>
                                        <div class="col-sm-10" id="type-list">

                                        </div>
                                    </div>

                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">时长</label>
                                        <div class="col-sm-10">
                                            <div class="input-group m-b">
                                                <input type="text" class="form-control" name="update-timeLen">
                                                <span class="input-group-addon">分钟</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">导演</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="update-director" class="form-control"> <span class="help-block m-b-none">多名导演以空格"  "分开</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">主演</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="update-actors" class="form-control"> <span class="help-block m-b-none">多名主演以空格"  "分开</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">国家</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="update-country" class="form-control">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">上映日期</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="update-releaseDate" class="form-control" data-mask="9999-99-99" placeholder="">
                                            <span class="help-block">yyyy-mm-dd</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">简介</label>
                                        <div class="col-sm-10">
                                            <textarea name="update-introduction" class="form-control" required="" aria-required="true" style="resize: vertical"></textarea>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">状态</label>
                                        <div class="col-sm-10">
                                            <div class="input-group">
                                                <select name="update-movieStatus" data-placeholder="-- --" class="form-control" style="width:350px;">
                                                    <option value="-1">-- --</option>
                                                    <option value="1">热映中</option>
                                                    <option value="0">已下架</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">保存内容</button>
                                            <button class="btn btn-white" type="button">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%-- ================================================================ 类型的新增/编辑 --%>

<%-- 类型列表 --%>
<div id="type-manage" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%-- 表单实际内容部分 --%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>类型 <small>汇总</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form action="/admin/movie/add_movie" enctype="multipart/form-data"
                                      method="post" class="form-horizontal">
                                    <div id="typeList" class="form-group">
                                        <c:forEach var="type" items="${typeList}" varStatus="status">
                                            <div class="form-check" id="type-id-${type.typeId}" typeId="${type.typeId}" typeName="${type.typeName}" style="display: inline-block;margin-right: 1rem;min-height: 1.5rem;padding-left: 1.5em;margin-bottom: 0.125rem;">
                                                <input class="form-check-input" name="update-types" value="${type.typeId}" type="checkbox" id="inlineCheckbox-${type.typeId}" typeId="${type.typeId}">
                                                <label class="form-check-label" for="inlineCheckbox-${type.typeId}">${type.typeName}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-6">
                                            <button id="btn-type-add" class="btn btn-primary" type="button">新增</button>
                                            <button id="btn-type-edit" class="btn btn-primary" type="button" disabled>修改</button>
                                            <button id="btn-type-ban" class="btn btn-primary" type="button" disabled>禁用</button>
                                            <button class="btn btn-white" type="button">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%-- ================================================================ 语种的新增/编辑 --%>

<%-- 语种列表 --%>
<div id="language-manage" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%-- 表单实际内容部分 --%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>语种 <small>汇总</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form action="/admin/movie/add_movie" enctype="multipart/form-data"
                                      method="post" class="form-horizontal">
                                    <div id="typeList" class="form-group">
                                        <c:forEach var="lan" items="${languageList}" varStatus="status">
                                            <div class="form-check" id="language-id-${lan.languageId}" languageId="${lan.languageId}" languageName="${lan.lanName}" style="display: inline-block;margin-right: 1rem;min-height: 1.5rem;padding-left: 1.5em;margin-bottom: 0.125rem;">
                                                <input class="form-check-input" name="update-languages" value="${lan.languageId}" type="checkbox" id="inlineCheckbox-${lan.languageId}" languageId="${lan.languageId}">
                                                <label class="form-check-label" for="inlineCheckbox-${lan.languageId}">${lan.lanName}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-6">
                                            <button id="btn-language-add" class="btn btn-primary" type="button">新增</button>
                                            <button id="btn-language-edit" class="btn btn-primary" type="button" disabled>修改</button>
                                            <button id="btn-language-ban" class="btn btn-primary" type="button" disabled>禁用</button>
                                            <button class="btn btn-white" type="button">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<script src="../../../resources/plugins/admin_assets/js/jquery.min.js?v=2.1.4"></script>
<script src="../../../resources/plugins/admin_assets/js/bootstrap.min.js?v=3.3.5"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/peity/jquery.peity.min.js"></script>
<script src="../../../resources/plugins/admin_assets/js/content.min.js?v=1.0.0"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/iCheck/icheck.min.js"></script>
<script src="../../../resources/plugins/admin_assets/js/demo/peity-demo.min.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/chosen/chosen.jquery.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/jsKnob/jquery.knob.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/jasny/jasny-bootstrap.min.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/nouslider/jquery.nouislider.min.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/switchery/switchery.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/clockpicker/clockpicker.js"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/cropper/cropper.min.js"></script>
<%--<script src="../../../resources/plugins/admin_assets/js/demo/form-advanced-demo.min.js"></script>--%>      <%-- 会使得自己写的刷新列表的js失效 --%>
<script>
    $(document).ready(function () {
        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
    })
</script>


<%-- 格式化电影的上映状态 --%>
<script>
    $(document).ready(function () {
        $("span[id^='movieStatus-']").each(function () {
            let status = "热映中";
            if ($(this).attr("status") == 0) {
                $(this).removeClass("label-warning")
                status = "已下架";
                $(this).addClass("label-info");
            }
            $(this).text(status);
        })
    })
</script>

<%-- 获取查询条件 刷新列表 --%>
<script>
    $(document).ready(function () {
        // 点击搜索按钮更新
        $('body').on('click', "#search-text", function () {
            $('#main-checkbox').prop("checked", false);      // 刷新全选框状态
            let keyWord = $("#keyWord").val();
            let movieStatus = -1;
            $("label[id^='btn-option-']").each(function () {
                if ($(this).hasClass("active")) {
                    movieStatus = $(this).attr("value");
                }
            })
            $.ajax({
                url: "refresh_list",
                async: false,
                data: {
                    "keyWord": keyWord,
                    "movieStatus": movieStatus,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let movieList = data["movieList"];
                    $("#movieList").empty();
                    if (movieList.length > 0) {                        // 有结果
                        refresh_movie_list(movieList);
                    }
                    // else {                                             // 无结果
                    //
                    // }
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })

        // 点击状态按钮更新
        $('body').on('click', "label[id^='btn-option-']", function () {
            $('#main-checkbox').prop("checked", false);      // 刷新全选框状态
            let keyWord = $("#keyWord").val();
            let movieStatus = $(this).attr("value");
            $.ajax({
                url: "refresh_list",
                async: false,
                data: {
                    "keyWord": keyWord,
                    "movieStatus": movieStatus,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let movieList = data["movieList"];
                    $("#movieList").empty();
                    if (movieList.length > 0) {                        // 有结果
                        refresh_movie_list(movieList);
                    }
                    // else {                                             // 无结果
                    //
                    // }
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    });
</script>

<%--刷新电影列表--%>
<script>
    function split_type_text(movie){
        let type_text = '';
        for (let t = 0;t < movie.typeList.length;t++){
            type_text += (movie.typeList[t].typeName + " ");
        }
        return type_text;
    }
    function refresh_movie_list(movieList){
        for (let i = 0; i < movieList.length; i++) {
            let eachText =
                '                            <tr>\n' +
                '                                <td>\n' +
                '                                    <input id="checkbox-' + movieList[i].movieId + '" movieId="' + movieList[i].movieId + '" type="checkbox" class="i-checks" name="input[]">\n' +
                '                                </td>\n' +
                '                                <td><img src="../../..' + movieList[i].imgUrl + '" style="width: 36px;height: 50px"></td>\n' +
                '                                <td>\n' +
                '                                    <div>' + movieList[i].chineseName + '</div>\n' +
                '                                    <div>' + movieList[i].englishName + '</div>\n' +
                '                                </td>\n' +
                '                                <td>' + split_type_text(movieList[i]) + '</td>\n' +
                '                                <td>' + movieList[i].director + '</td>\n' +
                '                                <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">' + movieList[i].actors + '</td>\n' +
                '                                <td>' + movieList[i].timeLen + '分钟</td>\n' +
                '                                <td>' + transferTime(movieList[i].releaseDate) + '</td>\n' +
                '                                <td>' + transferTime(movieList[i].addDate) + '</td>\n' +
                '                                <td id="movieStatus-' + movieList[i].movieId + '" status="' + movieList[i].movieStatus + '">' + getMovieStatus(movieList[i].movieStatus) + '</td>n' +
                '                            </tr>\n'
            ;
            $("#movieList").append(eachText);
        }
    }
</script>

<%-- 日期对象格式化 --%>
<script>
    function transferTime(cTime) {     //将json串的一串数字进行解析
        var jsonDate = new Date(parseInt(cTime));
        //       alert(jsonDate);
        //为Date对象添加一个新属性，主要是将解析到的时间数据转换为我们熟悉的“yyyy-MM-dd hh:mm:ss”样式
        Date.prototype.format = function (format) {
            var o = {
                //获得解析出来数据的相应信息，可参考js官方文档里面Date对象所具备的方法
                "y+": this.getFullYear(), //得到对应的年信息
                "M+": this.getMonth() + 1, //得到对应的月信息，得到的数字范围是0~11，所以要加一
                "d+": this.getDate(), //得到对应的日信息
                "h+": this.getHours(), //得到对应的小时信息
                "m+": this.getMinutes(), //得到对应的分钟信息
                "s+": this.getSeconds(), //得到对应的秒信息
            }
            //将年转换为完整的年形式
            if (/(y+)/.test(format)) {
                format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            }
            //连接得到的年月日 时分秒信息
            for (var k in o) {
                if (new RegExp("(" + k + ")").test(format)) {
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
                }
            }
            return format;
        }
        // var newDate = jsonDate.format("yyyy-MM-dd hh:mm:ss");
        var newDate = jsonDate.format("yyyy-MM-dd");                     // 设置时间格式
        return newDate;
    }
</script>

<%-- 格式化电影状态(ajax返回内容) --%>
<script>
    function getMovieStatus(statusNum) {
        let status = "";
        let lable_class = "";
        switch (statusNum) {
            case 1:
                status = "热映中";
                lable_class = "label-warning"
                break;
            case 0:
                status = "已下架";
                lable_class = "label-info"
                break;
        }
        return "<span class=\"label " + lable_class + " pull-right\">" + status +"</span>";
    }
</script>

<%-- 全选和反选 --%>
<script>
    // 勾选全选复选框时
    $('#main-checkbox').click(function () {
        let flag = this.checked; // 获取该复选框的勾选状态
        // console.log(flag);
        // 获取所有行记录的复选框
        $("input[id^='checkbox-']").each(function () {
            // console.log("+++++++++++")
            $(this).prop("checked", flag);
        })
        // $('#checkbox-1').prop('checked',true);
    })


    $('body').on('click', "input[id^='checkbox-']", function () {
        let total = $("input[id^='checkbox-']").length;
        let cnt = 0;
        $("input[id^='checkbox-']").each(function () {
            if (this.checked) {
                cnt++;
            }
        })
        if (cnt == total) {
            $('#main-checkbox').prop("checked", true);
        } else if (cnt != total) {
            $('#main-checkbox').prop("checked", false);
        }
    });
</script>

<%-- 删除提示框 --%>
<script>
    $(document).ready(function () {
        $('#delete-btn').click(function () {
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false,
                cancelButtonText:"取消",
            }, function () {
                swal("删除成功！", "您已经永久删除了这条信息。", "success");
            });
        });
    })

</script>

<%-- 选中的个数变化时 更新"删除按钮"的状态 有选中才允许删除 --%>
<script>
    $(document).ready(function () {
        $('body').on('click', "input[id*='checkbox']", function () {
            let select_cnt = 0;
            $("input[id*='checkbox']").each(function () {
                if (this.checked) {
                    select_cnt++;
                }
            })
            if (select_cnt == 0) {
                $('#delete-btn').prop("disabled", true);
            } else {
                $('#delete-btn').prop("disabled", false);
            }
        })
    })
</script>

<%-- 选中的个数变化时 更新"更新按钮"的状态 当且仅当选中一个记录时才允许修改 --%>
<script>
    $(document).ready(function () {
        $('body').on('click', "input[id*='checkbox']", function () {
            let select_cnt = 0;
            $("input[id*='checkbox']").each(function () {
                if (this.checked) {
                    select_cnt++;
                }
            })
            if (select_cnt != 1) {
                $('#update-btn').prop("disabled", true);
            } else {
                $('#update-btn').prop("disabled", false);
            }
        })
    })
</script>

<%-- 编辑按钮被单击 获取被选中的记录的movieId 更新表单内容 --%>
<script>
    $(document).ready(function () {
        $('#update-btn').click(function () {
            $("input[id^='checkbox-']").each(function () {
                if (this.checked) {             // 如果是被选中的那一个记录 就编辑他
                    let movieId = $(this).attr("movieId");
                    // console.log("movieId=" + movieId);
                    $.ajax({
                        url: "selectMovieById",
                        async: false,
                        data: {
                            "movieId": movieId,
                        },
                        type: "POST",
                        dataType: "json",
                        // contentType : "application/json;charset=UTF-8",
                        success: function (data) {
                            let movie = data["movie"];
                            let typeList = data["typeList"];
                            let movieTypeList = movie.typeList;
                            // 设置更新链接 传递movieId
                            $("#edit-form").attr("action","/admin/movie/update_movie?movieId=" + movie.movieId);

                            $("input[name='update-chineseName']").attr("value",movie.chineseName);
                            $("input[name='update-englishName']").attr("value",movie.englishName);

                            // $("input[name='update-types']").attr("value",movie.types);
                            $("#type-list").empty();
                            // 遍历每个类型 属于当前电影的类型将其选中
                            for (let i = 0;i < typeList.length;i++){
                                let sign = -1;          // 标记此电影是否属于包含当前类型
                                for (let j = 0;j < movieTypeList.length;j++){
                                    if (movieTypeList[j].typeId == typeList[i].typeId){
                                        sign = 1;
                                        break;
                                    }
                                }

                                // 判断当前电影是否属于此类型 勾选上对应的多选框
                                let typeText ='';
                                if (sign == -1){
                                    typeText =
                                        '                                        <div class="form-check" id="type-id-' + typeList[i].typeId + '" typeId="' + typeList[i].typeId + '" typeName="' + typeList[i].typeName + '" style="display: inline-block;margin-right: 1rem;min-height: 1.5rem;padding-left: 1.5em;margin-bottom: 0.125rem;">\n' +
                                        '                                            <input class="form-check-input" name="update-types" value="' + typeList[i].typeId + '" type="checkbox" id="inlineCheckbox-' + typeList[i].typeId + '" typeId="' + typeList[i].typeId + '">\n' +
                                        '                                            <label class="form-check-label" for="inlineCheckbox-' + typeList[i].typeId + '">' + typeList[i].typeName + '</label>\n' +
                                        '                                        </div>\n'
                                    ;
                                }
                                else {
                                    typeText =
                                        '                                        <div class="form-check" id="type-id-' + typeList[i].typeId + '" typeId="' + typeList[i].typeId + '" typeName="' + typeList[i].typeName + '" style="display: inline-block;margin-right: 1rem;min-height: 1.5rem;padding-left: 1.5em;margin-bottom: 0.125rem;">\n' +
                                        '                                            <input class="form-check-input" name="update-types" value="' + typeList[i].typeId + '" type="checkbox" id="inlineCheckbox-' + typeList[i].typeId + '" typeId="' + typeList[i].typeId + '" checked>\n' +
                                        '                                            <label class="form-check-label" for="inlineCheckbox-' + typeList[i].typeId + '">' + typeList[i].typeName + '</label>\n' +
                                        '                                        </div>\n'
                                    ;
                                }
                                $("#type-list").append(typeText);
                            }
                            $("input[name='update-timeLen']").attr("value",movie.timeLen);
                            $("input[name='update-director']").attr("value",movie.director);
                            $("input[name='update-actors']").attr("value",movie.actors);
                            $("input[name='update-country']").attr("value",movie.country);
                            $("input[name='update-releaseDate']").attr("value",transferTime(movie.releaseDate));
                            $("textarea[name='update-introduction']").text(movie.introduction);
                        },
                        error: function () {
                            alert("ajax请求错误");
                        }
                    });
                }
            })
        })
    })

</script>

<%-- 刷新按钮加载动效 --%>
<script>
    $(document).ready(function () {
        $("#loading-example-btn").click(function () {
            btn = $(this);
            simpleLoad(btn, true);
            simpleLoad(btn, false);

            let keyWord = $("#keyWord").val();
            let movieStatus = -1;
            $("label[id^='btn-option-']").each(function () {
                if ($(this).hasClass("active")) {
                    movieStatus = $(this).attr("value");
                }
            })
            $.ajax({
                url: "refresh_list",
                async: false,
                data: {
                    "keyWord": keyWord,
                    "movieStatus": movieStatus,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let movieList = data["movieList"];
                    $("#movieList").empty();
                    if (movieList.length > 0) {                        // 有结果
                        refresh_movie_list(movieList);
                    }
                    // else {                                             // 无结果
                    //
                    // }
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    });

    function simpleLoad(btn, state) {
        if (state) {
            btn.children().addClass("fa-spin");
            btn.contents().last().replaceWith(" 载入中")
        } else {
            setTimeout(function () {
                btn.children().removeClass("fa-spin");
                btn.contents().last().replaceWith(" 再次刷新")
            }, 2000)
        }
    }
</script>

<%-- 新增类型 --%>
<script>
    $(document).ready(function () {
        var add_type_sign = 0;
        $('body').on('click', "#btn-type-add", function () {
            if (add_type_sign == 0){
                let inputText = '<input type="text" id="typeName-add" class="form-control" style="display: inline-block;margin-right: 1rem;min-height: 1.5rem;padding-left: 1.5em;margin-bottom: 0.125rem;width: 100px">';
                $("#typeList").append(inputText);
                add_type_sign = 1;
            }
        });

        // 失去焦点后 检验input框内容 并更新列表
        $(document).on("blur", "#typeName-add", function(){     // <--采用这种写法 使得通过jquery去append的元素 也能成功绑定此事件
            if ($(this).val() == ''){                       // 未输入内容
                $(this).hide();
                add_type_sign = 0;
            }
            else{                                           // 已输入内容
                let typeName = $(this).val();
                $.ajax({
                    url: "add_type",
                    async: false,
                    data: {
                        "typeName": typeName,
                    },
                    type: "POST",
                    dataType: "json",
                    // contentType : "application/json;charset=UTF-8",
                    success: function (data) {
                        let typeList = data["typeList"];
                        $("#typeList").empty();
                        if (typeList.length > 0) {                        // 有结果
                            refresh_type_list(typeList);
                        }
                        add_type_sign = 0;
                    },
                    error: function () {
                        alert("ajax请求错误");
                    }
                });
            }
        });
    });
</script>

<%-- 修改类型 --%>
<script>
    $(document).ready(function () {
        // 两次循环 锁定要修改的类型的整个div
        let add_type_sign = 0;
        let typeId = -1;
        $(document).on("click", "#btn-type-edit", function(){
            $("input[id^='inlineCheckbox-']").each(function () {    // 寻找选中的type的typeId
                if (this.checked) {
                    typeId = $(this).attr("typeId");
                }
            })

            $("div[id^='type-id-']").each(function () {
                if ($(this).attr("typeId") == typeId) {     // 寻找匹配的typeId的type的整个div部分
                    let typeName = $(this).attr("typeName");
                    // 替换被选中的checkbox为输入框
                    $(this).replaceWith('<input type="text" id="typeName-edit" class="form-control" style="display: inline-block;margin-right: 1rem;min-height: 1.5rem;padding-left: 1.5em;margin-bottom: 0.125rem;width: 100px" value=' + typeName +'>');
                }
            })
        });

        // 失去焦点后 检验input框内容 并更新列表
        $(document).on("blur", "#typeName-edit", function(){     // <--采用这种写法 使得通过jquery去append的元素 也能成功绑定此事件
            if ($(this).val() == ''){                       // 未输入内容
                $(this).hide();
                add_type_sign = 0;
            }
            else{                                           // 已输入内容
                let typeName = $(this).val();
                $.ajax({
                    url: "edit_type",
                    async: false,
                    data: {
                        "typeName": typeName,
                        "typeId": typeId,
                    },
                    type: "POST",
                    dataType: "json",
                    // contentType : "application/json;charset=UTF-8",
                    success: function (data) {
                        let typeList = data["typeList"];
                        $("#typeList").empty();
                        if (typeList.length > 0) {                        // 有结果
                            refresh_type_list(typeList);
                        }
                        add_type_sign = 0;
                    },
                    error: function () {
                        alert("ajax请求错误");
                    }
                });
            }
        });
    });
</script>

<%-- 修改/删除 类型 按钮可用状态 抽象为方法可调用--%>
<script>
    function refreshBtnStatus(){
        let select_cnt = 0;
        // 统计选中个数
        $("input[id^='inlineCheckbox-']").each(function () {
            if (this.checked) {
                select_cnt++;
            }
        })

        if (select_cnt == 0) {                              // 一个都没有选中
            $('#btn-type-edit').prop("disabled", true);
            $('#btn-type-delete').prop("disabled", true);
        } else if (select_cnt == 1) {                       // 只选中一个
            $('#btn-type-edit').prop("disabled", false);
            $('#btn-type-delete').prop("disabled", false);
        } else {                                            // 选中不止一个
            $('#btn-type-edit').prop("disabled", true);
            $('#btn-type-delete').prop("disabled", false);
        }
    }

</script>

<%-- checkbox被单击时刷新 可操作按钮状态 --%>
<script>
    $(document).ready(function () {
        $('body').on('click', "input[id^='inlineCheckbox-']", function () {
            refreshBtnStatus();
        })
    })
</script>

<%-- 刷新类型列表 --%>
<script>
    function refresh_type_list(typeList) {
        $("#typeList").empty();
        for (let i = 0; i < typeList.length; i++) {
            // 类型列表
            let eachText =
                '                                            <div class="form-check" id="type-id-' + typeList[i].typeId + '" typeId="' + typeList[i].typeId + '" typeName="' + typeList[i].typeName + '" style="display: inline-block;margin-right: 1rem;min-height: 1.5rem;padding-left: 1.5em;margin-bottom: 0.125rem;">\n' +
                '                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox-' + typeList[i].typeId + '" typeId="' + typeList[i].typeId + '">\n' +
                '                                                <label class="form-check-label" for="inlineCheckbox-' + typeList[i].typeId + '">' + typeList[i].typeName + '</label>\n' +
                '                                            </div>\n'
            ;
            $("#typeList").append(eachText);
            refreshBtnStatus();
        }

    }
</script>

<%-- 传递currPage和pageSize 跳转指定分页函数 --%>
<script type="text/javascript">
    //分页相关内容
    function gotoPage(currPage) {
        //获取下拉列表中pageSize的值
        let pageSize = $("#pageSize").attr("pageSize");
        //判断控制页码范围
        if (currPage < 1) {
            return;//终止代码执行
        }
        if (currPage >${moviePageInfo.total}) {
            return;//终止代码执行
        }
        location.href = "${pageContext.request.contextPath}/admin/movie/list?currPage=" + currPage + "&pageSize=" + pageSize;
    }
</script>








</body>
</html>

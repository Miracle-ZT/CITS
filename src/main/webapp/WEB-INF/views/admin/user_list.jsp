<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/22
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 项目</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="../../../resources/plugins/admin_assets/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="../../../resources/plugins/admin_assets/css/animate.min.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/style.min.css?v=4.0.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInUp">
    <div class="row">
        <div class="col-sm-12">

            <div class="ibox">
                <div class="ibox-title">
                    <h5>用户列表</h5>
                </div>
                <div class="ibox-content">
                    <div class="row m-b-sm m-t-sm">
                        <div class="col-md-1">
                            <button type="button" id="loading-example-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
                        </div>
                        <div class="col-md-11">
                            <div class="input-group">
                                <input id="keyWord" type="text" placeholder="请输入用户信息" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                            </div>
                        </div>
                    </div>

                    <div class="project-list">
                        <table class="table table-hover">
                            <tbody id="userList">
                            <c:forEach var="user" items="${userList}" varStatus="status">
                                <tr>
                                    <td><img src="../../../..${user.photo}" style=";width: 40px;height: 40px;border-radius: 50%;overflow: hidden"></td>
                                    <td><a class="client-link">${user.username}</a></td>
                                    <td>${user.email}</td>
                                    <td>${user.phone}</td>
                                    <td class="project-actions">
                                        <a id="info-btn-${user.id}" userId="${user.id}"
                                           data-toggle="modal" href="#detail-form" class="btn btn-white btn-sm"><i class="fa fa-folder"></i> 查看 </a>

                                        <a id="edit-btn-${user.id}" userId="${user.id}"
                                           data-toggle="modal" href="#edit-form" class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> 编辑 </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%-- 查看资料弹窗 --%>
<div id="detail-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%-- 表单实际内容部分 --%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>查看用户 <small>详细信息</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form action="" enctype="multipart/form-data"
                                      method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">头像</label>
                                        <div class="col-sm-10">
                                            <img name="photo" style="width: 40px;height: 40px">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">用户名</label>
                                        <div class="col-sm-10">
                                            <div name="username" class="form-control"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">邮箱</label>
                                        <div class="col-sm-10">
                                            <div name="email" class="form-control"></div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-10">
                                            <div name="password" class="form-control">********</div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">电话</label>
                                        <div class="col-sm-10">
                                            <div name="phone" class="form-control"></div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- 编辑资料弹窗 --%>
<div id="edit-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%-- 表单实际内容部分 --%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>编辑用户 <small>详细信息</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form id="submit-form" action="" enctype="multipart/form-data"
                                      method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">头像</label>
                                        <div class="col-sm-10">
                                            <input type="file" name="file" class="form-control">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">用户名</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="update-username" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">邮箱</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="update-email" class="form-control">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-10">
                                            <input type="password" name="update-password" class="form-control">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">电话</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="update-phone" class="form-control">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-white" type="submit">保存</button>
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
<script src="../../../resources/plugins/admin_assets/js/content.min.js?v=1.0.0"></script>
<script>
    $(document).ready(function(){$("#loading-example-btn").click(function(){btn=$(this);simpleLoad(btn,true);simpleLoad(btn,false)})});function simpleLoad(btn,state){if(state){btn.children().addClass("fa-spin");btn.contents().last().replaceWith(" Loading")}else{setTimeout(function(){btn.children().removeClass("fa-spin");btn.contents().last().replaceWith(" Refresh")},2000)}};
</script>


<%-- 显示指定用户的个人信息弹窗中的信息 详情弹窗--%>
<script>
    $(document).ready(function () {
        $(document).on("click", "a[id^='info-btn-']", function(){
            let userId = $(this).attr("userId");
            $.ajax({
                url: "selectUserById",
                async: false,
                data: {
                    "userId": userId,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let user = data["user"];
                    // 设置更新链接 传递movieId
                    $("img[name='photo']").attr("src","../../.." + user.photo);
                    $("div[name='username']").text(user.username);
                    $("div[name='email']").text(user.email);
                    $("div[name='phone']").text(user.phone);
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    })
</script>

<%-- 显示指定用户的个人信息弹窗中的信息 可编辑 更新弹窗 --%>
<script>
    $(document).ready(function () {
        $(document).on("click", "a[id^='edit-btn-']", function(){
            let userId = $(this).attr("userId");
            $.ajax({
                url: "selectUserById",
                async: false,
                data: {
                    "userId": userId,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let user = data["user"];
                    // 设置更新链接 传递movieId
                    $("#submit-form").attr("action","/admin/user/update_user?userId=" + user.id);

                    $("input[name='update-username']").attr("value",user.username);
                    $("input[name='update-email']").attr("value",user.email);
                    $("input[name='update-password']").attr("value",user.password);
                    $("input[name='update-phone']").attr("value",user.phone);
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    })
</script>

<%-- 搜索框内容变化 实时更新用户列表 --%>
<script>
    $(document).ready(function () {
        // input propertychange --- input的实时内容更新事件
        $('body').on('input propertychange', "#keyWord", function () {
            let keyWord = $("#keyWord").val();
            $.ajax({
                url: "refresh_list",
                async: false,
                data: {
                    "keyWord": keyWord,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let userList = data["userList"];
                    $("#userList").empty();
                    if (userList.length > 0) {                        // 有结果
                        for (let i = 0; i < userList.length; i++) {
                            // 用户列表
                            let eachText ='                                <tr>\n' +
                                '                                    <td><img src="../../../..' + userList[i].photo + '" style=";width: 40px;height: 40px;border-radius: 50%;overflow: hidden"></td>\n' +
                                '                                    <td><a class="client-link">' + userList[i].username + '</a>\n' +
                                '                                    <td>' + userList[i].email + '</td>\n' +
                                '                                    <td>' + userList[i].phone + '</td>\n' +
                                '                                    <td class="project-actions">\n' +
                                '                                        <a id="info-btn-' + userList[i].id + '" userId="' + userList[i].id + '"\n' +
                                '                                           data-toggle="modal" href="#detail-form" class="btn btn-white btn-sm"><i class="fa fa-folder"></i> 查看 </a>\n' +
                                '                                        <a id="edit-btn-' + userList[i].id + '" userId="' + userList[i].id + '"\n' +
                                '                                           data-toggle="modal" href="#edit-form" class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> 编辑 </a>\n' +
                                '                                    </td>\n' +
                                '                                </tr>\n'
                            ;
                            $("#userList").append(eachText);
                        }
                    }
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    })

</script>



</body>
</html>

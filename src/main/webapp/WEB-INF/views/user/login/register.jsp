<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/4/16
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>影院智能购票平台</title>
    <link rel="stylesheet" href="../../../../resources/plugins/bootstrap-5.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="../../../../resources/plugins/bootstrap-3.4.1/bootstrap-3.4.1-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../../../resources/css/form.css">
</head>
<body>
<%
    String msg = (String)request.getSession().getAttribute("msg");         // 获取错误属性
    if(msg != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=msg%>");                                            // 弹出错误信息
</script>
<%}%>
<section class="h-100">
    <div class="container h-100" style="margin-top: 200px">
        <div class="row justify-content-sm-center h-100">
            <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
                <div class="card shadow-lg">
                    <div class="card-body p-5">
                        <h1 class="fs-2 card-title fw-bold mb-5 text-center">用户注册</h1>
                        <form method="post" action="${pageContext.request.contextPath}/user/register/" class="needs-validation" autocomplete="off">
                            <div class="mb-3">
                                <label class="mb-2 text-muted" for="email">邮箱：</label>
                                <input id="email" type="text" class="form-control" name="email" value="" required autofocus>
                            </div>

                            <div class="mb-3">
                                <div class="mb-2 w-100">
                                    <label class="text-muted" for="pwd">密码：</label>
                                </div>
                                <input id="pwd" type="password" class="form-control" name="password" required>
                            </div>

                            <div class="mb-3">
                                <label class="mb-2 text-muted">昵称：</label>
                                <input id="username" type="text" class="form-control" name="username" value="" required>
                            </div>

                            <div class="mb-3">
                                <label class="mb-2 text-muted">电话：</label>
                                <input id="phone" type="text" class="form-control" name="phone" value="" required>
                            </div>

                            <div class="mb-3">
                                <label class="mb-2 text-muted" for="email">性别：</label>
                                <div class="row" style="float: right;margin-right: 1px">
                                    <div class="col-6"><input type="radio" class="form-check-input" name="sex" value="1" checked>&nbsp;男</div>
                                    <div class="col-6"><input type="radio" class="form-check-input" name="sex" value="0">&nbsp;女</div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="mb-2 text-muted">验证码：
                                    <button class="btn btn-light" type="button" id="VCode-btn">点击发送</button>
                                    <a id="verify"></a>
                                </label>
                                <input id="VCode" type="text" class="form-control" name="VCode" value="" required>
                            </div>

                            <div class="d-flex align-items-center">
                                <button type="button" class="btn btn-outline-info ms-auto" onclick="toLogin()" style="margin-right: 10px;">
                                    返回
                                </button>
                                <button type="submit" class="btn btn-success" id="submit">
                                    注册
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer py-3 border-0">
                        <div style="text-align: center">Copyright &copy; 2112114236 &mdash; XMUT</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="../../../../resources/js/jquery-3.6.3.js"></script>

<%-- 返回登录页面 --%>
<script>
    function toLogin(){
        window.location = "/user/login";
    }
</script>

<%-- 发送验证码按钮状态变化 --%>
<script>
    let sec = 60;        // 倒计时秒数
    var t = null;
    function alterTime(){
        $("#VCode-btn").text("重新发送:" + sec);
        sec--;
        if (sec < 0){
            stopTime();
            $("#VCode-btn").attr("disabled",false);
            $("#VCode-btn").text("点击发送");
            sec = 60;
        }
    }
    function stopTime(){
        clearInterval(t);
    }
    $(document).ready(function(){
        $('body').on('click', "#VCode-btn", function () {
            $("#verify").text("");
            $(this).attr("disabled",true);
            $("#submit").attr("disabled",true);

            let to = $("#email").val();
            if (to != ""){
                $.ajax({
                    url: "sendEmail",
                    async: false,
                    data: {
                        "to": to,
                    },
                    type: "POST",
                    dataType: "json",
                    // contentType : "application/json;charset=UTF-8",
                    success: function (data) {
                        let VCode = data["VCode"];
                        t = setInterval(function (){alterTime()},1000);
                        // 监听验证码内容变化 进行比对
                        $('body').on('input propertychange', "#VCode", function () {
                            if ($(this).val() == VCode){
                                $("#submit").attr("disabled",false);
                                $("#verify").text("√");
                            }
                            else {
                                $("#submit").attr("disabled",true);
                                $("#verify").text("×");
                            }
                        });
                    },
                    error: function (xhr) {
                        alert("ajax请求错误:" + xhr.readyState);
                    }
                });
            }
            else {
                alert("请输入邮箱");
            }
        });
    });

</script>


</body>
</html>

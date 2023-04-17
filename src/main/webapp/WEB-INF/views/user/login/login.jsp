<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/1/10
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <h1 class="fs-2 card-title fw-bold mb-5 text-center">影院智能购票平台</h1>
                        <form method="post" action="${pageContext.request.contextPath}/user/login/" class="needs-validation" autocomplete="off">
                            <div class="mb-3">
                                <label class="mb-2 text-muted" for="email">邮箱：</label>
                                <input id="email" type="text" class="form-control" name="email" value="" required autofocus>
                            </div>
                            <div class="mb-3">
                                <div class="mb-2 w-100">
                                    <label class="text-muted" for="pwd">密码：</label>
                                    <a href="#" class="float-end">
                                        忘记密码?
                                    </a>
                                </div>
                                <input id="pwd" type="password" class="form-control" name="password" required>
                            </div>

                            <div class="d-flex align-items-center">
                                <div class="form-check">
                                    <input type="checkbox" name="remember" id="remember" class="form-check-input">
                                    <label for="remember" class="form-check-label">自动登录</label>
                                </div>
                                <button type="button" onclick="toRegister()" class="btn btn-outline-info ms-auto" style="margin-right: 10px;">
                                    注册
                                </button>
                                <button type="submit" class="btn btn-success">
                                    登录
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
<script>
    function toRegister(){
        window.location = "/user/register";
    }
</script>


</body>
</html>


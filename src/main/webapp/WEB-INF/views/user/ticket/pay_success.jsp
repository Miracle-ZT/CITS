<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/3/9
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<h1>支付成功!!</h1>
<a href="/home/center/index?type=1">查看全部订单</a>

<div>total_amount:${total_amount}</div>
<div>out_trade_no:${out_trade_no}</div>
<div>trade_no:${trade_no}</div>
<div>seller_id:${seller_id}</div>



</body>
</html>

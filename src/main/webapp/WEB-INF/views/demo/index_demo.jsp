<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/4/3
  Time: 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <script src="../../../resources/js/jquery-3.6.3.js"></script>
    <title>Title</title>
    <link href="../../../resources/plugins/bootstrap-3.4.1/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../../../resources/plugins/bootstrap-select-1.13.14/dist/css/bootstrap-select.min.css" rel="stylesheet"/>
    <link href="../../../resources/plugins/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
</head>
<body>

<select class="selectpicker" data-live-search="true">
    <option value="1">广东省</option>
    <option value="2">广西省</option>
    <option value="3">福建省</option>
    <option value="4">湖南省</option>
    <option value="5">山东省</option>
</select>


<input type="text" name="preview_end_time" class=" form-control" placeholder="请输入预展结束时间" required="" id="id_preview_end_time">
<input type="text" id="demo" class="form-control">




<script src="../../../resources/plugins/bootstrap-3.4.1/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<script src="../../../resources/plugins/bootstrap-select-1.13.14/dist/js/bootstrap-select.min.js"></script>
<script src="../../../resources/plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<script src="../../../resources/plugins/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $('.selectpicker').selectpicker('refresh');
</script>

<script>
    $("#demo").datetimepicker({
        format: 'yyyy-mm-dd'
    });
</script>

<script>
    // 函数执行
    $(function () {
        initDatepicker();
    });
    // 把时间input框的id，添加到里面
    function initDatepicker() {
        $('#id_preview_end_time').datetimepicker({
            language: "zh-CN",
            minView: 4,
            sideBySide: true,
            format: 'yyyy-mm-dd',
            bootcssVer: 3,
            startDate: new Date(),
            autoclose: true
        })
    }
</script>

</body>
</html>

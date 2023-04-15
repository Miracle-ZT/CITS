<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/14
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--content--%>

<div class="row">
    <div class="col-sm-4 col-3">
        <h4 class="page-title">影厅列表</h4>
    </div>
    <div class="col-sm-8 col-9 text-right m-b-20">
        <a class="btn btn btn-primary btn-rounded float-right"
           data-bs-toggle="modal" data-bs-target="#addLayoutModal"><i class="fa fa-plus"></i>
            添加影厅</a>
    </div>
</div>
<div class="row filter-row">
    <div class="col-sm-6 col-md-3">
        <div class="form-group form-focus">
            <label class="focus-label">名称</label>
            <input id="search-text" type="text" class="form-control floating">
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <a id="search-btn" href="/cinema_admin/room_list?cinemaId=${cinema.cinemaId}" class="btn btn-success btn-block">
            搜索 </a>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-border table-striped custom-table datatable mb-0">
                <thead>
                <tr>
                    <th>影厅名</th>
                    <th>排数(max)</th>
                    <th>列数(max)</th>
                    <th>布局</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="room" items="${roomList}" varStatus="status">
                    <tr>
                        <td>${room.roomName}</td>
                        <td>${room.roomRow}</td>
                        <td>${room.roomCol}</td>
                        <td><a id="layout-detail-${status.count}" roomId="${room.roomId}"
                               style="color: #0d6efd;cursor: pointer" data-bs-toggle="modal" data-bs-target="#myModal">查看</a>
                        </td>
                        <td class="text-right">
                            <div class="dropdown dropdown-action">
                                <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown"
                                   aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a id="layout-edit-${room.roomId}" roomId="${room.roomId}" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#editLayoutModal"><i class="fa fa-pencil m-r-5"></i> 编辑</a>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_patient"><i class="fa fa-trash-o m-r-5"></i> 删除</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- 查看布局模态框 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content" style="width: 1000px">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">影厅详情</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- 模态框内容 -->
            <div class="modal-body">
                <div id="roomName" style="font-size: 25px;margin: 10px">名称：</div>
                <div class="row">
                    <div class="col-6">
                        <div id="roomRow" style="font-size: 25px;margin: 10px">排数：</div>
                    </div>
                    <div class="col-6">
                        <div id="roomCol" style="font-size: 25px;margin: 10px">列数：</div>
                    </div>
                </div>
                <div class="dropdown-divider"></div>
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-7">
                        <div class="screen align-items-center">屏幕</div>
                        <div id="roomSeats" class="align-items-center" style="margin-left: 85px">

                        </div>
                    </div>
                    <div class="col-4">
                        <div id="roomSeatType" style="margin: 20px">
                            <div class="row" style="margin-top: 100px">                   <%-- 示例图 --%>
                                <div class="col-6">
                                    <div id="seat-col-sample-available" class="seat-available seatCharts-seat seat-cell"
                                         style="cursor: none;pointer-events: none"></div>
                                    <h7 style="margin-left: 5px;line-height: 30px">有座位</h7>
                                </div>
                                <div class="col-6">
                                    <div id="seat-col-sample-null" class="seat-null seatCharts-seat seat-cell" style="pointer-events: none"></div>
                                    <h7 style="margin-left: 5px;line-height: 30px">无座位</h7>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>

<%-- 编辑布局模糊框 --%>
<div class="modal fade" id="editLayoutModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">影厅资料编辑</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- 模态框内容 -->
            <div class="modal-body" id="roomId" roomId="">
                <div style="font-size: 25px;margin: 10px">
                    <div class="form-group form-focus focused">
                        <label class="focus-label">名称</label>
                        <input id="roomNameEdit" type="text" class="form-control floating">
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div style="font-size: 25px;margin: 10px">
                            <div class="form-group form-focus focused">
                                <label class="focus-label">排数(1~15)</label>
                                <input id="roomRowEdit" type="text" class="form-control floating">
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div style="font-size: 25px;margin: 10px">
                            <div class="form-group form-focus focused">
                                <label class="focus-label">列数(1~15)</label>
                                <input id="roomColEdit" type="text" class="form-control floating">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="dropdown-divider"></div>
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-7">
                        <div class="screen align-items-center">屏幕</div>
                        <div id="roomSeatsEdit" class="align-items-center" style="margin-left: 25px">

                        </div>
                    </div>
                    <div class="col-4" style="border-left: #d3d3d3 1px solid">
                        <div id="roomSeatTypeEdit" style="margin: 20px" class="align-self-center">
                            <div style="font-size: 18px;margin-bottom:30px">
                                1.点击重置按钮，刷新座位布局大小。<br>
                                2.选中已有座位后，点击下方座位类型，即可逐个设置座位类型。
                            </div>
                            <button class="btn btn-outline-primary btn-lg" onclick="resetLayoutEdit()">重置</button>
                            <div class="row" style="margin-top: 100px">                   <%-- 示例图 --%>
                                <div class="col-4" onclick="seatToAvailable('edit')">
                                    <div id="seat-col-sample-available-edit" class="seat-available seatCharts-seat seat-cell"></div>
                                    <h7 style="margin-left: 5px;line-height: 30px">有座位</h7>
                                </div>
                                <div class="col-4" onclick="seatToNull('edit')">
                                    <div id="seat-col-sample-null-edit" class="seat-null seatCharts-seat seat-cell"></div>
                                    <h7 style="margin-left: 5px;line-height: 30px">无座位</h7>
                                </div>
                                <div class="col-4">
                                    <div id="seat-col-sample-selected-edit" class="seat-selected seatCharts-seat seat-cell" style="pointer-events: none"></div>
                                    <h7 style="margin-left: 5px;line-height: 30px">已选中</h7>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" onclick="submitNewSeatsEdit()" class="btn btn-primary" data-bs-dismiss="modal">保存</button>
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>

<%-- 新增布局模糊框 --%>
<div class="modal fade" id="addLayoutModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <form action="/cinema_admin/">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">影厅资料新增</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- 模态框内容 -->
                <div class="modal-body">
                    <div style="font-size: 25px;margin: 10px">
                        <div class="form-group form-focus focused">
                            <label class="focus-label">名称</label>
                            <input id="roomNameAdd" type="text" class="form-control floating">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div style="font-size: 25px;margin: 10px">
                                <div class="form-group form-focus focused">
                                    <label class="focus-label">排数(1~15)</label>
                                    <input id="roomRowAdd" name="roomRowAdd" type="text" class="form-control floating">
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div style="font-size: 25px;margin: 10px">
                                <div class="form-group form-focus focused">
                                    <label class="focus-label">列数(1~15)</label>
                                    <input id="roomColAdd" name="roomColAdd" type="text" class="form-control floating">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown-divider"></div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-7">
                            <div class="screen align-items-center">屏幕</div>
                            <div id="roomSeatsAdd" class="align-items-center" style="margin-left: 25px">

                            </div>
                        </div>
                        <div class="col-4" style="border-left: #d3d3d3 1px solid">
                            <div id="roomSeatTypeAdd" style="margin: 20px" class="align-self-center">
                                <div style="font-size: 18px;margin-bottom:30px">
                                    1.点击重置按钮，刷新座位布局大小。<br>
                                    2.选中已有座位后，点击下方座位类型，即可逐个设置座位类型。
                                </div>
                                <button class="btn btn-outline-primary btn-lg" onclick="resetLayoutAdd()" type="button">重置</button>
                                <div class="row" style="margin-top: 100px">                   <%-- 示例图 --%>
                                    <div class="col-4" onclick="seatToAvailable('add')">
                                        <div id="seat-col-sample-available-add" class="seat-available seatCharts-seat seat-cell"></div>
                                        <h7 style="margin-left: 5px;line-height: 30px">有座位</h7>
                                    </div>
                                    <div class="col-4" onclick="seatToNull('add')">
                                        <div id="seat-col-sample-null-add" class="seat-null seatCharts-seat seat-cell"></div>
                                        <h7 style="margin-left: 5px;line-height: 30px">无座位</h7>
                                    </div>
                                    <div class="col-4">
                                        <div id="seat-col-sample-selected-add" class="seat-selected seatCharts-seat seat-cell" style="pointer-events: none"></div>
                                        <h7 style="margin-left: 5px;line-height: 30px">已选中</h7>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" onclick="submitNewSeatsAdd()" class="btn btn-primary" data-bs-dismiss="modal">保存</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>




<%-- jquery --%>
<script src="../../../resources/js/jquery-3.6.3.js"></script>

<%--　获取搜索框关键字 拼接GET参数　--%>
<script>
    $("#search-text").change(function () {
        let search_text = $(this).val();
        let completeUrl = '/cinema_admin/room_list?cinemaId=${cinema.cinemaId}&searchText=' + search_text;
        $("#search-btn").attr("href", completeUrl);
    });
</script>

<%-- 查看详情 渲染座位布局 --%>
<script>
    $(document).ready(function () {
        $("a[id*='layout-detail-']").on("click", function (e) {               // 监听layout-detail-开头的id的控件
            let roomId = $(e.target).attr("roomId");                        // 并获取此控件
            // alert("roomId=" + roomId);
            $.ajax({
                url: "layout_detail?roomId=" + roomId,
                async: false,
                data: {
                    "roomId": roomId,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    var room = data["room"];
                    $("#roomSeats").empty();
                    let row = room.roomRow;
                    let col = room.roomCol;
                    let layout = room.layout;
                    var eachSeatText = '';
                    for (var i = 0; i < row; i++) {                        // 每一行
                        eachSeatText = '<div class="seat-row" id="seat-row-' + i + '">\n';
                        $("#roomSeats").append(eachSeatText);
                        for (var j = 0; j < col; j++) {
                            if (j == 0) {                                // 标记列      渲染排的序号
                                eachSeatText = '<div id="seat-tag-' + i + '" class="seat-available seatCharts-seat seat-cell" style="color: black;background-color: #fff">' + (i + 1) + '</div>\n'
                                $("#roomSeats").append(eachSeatText);
                            }
                            switch (layout.charAt(((i * col) + j))) {      // 单个位置
                                case 'a':
                                    eachSeatText = '<div id="seat-col-' + i + '-' + j + '" row="' + i + '" col="' + j + '" class="seat-available seatCharts-seat seat-cell" style="cursor: none;pointer-events: none">' + (j + 1) + '</div>\n'
                                    $("#roomSeats").append(eachSeatText);
                                    break;
                                case '_':
                                    eachSeatText = '<div id="seat-col-' + i + '-' + j + '" row="' + i + '" col="' + j + '" class="seat-null seatCharts-seat seat-cell" style="pointer-events: none">' + (j + 1) + '</div>\n'
                                    $("#roomSeats").append(eachSeatText);
                                    break;
                            }

                            // eachSeatText = '<div id="seat-col-' + i + '-' + j + '" class="seat-available seatCharts-seat seat-cell">' + (j+1) + '</div>\n'
                            // $("#seats").append(eachSeatText);
                        }
                        eachSeatText = '</div>\n';
                        $("#roomSeats").append(eachSeatText);
                    }
                    $("#roomName").text("名称：" + room.roomName);
                    $("#roomRow").text("排数：" + room.roomRow);
                    $("#roomCol").text("列数：" + room.roomCol)
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        });
    });
</script>

<%-- 修改详情 渲染可供修改的座位布局 --%>
<script>
    $(document).ready(function () {
        $("a[id^='layout-edit-']").on("click", function (e) {               // 监听layout-detail-开头的id的控件
            let roomId = $(e.target).attr("roomId");                        // 并获取此控件
            $.ajax({
                url: "layout_detail?roomId=" + roomId,
                async: false,
                data: {
                    "roomId": roomId,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    var room = data["room"];
                    $("#roomSeatsEdit").empty();
                    let row = room.roomRow;
                    let col = room.roomCol;
                    let layout = room.layout;
                    var eachSeatText = '';
                    for (var i = 0; i < row; i++) {                        // 每一行
                        eachSeatText = '<div class="seat-row" id="seat-row-' + i + '">\n';
                        $("#roomSeatsEdit").append(eachSeatText);
                        for (var j = 0; j < col; j++) {
                            if (j == 0) {                                // 标记列      渲染排的序号
                                eachSeatText = '<div id="seat-tag-' + i + '" class="seat-available seatCharts-seat seat-cell" style="color: black;background-color: #fff">' + (i + 1) + '</div>\n'
                                $("#roomSeatsEdit").append(eachSeatText);
                            }
                            switch (layout.charAt(((i * col) + j))) {      // 单个位置
                                case 'a':
                                    eachSeatText = '<div id="seat-col-edit-' + i + '-' + j + '" row="' + i + '" col="' + j + '" class="seat-available seatCharts-seat seat-cell" >' + (j + 1) + '</div>\n'
                                    $("#roomSeatsEdit").append(eachSeatText);
                                    break;
                                case '_':
                                    eachSeatText = '<div id="seat-col-edit-' + i + '-' + j + '" row="' + i + '" col="' + j + '" class="seat-null seatCharts-seat seat-cell">' + (j + 1) + '</div>\n'
                                    $("#roomSeatsEdit").append(eachSeatText);
                                    break;
                            }
                        }
                        eachSeatText = '</div>\n';
                        $("#roomSeats").append(eachSeatText);
                    }
                    $("#roomNameEdit").val(room.roomName);
                    $("#roomRowEdit").val(room.roomRow);
                    $("#roomColEdit").val(room.roomCol);
                    $("#roomId").attr("roomId",roomId);                 // 用于后续获取 被修改的room的roomId
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        });
    });
</script>

<%-- 根据输入框内的值 刷新布局区域座位 --%>
<script>
    function resetLayoutEdit(){
        let row = $("#roomRowEdit").val();
        let col = $("#roomColEdit").val();
        let eachSeatText = '';
        if (row > 15 || row <= 0 || col > 15 || col <= 0){          // 非法输入 座位大小不在范围内
            alert("定义长度不合法，请重新设置。");
        }else{                                              // 合理区间 可以刷新布局
            $("#roomSeatsEdit").empty();
            for (let i = 0; i < row; i++) {                        // 每一行
                eachSeatText = '<div class="seat-row" id="seat-row-' + i + '">\n';
                $("#roomSeatsEdit").append(eachSeatText);
                for (let j = 0; j < col; j++) {
                    if (j == 0) {                                // 标记列      渲染排的序号
                        eachSeatText = '<div id="seat-tag-' + i + '" class="seat-available seatCharts-seat seat-cell" style="color: black;background-color: #fff">' + (i + 1) + '</div>\n'
                        $("#roomSeatsEdit").append(eachSeatText);
                    }
                    eachSeatText = '<div id="seat-col-edit-' + i + '-' + j + '" row="' + i + '" col="' + j + '" class="seat-available seatCharts-seat seat-cell" >' + (j + 1) + '</div>\n'
                    $("#roomSeatsEdit").append(eachSeatText);
                }
                eachSeatText = '</div>\n';
                $("#roomSeats").append(eachSeatText);
            }
        }
    }

    function resetLayoutAdd(){
        let row = $("#roomRowAdd").val();
        let col = $("#roomColAdd").val();
        let eachSeatText = '';
        if (row > 15 || row <= 0 || col > 15 || col <= 0){          // 非法输入 座位大小不在范围内
            alert("定义长度不合法，请重新设置。");
        }else{                                              // 合理区间 可以刷新布局
            $("#roomSeatsAdd").empty();
            for (let i = 0; i < row; i++) {                        // 每一行
                eachSeatText = '<div class="seat-row" id="seat-row-' + i + '">\n';
                $("#roomSeatsAdd").append(eachSeatText);
                for (let j = 0; j < col; j++) {
                    if (j == 0) {                                // 标记列      渲染排的序号
                        eachSeatText = '<div id="seat-tag-' + i + '" class="seat-available seatCharts-seat seat-cell" style="color: black;background-color: #fff">' + (i + 1) + '</div>\n'
                        $("#roomSeatsAdd").append(eachSeatText);
                    }
                    eachSeatText = '<div id="seat-col-add-' + i + '-' + j + '" row="' + i + '" col="' + j + '" class="seat-available seatCharts-seat seat-cell" >' + (j + 1) + '</div>\n'
                    $("#roomSeatsAdd").append(eachSeatText);
                }
            }
        }
    }
</script>

<%-- 基本鼠标事件 --%>
<script>
    // 在不修改右下方的批量修改按钮的id的前提下，暂不能用"seat-col-"简化。

    $(document).ready(function(){               // 修改 内容框的座位事件
        $('body').on('click', "div[id^='seat-col-edit-']", function () {    // 单击事件
            let hasSelectedClass = $(this).hasClass('seat-selected');       // 是否已被选择
            let hasAvailableClass = $(this).hasClass('seat-available');     // 是否可用
            let hasNullClass = $(this).hasClass('seat-null');               // 是否鼠标在上方
            if (hasNullClass || hasAvailableClass) {                        // 本就为可用状态
                $(this).removeClass('seat-null');
                $(this).removeClass('seat-available');
                $(this).addClass('seat-selected');
            }else if (hasSelectedClass) {                                   // 已为不可用状态
                $(this).removeClass('seat-selected');
                $(this).addClass('seat-available');
            }
        });
    });

    $(document).ready(function(){               // 新增 内容框的座位事件
        $('body').on('click', "div[id^='seat-col-add-']", function () {     // 单击事件
            let hasSelectedClass = $(this).hasClass('seat-selected');       // 是否已被选择
            let hasAvailableClass = $(this).hasClass('seat-available');     // 是否可用
            let hasNullClass = $(this).hasClass('seat-null');               // 是否鼠标在上方
            if (hasNullClass || hasAvailableClass) {                        // 本就为可用状态
                $(this).removeClass('seat-null');
                $(this).removeClass('seat-available');
                $(this).addClass('seat-selected');
            }else if (hasSelectedClass) {                                   // 已为不可用状态
                $(this).removeClass('seat-selected');
                $(this).addClass('seat-available');
            }
        });
    });
</script>

<%-- 鼠标点击样式选项后 修改所有选中的作为的样式 --%>
<script>
    function seatToAvailable(type){
        if (type == 'edit'){
            $("div[id^='seat-col-edit-']").each(function (){
                if ($(this).hasClass('seat-selected')){              // 如果是被选中的 才需要更改
                    $(this).removeClass('seat-selected');
                    $(this).addClass('seat-available');
                }
            });
        }
        else if (type == 'add'){
            $("div[id^='seat-col-add-']").each(function (){
                if ($(this).hasClass('seat-selected')){              // 如果是被选中的 才需要更改
                    $(this).removeClass('seat-selected');
                    $(this).addClass('seat-available');
                }
            });
        }
    }
    function seatToNull(type){
        if (type == 'edit'){
            $("div[id^='seat-col-edit-']").each(function (){
                if ($(this).hasClass('seat-selected')){              // 如果是被选中的 才需要更改
                    $(this).removeClass('seat-selected');
                    $(this).addClass('seat-null');
                }
            });
        }
        else if (type == 'add'){
            $("div[id^='seat-col-add-']").each(function (){
                if ($(this).hasClass('seat-selected')){              // 如果是被选中的 才需要更改
                    $(this).removeClass('seat-selected');
                    $(this).addClass('seat-null');
                }
            });
        }

    }
</script>

<%-- 提交修改后的布局 --%>
<script>
    function submitNewSeatsEdit(){
        let roomId = $("#roomId").attr("roomId");       // 获取当前将要修改的room的roomId
        let roomName =$("#roomNameEdit").val();         // 获取当前将要修改的room的roomName
        let roomRow =$("#roomRowEdit").val();           // 获取当前将要修改的room的roomRow
        let roomCol =$("#roomColEdit").val();           // 获取当前将要修改的room的roomCol
        let newSeats = '';

        // 根据座位区的不同座位的各自样式 解析出代表布局的字符串
        $("div[id^='seat-col-edit-']").each(function (){
            if ($(this).hasClass('seat-null')){
                newSeats += '_';
            }
            else if ($(this).hasClass('seat-available')){
                newSeats += 'a';
            }
        });
        // 将更新内容返回给后台
        $.ajax({
            url: "submit_update_room?roomId=" + roomId,
            async: false,
            data: {
                "roomName": roomName,
                "roomRow": roomRow,
                "roomCol": roomCol,
                "newSeats": newSeats,
            },
            type: "POST",
            dataType: "json",
            // contentType : "application/json;charset=UTF-8",
            success: function (data) {
                window.location = "/cinema_admin/room_list?cinemaId=" + ${cinema.cinemaId};
            },
            error: function () {
                alert("ajax请求错误");
            }
        });
    }

    function submitNewSeatsAdd(){
        let roomName =$("#roomNameAdd").val();         // 获取当前将要新增的room的roomName
        let roomRow =$("#roomRowAdd").val();           // 获取当前将要新增的room的roomRow
        let roomCol =$("#roomColAdd").val();           // 获取当前将要新增的room的roomCol
        let newSeats = '';
        console.log(roomName);
        // 根据座位区的不同座位的各自样式 解析出代表布局的字符串
        $("div[id^='seat-col-add-']").each(function (){
            // console.log($(this).attr("class").split('&nbsp;'));
            if ($(this).hasClass('seat-available')){
                newSeats += 'a';
            }
            else {
                newSeats += '_';
            }
            // 不知道这个判断方法为什么在这里不行 而修改部分这样写是可以的
            // else if($(this).hasClass('seat-null')){
            //     newSeats += '_';
            // }
        });
        console.log(newSeats);
        // 将更新内容返回给后台
        $.ajax({
            url: "add_room?cinemaId=" + ${cinema.cinemaId},
            async: false,
            data: {
                "roomName": roomName,
                "roomRow": roomRow,
                "roomCol": roomCol,
                "newSeats": newSeats,
            },
            type: "POST",
            dataType: "json",
            // contentType : "application/json;charset=UTF-8",
            success: function (data) {
                window.location = "/cinema_admin/room_list?cinemaId=" + ${cinema.cinemaId};
            },
            error: function () {
                alert("ajax请求错误");
            }
        });
    }
</script>
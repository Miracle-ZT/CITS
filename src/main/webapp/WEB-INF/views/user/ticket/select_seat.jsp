<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/6
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
    <link href="../../../../resources/css/seat.css" type="text/css" rel="stylesheet"/>
    <link href="../../../../resources/plugins/admin_assets/css/plugins/toastr/toastr.min.css" rel="stylesheet">
</head>
<body>
<div style="margin:100px auto;width: 1400px;margin-top: 0px">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
</div>
<%--<div id="seat-demo" class="seat-available seatCharts-seat">5</div>--%>

<div id="content-area">
    <div class="scope">
        <div class="seat-title">${cinema.name} ----- ${screening.room.roomName}
            <br>
            <div style="font-size: 16px">(${screening.cinema.address})</div>
        </div>
        <div class="row">
            <div class="col-8 seat-scope">
                <div class="screen align-items-center">屏幕</div>
                <div id="seats" class="seat">
                    <%--                <div class="seat-row" id="seat-row-1">--%>
                    <%--                    <div class="seat-available seatCharts-seat tag">1</div>--%>
                    <%--                </div>--%>
                </div>
            </div>
            <div class="col-4 info-scope">
                <div class="row">
                    <div class="col-4">
                        <div class="ticket-info-name">电影：</div>
                        <div class="ticket-info-name">语言：</div>
                        <div class="ticket-info-name">时间：</div>
                        <div class="ticket-info-name">票价：</div>
                        <div class="ticket-info-name">票数：</div>
                        <div class="ticket-info-name">总计：</div>
                    </div>
                    <div class="col-8">
                        <div class="ticket-info-content" style="width: 165px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">${screening.movie.chineseName}</div>
                        <div class="ticket-info-content">${screening.language.lanName}</div>
                        <div class="ticket-info-content">
                            <fmt:formatDate value="${screening.startTime}" pattern="MM-dd"/>
                            &nbsp;
                            <fmt:formatDate value="${screening.startTime}" pattern="HH:mm"/>
                            ~
                            <fmt:formatDate value="${screening.endTime}" pattern="HH:mm"/>
                        </div>
                        <div class="ticket-info-content">￥${screening.price}/张</div>
                        <div id="ticket_cnt" class="ticket-info-content">0张</div>
                        <div id="total_price" class="ticket-info-content">￥ 0</div>
                    </div>
                </div>
                <div style="margin-left: 45px;padding: 10px">
                    <button id="ack-select-button" onclick="ack_button()" type="button" class="btn btn-outline-primary disabled" style="width: 145px;border-radius: 30px">确认选座</button>
                </div>
                <div id="selected-seats">
                    <%-- 已选的座位的汇总区 --%>
                </div>
                <div class="row" style="margin-top: 100px">             <%-- 示例图 --%>
                    <div class="col-6">
                        <div id="seat-col-sample-available" class="seat-available seatCharts-seat seat-cell"></div><h7 style="margin-left: 5px;line-height: 30px">可选座</h7>
                    </div>
                    <div class="col-6">
                        <div id="seat-col-sample-sold" class="seat-sold seatCharts-seat seat-cell"></div><h7 style="margin-left: 5px;line-height: 30px">已售出</h7>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- jquery --%>
<script src="../../../../resources/js/jquery-3.6.3.js"></script>

<%-- 渲染座位 --%>
<script>
    cnt = 0;            // 全局变量 已选中的cnt;
    let price = ${screening.price};     // 这个场次的price是不变的 和下方点击事件中的price一致 无需多一个全局变量
    $(document).ready(function(){
        var row = ${row};
        var col = ${col};
        var seat_str = '${seat_str}';
        var eachSeatText = '';
        var oldSeatStr = '${old_seat_str}';
        for (var i = 0;i < row;i++){                        // 每一行
            eachSeatText = '<div class="seat-row" id="seat-row-' + i + '">\n';
            $("#seats").append(eachSeatText);
            for (var j = 0;j < col;j++){
                if (j == 0){                                // 标记列      渲染排的序号
                    eachSeatText = '<div id="seat-tag-' + i + '" class="seatCharts-seat tag">' + (i+1) + '</div>\n'
                    $("#seats").append(eachSeatText);
                }
                if (oldSeatStr != "" && oldSeatStr.charAt(((i*col)+j)) == 'o'){        // 用户已锁定的座位 直接渲染 不走下面的判断
                    eachSeatText = '<div id="seat-col-' + i + '-' + j + '" row="' + i + '" col="' + j + '" class="seat-selected seatCharts-seat seat-cell">' + (j+1) + '</div>\n'
                    $("#seats").append(eachSeatText);

                    // 统计区的数据
                    cnt++;
                    $("#ticket_cnt").text(cnt+"张");         // 更新“票数”统计
                    $("#total_price").text("￥" + (cnt*price));         // 更新“总价”统计
                    let eachSelectedSeatText = '                <div id="selected-seats-' + i + '-' + j + '" class="selected-seats" row="' + i + '" col="' + j + '">\n' +
                        (+i+1) + '排' + (+j+1) + '座\n' +
                        '                </div>';
                    $("#selected-seats").append(eachSelectedSeatText);
                    // 走到这里 说明至少有一个位置已选中 '确认选座'按钮应可点击
                    $("#ack-select-button").removeClass("disabled");
                    continue;
                }
                switch (seat_str.charAt(((i*col)+j))){      // 单个位置
                    case 'a':
                        eachSeatText = '<div id="seat-col-' + i + '-' + j + '" row="' + i + '" col="' + j + '" class="seat-available seatCharts-seat seat-cell">' + (j+1) + '</div>\n'
                        $("#seats").append(eachSeatText);
                        break;
                    case '_':
                        eachSeatText = '<div id="seat-col-' + i + '-' + j + '" row="' + i + '" col="' + j + '" class="seat-empty seatCharts-seat seat-cell">' + (j+1) + '</div>\n'
                        $("#seats").append(eachSeatText);
                        break;
                    case 's':
                        eachSeatText = '<div id="seat-col-' + i + '-' + j + '" row="' + i + '" col="' + j + '" class="seat-sold seatCharts-seat seat-cell">' + (j+1) + '</div>\n'
                        $("#seats").append(eachSeatText);
                        break;
                }
                // eachSeatText = '<div id="seat-col-' + i + '-' + j + '" class="seat-available seatCharts-seat seat-cell">' + (j+1) + '</div>\n'
                // $("#seats").append(eachSeatText);
            }
            eachSeatText = '</div>\n';
            $("#seats").append(eachSeatText);
        }
    });
</script>

<%-- 座位点击事件 --%>
<script>
    $(document).ready(function(){
        let price = ${screening.price}
        // var cnt = 0             // 已选票数      -- 修改为全局变量
        var max_cnt = 5;        // 最大同时座位选择数
        var eachSelectedSeatText = '';      // 已选座位的信息
        $('body').on('mouseenter', "div[id^='seat-col-']", function() {          // 鼠标光标经过
            if ($(this).hasClass('seat-available')){             // 若为可用状态
                $(this).removeClass('seat-available');
                $(this).addClass('seat-up');
            }
        });
        $('body').on('mouseleave', "div[id^='seat-col-']", function () {          // 鼠标光标离开
            if ($(this).hasClass('seat-up')) {
                $(this).removeClass('seat-up');
                $(this).addClass('seat-available');
            }
        });
        $('body').on('click', "div[id^='seat-col-']", function () {         // 单击事件
            var hasUpClass = $(this).hasClass('seat-up');                   // 是否鼠标在上方
            var hasSelectedClass = $(this).hasClass('seat-selected');       // 是否已被选择
            var hasAvailableClass = $(this).hasClass('seat-available');     // 是否可用
            var temp_row = $(this).attr("row");                     // 当前控件的row
            var temp_col = $(this).attr("col");                     // 当前控件的col
            if (hasUpClass) {                       // 本就为可用状态
                if (cnt < max_cnt){                             // 未满票数限制
                    $(this).removeClass('seat-up');
                    $(this).addClass('seat-selected');
                    cnt++;
                    $("#ticket_cnt").text(cnt+"张");         // 更新“票数”统计
                    $("#total_price").text("￥" + (cnt*price));         // 更新“总价”统计
                    // 添加已选座位的汇总
                    // +temp_row+1 在temp_row前加上'+' 将其转换为数值 进行后续的数值运算 而不是字符串拼接
                    eachSelectedSeatText = '                <div id="selected-seats-' + temp_row + '-' + temp_col + '" class="selected-seats" row="' + temp_row + '" col="' + temp_col + '">\n' +
                    (+temp_row+1) + '排' + (+temp_col+1) + '座\n' +
                    '                </div>';
                    $("#selected-seats").append(eachSelectedSeatText);
                }
                else {
                    alert("最多同时购买" + max_cnt + "张票");
                }
            }else if (hasAvailableClass) {         // 可用状态
                if (cnt < max_cnt){
                    $(this).removeClass('seat-available');
                    $(this).addClass('seat-selected');
                    cnt++;
                    $("#ticket_cnt").text(cnt+"张");         // 更新“票数”统计
                    $("#total_price").text("￥" + (cnt*price));         // 更新“总价”统计
                    eachSelectedSeatText = '                <div id="selected-seats-' + temp_row + '-' + temp_col + '" class="selected-seats" row="' + temp_row + '" col="' + temp_col + '">\n' +
                        (+temp_row+1) + '排' + (+temp_col+1) + '座\n' +
                        '                </div>';
                    $("#selected-seats").append(eachSelectedSeatText);
                }
                else {
                    alert("最多同时购买" + max_cnt + "张票");
                }
            }else if (hasSelectedClass) {          // 已为不可用状态
                $(this).removeClass('seat-selected');
                $(this).addClass('seat-available');
                cnt--;
                $("#ticket_cnt").text(cnt+"张");         // 更新“票数”统计
                $("#total_price").text("￥" + (cnt*price));         // 更新“总价”统计
                $("#selected-seats-" + temp_row + "-" + temp_col).remove();     // 移除预选座位区的对应元素
            }

            if (cnt == 1){                          // 若至少选中一个位置 则确认选择的按钮可单击
                $("#ack-select-button").removeClass("disabled");
            }
            else if (cnt == 0){                     // 若未选中位置 则确认选择的按钮禁用
                $("#ack-select-button").addClass("disabled");
            }
        });
    });
</script>

<%-- 确认按钮点击事件 --%>
<script>
    function ack_button(){
        let SeatsArray = new Array();
        $("div[id^='selected-seats-']").each(function (){           // 获取汇总区的seat的信息 遍历
            let temp_row = $(this).attr("row");
            let temp_col = $(this).attr("col");

            // 由于是从上至下渲染的
            let seat_num = (temp_row*(+${col}) + (+temp_col));
            SeatsArray.push(seat_num);                          // 得到座位号列表
        });
        // console.log(SeatsArray);
        let screeningId = ${screening.screeningId};

        $.ajax({
            url: "/home/order/checkSeats",
            traditional: true,
            data: {
                "screeningId": screeningId,
                "SeatsArray": SeatsArray,
            },
            type: "POST",
            dataType: "json",
            // contentType : "application/json;charset=UTF-8",
            success: function (data) {
                let msg = data['msg'];
                console.log(msg);
                // 位置暂时不冲突
                if (msg == 'success'){
                    let allSeatsJoin = '';
                    for (let i = 0;i < SeatsArray.length;i++){                  // 拼接GET参数的文本
                        allSeatsJoin += "&seat" + i + "=" + SeatsArray[i];
                    }
                    console.log(allSeatsJoin);
                    // 跳转确认订单界面
                    var getParamText = '/home/order/ack_order?screeningId=' + screeningId + allSeatsJoin;
                    console.log(getParamText);
                    window.location = getParamText;                      // 跳转后端
                }
                // 位置已冲突
                else if (msg == 'error'){
                    // 刷新座位页面并置提醒位为1
                    var getParamText = '/home/order/select_seat?cinemaId=${cinema.cinemaId}&movieId=${movie.movieId}&screeningId=' + screeningId + '&isRefresh=1';
                    console.log(getParamText);
                    window.location = getParamText;                      // 跳转后端
                }
            },
            error: function () {
                alert("ajax请求错误");
            }
        });




        <%--var map = {--%>
        <%--    "SeatsArray":JSON.stringify(SeatsArray),--%>
        <%--    "screeningId":JSON.stringify(${screening.screeningId}),--%>
        <%--};--%>
        <%--$.ajax({--%>
        <%--    url:"ack_order",--%>
        <%--    async:false,--%>
        <%--    data:JSON.stringify(map),--%>
        <%--    type:"POST",--%>
        <%--    dataType:"json",--%>
        <%--    contentType : "application/json;charset=UTF-8",--%>
        <%--    success:function (data){--%>
        <%--        &lt;%&ndash;let include_file = '<jsp:include page="submit_order.jsp" flush="true"/>';&ndash;%&gt;--%>
        <%--        // $("#content-area").empty();--%>
        <%--        // $("#content-area").append(include_file);--%>
        <%--        var screeningId = data["screeningId"];--%>
        <%--        var newSeats = data["newSeats"];--%>
        <%--        // console.log(screeningId);--%>
        <%--        // console.log(newSeats);--%>

        <%--        // $("#content-area").load("submit_order?screeningId=" + screeningId + "&newSeats=" + newSeats + "&SeatsNumList=" +SeatsNumList);--%>

        <%--        // 渲染提交订单并支付的布局--%>
        <%--        // var submitOrderText =--%>
        <%--        &lt;%&ndash;    '<div class="scope" style="width: 800px">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '    <div class="title">提交订单</div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '    <div class="row">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '        <div class="col-5" style="border-right: 1px solid #d3d3d3">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '            <img src="../../../../resources/upload/movie/Ping-pong%20of%20China.png"\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                 class="mx-auto d-block border-white border border-3"\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                 style="width: 232px;height: 322px;margin: 40px 40px 10px 40px">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '            <div style="margin-left: auto;margin-right: auto;line-height: 25px;font-size: 20px;color: #666;text-align: center">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                ${movie.chineseName}\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '            </div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '        </div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '        <div class="col-7" style="font-size: 20px;color: #666">             &lt;%&ndash; 订单右边的文字信息 &ndash;%&gt;\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '            <div style="margin: 40px;">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                <div style="margin: 5px">2019-08-23</div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                <div style="font-size: 35px;margin: 5px">21:35~23:25</div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                <div style="margin: 5px">国语3D &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1张</div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                <div class="row" style="margin-top: 30px">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                    <div class="col-5">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                        <div style="margin: 5px;">4号厅</div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                    </div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                    <div class="col-7">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                        <div style="margin: 5px;float:left;">4排3座</div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                        <div style="margin: 5px;">|&nbsp;4排4座</div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                    </div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                </div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                <div style="float:left;height: 40px;width: 200px;margin: 5px;margin-top: 80px">总计：xx.xx元</div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                <div style="margin: 5px;margin-top: 80px">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                    <a href="/">\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                        <button id="submit-order-button" type="button" class="btn btn-outline-primary"\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                                style="width: 145px;border-radius: 30px">确认支付\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                        </button>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                    </a>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                    <div style="font-size: 15px;margin-top: 5px">手机号码:150*****527</div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '                </div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '            </div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '        </div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '    </div>\n' +&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    '</div>\n';&ndash;%&gt;--%>
        <%--        &lt;%&ndash;$("#content-area").append(submitOrderText);&ndash;%&gt;--%>
        <%--    },--%>
        <%--    error:function (){--%>
        <%--        alert("ajax请求错误");--%>
        <%--    }--%>
        <%--});--%>
    }
</script>

<%-- 判断是否为发生选座冲突 若是则要显示toast提示用户 --%>
<script>
    $(document).ready(function () {
        let isRefresh = ${isRefresh};
        if (isRefresh == 1){
            toastr.warning("晚了一步！所选座位已被购买，请重新选座。");
        }
    });
</script>


<script src="../../../../resources/plugins/admin_assets/js/plugins/toastr/toastr.min.js"></script>
</body>
</html>
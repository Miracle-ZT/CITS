<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/10
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
    <link href="../../../../resources/css/seat.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div style="margin:100px auto;width: 1400px;margin-top: 0px">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
</div>

<div id="content-area">
    <div class="scope" style="width: 800px">
        <div class="seat-title">${screening.cinema.name}
            <small style="font-size: 20px">(${screening.cinema.address})</small>
        </div>
        <div class="row">
            <div class="col-5" style="border-right: 1px solid #d3d3d3">
                <img src="../../../..${screening.movie.imgUrl}"
                     class="mx-auto d-block border-white border border-3"
                     style="width: 232px;height: 322px;margin: 40px 40px 10px 40px">
                <div style="margin-left: auto;margin-right: auto;line-height: 25px;font-size: 20px;color: #666;text-align: center">
                    ${screening.movie.chineseName}
                </div>
                <div style="color: #666;text-align: center">(${screening.language.lanName})</div>
            </div>
            <div class="col-7" style="font-size: 20px;color: #666">             <%-- 订单右边的文字信息 --%>
                <div style="margin: 40px;">
                    <div style="margin: 5px">                   <%-- 直接将JavaBean的时间 在前端格式化 --%>
                        <fmt:formatDate value="${screening.startTime}" pattern="yyyy-MM-dd"/>
                    </div>
                    <div style="font-size: 35px;margin: 5px">
                        <fmt:formatDate value="${screening.startTime}" pattern="HH:mm"/>
                        ~
                        <fmt:formatDate value="${screening.endTime}" pattern="HH:mm"/>
                    </div>
                    <div style="margin: 5px">${screening.language.lanName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${SeatsNumList.size()}张</div>
                    <div class="row" style="margin-top: 30px">
                        <div class="col-5">
                            <div style="margin: 5px;">${screening.room.roomName}</div>
                        </div>
                        <div class="col-7" >
                            <div class="row text-center" style="margin: 5px">
                                <div id="seatInfo-0" class="col-6" style="border-right: 1px solid #d3d3d3">
<%--                                    <div>2排3座</div>--%>
                                </div>
                                <div id="seatInfo-1" class="col-6">
<%--                                    <div>2排3座</div>--%>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div id="price" style="float:left;height: 40px;width: 200px;margin: 5px;margin-top: 80px"></div>
                    <div style="margin: 5px;margin-top: 80px">
                        <a id="submit-order" href="">
                            <button id="submit-order-button" type="button" class="btn btn-outline-primary"
                                    style="width: 145px;border-radius: 30px">确认支付
                            </button>
                        </a>
                        <div id="user-phone" style="font-size: 15px;margin-top: 5px"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- jquery --%>
<script src="../../../../resources/js/jquery-3.6.3.js"></script>

<%-- 渲染预订单中的座位信息 --%>
<script>
    $(document).ready(function(){
        var SeatsArray = ${SeatsNumList};               // 数字的位置数组 -- 得到座位号的数值以及座位个数(票数)
        var SeatsInfoText = new Array();                // 中文文本的位置数组 --- 最后加载显示的
        // 根据座位号 计算座位行列
        let row = ${screening.room.roomRow};
        let col = ${screening.room.roomCol};
        for (let i = 0;i < SeatsArray.length;i++){
            let temp_row = Math.floor((SeatsArray[i]/col)+1);
            let temp_col = Math.floor((SeatsArray[i]%col)+1);
            SeatsInfoText.push(temp_row + "排" + temp_col + "座");
        }
        // console.log(SeatsInfoText);
        // 渲染预订单中的座位信息
        for (let i = 0;i < SeatsInfoText.length;i++){
            // 根据奇偶数 轮流添加文本至 左右两个小文本显示区
            if (i%2 == 0){
                $("#seatInfo-0").append('<div>' + SeatsInfoText[i] + '</div>');
            }
            else if (i%2 == 1){
                $("#seatInfo-1").append('<div>' + SeatsInfoText[i] + '</div>');
            }
        }
    });
</script>

<%-- 根据单价和票数计算总价 --%>
<script>
    $(document).ready(function(){
        let price = '总计：' + (+${screening.price}*${SeatsNumList.size()}) + '元'
        $("#price").text(price);
    });
</script>

<%-- 格式化用户电话号码 --%>
<script>
    $(document).ready(function(){
        var user_phone = ${logined_user.phone};
        user_phone = user_phone.toString().substring(0,3) + '*****' + user_phone.toString().substring(8,user_phone.length);
        $("#user-phone").text("手机号码:" + user_phone);
    });
</script>

<%-- 拼接传递参数 设置提交按钮跳转链接 --%>
<script>
    $(document).ready(function(){
        let SeatsArray = ${SeatsNumList};
        let completeUrl = '/home/order/submit_order?screeningId=' + ${screening.screeningId} ;
        for (let i = 0;i < SeatsArray.length;i++){                  // 拼接GET参数的文本
            completeUrl += "&seat" + i + "=" + SeatsArray[i];
        }
        $("#submit-order").attr("href",completeUrl);
    });
</script>
</body>
</html>
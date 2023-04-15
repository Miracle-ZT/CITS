<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/17
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--content--%>

<div class="row">
    <div class="col-sm-8 col-6">
        <h4 class="page-title">订单列表</h4>
    </div>
    <div class="col-sm-4 col-6 text-right m-b-30">
<%--        <a href="add-leave.html" class="btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> </a>--%>
    </div>
</div>
<div class="row filter-row">
    <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">
        <div class="form-group form-focus">
            <label class="focus-label">订单编号</label>
            <input id="order-num" type="text" class="form-control floating">
        </div>
    </div>
    <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">
        <div class="form-group form-focus">
            <label class="focus-label">用户名</label>
            <input id="order-username" type="text" class="form-control floating">
        </div>
    </div>
    <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">
        <div class="form-group form-focus select-focus">
            <label class="focus-label">订单状态</label>
            <select id="order-status" class="select floating">
                <option value="-1"> -- --</option>
                <option value="0"> 未支付</option>
                <option value="1"> 已支付</option>
                <option value="2"> 已完成</option>
                <option value="3"> 已退款</option>
            </select>
        </div>
    </div>
    <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">
        <div class="form-group form-focus">
            <label class="focus-label">从</label>
            <div class="cal-icon">
                <input id="order-from" class="form-control floating datetimepicker" type="text">
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">
        <div class="form-group form-focus">
            <label class="focus-label">至</label>
            <div class="cal-icon">
                <input id="order-to" class="form-control floating datetimepicker" type="text">
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">
        <a id="order-search" class="btn btn-success btn-block text-white"> 搜 索 </a>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-striped custom-table mb-0 datatable">
                <thead>
                <tr>
                    <th>用户</th>
                    <th>订单编号</th>
                    <th>订单状态</th>
                    <th>座位数</th>
                    <th>支付金额</th>
                    <th>创建时间</th>
                    <th class="text-right">操作</th>
                </tr>
                </thead>
                <tbody id="ordersList">
                <c:forEach var="orders" items="${ordersList}" varStatus="status">
                    <tr>
                        <td>
                            <a href="profile.html" class="avatar">${orders.user.username.substring(0,1)}</a>
                            <h2><a> ${orders.user.username}</a></h2>
                        </td>
                        <td>${orders.orderNum}</td>
                        <td>
                            <c:if test="${orders.status == 0}">
                                <span class="custom-badge status-grey">未支付</span>
                            </c:if>
                            <c:if test="${orders.status == 1}">
                                <span class="custom-badge status-green">已支付</span>
                            </c:if>
                            <c:if test="${orders.status == 2}">
                                <span class="custom-badge status-orange">已完成</span>
                            </c:if>
                            <c:if test="${orders.status == 3}">
                                <span class="custom-badge status-red">已退款</span>
                            </c:if>
                        </td>
                        <td id="seat-cnt-${orders.orderId}" seatNums="${orders.seatNums}"></td>
                        <td>${orders.totalPrice}</td>
                        <td>
                            <fmt:formatDate value="${orders.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td class="text-right">
                            <div class="dropdown dropdown-action">
                                <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown"
                                   aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="edit-leave.html"><i class="fa fa-pencil m-r-5"></i>编辑</a>
                                    <a class="dropdown-item" href="#" title="Decline" data-toggle="modal" data-target="#delete_approve"><i class="fa fa-trash-o m-r-5"></i> 删除</a>
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

<script src="../../../resources/js/jquery-3.6.3.js"></script>

<%-- 根据订单的座位字段的字符串 得到订单包含的座位数 --%>
<script>
    $(document).ready(function () {
        $("td[id^='seat-cnt-']").each(function () {
            let seatNums = $(this).attr("seatNums");
            let len = 0;
            for (let i = 0; i < seatNums.length; i++) {
                if (seatNums.charAt(i) == 1) {
                    len++;
                }
            }
            $(this).text(len);
        });
    })
</script>

<%-- 获取搜索的各个条件值 传入后台 得到新的orderList 传入前台 刷新 --%>
<script>
    $(document).ready(function(){
        $('body').on('click', "#order-search", function() {
            let order_num = $("#order-num").val();
            let order_status = $("#order-status").val();
            let order_username = $("#order-username").val();
            let order_from = $("#order-from").val();
            let order_to = $("#order-to").val();
            // console.log("order_to = " + order_to);
            // console.log("order_from = " + order_from);
            // console.log("order_status = " + order_status);
            // console.log("order_username = " + order_username);
            // console.log("order_num = " + order_num);

            $.ajax({
                url:"refresh_order_list?cinemaId=${cinema.cinemaId}",
                async:false,
                data:{
                    "order_num":order_num,
                    "order_username":order_username,
                    "order_status":order_status,
                    "order_from":order_from,
                    "order_to":order_to,
                },
                type:"POST",
                dataType:"json",
                // contentType : "application/json;charset=UTF-8",
                success:function (data){
                    var ordersList = data["ordersList"];
                    $("#ordersList").empty();
                    if (ordersList.length > 0){
                        for (let i = 0;i < ordersList.length;i++){
                            // 在JavaScript中不能直接通过append更新后生效的jstl或js效果 再次计算得出 十分冗余
                            let statusText = '';
                            let createTime = transferTime(ordersList[i].createTime);
                            let seatNums = getNumOfSeats(ordersList[i].seatNums);
                            if (ordersList[i].status == "0"){
                                statusText = '                                <span class="custom-badge status-grey">未支付</span>\n';
                            }
                            else if (ordersList[i].status == "1"){
                                statusText = '                                <span class="custom-badge status-green">已支付</span>\n';
                            }
                            else if (ordersList[i].status == "2"){
                                statusText = '                                <span class="custom-badge status-orange">已完成</span>\n';
                            }
                            else if (ordersList[i].status == "3"){
                                statusText = '                                <span class="custom-badge status-red">已退款</span>\n';
                            }
                            let eachText =
                                '                    <tr>\n' +
                                '                        <td>\n' +
                                '                            <a href="profile.html" class="avatar">' + ordersList[0].user.username.substring(0,1) + '</a>\n' +
                                '                            <h2><a> ' + ordersList[i].user.username + '</a></h2>\n' +
                                '                        </td>\n' +
                                '                        <td>' + ordersList[i].orderNum + '</td>\n' +
                                '                        <td>\n' +
                                statusText +
                                '                        </td>\n' +
                                '                        <td id="seat-cnt-' + ordersList[i].orderId + '" seatNums="' + ordersList[i].seatNums + '">' + seatNums + '</td>\n' +
                                '                        <td>' + ordersList[i].totalPrice + '.0</td>\n' +
                                '                        <td>\n' +
                                createTime +
                                '                        </td>\n' +
                                '                        <td class="text-right">\n' +
                                '                            <div class="dropdown dropdown-action">\n' +
                                '                                <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown"\n' +
                                '                                   aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>\n' +
                                '                                <div class="dropdown-menu dropdown-menu-right">\n' +
                                '                                    <a class="dropdown-item" href="edit-leave.html"><i class="fa fa-pencil m-r-5"></i>编辑</a>\n' +
                                '                                    <a class="dropdown-item" href="#" title="Decline" data-toggle="modal" data-target="#delete_approve"><i class="fa fa-trash-o m-r-5"></i> 删除</a>\n' +
                                '                                </div>\n' +
                                '                            </div>\n' +
                                '                        </td>\n' +
                                '                    </tr>\n'
                            ;
                            $("#ordersList").append(eachText);
                        }
                    }else{
                        let noResultText ='无结果';
                        $("#ordersList").append(noResultText);
                    }


                    // alert("ajax请求成功");
                },
                error:function (){
                    alert("ajax请求错误");
                }
            });
        })
    });
</script>

<%-- 日期对象格式化 --%>
<script>
    function transferTime(cTime) {     //将json串的一串数字进行解析
        var jsonDate = new Date(parseInt(cTime));
        //       alert(jsonDate);
        //为Date对象添加一个新属性，主要是将解析到的时间数据转换为我们熟悉的“yyyy-MM-dd hh:mm:ss”样式
        Date.prototype.format = function(format) {
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
            if(/(y+)/.test(format)) {
                format = format.replace(RegExp.$1,    (this.getFullYear() + "") .substr(4 - RegExp.$1.length));
            }
            //连接得到的年月日 时分秒信息
            for(var k in o) {
                if(new RegExp("(" + k + ")").test(format)) {
                    format = format.replace(RegExp.$1,  RegExp.$1.length == 1 ? o[k] : ("00" + o[k]) .substr(("" + o[k]).length));
                }
            }
            return format;
        }
        var newDate = jsonDate.format("yyyy-MM-dd hh:mm:ss");
        // var newDate = jsonDate.format("hh:mm");                     // 设置时间格式
        return newDate;
    }
</script>

<%-- 根据seatNums得到本订单包含的座位数量 --%>
<script>
    function getNumOfSeats(seatNums) {
        let cnt = 0;
        for (let i = 0;i < seatNums.length;i++){
            if (seatNums.charAt(i) == "1"){
                cnt++;
            }
        }
        return cnt;
    }
</script>
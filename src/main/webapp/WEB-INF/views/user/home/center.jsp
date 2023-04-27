<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/3/6
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>个人中心</title>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
    <style>
        .divider-form{
            border-top: 1px dashed #e7eaec;
            color: #ffffff;
            background-color: #ffffff;
            height: 1px;
            margin: 15px 0;
        }
        .selected-seats {                               /* 汇总区 当前选中的座位信息块 */
            float: left;
            width: 72px;
            height: 25px;
            line-height: 25px;
            border: 1px solid #d3d3d3;
            background: #f7f7f7;
            margin: 6px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
        }
    </style>
    <link href="../../../../resources/plugins/admin_assets/css/plugins/toastr/toastr.min.css" rel="stylesheet">
</head>
<body>
<div style="width: 1400px;margin: 0px auto 100px;">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>
    <div style="padding: 100px">
        <div class="d-flex align-items-start">
            <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="padding: 10px 50px 50px 50px;min-height: 700px;box-shadow: 2px 2px 20px #d3d3d3;min-width: 200px">
                <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">基本设置</button>
                <button class="nav-link" id="v-pills-order-tab" data-bs-toggle="pill" data-bs-target="#v-pills-order" type="button" role="tab" aria-controls="v-pills-order" aria-selected="false">我的订单</button>
                <button class="nav-link" id="v-pills-collect-tab" data-bs-toggle="pill" data-bs-target="#v-pills-collect" type="button" role="tab" aria-controls="v-pills-collect" aria-selected="false">我的收藏</button>
                <button class="nav-link" id="v-pills-comment-tab" data-bs-toggle="pill" data-bs-target="#v-pills-comment" type="button" role="tab" aria-controls="v-pills-comment" aria-selected="false">我的评论</button>
            </div>
            <div class="tab-content" id="v-pills-tabContent" style="padding: 10px 50px 50px 50px;min-height: 700px;box-shadow: 2px 2px 20px #d3d3d3;min-width: 1000px"> <!-- 外框大小 -->
                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab" tabindex="0">
                    <div style="padding: 10px;font-size: 18px">
                        <h4>个人资料</h4>
                        <form action="/home/center/update_info?userId=${user.id}" method="post" enctype="multipart/form-data">
                            <div class="divider-form"></div>
                            <div class="row">
                                <div class="col-2 text-center">头像</div>
                                <div class="col-10">
                                    <div class="input-group mb-3">
                                        <img src="../../../..${user.photo}" onclick="file_photo()" id="img-selector"
                                             style="width: 70px;height: 70px;border: 1px #d3d3d3 solid;border-radius: 5px">
                                    </div>
                                    <input type="file" name="file" id="photo" onchange="show(this)" hidden>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-2 text-center">昵称</div>
                                <div class="col-10">
                                    <div class="input-group mb-3">
                                        <input type="text" name="username" class="form-control" value="${user.username}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-2 text-center">邮箱</div>
                                <div class="col-10">
                                    <div class="input-group mb-3">
                                        <input type="text" name="email-account" class="form-control" value="${user.email.split("@")[0]}">
                                        <span class="input-group-text">@</span>
                                        <input type="text" name="email-server" class="form-control" value="${user.email.split("@")[1]}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-2 text-center">密码</div>
                                <div class="col-10">
                                    <div class="input-group mb-3">
                                        <input type="password" name="password" class="form-control" value="${user.password}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-2 text-center">电话</div>
                                <div class="col-10">
                                    <div class="input-group mb-3">
                                        <input type="text" name="phone" class="form-control" value="${user.phone}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-2 text-center">性别</div>
                                <div class="col-10">
                                    <div id="sex" sex="${user.sex}">

                                    </div>
                                </div>
                            </div>
                            <div style="align-items: center;display: flex;justify-content: center">
                                <button type="submit" class="btn btn-primary" style="width: 120px">保存</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="tab-pane fade" id="v-pills-order" role="tabpanel" aria-labelledby="v-pills-order-tab" tabindex="0">
                    <div class="row" style="padding: 10px;font-size: 18px">
                        <div>
                            <div class="col-4"><h4>订单列表</h4></div>
                            <div class="col-8"></div>

                            <div class="divider-form"></div>
                            <c:forEach var="order" items="${ordersList}" varStatus="status">
                                <div class="row" style="padding: 10px;border: 1px solid #d3d3d3;border-radius: 5px">
                                    <div class="col-2">
                                        <a href="/home/movie_detail?movieId=${order.screening.movie.movieId}"><img src="../../../..${order.screening.movie.imgUrl}" style="width: 64.8px;height: 90px"></a>
                                    </div>
                                    <div class="col-4" style="height: 90px">
                                        <h6 style="line-height: 25px;font-size: 20px;font-weight: bold;
                                        width: 269px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis">
                                                ${order.screening.movie.chineseName}&nbsp;&nbsp;&nbsp;&nbsp;${order.totalNOP}张</h6>
                                        <h6 style="line-height: 25px">${order.screening.cinema.name}</h6>
                                        <small style="line-height: 25px">创建时间：<fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></small>
                                    </div>
                                    <div id="selected-seats-${order.orderId}" seatNums="${order.seatNums}"
                                         row="${order.screening.seat.row}" col="${order.screening.seat.col}"
                                         class="col-4">
<%--                                             <div class="selected-seats">3排6座</div>--%>
                                    </div>
                                    <div class="col-2" style="vertical-align:middle;display: flex;align-items: center">
<%--                                        <button class="btn btn-outline-success" onclick="open_comment_modal(${order.screening.movieId},${order.orderNum})"--%>
<%--                                                data-bs-toggle="modal" data-bs-target="#commentModal">--%>
<%--                                            评论--%>
<%--                                        </button>--%>
                                        <c:if test="${order.isCommented == 0}">
                                            <button class="btn btn-outline-success" onclick="open_comment_modal(${order.screening.movieId},'${order.orderNum}')"
                                                    data-bs-toggle="modal" data-bs-target="#commentModal">
                                                评论
                                            </button>
                                        </c:if>
                                        <c:if test="${order.isCommented == 1}">
                                            <button class="btn btn-outline-secondary" disabled>
                                                已评
                                            </button>
                                        </c:if>
                                        <button class="btn btn-outline-info"
                                                data-bs-toggle="modal" data-bs-target="#detailModal"
                                                id="btn-detail-${order.orderId}" orderId="${order.orderId}"
                                        style="margin-left: 7px">
                                            详情
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>


                <div class="tab-pane fade" id="v-pills-collect" role="tabpanel" aria-labelledby="v-pills-collect-tab" tabindex="0">我的收藏</div>
                <div class="tab-pane fade" id="v-pills-comment" role="tabpanel" aria-labelledby="v-pills-comment-tab" tabindex="0">我的评论</div>
            </div>
        </div>
    </div>
</div>




<%-- 评论弹窗 --%>
<div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="comment" action="#" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-2 text-center"
                             style="font-weight: bold;font-size: 22px;display: inline-block;vertical-align: middle">评分
                        </div>
                        <div class="col-10" style="display: flex;justify-content: space-between">
                            <input id="score" name="score" type="text" value="0" hidden>
                            <div id="star" style="display: flex;justify-content: flex-end;align-items: center">
                                <svg id="star-1" star="1" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                                <svg id="star-2" star="2" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                                <svg id="star-3" star="3" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                                <svg id="star-4" star="4" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                                <svg id="star-5" star="5" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>
                            </div>
                            <span id="score-display" style="display: flex;justify-content: flex-end;align-items: center;color: #ffc600;font-size: 20px">
                                0.0
                            </span>
                        </div>
                    </div>
                    <div style="height: 25px"></div>
                    <div>
                        <textarea id="comment-content" name="comment-content" class="form-control" rows="5" placeholder="大家都在问：剧情怎么样，画面好吗，演技如何？"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" style="width: 100px">发布</button>
                </div>
            </form>
        </div>
    </div>
</div>


<%-- 订单详情弹窗 --%>
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">订单详情</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="detail" action="#" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-7" style="border-right: 1px #d3d3d3 solid">
                            <div style="padding: 20px 20px 10px 20px">
                                <div id="cinemaName" style="font-size: 20px">影院名></div>
                                <div id="movieName" style="font-size: 30px;padding-top: 10px;">电影名</div>
                                <div class="row" style="padding-top: 10px;font-size: 20px">
                                    <div id="language" class="col-7">语种</div>
                                    <div id="ticketNum" class="col-5">2张</div>
                                </div>
                                <div class="row" style="padding-top: 40px;font-size: 20px">
                                    <div class="col-7">
                                        <div id="movieDate">2023-01-01</div>
                                        <div id="movieTime">20:12~21:22</div>
                                    </div>
                                    <div class="col-5">
                                        <div id="roomName">3号厅</div>
                                        <div id="seatNum" style="padding-top: 20px;">
                                            <div class="row" style="margin: 5px;border: 1px #d3d3d3 dashed;border-radius: 10px;">
                                                <div id="seatInfo-0" class="col-6" style="border-right: 1px solid #d3d3d3">
                                                    <%--                                    <div>2排3座</div>--%>
                                                </div>
                                                <div id="seatInfo-1" class="col-6">
                                                    <%--                                    <div>2排3座</div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="border-top: 1px solid #d3d3d3;height: 200px;margin-top: 50px">
                                    <h5 style="margin-top: 50px;margin-bottom: 20px;">支付资料</h5>
                                    <div id="totalPrice" style="padding-bottom: 10px">实付金额:</div>
                                    <div id="phone" style="padding-bottom: 10px">手机号码:</div>
                                    <div id="orderNum" style="padding-bottom: 10px">订单号码:</div>
                                    <div id="orderCreateTime" style="padding-bottom: 10px">订单时间:</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-5">
                            <div class="text-center">
                                <img src="../../../../resources/upload/qrcode/XL387465230C20C5395132.jpg" draggable="false" style="-moz-user-select: none;-khtml-user-select: none;-webkit-user-select: none;-o-user-select: none;user-select: none;" oncontextmenu="return false">
                            </div>
                            <div>
                                <h4>观影须知</h4>
                                <div style="color: #888888">
                                    1.疫情期间,请注意当地防疫政策和影院观影需求。<br/>
                                    2.请提前到达影院现场,通过影院自助取票机完成取票。<br/>
                                    3.若取票过程中遇到无法取票等其它问题,请联系影院工作
                                    人员进行处理。<br/>
                                    4.请及时关注电影开场时间,凭票有序检票入场。<br/>
                                    5.如需开具电影票发票,可联系影院工作人员凭当日票根进
                                    行开具,若遇到特殊情况请及时联系猫眼客服人员。<br/>
                                    6.退票、改签服务请参考影院具体政策要求,特殊场次及部
                                    分使用卡、券场次订单可能不支持此服务。<br/>
                                    7.客服电话: 1010-5335,也可在当前页面联系在线客服, 工作时间: 9:00-22:00,国家法定节假日延至24:00。<br/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>




<%-- jquery --%>
<script src="../../../../resources/js/jquery-3.6.3.js"></script>

<%-- 根据用户选择的选项卡 激活对应的区域 --%>
<script>
    $(document).ready(function () {
        let type = ${type};
        switch(type)
        {
            case 0:
                $("#v-pills-settings").addClass("show");
                $("#v-pills-settings").addClass("active");
                $("#v-pills-settings-tab").addClass("active");
                $("#v-pills-settings-tab").attr("aria-selected",true);
                break;
            case 1:
                $("#v-pills-order").addClass("show");
                $("#v-pills-order").addClass("active");
                $("#v-pills-order-tab").addClass("active");
                $("#v-pills-order-tab").attr("aria-selected",true);
                break;
            case 2:
                $("#v-pills-collect").addClass("show");
                $("#v-pills-collect").addClass("active");
                $("#v-pills-collect-tab").addClass("active");
                $("#v-pills-collect-tab").attr("aria-selected",true);
                break;
            case 3:
                $("#v-pills-comment").addClass("show");
                $("#v-pills-comment").addClass("active");
                $("#v-pills-comment-tab").addClass("active");
                $("#v-pills-comment-tab").attr("aria-selected",true);
                break;
            default:
                $("#v-pills-settings").addClass("show");
                $("#v-pills-settings").addClass("active");
                $("#v-pills-settings-tab").addClass("active");
                $("#v-pills-settings-tab").attr("aria-selected",true);
        }
    });
</script>

<%-- 当前用户的性别 选中状态 --%>
<script>
    $(document).ready(function () {
        let tempText = '';
        let sex = $("#sex").attr("sex");
        $("#sex").empty();
        if (sex == 1){
            tempText = '<input class="form-check-input" name="sex" value="1" type="radio" checked>&nbsp男&nbsp&nbsp&nbsp&nbsp&nbsp\n' +
                '<input class="form-check-input" name="sex" value="0" type="radio">&nbsp女';
        }
        else{
            tempText = '<input class="form-check-input" name="sex" value="1" type="radio">&nbsp男&nbsp&nbsp&nbsp&nbsp&nbsp\n' +
                '<input class="form-check-input" name="sex" value="0" type="radio" checked>&nbsp女';
        }
        $("#sex").append(tempText);
    });
</script>

<%-- 激活隐藏的file按钮的单击事件 达到点击图片打开选择文件窗口的效果 --%>
<script>
    function file_photo(){
        $("#photo").click();
    }
</script>

<%-- 显示当前文件选择器选中的图片 --%>
<script>
    function show(file){
        let reader = new FileReader();	// 实例化一个FileReader对象，用于读取文件
        let img = document.getElementById('img-selector'); 	// 获取要显示图片的标签

        //读取File对象的数据
        reader.onload = function(evt){
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
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
        var newDate = jsonDate.format("yyyy-MM-dd hh:mm:ss");
        // var newDate = jsonDate.format("yyyy-MM-dd");                     // 设置时间格式
        return newDate;
    }
</script>

<%-- 渲染每个订单中包含的座位 --%>
<script>
    $(document).ready(function () {
        $("div[id^='selected-seats-']").each(function (){
            let seatNums = $(this).attr("seatNums");
            let row = $(this).attr("row");
            let col = $(this).attr("col");
            $(this).empty();
            for (let i = 0;i < seatNums.length;i++){
                if (seatNums.charAt(i) == "1"){
                    let temp_row = Math.floor((i/col)+1);
                    let temp_col = Math.floor((i%col)+1);
                    let eachText = '<div class="selected-seats">' + temp_row + '排' + temp_col + '座</div>'
                    $(this).append(eachText);
                }
            }
        });
    });
</script>

<%-- 实时修改发布评论弹窗表单的GET参数 --%>
<script>
    function open_comment_modal(movieId,orderNum){
        console.log('+++');
        $("#comment").attr("action","/home/center/public_comment?userId=" + ${user.id} + "&movieId=" + movieId + "&orderNum=" + orderNum);
        $("#comment-score").val("");
        $("#comment-content").val("");
    }
</script>

<%-- 判断是否为发布评论后的重新进入 若是则要显示toast显示 --%>
<script>
    $(document).ready(function () {
        let isRefresh = ${isRefresh};
        if (isRefresh == 1){
            toastr.success("评论成功！");
        }
    });
</script>

<%-- 更新订单详情窗口中的信息 --%>
<script>
    $(document).ready(function () {
        $(document).on("click", "button[id^='btn-detail-']", function(){
            let orderId = $(this).attr("orderId");
            $.ajax({
                url:"findOrderById",
                async:false,
                data:{
                    "orderId":orderId,
                },
                type:"POST",
                dataType:"json",
                // contentType : "application/json;charset=UTF-8",
                success:function (data){
                    let order = data["orders"];
                    let SeatsNumList = data["SeatsNumList"];

                    $("#cinemaName").text(order.screening.cinema.name);
                    $("#movieName").text(order.screening.movie.chineseName);
                    $("#language").text(order.screening.language.lanName);
                    $("#ticketNum").text(order.totalNOP + "张");
                    $("#movieDate").text(transferTime(order.screening.startTime,"yyyy-MM-dd"));
                    $("#movieTime").text(transferTime(order.screening.startTime,"hh:mm") + "~" + transferTime(order.screening.endTime,"hh:mm"));
                    $("#roomName").text(order.screening.room.roomName);

                    $("#seatNum").text(getSeat(SeatsNumList,order.screening.seat.row,order.screening.seat.col));

                    $("#totalPrice").text("实付金额：" + order.totalPrice);
                    $("#phone").text("手机号码：" + order.user.phone.substr(0,3) + "****" + order.user.phone.substr(7,10));
                    $("#orderNum").text("订单号码：" + order.orderNum);
                    $("#orderCreateTime").text("订单时间：" + order.createTime);
                },
                error:function (){
                    alert("ajax请求错误");
                }
            });
        });
    });
</script>

<%-- 渲染预订单中的座位信息 --%>
<script>
    function getSeat(SeatsNumList,row,col){
        $("#seatInfo-0").empty();
        $("#seatInfo-1").empty();
        let SeatsArray = SeatsNumList;               // 数字的位置数组 -- 得到座位号的数值以及座位个数(票数)
        let SeatsInfoText = new Array();                // 中文文本的位置数组 --- 最后加载显示的
        // 根据座位号 计算座位行列
        for (let i = 0;i < SeatsArray.length;i++){
            let temp_row = Math.floor((SeatsArray[i]/col)+1);
            let temp_col = Math.floor((SeatsArray[i]%col)+1);
            SeatsInfoText.push(temp_row + "排" + temp_col + "座");
        }
        console.log("SeatsInfoText=" + SeatsInfoText);
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
    }
</script>

<%-- 日期对象格式化 --%>
<script>
    function transferTime(cTime,format) {     //将json串的一串数字进行解析
        console.log(format);
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
        var newDate = jsonDate.format(format);
        // var newDate = jsonDate.format("yyyy-MM-dd");                     // 设置时间格式
        return newDate;
    }
</script>

<%-- 评分窗口的打分动效 --%>
<script>
    $(document).ready(function () {
        $(document).on("click", "svg[id^='star-']", function(){
            $("#star").empty();
            let score = $(this).attr("star");
            $("#score-display").text(score + ".0");
            $("#score").attr("value",score);
            for (let i = 0;i < 5;i++){
                if (i < score){
                    $("#star").append('<svg id="star-' + (i+1) + '" star="' + (i+1) + '" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#ffc600" stroke="#ffc600" stroke-width="4" stroke-linejoin="round"/></svg>');
                }
                else{
                    $("#star").append('<svg id="star-' + (i+1) + '" star="' + (i+1) + '" style="pointer-events: auto;cursor:pointer;" width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.9986 5L17.8856 17.4776L4 19.4911L14.0589 29.3251L11.6544 43L23.9986 36.4192L36.3454 43L33.9586 29.3251L44 19.4911L30.1913 17.4776L23.9986 5Z" fill="#d3d3d3" stroke="#d3d3d3" stroke-width="4" stroke-linejoin="round"/></svg>');
                }
            }
        });
    });
</script>


<script src="../../../../resources/plugins/admin_assets/js/plugins/toastr/toastr.min.js"></script>

</body>
</html>

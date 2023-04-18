<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/13
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--content--%>

<div class="row" style="height: 50px">
    <div class="col-sm-7 col-6">
        <h4 class="page-title" style="font-weight: bold">影院资料</h4>
    </div>
    <div class="col-sm-5 col-6 text-right m-b-30">
        <a href="/cinema_admin/cinema_info_edit?cinemaId=${cinema.cinemaId}" class="btn btn-primary btn-rounded"><i class="fa fa-plus"></i> 编辑资料</a>
    </div>
</div>
<div class="card-box profile-header">
    <div class="row">
        <div class="col-md-12">
            <div class="profile-view">
                <div class="profile-img-wrap">
                    <div class="profile-img">
                        <a href="#"><img class="avatar" src="../../..${cinema.photo}" alt=""></a>
                    </div>
                </div>
                <div class="profile-basic">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="profile-info-left">
                                <h3 class="user-name m-t-0 mb-0">${cinema.name}</h3>
<%--                                <small class="text-muted">${cinema.address}</small>--%>
<%--                                <div class="staff-id">客服：${cinema.phone}</div>--%>
                                <div class=" staff-id h4">地址：${cinema.address}</div>
                                <div class="staff-id">城市：${cinema.city}</div>
                                <div class="staff-msg"><a href="chat.html" class="btn btn-primary">复制信息</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <ul class="personal-info">
                                <li>
                                    <span class="title">电话：</span>
                                    <span class="text"><a href="">${cinema.phone}</a></span>
                                </li>
                                <li>
                                    <span class="title">邮箱：</span>
                                    <span class="text"><a href=""><span class="__cf_email__"
                                                                        data-cfemail="97f4e5fee4e3fef9f6f0e5f8e1f2e4d7f2eff6fae7fbf2b9f4f8fa"></span>${cinema.adminCinema.email}</a></span>
                                </li>
                                <li>
                                    <span class="title">负责人：</span>
                                    <span class="text">${cinema.adminCinema.name}</span>
                                </li>
                                <li>
                                    <span class="title">所属：</span>
                                    <span class="text">${cinema.brand.brandName}</span>
                                </li>
                                <li>
                                    <span class="title">加入日期：</span>
                                    <span class="text">
                                        <fmt:formatDate value="${cinema.joinDate}" pattern="yyyy-MM-dd"/>
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- 两个图表 --%>
<div class="row" style="padding-top: 30px">
    <div class="col-12 col-md-6 col-lg-6 col-xl-6">
        <div class="card">
            <div class="card-body">
                <div id="lineChart" style="width: 700px;height:400px;">

                </div>
            </div>
        </div>
    </div>
    <div class="col-12 col-md-6 col-lg-6 col-xl-6">
        <div class="card">
            <div class="card-body">
                <div id="barChart" style="width: 700px;height:400px;">

                </div>
            </div>
        </div>
    </div>
</div>


<%-- 统计数据部分 --%>
<div class="row">
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="dash-widget">
            <span class="dash-widget-bg1">
                <i class="fa fa-stethoscope" style="margin-top: 12px" aria-hidden="true"></i></span>
            <div class="dash-widget-info text-right">
                <h3 id="totalScreening"></h3>
                <span class="widget-title1">累计放映场次 <i class="fa fa-check" aria-hidden="true"></i></span>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="dash-widget">
            <span class="dash-widget-bg2"><i class="fa fa-user-o" style="margin-top: 12px"></i></span>
            <div class="dash-widget-info text-right">
                <h3 id="totalPerson">1072</h3>
                <span class="widget-title2">累计观影人数 <i class="fa fa-check" aria-hidden="true"></i></span>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="dash-widget">
            <span class="dash-widget-bg3"><i class="fa fa-cny" style="margin-top: 12px" aria-hidden="true"></i></span>
            <div class="dash-widget-info text-right">
                <h3 id="totalPrice"></h3>
                <span class="widget-title3">累计营业额 <i class="fa fa-check" aria-hidden="true"></i></span>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="dash-widget">
            <span class="dash-widget-bg4"><i class="fa fa-hourglass-2" style="margin-top: 12px" aria-hidden="true"></i></span>
            <div class="dash-widget-info text-right">
                <h3 id="runTime"></h3>
                <span class="widget-title4">已上线时间 <i class="fa fa-check" aria-hidden="true"></i></span>
            </div>
        </div>
    </div>
</div>

















<%-- jquery --%>
<script src="../../../resources/js/jquery-3.6.3.js"></script>

<%-- echart --%>
<script src="../../../resources/js/echarts.js"></script>

<%-- 请求图表数据 数据申明为var 下方方法直接使用此数据 --%>
<script>
    var eachDateText = null;
    var eachPerson = null;;
    var eachPrice = null;;

    $.ajax({
        url:"chart_data?cinemaId=${cinema.cinemaId}",
        async:false,
        data:{},
        type:"POST",
        dataType:"json",
        // contentType : "application/json;charset=UTF-8",
        success:function (data){
            eachDateText = data["eachDateText"];
            eachPerson = data["eachPerson"];
            eachPrice = data["eachPrice"];
        },
        error:function (){
            alert("ajax请求错误");
        }
    });
</script>

<%-- 折线图 --%>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    let lineChart = echarts.init(document.getElementById('lineChart'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '观影人数'
        },
        legend: {
            data: ['人数']
        },
        xAxis: {
            data: eachDateText
        },
        yAxis: {},
        series: [
            {
                name: '人数',
                data: eachPerson,
                type: 'line',
                smooth: true
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    lineChart.setOption(option);
</script>

<%-- 柱状图 --%>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    let barChart = echarts.init(document.getElementById('barChart'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '票房金额'
        },
        legend: {
            data: ['金额']
        },
        xAxis: {
            data: eachDateText
        },
        yAxis: {},
        series: [
            {
                name: '金额',
                type: 'bar',
                data: eachPrice
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    barChart.setOption(option);
</script>

<%-- 统计数值 累计放映场次+累计观影人数 --%>
<script>
    $.ajax({
        url:"stats_data?cinemaId=${cinema.cinemaId}",
        async:false,
        data:{},
        type:"POST",
        dataType:"json",
        // contentType : "application/json;charset=UTF-8",
        success:function (data){
            let totalScreening = data["totalScreening"];
            let totalPerson = data["totalPerson"];
            let totalPrice = data["totalPrice"];
            let runTime = data["runTime"];
            $("#totalScreening").text(totalScreening);
            $("#totalPerson").text(totalPerson);
            $("#totalPrice").text("￥"+totalPrice);
            $("#runTime").text(runTime+"天");


        },
        error:function (){
            alert("ajax请求错误");
        }
    });
</script>

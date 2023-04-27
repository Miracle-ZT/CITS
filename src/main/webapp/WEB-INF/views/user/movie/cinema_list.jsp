<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/1/27
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${movie.chineseName}_XiaoLanMovie</title>
    <jsp:include page="../../utils/bootstrap5.1.1.jsp" flush="true"/>
    <script src="../../../../resources/js/jquery.seat-charts.min.js"></script>
    <style>
        .box {
            background-image: url(../../../../resources/img/bg_detail.jpg);
            height: 400px;
            width: 2534px;
        }
    </style>
</head>
<body>
<div style="margin:100px auto;width: 1400px;margin-top: 0px">
    <jsp:include page="../../utils/nav.jsp" flush="true"/>

</div>

<div class="row box" style="width: 100%;margin-top: -100px;">
    <div class="col-2"></div>
    <div class="col-2">
        <div>
            <img src="../../../..${movie.imgUrl}" class="mx-auto d-block border-white border border-3"
                 style="width: 232px;height: 322px;margin-top: 40px">
        </div>
    </div>
    <div class="col-3" style="margin-top: 40px">
        <div class="text-white">                <!-- 白色文字信息部分 -->
            <h1 style="font-weight: bold;margin-top: 5px">${movie.chineseName}</h1>
            <h4 style="margin-top: -10px;">${movie.englishName}</h4>
            <div style="margin-top: 20px">
                <h5>
                    <c:forEach var="type" items="${movie.typeList}" varStatus="status">
                        ${type.typeName}&nbsp;
                    </c:forEach>
                </h5>
                <h5>${movie.country} / ${movie.timeLen}分钟</h5>
                <h5>${movieDate} 中国大陆上映</h5>
            </div>
        </div>
        <div class="row" style="padding: 12px;margin-top: 30px">                                   <!-- 按钮部分 -->
            <button type="button" class="btn btn-outline-danger text-white" style="width: 145px">
                <img src="../../../../resources/img/mark_white_0.png" style="width: 20px;height: 20px">
                收藏
            </button>
            <button type="button" class="btn btn-outline-danger text-white" style="width: 145px;margin-left: 10px">
                <img src="../../../../resources/img/rating_white_0.png" style="width: 20px;height: 20px">
                评分
            </button>
            <p>
                <a href="/home/movie_detail?movieId=${movie.movieId}">
                    <button type="button" class="btn btn-danger"
                            style="width: 300px;margin-left: -12px;margin-top: 10px">查看电影详情
                    </button>
                </a>
            </p>
        </div>
    </div>
    <div class="col-5 text-white">
        <div class="col" style="height: 200px;width: 100%"></div>
        <div class="col">
            小蓝口碑
            <div class="row">
                <div class="col-2">
                    x.x
                </div>
                <div class="col-3">
                    ※※※※※
                </div>
                <div class="col-7"></div>
            </div>
        </div>
        <div class="col">
            累计票房
            <div class="row">
                <div class="col-3">
                    xx.xx亿
                </div>
                <div class="col-7"></div>
            </div>
        </div>
    </div>
</div>

<!-- 日期 -->
<div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px;margin-top: 50px">
    <div>
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <h5 class="align-self-center text-muted" style="padding: 5px;margin-top: 7px">日期：</h5>
            <c:forEach var="dateText" items="${dateTextMap}" varStatus="status">
                <c:if test="${status.first}">
                    <li class="nav-item" role="presentation" style="padding: 5px">
                        <button class="nav-link active" name="spanDate" value="${status.index}" data-bs-toggle="pill"
                                data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                aria-selected="true" id="spanDate-${status.index}">${dateText.key}&nbsp;&nbsp;${dateText.value}</button>
                    </li>
                </c:if>
                <c:if test="${!status.first}">
                    <li class="nav-item" role="presentation" style="padding: 5px">
                        <button class="nav-link" name="spanDate" value="${status.index}" data-bs-toggle="pill"
                                data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                aria-selected="false" id="spanDate-${status.index}">${dateText.key}&nbsp;&nbsp;${dateText.value}</button>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px">
    <div>
        <ul class="nav nav-pills mb-3" role="tablist">
            <h5 class="align-self-center text-muted" style="padding: 5px;margin-top: 7px">影院服务：</h5>
            <li class="nav-item" role="presentation" style="padding: 5px">
                <button class="nav-link active" name="spanDate" value="" data-bs-toggle="pill"
                        data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                        aria-selected="true">全部
                </button>
            </li>
            <li class="nav-item" role="presentation" style="padding: 5px">
                <button class="nav-link" name="spanDate" value="" data-bs-toggle="pill" data-bs-target="#pills-home"
                        type="button" role="tab" aria-controls="pills-home" aria-selected="true">可退票
                </button>
            </li>
        </ul>
    </div>
</div>
<div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px">
    <div>
        <ul class="nav nav-pills mb-3" role="tablist">
            <h5 class="align-self-center text-muted" style="padding: 5px;margin-top: 7px">影厅类型：</h5>
            <li class="nav-item" role="presentation" style="padding: 5px">
                <button class="nav-link active" name="spanDate" value="" data-bs-toggle="pill"
                        data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                        aria-selected="true">全部
                </button>
            </li>
            <li class="nav-item" role="presentation" style="padding: 5px">
                <button class="nav-link" name="spanDate" value="" data-bs-toggle="pill" data-bs-target="#pills-home"
                        type="button" role="tab" aria-controls="pills-home" aria-selected="true">可退票
                </button>
            </li>
        </ul>
    </div>
</div>

<div>
    <div class="collapse" id="collapseExample">
        <div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px;">
            <ul class="nav nav-pills mb-3" role="tablist">
                <h5 class="align-self-center text-muted" style="padding: 5px;margin-top: 7px">更多选项：</h5>
                <li class="nav-item" role="presentation" style="padding: 5px">
                    <button class="nav-link active" name="spanDate" value="" data-bs-toggle="pill"
                            data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                            aria-selected="true">全部
                    </button>
                </li>
                <li class="nav-item" role="presentation" style="padding: 5px">
                    <button class="nav-link" name="spanDate" value="" data-bs-toggle="pill" data-bs-target="#pills-home"
                            type="button" role="tab" aria-controls="pills-home" aria-selected="true">选项一
                    </button>
                </li>
            </ul>
        </div>
    </div>
    <div>
        <button class="btn btn-primary btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
                aria-expanded="false" aria-controls="collapseExample">
            更多
        </button>
    </div>
</div>

<div class="mt-5">                              <!-- 影院列表 -->
    <div class="row" style="margin: 0px auto 0px auto;width: 1400px;">
        <div class="col-4" style="align-items: center">
            <img src="../../../../resources/img/pic_movie_list.png" width="20px" height="20px"
                 class="d-inline-block align-text-top" style="margin-top: 1px">
            <h7>影院列表</h7>
        </div>
        <div class="col-7"></div>
        <div class="col-1" style="align-items: center">
            <img src="../../../../resources/img/filter.png" width="20px" height="20px"
                 class="d-inline-block align-text-top" style="margin-top: 1px">
            <h7>筛选</h7>
        </div>
    </div>
    <div style="height: 20px"></div>

    <!-- 影院列表 -->
    <div id="cinemaList">
        <c:if test="${not empty cinemaList}">
            <c:forEach var="cinema" items="${cinemaList}" varStatus="status">
                <div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px">
                    <div class="row">
                        <div class="col-10">
                            <div><a href="/home/cinema_detail?cinemaId=${cinema.cinemaId}" style="text-decoration: none">${cinema.name}</a></div>
                            <div class="text-muted">${cinema.address}</div>
                        </div>
                        <div class="col-1">
                            <div>￥xx元 起</div>
                            <div>x.x km</div>
                        </div>
                        <div class="col-1">
                            <a href="">
                                <button class="btn btn-outline-danger" style="border-radius: 300px" name="spanDate"
                                        type="button">购票
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty cinemaList}">
            <div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px">
                <h5>抱歉，没有找到相关结果，请尝试用其他条件筛选。</h5>
            </div>
        </c:if>
    </div>
</div>


<!--
<%--<div style="margin:100px auto;width: 1400px;transform: translateX(20%)">--%>
<%--    <nav>--%>
<%--        <div class="nav nav-tabs" id="nav-tab" role="tablist">          <!-- data-bs-target 需与内容部分的 id 一致 -->--%>
<%--            <button class="nav-link active" id="nav-date-1" data-bs-toggle="tab" data-bs-target="#date-1" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Home</button>--%>
<%--            <button class="nav-link" id="nav-date-2" data-bs-toggle="tab" data-bs-target="#date-2" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</button>--%>
<%--            <button class="nav-link" id="nav-date-3" data-bs-toggle="tab" data-bs-target="#date-3" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>--%>
<%--            <button class="nav-link" id="nav-date-4" data-bs-toggle="tab" data-bs-target="#date-4" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Home</button>--%>
<%--            <button class="nav-link" id="nav-date-5" data-bs-toggle="tab" data-bs-target="#date-5" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</button>--%>
<%--            <button class="nav-link" id="nav-date-6" data-bs-toggle="tab" data-bs-target="#date-6" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>--%>
<%--            <button class="nav-link" id="nav-date-7" data-bs-toggle="tab" data-bs-target="#date-7" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--    <div class="tab-content" id="nav-tabContent">--%>
<%--        <div class="tab-pane fade show active" id="date-1" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">1</div>--%>
<%--        <div class="tab-pane fade" id="date-2" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">2</div>--%>
<%--        <div class="tab-pane fade" id="date-3" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">3</div>--%>
<%--        <div class="tab-pane fade" id="date-4" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">4</div>--%>
<%--        <div class="tab-pane fade" id="date-5" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">5</div>--%>
<%--        <div class="tab-pane fade" id="date-6" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">6</div>--%>
<%--        <div class="tab-pane fade" id="date-7" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">7</div>--%>
<%--    </div>--%>
<%--</div>--%>
-->




<script src="../../../../resources/js/jquery-3.6.3.js"></script>
<script>
    $("button[id*='spanDate-']").on("click",function (e){               // 监听spanDate-开头的id的控件
        let spanDate = $(e.target).val()                                // 并获取此控件
        // alert(spanDate);
        $.ajax({
            url:"refresh_cinema_list?movieId=${movie.movieId}",
            async:false,
            data:{
                "spanDate":spanDate,
            },
            type:"POST",
            dataType:"json",
            // contentType : "application/json;charset=UTF-8",
            success:function (data){
                var cinemaList = data["cinemaList"];
                $("#cinemaList").empty();
                if (cinemaList.length > 0){                        // 有结果
                    for (var i = 0;i < cinemaList.length;i++){
                        var eachText = '<div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px">\n' +
                            '                <div class="row">\n' +
                            '                    <div class="col-10">\n' +
                            '                            <div><a href="/home/cinema_detail?cinemaId=' + cinemaList[i].cinemaId + '" style="text-decoration: none">' + cinemaList[i].name + '</a></div>\n' +
                            '                        <div class="text-muted">' + cinemaList[i].address +'</div>\n' +
                            '                    </div>\n' +
                            '                    <div class="col-1">\n' +
                            '                        <div>￥xx元 起</div>\n' +
                            '                        <div>x.x km</div>\n' +
                            '                    </div>\n' +
                            '                    <div class="col-1">\n' +
                            '                        <a href="">\n' +
                            '                            <button class="btn btn-outline-danger" style="border-radius: 300px" name="spanDate" value=""\n' +
                            '                                    type="button">购票\n' +
                            '                            </button>\n' +
                            '                        </a>\n' +
                            '                    </div>\n' +
                            '                </div>\n' +
                            '            </div>';
                        $("#cinemaList").append(eachText);
                    }
                }else {                                             // 无结果
                    var noResultText = '<div class="card card-body" style="margin: 0px auto 0px auto;width: 1400px">\n' +
                        '<h5>抱歉，没有找到相关结果，请尝试用其他条件筛选。</h5>\n' +
                        '</div>\n';
                    $("#cinemaList").append(noResultText);
                }
            },
            error:function (){
                alert("ajax请求错误");
            }
        });
    });
</script>

</body>
</html>


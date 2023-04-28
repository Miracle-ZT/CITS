<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/17
  Time: 0:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .warning-sign{
        margin: auto;color: red;
        font-size: 20px;
    }
</style>


<%--content--%>

<div class="row">
    <div class="col-sm-4 col-3">
        <h4 class="page-title">场次列表</h4>
    </div>
    <div class="col-sm-8 col-9 text-right m-b-20">
        <a href="#" class="btn btn btn-primary btn-rounded float-right"
           data-bs-toggle="modal"
           data-bs-target="#add-form"
        ><i class="fa fa-plus"></i> 添加场次</a>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-border table-striped custom-table datatable mb-0">
                <thead>
                <tr>
                    <th>电影</th>
                    <th>放映影厅</th>
                    <th>语言版本</th>
                    <th>放映日期</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>票价</th>
                    <th>状态</th>
                    <th class="text-right">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="currentTime" value="<%= System.currentTimeMillis()%>"></c:set>
                <!-- 未开始 -->
                <c:forEach var="screening" items="${screeningList}" varStatus="status">
                    <c:if test="${currentTime < screening.startTime.time}">
                        <tr>
                            <td><img width="28" height="28" src="../../..${screening.movie.imgUrl}" class="rounded-circle m-r-5" alt="">
                                    ${screening.movie.chineseName}
                            </td>
                            <td>${screening.room.roomName}</td>
                            <td>${screening.language.lanName}</td>
                            <td>
                                <fmt:formatDate value="${screening.startTime}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${screening.startTime}" pattern="HH:mm"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${screening.endTime}" pattern="HH:mm"/>
                            </td>
                            <td>
                                    ${screening.price}
                            </td>
                            <td>
                                <span class="custom-badge status-green">未开始</span>
                            </td>
                            <td class="text-right">
                                <div class="dropdown dropdown-action">
                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown"
                                       aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="edit-patient.html"><i class="fa fa-pencil m-r-5"></i>
                                            编辑</a>
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_patient"><i
                                                class="fa fa-trash-o m-r-5"></i> 删除</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                <!-- 已结束 -->
                <c:forEach var="screening" items="${screeningList}" varStatus="status">
                    <c:if test="${currentTime >= screening.startTime.time}">
                        <tr>
                            <td><img width="28" height="28" src="../../..${screening.movie.imgUrl}" class="rounded-circle m-r-5" alt="">
                                    ${screening.movie.chineseName}
                            </td>
                            <td>${screening.room.roomName}</td>
                            <td>${screening.language.lanName}</td>
                            <td>
                                <fmt:formatDate value="${screening.startTime}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${screening.startTime}" pattern="HH:mm"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${screening.endTime}" pattern="HH:mm"/>
                            </td>
                            <td>
                                    ${screening.price}
                            </td>
                            <td>
                                <span class="custom-badge status-red">已结束</span>
                            </td>
                            <td class="text-right">
                                <div class="dropdown dropdown-action">
                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown"
                                       aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="edit-patient.html"><i class="fa fa-pencil m-r-5"></i>
                                            编辑</a>
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_patient"><i
                                                class="fa fa-trash-o m-r-5"></i> 删除</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%-- 弹出的添加表单 --%>
<div class="modal fade" id="add-form" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">添加场次</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="/cinema_admin/add_screening?cinemaId=${cinema.cinemaId}" method="post">
                <div class="modal-body">

                    <div class="row" style="margin-bottom: 15px">
                        <label class="col-3" style="padding-left: 30px;font-size: 17px;margin: auto;overflow: auto">放映电影</label>
                        <div class="col-6">
                            <select class="selectpicker" data-live-search="true"
                                    id="add-movie-id" name="add-movie-id">
                                <option value="">-- --</option>
                                <c:forEach var="movie" items="${movieList}" varStatus="status">
                                    <option value="${movie.movieId}">${movie.chineseName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-3 warning-sign" id="movieId-check"></div>
                    </div>

                    <div class="row" style="margin-bottom: 15px">
                        <label class="col-3" style="padding-left: 30px;font-size: 17px;margin: auto;overflow: auto">放映影厅</label>
                        <div class="col-6">
                            <select class="selectpicker" data-live-search="true"
                                    id="add-room-id" name="add-room-id">
                                <option value="">-- --</option>
                                <c:forEach var="room" items="${roomList}" varStatus="status">
                                    <option value="${room.roomId}">${room.roomName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-3 warning-sign" id="roomId-check"></div>
                    </div>

                    <div class="row" style="margin-bottom: 15px">
                        <label class="col-3" style="padding-left: 30px;font-size: 17px;margin: auto;overflow: auto">放映语种</label>
                        <div class="col-6">
                            <select class="selectpicker" data-live-search="true"
                                    id="add-language-id" name="add-language-id">
                                <option value="">-- --</option>
                                <c:forEach var="lan" items="${languageList}" varStatus="status">
                                    <option value="${lan.languageId}">${lan.lanName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-3 warning-sign" id="languageId-check"></div>
                    </div>

                    <div class="row" style="margin-bottom: 15px">
                        <label class="col-3" style="padding-left: 30px;font-size: 17px;margin: auto;overflow: auto">放映日期</label>
                        <div class="col-6">
                            <input type="date" id="add-screening-date" name="add-screening-date" class="form-control" style="width: 220px" required>
                        </div>
                        <div class="col-3 warning-sign" id="screening-date-check"></div>
                    </div>

                    <div class="row" style="margin-bottom: 15px">
                        <label class="col-3" style="padding-left: 30px;font-size: 17px;margin: auto;overflow: auto">放映时间</label>
                        <div class="col-6">
                            <!-- 若input为disabled 则form表单提交时不会提交此input的值 -->
                            <!-- 故改用readonly -->
                            <input type="time" name="add-startTime" id="add-startTime" class="form-control" style="width: 105px;display: inline" required>~<input type="time" name="add-endTime" id="add-endTime" class="form-control" style="width: 105px;display:inline;" readonly>
                        </div>
                        <div class="col-3 warning-sign" id="time-check"></div>
                    </div>

                    <div class="row" style="margin-bottom: 15px">
                        <label class="col-3" style="padding-left: 30px;font-size: 17px;margin: auto;overflow: auto">场次票价</label>
                        <div class="col-6">
                            <input type="text" id="add-price" name="add-price" class="form-control" style="width: 220px;display: inline" placeholder="(元)" required>
                        </div>
                        <div class="col-3 warning-sign" id="price-check"></div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary disabled" id="btn-submit">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>





<script src="../../../resources/plugins/cinema_manage_assets/js/jquery-3.2.1.min.js"></script>

<%-- 判断各input是否填写 并提示 --%>
<script>
    // 判断传入的input对象的val是否为空
    function checkInputEmpty(obj){
        if (obj.val() == ""){
            return true;
        }
    }

    // 根据startTime和timeLen计算endTime
    function figureEndTime(startTime,timeLen){
        let hh = +startTime.split(':')[0];
        let mm = +startTime.split(':')[1];

        mm += (+timeLen);

        // mm进位到hh的值
        let carry_mm = parseInt(mm/60);
        // 得到最终的mm
        mm -= (carry_mm*60);
        // 得到最终的mm
        hh += carry_mm;
        hh = (hh%24);
        // 不足2bit补0
        mm = "0" + mm;
        hh = "0" + hh;
        mm = mm.substr(-2);
        hh = hh.substr(-2);
        return hh + ":" + mm;
    }

    // 根据当前所选电影和设置的放映开始时间 更新结束时间的值
    function refreshTime(){
        let movieId = $("#add-movie-id").val();
        let startTime = $("#add-startTime").val();
        if (movieId != "" && startTime != ""){
            $.ajax({
                url:"/admin/movie/selectMovieById",
                async:false,
                data:{
                    "movieId":movieId,
                },
                type:"POST",
                dataType:"json",
                // contentType : "application/json;charset=UTF-8",
                success:function (data){
                    let movie = data["movie"];
                    let timeLen = movie.timeLen;
                    $("#add-endTime").val(figureEndTime(startTime,timeLen));
                },
                error:function (){
                    alert("ajax请求错误");
                }
            });
        }
    }

    // 检查是否所有项都填写
    function checkSubmitStatus(){
        let sign = true;

        if (checkInputEmpty($("#add-movie-id")) || checkInputEmpty($("#add-room-id")) || checkInputEmpty($("#add-language-id")) || checkInputEmpty($("#add-screening-date")) || checkInputEmpty($("#add-startTime")) || checkInputEmpty($("#add-price"))){
            sign = false;
        }

        if (sign){
            $("#btn-submit").removeClass("disabled");
        }
        else {
            $("#btn-submit").addClass("disabled");
        }
    }

    $(document).ready(function(){
        // $("select[name^='add-'],input[name^='add-']").change(function (){
        // });

        // 如果未填写 在col-3这一列进行提示
        // 每一次任何input框的值发生变化 都检查一遍是否都填写 并依此更新submit按钮的可点击状态
        // 当电影 和 开始时间变动时 额外刷新结束时间input的值
        $("#add-movie-id").change(function (){
            if (checkInputEmpty($(this))){
                $("#movieId-check").text("×");
            }
            else{
                $("#movieId-check").text("");
            }
            refreshTime();
            checkSubmitStatus();
        });
        $("#add-room-id").change(function (){
            if (checkInputEmpty($(this))){
                $("#roomId-check").text("×");
            }
            else{
                $("#roomId-check").text("");
            }
            checkSubmitStatus();
        });
        $("#add-language-id").change(function (){
            if (checkInputEmpty($(this))){
                $("#languageId-check").text("×");
            }
            else{
                $("#languageId-check").text("");
            }
            checkSubmitStatus();
        });
        $("#add-screening-date").change(function (){
            if (checkInputEmpty($(this))){
                $("#screening-date-check").text("×");
            }
            else{
                $("#screening-date-check").text("");
            }
            checkSubmitStatus();
        });
        $("#add-startTime").change(function (){
            if (checkInputEmpty($(this))){
                $("#time-check").text("×");
            }
            else{
                $("#time-check").text("");
            }
            checkSubmitStatus();
            // 更新放映时间的结束时间
            refreshTime();
        });
        $("#add-price").change(function (){
            if (checkInputEmpty($(this))){
                $("#price-check").text("×");
            }
            else{
                $("#price-check").text("");
            }
            checkSubmitStatus();
        });
    });
</script>







<%-- 没有也能用？废弃 --%>
<script>
    // $('.selectpicker').selectpicker({
    //     width: 250,
    //     noneSelectedText: '请选择'
    // });
    // $('.selectpicker').selectpicker('refresh');
</script>


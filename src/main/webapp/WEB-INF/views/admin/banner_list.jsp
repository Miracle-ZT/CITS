<%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/2/22
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 项目</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="../../../resources/plugins/admin_assets/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="../../../resources/plugins/admin_assets/css/animate.min.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/style.min.css?v=4.0.0" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="../../../resources/plugins/admin_assets/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="../../../resources/plugins/admin_assets/css/plugins/chosen/chosen.css" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInUp">
    <div class="row">
        <div class="col-sm-12">

            <div class="ibox">
                <div class="ibox-title">
                    <h5>轮播内容列表</h5>
                    <div class="ibox-tools">
                        <a id="add-btn" data-toggle="modal" href="#add-form"
                           class="btn btn-primary btn-xs">添加轮播</a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row m-b-sm m-t-sm">
                        <div class="col-md-1">
                            <button type="button" id="loading-example-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
                        </div>
                        <div class="col-md-11">
                            <div class="input-group">
                                <input id="keyWord" type="text" placeholder="请输入轮播对应的电影名" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                            </div>
                        </div>
                    </div>

                    <div class="project-list">
                        <table class="table table-hover">
                            <tbody id="bannerList">
                            <c:forEach var="ban" items="${bannerList}" varStatus="status">
                                <tr>
                                    <td><img src="../../../..${ban.path}" style=";width: 160px;height: 90px;"></td>
                                    <td>
                                        <a class="client-link">${ban.movie.chineseName}</a>
                                        <br>
                                        <small>${ban.movie.englishName}</small>
                                    </td>
                                    <td>
                                        <small>添加于：</small><br>
                                        <fmt:formatDate value="${ban.banAddDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </td>
                                    <td class="project-actions">
                                        <a id="info-btn-${ban.banId}" banId="${ban.banId}"
                                           data-toggle="modal" href="#detail-form" class="btn btn-white btn-sm"><i class="fa fa-folder"></i> 查看 </a>

                                        <a id="edit-btn-${ban.banId}" banId="${ban.banId}"
                                           data-toggle="modal" href="#edit-form" class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> 编辑 </a>

                                        <a id="delete-btn-${ban.banId}" banId="${ban.banId}"
                                           class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> 删除 </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%-- 查看资料弹窗 --%>
<div id="detail-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%-- 表单实际内容部分 --%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>查看轮播内容 <small>详细信息</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form action="" enctype="multipart/form-data"
                                      method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <div >
                                            <img name="path" style="width: 528px;height: 297px">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">所属电影</label>
                                        <div class="col-sm-10">
                                            <a name="chineseName" class="client-link"></a>
                                            <br>
                                            <small name="englishName"></small>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">添加日期</label>
                                        <div class="col-sm-10">
                                            <div name="ban-add-date" style="height: 30px;line-height: 30px"></div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- 编辑资料弹窗 --%>
<div id="edit-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%-- 表单实际内容部分 --%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>编辑轮播内容 <small>详细信息</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form id="update-form" action="" enctype="multipart/form-data"
                                      method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">轮播图</label>
                                        <div class="col-sm-10">
                                            <input type="file" name="file" class="form-control">
                                            <small>推荐图片比例为16:9</small>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">所属电影</label>
                                        <div class="col-sm-10">
                                            <div class="input-group">
                                                <select name="movie-edit" data-placeholder="-- --" class="form-control" style="width:350px;">

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">保存内容</button>
                                            <button class="btn btn-white" type="button">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- 添加资料弹窗 --%>
<div id="add-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%-- 表单实际内容部分 --%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>添加轮播 <small>详细信息</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form id="add-info" action="/admin/banner/add_banner" enctype="multipart/form-data"
                                      method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">轮播图</label>
                                        <div class="col-sm-10">
                                            <input type="file" name="file" class="form-control" required>
                                            <small>推荐图片比例为16:9</small>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">所属电影</label>
                                        <div class="col-sm-10">
                                            <div class="input-group">
                                                <select name="movie-add" data-placeholder="-- --" class="form-control" style="width:350px;">
                                                    <%-- <option value="-1">-- --</option> --%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">保存内容</button>
                                            <button class="btn btn-white" type="button">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<script src="../../../resources/plugins/admin_assets/js/jquery.min.js?v=2.1.4"></script>
<script src="../../../resources/plugins/admin_assets/js/bootstrap.min.js?v=3.3.5"></script>
<script src="../../../resources/plugins/admin_assets/js/content.min.js?v=1.0.0"></script>
<script src="../../../resources/plugins/admin_assets/js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){$("#loading-example-btn").click(function(){btn=$(this);simpleLoad(btn,true);simpleLoad(btn,false)})});function simpleLoad(btn,state){if(state){btn.children().addClass("fa-spin");btn.contents().last().replaceWith(" Loading")}else{setTimeout(function(){btn.children().removeClass("fa-spin");btn.contents().last().replaceWith(" Refresh")},2000)}};
</script>


<%-- 查看轮播图 --%>
<script>
    $(document).ready(function () {
        $(document).on("click", "a[id^='info-btn-']", function(){   // <--采用这种写法 使得通过jquery去append的元素 也能成功绑定此事件
            let banId = $(this).attr("banId");
            $.ajax({
                url: "selectBannerById",
                async: false,
                data: {
                    "banId": banId,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let banner = data["banner"];
                    // 设置更新链接 传递movieId
                    $("img[name='path']").attr("src","../../.." + banner.path);
                    $("a[name='chineseName']").text(banner.movie.chineseName);
                    $("small[name='englishName']").text(banner.movie.englishName);
                    $("div[name='ban-add-date']").text(transferTime(banner.banAddDate));
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    })
</script>

<%-- 编辑轮播图 --%>
<script>
    $(document).ready(function () {
        $(document).on("click", "a[id^='edit-btn-']", function(){
            let banId = $(this).attr("banId");
            $.ajax({
                url: "selectMovieNotInBanList",
                async: false,
                data: {
                    "banId": banId,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let banner = data["banner"];
                    let movieList = data["movieList"];

                    // 设置更新链接 传递要修改的banId
                    $("#update-form").attr("action","/admin/banner/update_banner?banId=" + banner.banId);
                    // 加载所属电影选择下拉项
                    $("select[name='movie-edit']").empty();
                    $("select[name='movie-edit']").append('<option value=\"' + banner.movie.movieId + '\">' + banner.movie.chineseName + '</option>');
                    for (let i = 0;i < movieList.length;i++){
                        $("select[name='movie-edit']").append('<option value=\"' + movieList[i].movieId + '\">' + movieList[i].chineseName + '</option>');
                    }
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    })
</script>

<%-- 新增轮播图 --%>
<script>
    $(document).ready(function () {
        $("#add-btn").click(function () {
            $.ajax({
                url: "selectMovieNotInBanList",
                async: false,
                data: {

                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let movieList = data["movieList"];
                    // 加载电影选择下拉项
                    $("select[name='movie-add']").empty();
                    $("select[name='movie-add']").append('<option value="-1">-- --</option>');
                    for (let i = 0;i < movieList.length;i++){
                        $("select[name='movie-add']").append('<option value=\"' + movieList[i].movieId + '\">' + movieList[i].chineseName + '</option>');
                    }
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    })
</script>

<%-- 搜索框内容变化 实时更新轮播列表 --%>
<script>
    $(document).ready(function () {
        // input propertychange --- input的实时内容更新事件
        $('body').on('input propertychange', "#keyWord", function () {
            let keyWord = $("#keyWord").val();
            $.ajax({
                url: "refresh_list",
                async: false,
                data: {
                    "keyWord": keyWord,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    let bannerList = data["bannerList"];
                    $("#bannerList").empty();
                    if (bannerList.length > 0) {                        // 有结果
                        for (let i = 0; i < bannerList.length; i++) {
                            // 轮播列表
                            let eachText =
                                '                                <tr>\n' +
                                '                                    <td><img src="../../../..' + bannerList[i].path + '" style=";width: 160px;height: 90px;"></td>\n' +
                                '                                    <td>\n' +
                                '                                        <a class="client-link">' + bannerList[i].movie.chineseName + '</a>\n' +
                                '                                        <br>\n' +
                                '                                        <small>' + bannerList[i].movie.englishName + '</small>\n' +
                                '                                    </td>\n' +
                                '                                    <td>\n' +
                                '                                        <small>添加于：</small><br>\n' +
                                '                                        ' + transferTime(bannerList[i].banAddDate) + '\n' +
                                '                                    </td>\n' +
                                '                                    <td class="project-actions">\n' +
                                '                                        <a id="info-btn-' + bannerList[i].banId + '" banId="' + bannerList[i].banId + '"\n' +
                                '                                           data-toggle="modal" href="#detail-form" class="btn btn-white btn-sm"><i class="fa fa-folder"></i> 查看 </a>\n' +
                                '                                        <a id="edit-btn-' + bannerList[i].banId + '" banId="' + bannerList[i].banId + '"\n' +
                                '                                           data-toggle="modal" href="#edit-form" class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> 编辑 </a>\n' +
                                '                                        <a id="delete-btn-' + bannerList[i].banId + '" banId="' + bannerList[i].banId + '"\n' +
                                '                                           data-toggle="modal" href="#edit-form" class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> 删除 </a>\n' +
                                '                                    </td>\n' +
                                '                                </tr>\n'
                            ;
                            $("#bannerList").append(eachText);
                        }
                    }
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
        })
    })
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

<%-- 删除提示框 --%>
<script>
    $(document).ready(function () {
        $(document).on("click", "a[id^='delete-btn-']", function(){
            let banId = $(this).attr("banId");
            let banner = null;
            $.ajax({
                url: "selectBannerById",
                async: false,
                data: {
                    "banId": banId,
                },
                type: "POST",
                dataType: "json",
                // contentType : "application/json;charset=UTF-8",
                success: function (data) {
                    banner = data["banner"];
                },
                error: function () {
                    alert("ajax请求错误");
                }
            });
            swal({
                title: "您确定要删除此轮播图吗",
                text: "< " + banner.movie.chineseName + " >" + "\n\n删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false,
                cancelButtonText:"取消",
            }, function () {                    // 选择删除
                //后台执行删除
                $.ajax({
                    url: "delete_banner",
                    async: false,
                    data: {
                        "banId": banId,
                    },
                    type: "POST",
                    dataType: "json",
                    // contentType : "application/json;charset=UTF-8",
                    success: function (data) {
                        swal("删除成功！", "您已经删除此轮播图。", "success");
                    },
                    error: function () {
                        swal("删除失败！", "您尚未删除此轮播图。", "error");
                    }
                });

                // 无论删除与否 执行完成后 再次刷新列表
                $.ajax({
                    url: "refresh_list",
                    async: false,
                    data: {
                        "keyWord": "",
                    },
                    type: "POST",
                    dataType: "json",
                    // contentType : "application/json;charset=UTF-8",
                    success: function (data) {
                        let bannerList = data["bannerList"];
                        $("#bannerList").empty();
                        if (bannerList.length > 0) {                        // 有结果
                            for (let i = 0; i < bannerList.length; i++) {
                                // 轮播列表
                                let eachText =
                                    '                                <tr>\n' +
                                    '                                    <td><img src="../../../..' + bannerList[i].path + '" style=";width: 160px;height: 90px;"></td>\n' +
                                    '                                    <td>\n' +
                                    '                                        <a class="client-link">' + bannerList[i].movie.chineseName + '</a>\n' +
                                    '                                        <br>\n' +
                                    '                                        <small>' + bannerList[i].movie.englishName + '</small>\n' +
                                    '                                    </td>\n' +
                                    '                                    <td>\n' +
                                    '                                        <small>添加于：</small><br>\n' +
                                    '                                        ' + transferTime(bannerList[i].banAddDate) + '\n' +
                                    '                                    </td>\n' +
                                    '                                    <td class="project-actions">\n' +
                                    '                                        <a id="info-btn-' + bannerList[i].banId + '" banId="' + bannerList[i].banId + '"\n' +
                                    '                                           data-toggle="modal" href="#detail-form" class="btn btn-white btn-sm"><i class="fa fa-folder"></i> 查看 </a>\n' +
                                    '                                        <a id="edit-btn-' + bannerList[i].banId + '" banId="' + bannerList[i].banId + '"\n' +
                                    '                                           data-toggle="modal" href="#edit-form" class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> 编辑 </a>\n' +
                                    '                                        <a id="delete-btn-' + bannerList[i].banId + '" banId="' + bannerList[i].banId + '"\n' +
                                    '                                           data-toggle="modal" href="#edit-form" class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> 删除 </a>\n' +
                                    '                                    </td>\n' +
                                    '                                </tr>\n'
                                ;
                                $("#bannerList").append(eachText);
                            }
                        }
                    },
                    error: function () {
                        alert("ajax请求错误");
                    }
                });
            });
        });
    })

</script>


</body>
</html>

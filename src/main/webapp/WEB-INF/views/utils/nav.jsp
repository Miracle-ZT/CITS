<%@ page import="sfw.xmut.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: Miracle-ZT
  Date: 2023/1/18
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-expand-lg" style="background: rgba(239,239,239,0.2)">
    <%--    <nav class="navbar navbar-expand-lg bg-body-tertiary">--%>
    <div class="container-fluid">
        <a class="navbar-brand" style="font-size: 35px;margin-right: 35px" href="/home/index">
            <img src="../../../resources/img/logo.png" alt="Logo" width="50px" height="50px"
                 class="d-inline-block align-text-top" style="margin-top: -4px">
            <font color="#6495ed">XiaoLan Movie</font>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <button class="btn btn-outline-primary btn-sm" style="border-radius: 40px" data-bs-toggle="modal"
                data-bs-target="#exampleModal">
            福州市
        </button>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary">确定</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="nav nav-pills me-auto">
                <%--                <ul class="navbar-nav me-auto mb-2 mb-lg-0">--%>
                <li class="nav-item" style="font-size: 20px;padding: 10px">
                    <a class="nav-link ${ac_home}" aria-current="page" href="/home/index">首页</a>
                </li>
                <li class="nav-item" style="font-size: 20px;padding: 10px">
                    <a class="nav-link ${ac_movie}" href="/home/movie?currPage=1&pageSize=14">电影</a>
                </li>
                <li class="nav-item" style="font-size: 20px;padding: 10px">
                    <a class="nav-link ${ac_cinema}" href="/home/cinema">影院</a>
                </li>
                <li class="nav-item" style="font-size: 20px;padding: 10px">
                    <a class="nav-link ${ac_top}" href="/home/top">榜单</a>
                </li>
                <li class="nav-item" style="font-size: 20px;padding: 10px">
                    <a class="nav-link ${ac_news}" href="/home/news">资讯</a>
                </li>

                <%
                    if (session.getAttribute("logined_user") != null) {                // 头像下拉框
                        User logined_user = (User) request.getSession().getAttribute("logined_user");
                %>
                <li class="nav-item dropdown" style="font-size: 20px;padding: 5px;margin-left: 100px">
                    <!-- 已登录 -->
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <img src="../../../..<%=logined_user.getPhoto()%>"
                             style=";width: 40px;height: 40px;border-radius: 50%;overflow: hidden">
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/home/center/index?type=0">基本设置</a></li>
                        <li><a class="dropdown-item" href="/home/center/index?type=1">我的订单</a></li>
                        <li><a class="dropdown-item" href="/home/center/index?type=2">我的收藏</a></li>
                        <li><a class="dropdown-item" href="/home/center/index?type=3">我的评论</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/user/logout">退出登录</a></li>
                    </ul>
                </li>
                <%} else {%>                                                             <!-- 未登录 -->
                <li class="nav-item dropdown" style="font-size: 20px;padding: 5px;margin-left: 100px">
                    <a class="nav-link dropdown-toggle" href="/user/login" role="button"
                       aria-expanded="false">
                        <img src="../../../resources/img/default_user_head.png"
                             style=";width: 40px;height: 40px;border-radius: 50%;overflow: hidden">
                    </a>
                </li>
                <%}%>

            </ul>
            <form action="${pageContext.request.contextPath}/home/search_content"
                  class="d-flex" role="search" style="margin-top: 15px">
                <input name="keyWord" class="form-control me-2" type="search" placeholder="影视剧、影人、影院"
                       aria-label="Search" value="">
                <button id="submit-keyword" class="btn btn-outline-primary" type="submit">
                    <?xml version="1.0" encoding="UTF-8"?>
                    <svg width="24" height="24" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M21 38C30.3888 38 38 30.3888 38 21C38 11.6112 30.3888 4 21 4C11.6112 4 4 11.6112 4 21C4 30.3888 11.6112 38 21 38Z"
                              fill="none" stroke="#2196f3" stroke-width="4" stroke-linejoin="round"/>
                        <path d="M26.657 14.3431C25.2093 12.8954 23.2093 12 21.0001 12C18.791 12 16.791 12.8954 15.3433 14.3431"
                              stroke="#2196f3" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M33.2216 33.2217L41.7069 41.707" stroke="#2196f3" stroke-width="4"
                              stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </button>
            </form>
        </div>
    </div>
</nav>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>万达企业服务</title>
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Simple Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //For-Mobile-Apps-and-Meta-Tags -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
<h1>某某公司后台登录系统</h1>
<div class="container w3">
    <h2>现在登录</h2>
    <form action="/lookPro/index" method="post">
        <div class="username">
            <span class="username" style="height:19px">用户:</span>
            <input type="text" name="name" class="name" placeholder="" required="">
            <div class="clear"></div>
        </div>
        <div class="password-agileits">
            <span class="username"style="height:19px">密码:</span>
            <input type="password" name="password" id="password" class="password" placeholder="" required="">
            <div class="clear"></div>
        </div>
        <div class="rem-for-agile">
            <input type="checkbox" name="remember" class="remember">记得我
            　　
            <br>
            <a href="#">忘记了密码</a><br>
        </div>
        <div class="login-w3">
            <input type="submit" class="login" value="Login" id="login">
        </div>
        <div class="clear"></div>
    </form>
</div>
<div class="footer-w3l">
    <p> 某某公司后台登录系统</p>
</div>
</body>
<script>

</script>
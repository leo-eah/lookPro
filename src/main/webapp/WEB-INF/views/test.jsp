<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>万达企业服务</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width,initial-scake=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!-- //For-Mobile-Apps-and-Meta-Tags -->
    <%--<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>--%>
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>
                h3. 这是一套可视化布局系统.1231
            </h3>
            <div class="row clearfix">
                <div class="col-md-2 column">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active">
                            <a href="#">首页</a>
                        </li>
                        <li>
                            <a href="#">简介</a>
                        </li>
                        <li class="disabled">
                            <a href="#">信息</a>
                        </li>

                    </ul>
                </div>
                <div class="col-md-10 column">
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <form role="form" class="form-inline">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label><input type="email" class="form-control" id="exampleInputEmail1" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label><input type="password" class="form-control" id="exampleInputPassword1" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">File input</label><input type="file" id="exampleInputFile" />
                                    <p class="help-block">
                                        Example block-level help text here.
                                    </p>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" />Check me out</label>
                                </div> <button type="submit" class="btn btn-default">Submit</button>
                            </form>
                            <ul class="pagination">
                                <li>
                                    <a href="#">Prev</a>
                                </li>
                                <li>
                                    <a href="#">1</a>
                                </li>
                                <li>
                                    <a href="#">2</a>
                                </li>
                                <li>
                                    <a href="#">3</a>
                                </li>
                                <li>
                                    <a href="#">4</a>
                                </li>
                                <li>
                                    <a href="#">5</a>
                                </li>
                                <li>
                                    <a href="#">Next</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 column">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
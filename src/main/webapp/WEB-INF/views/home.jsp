<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>万达企业服务</title>
    <meta name="viewport" content="width=device-width,initial-scake=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!-- //For-Mobile-Apps-and-Meta-Tags -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fileinput.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/public.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/fileinput.js"></script>
    <script src="<%=request.getContextPath()%>/js/zh.js"></script>
</head>

<body style="background-image:url(<%=request.getContextPath()%>/image/home.jpg)">

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">万达演示</a>
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
<div class="container" style="margin-top: 60px">
    <div class="row clearfix">
        <div class="col-md-2 column"></div>
        <div class="col-md-8 column" style="margin-top: 100px">
            <div class="form-inline" role="form">
                <div class="form-group">
                    <span> 项目名称：</span>
                 <input type="text" id="proid" name="proname" class="form-control" value="${proname}" >&nbsp;&nbsp;&nbsp;
                    <span>提交人：</span>
                 <input type="text" id="publisherid" name="publishername" class="form-control" value="${publisherName}" >
                </div>
                <div class="form-group">
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="btn btn-default" value="查询">
                    &nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary btn-default" data-toggle="modal" data-target="#myModal" id="modal">新建</button>

                </div>
            </div>



            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" >
                <div class="modal-dialog">

                    <div class="modal-content">
                        <div class="modal-header">

                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                新建项目
                            </h4>
                        </div>
                        <form action="<%=request.getContextPath()%>/lookPro/upload" name="pro" method="post" enctype="multipart/form-data">

                        <div class="modal-body">
                                <div class="input-group">
                                    <span class="input-group-addon">项目名称</span>
                                    <input type="text" class="form-control" name="proName" placeholder="啦啦啦">
                                </div>
                                <div class="input-group" style="margin-top: 10px">
                                    <span class="input-group-addon">上传人&nbsp;</span>
                                    <input type="text" class="form-control" name="author" placeholder="哒哒哒">

                                </div>
                                <div  style="margin-top: 10px">
                                    <input id="file" type="file"name="pro" class="file"></div>

                            </div>
                        </form>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="button" class="btn btn-primary">
                                提交
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

        <table class="table table-striped" style="margin-top: 20px">
            <caption>项目列表</caption>
            <thead>
            <tr>
                <th>序号</th>
                <th>项目名称</th>
                <th>项目版本</th>
                <th>上传时间</th>
                <th colspan="3">操作</th>

            </tr>

            </thead>
            <c:forEach varStatus="status" var="pro" items="${proList}">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${pro.proName}</td>
                    <td>${pro.author}</td>
                    <td>${pro.createTime}</td>
                    <td style="text-align: center">查看 更新 删除</td>

                </tr>
            </c:forEach>
        </table>
        </div>
        <div class="col-md-2 column"></div>
    </div>
</div>
</body>
<script>
$(function () {
    var oFileInput = new FileInput();
    oFileInput.Init("file","/lookpro/upload");
});
//$(document).ready(function(){
//    $('#modal').click(function () {
//       $("#myModal").modal('show');
//    })
//})
//初始化fileinput
var FileInput = function () {
    var oFile = new Object();

    //初始化fileinput控件（第一次初始化）
    oFile.Init = function(ctrlName, uploadUrl) {
        var control = $('#' + ctrlName);

        //初始化上传控件的样式
        control.fileinput({
            uploadUrl: uploadUrl, //上传的地址
            allowedFileExtensions: ['jpg', 'zip', 'rar'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            dropZoneEnabled: false,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
           // maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount:true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        });

        //导入文件上传完成之后的事件
        $("#file").on("fileuploaded", function (event, data, previewId, index) {
            $("#myModal").modal("hide");
            var data = data.response.lstOrderImport;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            }
            //1.初始化表格
            var oTable = new TableInit();
            oTable.Init(data);
            $("#div_startimport").show();
        });
    }
    return oFile;
};
function  look(name) {

}
</script>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新用户注册</title>
    <script src="static-res/js/jquery.js"></script>
    <link href="static-res/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="static-res/css/index_css.css" rel="stylesheet">
    <script src="static-res/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>


<div class="container">
    <div class="row" style="height:200px">
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4">


            <form class="form-horizontal" action="<%=basePath%>register_user" method="POST">
                <div class="form-group">
                    <h4 class="form-title" style="padding-left:90px">新用户注册 (<a href="<%=basePath%>">去登陆</a>)</h4>
                </div>
                <div class="form-group">
                    <label for="inputUsername" class="col-sm-2 control-label">用户:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputUsername"
                               placeholder="输入用户名" name="user">
                        <span class="help-block" style="color:red" id="span_u"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">密码:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputPassword"
                               placeholder="输入密码" name="password">
                        <span class="help-block" style="color:red" id="span_p"></span>
                    </div>
                </div>
                <div class="form-group" style="padding-left:80px">
                    <label class="radio-inline">
                        <input type="radio" name="role" value="0" checked>普通店员注册
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="role" value="1">管理员注册
                    </label>
                </div>
                <div class="form-group" style="padding-left:80px">
                    <button type="submit" class="btn btn-info" id="itbtn" style="width:140px">注册</button>
                    <button type="reset" class="btn btn-warning" style="width:140px">清除</button>
                </div>
            </form>


        </div>
    </div>
    <div class="row"></div>
</div>


<input type="hidden" id="msg" value="${info}">

<script type="text/javascript">
    $(function () {
        var msg = $("#msg").val();
        if (msg == "1") {
            alert("注册成功");
        }
        if (msg == "0") {
            $("#span_u").text("用户名已存在或输入值非法");
        }
    });

    $("#itbtn").click(function () {
        var checkuser = $("#inputUsername").val().trim();
        var checkpass = $("#inputPassword").val();
        if (checkuser == "" || checkuser.length == 0 || checkpass == "" || checkpass.length == 0) {
            $("#span_u").text("用户名或密码不能为空");
            return false;
        } else {
            return true;
        }
    });
    $("#inputUsername").change(function () {
        $("#span_u").text("");
        $("#span_p").text("");
    });
    $("#inputPassword").change(function () {
        $("#span_u").text("");
        $("#span_p").text("");
    });
</script>


</body>
</html>

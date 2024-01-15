<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


    <title>医药信息管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="static-res/js/jquery.js"></script>
    <link href="static-res/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="static-res/css/main.css" rel="stylesheet">
    <script src="static-res/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>

<body>
<c:if test="${empty sessionScope.login }">
    <script type="text/javascript">
        window.location.href = "<%=basePath%>index.jsp";
    </script>
</c:if>
<c:if test="${not empty requestScope.msg }">
    <script type="text/javascript">
        alert('${requestScope.msg }');
    </script>
</c:if>
<div class="container-fluid">
    <div class="row" style="background-color:rgba(232,232,232,0.6);">
        <div class="main_nav">
            <h1>医药信息管理系统</h1>
        </div>
    </div>
    <div class="row" style="height:50px">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="collapse navbar-collapse"
                     id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="<%=basePath%>main">药品基础信息</a></li>
                        <li><a href="<%=basePath%>tostore">进货信息</a></li>
                        <li><a href="<%=basePath%>store">药品库存信息</a></li>
                        <li><a href="<%=basePath%>sell">零售信息</a></li>
                        <li><a href="<%=basePath%>rx">处方药管理</a></li>
                        <li><a href="<%=basePath%>date">效期提示</a></li>
                        <li><a href="<%=basePath%>storetip">库存预警</a></li>
                        <li><a href="<%=basePath%>sellover">缺货信息</a></li>
                        <li><a href="<%=basePath%>tips">销售记录</a></li>
                        <li><a href="<%=basePath%>clerk_manage">员工管理</a></li>
                        <li><a href="<%=basePath%>index.jsp">退出系统</a></li>
                        <li><a href="#">欢迎${login.user}登录系统</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="row" style="padding-top:3px">
        <ul class="nav nav-tabs nav-justified">
            <li role="presentation"><a href="<%=basePath%>main">搜索药品信息</a></li>
            <li role="presentation"><a href="<%=basePath%>druginfo">查看药品信息</a></li>
            <li role="presentation" class="active"><a href="<%=basePath%>adddrug">添加药品信息</a></li>
        </ul>
    </div>
    <div class="row col-md-4 col-md-offset-4">
        <form action="<%=basePath%>adddrugval" method="post">
            <div class="form-group">
                <label for="inputdn" class="control-label">药品名称:</label><span class="forclean" style="color:red"
                                                                                  id="span_dn"></span>
                <input type="text" class="form-control input-sm" id="inputdn" name="drugname"
                       value="${olddrug.drugname }">
            </div>
            <div class="form-group">
                <label for="inputcs" class="control-label">厂商:</label><span class="forclean" style="color:red"
                                                                              id="span_cs"></span>
                <input type="text" class="form-control input-sm" id="inputcs" name="changshang"
                       value="${olddrug.changshang }">
            </div>
            <div class="form-group">
                <label for="inputbz" class="control-label">备注:</label><span class="forclean" style="color:red"
                                                                              id="span_bz"></span>
                <input type="text" class="form-control input-sm" id="inputbz" name="beizhu" value="${olddrug.beizhu }">
            </div>
            <div class="form-group">
                <label for="inputloc" class="control-label">药品位置:</label><span class="forclean" style="color:red"
                                                                                   id="span_loc"></span>
                <input type="text" class="form-control input-sm" id="inputloc" name="location"
                       value="${olddrug.location }">
            </div>
            <div class="form-group">
                <label for="inputdw" class="control-label">单位:</label><span class="forclean" style="color:red"
                                                                              id="span_dw"></span>
                <input type="text" class="form-control input-sm" id="inputdw" name="unit" value="${olddrug.unit }">
            </div>
            <div class="form-group">
                <label for="inputgg" class="control-label">规格:</label><span class="forclean" style="color:red"
                                                                              id="span_gg"></span>
                <input type="text" class="form-control input-sm" id="inputgg" name="guige" value="${olddrug.guige }">
            </div>
            <div class="form-group">
                <label for="inputti" class="control-label">条形码:</label><span class="forclean" style="color:red"
                                                                                id="span_ti"></span>
                <input type="text" class="form-control input-sm" id="inputti" name="tiaoxingma"
                       value="${olddrug.tiaoxingma }">
            </div>
            <div class="form-group text-right">
                <button type="submit" class="btn btn-primary" id="btn-edit">确认添加</button>
                <button type="reset" class="btn btn-default">清除</button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    $("#btn-edit").click(function () {
        var tip = "格式错误或超过字数限制";
        var checkdn = valid_it(/^.{1,22}$/, "#inputdn", "#span_dn", "药品名称", tip);
        var checkcs = valid_it(/^.{1,22}$/, "#inputcs", "#span_cs", "厂商", tip);
        var checkbz = valid_it(/^.{1,22}$/, "#inputbz", "#span_bz", "备注", tip);
        var checkloc = valid_it(/^.{1,22}$/, "#inputloc", "#span_loc", "药品位置", tip);
        var checkdw = valid_it(/^.{1,10}$/, "#inputdw", "#span_dw", "单位", tip);
        var checkgg = valid_it(/^.{1,22}$/, "#inputgg", "#span_gg", "规格", tip);
        var checkti = valid_ti(/^[0-9]{6,22}$/, "#inputti", "#span_ti", "条形码", "不是条形码格式");
        if (checkdn && checkcs && checkbz && checkloc && checkdw && checkgg && checkti) {
            return true;
        } else {
            return false;
        }
    });
    $("#inputdn").change(function () {
        $("#span_dn").text("");
    });
    $("#inputcs").change(function () {
        $("#span_cs").text("");
    });
    $("#inputbz").change(function () {
        $("#span_bz").text("");
    });
    $("#inputloc").change(function () {
        $("#span_loc").text("");
    });
    $("#inputdw").change(function () {
        $("#span_dw").text("");
    });
    $("#inputgg").change(function () {
        $("#span_gg").text("");
    });
    $("#inputti").change(function () {
        $("#span_ti").text("");
    });

    function valid_ti(regstr, id, span, show, tips) {
        if ($(id).val().trim() == "" || $(id).val().length == 0) {
            $(id).val($(id).val().trim());
            return true;
        } else if (!regstr.test($(id).val())) {
            $(span).text(tips);
            return false;
        } else {
            return true;
        }
    };

    function valid_it(regstr, id, span, show, tips) {
        if ($(id).val().trim() == "" || $(id).val().length == 0) {
            $(span).text(show + "不能为空");
            return false;
        } else if (!regstr.test($(id).val().trim())) {
            $(span).text(tips);
            return false;
        } else {
            $(id).val($(id).val().trim());
            return true;
        }
    };
</script>
</body>
</html>




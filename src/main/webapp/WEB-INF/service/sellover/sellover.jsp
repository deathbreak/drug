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
                        <li><a href="<%=basePath%>main">药品基础信息</a></li>
                        <li><a href="<%=basePath%>tostore">进货信息</a></li>
                        <li><a href="<%=basePath%>store">药品库存信息</a></li>
                        <li><a href="<%=basePath%>sell">零售信息</a></li>
                        <li><a href="<%=basePath%>rx">处方药管理</a></li>
                        <li><a href="<%=basePath%>date">效期提示</a></li>
                        <li><a href="<%=basePath%>storetip">库存预警</a></li>
                        <li class="active"><a href="<%=basePath%>sellover">缺货信息</a></li>
                        <li><a href="<%=basePath%>tips">销售记录</a></li>
                        <li><a href="<%=basePath%>clerk_manage">员工管理</a></li>
                        <li><a href="<%=basePath%>index.jsp">退出系统</a></li>
                        <li><a href="#">欢迎${login.user}登录系统</a></li>
                    </ul>
                </div>

            </div>
        </nav>
    </div>
    <c:if test="${sellover.size()>0 }">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>药品名称</th>
                        <th>厂商</th>
                        <th>销售价格</th>
                        <th>售完的时间</th>
                        <th>批号</th>
                        <th>备注</th>
                        <th>库存</th>
                        <th>单位</th>
                        <th>规格</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${sellover }" var="dq">
                        <tr>
                            <td>${dq.drugname }</td>
                            <td>${dq.changshang }</td>
                            <td>${dq.price }</td>
                            <td>${dq.date }</td>
                            <td>${dq.pihao }</td>
                            <td>${dq.beizhu }</td>
                            <td>${dq.count }</td>
                            <td>${dq.unit }</td>
                            <td>${dq.guige }</td>
                            <td>
                                <button type="button" class="btn btn-danger btn-sm">
										<span class="glyphicon glyphicon-ban-circle"
                                              aria-hidden="true"></span>删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </c:if>

</div>
<form id="ff" action="<%=basePath%>delsellover" method="POST">
    <input type="hidden" name="drugname" value="" id="inputdn">
    <input type="hidden" name="changshang" value="" id="inputcs">
    <input type="hidden" name="pihao" value="" id="inputph">
</form>
<script type="text/javascript">
    $(".btn.btn-danger.btn-sm").click(function () {
        $("#inputdn").val($(this).parents("tr").children("td").eq(0).text());
        $("#inputcs").val($(this).parents("tr").children("td").eq(1).text());
        $("#inputph").val($(this).parents("tr").children("td").eq(4).text());
        $("#ff").submit();
    });
</script>
</body>
</html>




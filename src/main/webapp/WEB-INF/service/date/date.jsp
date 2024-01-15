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
                        <li class="active"><a href="<%=basePath%>date">效期提示</a></li>
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
    <c:if test="${not empty requestScope.datetips }">
        <c:if test="${datetips[0].flag == 'notip'}">
            <div class="row">
                <div class="page-header">
                    <h3 class="text-center">
                        没有将在6个月内失效的药品信息！<small>效期预警时长可以设置</small>
                    </h3>
                </div>
            </div>
        </c:if>
        <c:if test="${datetips[0].flag != 'notip'}">
            <div class="row">
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>药品名称</th>
                        <th>厂商</th>
                        <th>进价</th>
                        <th>销售价格</th>
                        <th>有效期至</th>
                        <th>批号</th>
                        <th>备注</th>
                        <th>药品位置信息</th>
                        <th>库存</th>
                        <th>单位</th>
                        <th>规格</th>
                        <th>效期提示</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${datetips }" var="ds">
                        <tr class="${ds.flag == 'r'?'danger':'warning'}">
                            <td>${ds.drugname }</td>
                            <td>${ds.changshang }</td>
                            <td>${ds.beginprice }</td>
                            <td>${ds.price }</td>
                            <td>${ds.date }</td>
                            <td>${ds.pihao }</td>
                            <td>${ds.beizhu }</td>
                            <td>${ds.location }</td>
                            <td>${ds.count }</td>
                            <td>${ds.unit }</td>
                            <td>${ds.guige }</td>
                            <td>${ds.tip }</td>
                            <td>
                                <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">
                                    <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:if>
    </c:if>
</div>

<!-- 模态框 2-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center" style="color:red">确定删除吗?</h4>
            </div>
            <div class="modal-body">
                <form action="<%=basePath%>deletetip" method="post">
                    <input type="hidden" id="inputdn-del" name="drugname" value="">
                    <input type="hidden" id="inputcs-del" name="changshang" value="">
                    <input type="hidden" id="inputph-del" name="pihao" value="">
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary">确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(".btn.btn-info.btn-sm").click(function () {
        $("#inputdn-del").val($(this).parents("tr").children("td").eq(0).text());
        $("#inputcs-del").val($(this).parents("tr").children("td").eq(1).text());
        $("#inputph-del").val($(this).parents("tr").children("td").eq(5).text());
    });
</script>
</body>
</html>




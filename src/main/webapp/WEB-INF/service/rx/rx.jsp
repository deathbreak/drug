<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>销售管理系统</title>
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>	
	<link href="static-res/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="static-res/css/main.css" rel="stylesheet">
	<script src="static-res/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

  </head>
  
  <body>
  <c:if test="${empty sessionScope.login }">
  		<script type="text/javascript">
  			window.location.href="<%=basePath%>index.jsp";
  		</script>
  </c:if>
   <div class="container-fluid">
		<div class="row" style="background-color:rgba(232,232,232,0.6);">
			<div class="main_nav">
  				<h1>销售管理系统</h1>
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
						<li class="active"><a href="<%=basePath%>rx">处方药管理</a></li>
						<li><a href="<%=basePath%>date">效期提示</a></li>
						<li><a href="<%=basePath%>storetip">库存预警</a></li>
						<li><a href="<%=basePath%>sellover">缺货信息</a></li>
						<li><a href="<%=basePath%>tips">销售记录</a></li>
						<li><a href="<%=basePath%>index.jsp">退出系统</a></li>
						<li><a href="#">欢迎${login.user}登录系统</a></li>
					</ul>
				</div>

			</div>
			</nav>
		</div>
	</div>
  </body>
</html>




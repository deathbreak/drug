<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>医药信息管理系统</title>
	<script src="static-res/js/jquery.js"></script>	
	<link href="static-res/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="static-res/css/index_css.css" rel="stylesheet">
	<script src="static-res/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>	
  </head>
  <body>
  ${logininfo }
	<div class="container">
		<div class="row" style="height:200px">
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form class="form-horizontal" action="<%=basePath%>login" method="POST">
					<div class="form-group">
						<h4 class="form-title" style="padding-left:90px">欢迎使用医药信息管理系统</h4>
					</div>					
					<div class="form-group">
						<label for="inputUsername" class="col-sm-2 control-label">用户:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputUsername"
								placeholder="输入用户名" name="username">
							<span class="help-block" style="color:red" id="span_u">${logininfouser}</span>	
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-sm-2 control-label">密码:</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPassword"
								placeholder="输入密码" name="password">
							<span class="help-block" style="color:red" id="span_p">${logininfopass}</span>
						</div>
					</div>					
					<div class="form-group" style="padding-left:80px">
							<button type="submit" class="btn btn-info" id="itbtn" style="width:100px">登录</button>	
							<a href="<%=basePath%>register" class="btn btn-info" role="button" style="width:100px;margin-left:10px">注册</a>
					</div>
				</form>
			</div>
		</div>
		<div class="row"></div>
	</div>
	<script type="text/javascript">
		$("#itbtn").click(function(){
			var checkuser = $("#inputUsername").val().trim();
			var checkpass = $("#inputPassword").val();
			if(checkuser==""||checkuser.length==0||checkpass==""||checkpass.length==0){
				$("#span_u").text("用户名或密码不能为空");
				return false;
			}else{
				return true;
			}
		});
		$("#inputUsername").change(function(){
			$("#span_u").text("");
			$("#span_p").text("");
		});
		$("#inputPassword").change(function(){
			$("#span_u").text("");
			$("#span_p").text("");
		});
	</script>
</body>
</html>

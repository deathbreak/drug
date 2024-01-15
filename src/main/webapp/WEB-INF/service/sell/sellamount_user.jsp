<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
        window.location.href="<%=basePath%>index.jsp";
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
                        <li class="active"><a href="<%=basePath%>sell_user">零售信息</a></li>
                        <li><a href="<%=basePath%>rx_user">处方药管理</a></li>
                        <li><a href="<%=basePath%>index.jsp">退出系统</a></li>
                        <li><a href="#">欢迎${login.user}登录系统</a></li>
                    </ul>
                </div>

            </div>
        </nav>
    </div>

    <c:if test="${foraddamount.size()==0}">
        <div class="row">
            <div class="page-header">
                <h3 class="text-center">没有查询到符合条件的药品信息！<a href="<%=basePath%>sell_user">返回</a></h3>
            </div>
        </div>
    </c:if>

    <!--  -->
    <c:if test="${foraddamount.size()>0}">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>药品名称</th>
                        <th>厂商</th>
                        <th>销售价格</th>
                        <th>有效日期</th>
                        <th>批号</th>
                        <th>备注</th>
                        <th>药品位置信息</th>
                        <th>库存</th>
                        <th>单位</th>
                        <th>规格</th>
                        <th>输入销售数量</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                        <td>${foraddamount[0].drugname }</td>
                        <td>${foraddamount[0].changshang }</td>
                        <td>${foraddamount[0].price }</td>
                        <td>${foraddamount[0].date }</td>
                        <td>${foraddamount[0].pihao }</td>
                        <td>${foraddamount[0].beizhu }</td>
                        <td>${foraddamount[0].location }</td>
                        <td>${foraddamount[0].count }</td>
                        <td>${foraddamount[0].unit }</td>
                        <td>${foraddamount[0].guige }</td>
                        <td><input type="number" value="1" id="asd"></td>
                        <td>
                            <button class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>选择此药品
                            </button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </c:if>
    <!--  -->
</div>
<form id="ff" action="<%=basePath%>addsellamount_user" method="POST">
    <input type="hidden" name="drugname" value="" id="inputdn">
    <input type="hidden" name="changshang" value="" id="inputcs">
    <input type="hidden" name="pihao" value="" id="inputph">
    <input type="hidden" name="amount" value="" id="inputam">
</form>
<script type="text/javascript">
    $(".btn.btn-info.btn-sm").click(function(){
        $("#inputdn").val($(this).parents("tr").children("td").eq(0).text());
        $("#inputcs").val($(this).parents("tr").children("td").eq(1).text());
        $("#inputph").val($(this).parents("tr").children("td").eq(4).text());
        $("#inputam").val($("#asd").val().trim());
        var kc = $(this).parents("tr").children("td").eq(7).text();
        var amount = $("#asd").val().trim();
        //这里有个坑js比较数字是比较string类型,需要转化int
        if(parseInt(amount)>parseInt(kc)||parseInt(amount)<=0){
            alert("销售数量不能大于库存并且不能小于0!!!");
            return false;
        }else{
            $("#ff").submit();
        }
    });
</script>
</body>
</html>





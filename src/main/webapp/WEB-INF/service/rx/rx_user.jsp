
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
    <link href="static-res/bootstrap-3.3.7-dist/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="static-res/bootstrap-3.3.7-dist/datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script src="static-res/bootstrap-3.3.7-dist/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>
</head>

<body>
<c:if test="${empty sessionScope.login }">
    <script type="text/javascript">
        window.location.href="<%=basePath%>index.jsp";
    </script>
</c:if>
<!-- <c:if test="${not empty msg }">
  		<script type="text/javascript">
  		 alert('${msg}');
  		</script>
       </c:if>
  -->
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
                        <li><a href="<%=basePath%>sell_user">零售信息</a></li>
                        <li class="active"><a href="<%=basePath%>rx_user">处方药管理</a></li>
                        <li><a href="<%=basePath%>index.jsp">退出系统</a></li>
                        <li><a href="#">欢迎${login.user}登录系统</a></li>
                    </ul>
                </div>

            </div>
        </nav>
    </div>
    <div class="row" style="padding-top:3px">
        <ul class="nav nav-tabs nav-justified">
            <li role="presentation" class="active"><a href="<%=basePath%>rx_user">未填写的处方药信息</a></li>
            <li role="presentation"><a href="<%=basePath%>rxinfo_user">查看处方药登记记录</a></li>
        </ul>
    </div>
    <c:if test="${empty timeinfo}">
        <div class="row">
            <div class="page-header">
                <h3 class="text-center">没有未登记的处方药信息！</h3>
            </div>
        </div>
    </c:if>
    <c:if test="${timeinfo.size()>0}">
        <div class="row" style="padding-top:5px">
            <div class="col-md-12">
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>未登记的处方药购药时间</th>
                        <th>未登记的药品简略信息</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${timeinfo }" var="tt">
                        <tr>
                            <td>${tt.first }</td>
                            <td>${tt.second }</td>
                            <td>
                                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">
                                    <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>开始登记
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </c:if>
</div>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center" style="color:red">处方药信息填写</h4>
            </div>
            <div class="modal-body">
                <form action="<%=basePath%>addprx_user" method="post">
                    <input type="hidden" id="input-time" name="time" value="">
                    <table class="table table-hover table-condensed table-bordered">
                        <tr>
                            <td>*顾客姓名:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-name" name="name" placeholder="" value=""></td>
                            <td>性别:</td>
                            <td colspan="2">
                                <label class="radio-inline"><input type="radio" name="gendar" value="男" checked>男</label>
                                <label class="radio-inline"><input type="radio" name="gendar" value="女">女</label>
                            </td>
                        </tr>
                        <tr>
                            <td>年龄:</td>
                            <td colspan="2"><input type="number" class="form-control" id="input-age" name="age" placeholder="" value=""></td>
                            <td>*联系方式:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-phone" name="phone" placeholder="" value=""></td>
                        </tr>
                        <tr>
                            <td>*地址:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-loc" name="location" placeholder="" value=""></td>
                            <td>医疗机构名称:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-hos" name="hospital" placeholder="" value=""></td>
                        </tr>
                        <tr>
                            <td>就医日期:</td>
                            <td colspan="2"><input type="text" class="form-control input-sm picker" id="input-htime" name="htime" value="" readonly></td>
                            <td>医嘱内容:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-yz" name="yz" placeholder="" value=""></td>
                        </tr>
                        <tr>
                            <td>医师姓名:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-ysname" name="ysname" placeholder="" value=""></td>
                            <td>驻店药师签名:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-zdys" name="zdys" placeholder="" value=""></td>
                        </tr>

                    </table>
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary" id="checkbtn">提交</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">一会儿再填</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(".picker").datetimepicker({
        format : 'yyyy-mm-dd',
        language : 'zh-CN',
        minView : 2,
        autoclose : true,
    });
    $("#checkbtn").click(function(){
        if(valid_it("#input-name")&&valid_it("#input-phone")&&valid_it("#input-loc")){
            return true;
        }else{
            alert("带*符号的不能为空");
            return false;
        }
    });
    function valid_it(id){
        if($(id).val().trim()==""||$(id).val().length==0){
            return false;
        }else{
            $(id).val($(id).val().trim());
            return true;
        }
    };
    $(".btn.btn-info.btn-sm").click(function(){
        $("#input-time").val($(this).parents("tr").children("td").eq(0).text());
    });
</script>
</body>
</html>




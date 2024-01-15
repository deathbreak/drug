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
            <li role="presentation"><a href="<%=basePath%>rx_user">未填写的处方药信息</a></li>
            <li role="presentation" class="active"><a href="<%=basePath%>rxinfo_user">查看全部处方药登记记录</a></li>
        </ul>
    </div>

    <div class="row" style="padding-top:3px">
        <div class="col-md-3">
            <form action="<%=basePath%>queryrx_user" method="post">
                <div class="input-group col-md-12" >
                    <input type="text" class="form-control picker"
                           name="queryrx" value="" readonly/>
                    <span class="input-group-btn">
								<button class="btn btn-info" type="submit">日期查询处方登记记录</button>
							</span>
                </div>
            </form>
        </div>
        <div class="col-md-4">
            <form action="<%=basePath%>queryrx_user" method="post">
                <div class="input-group col-md-12" >
                    <input type="text" class="form-control"
                           name="queryrx" id="queryname" placeholder="输入要查询的处方药名称,可不输入全名" value=""/>
                    <span class="input-group-btn">
								<button class="btn btn-info" id="btn-submit" type="submit">按处方药药品名称查询</button>
							</span>
                </div>
            </form>
        </div>
    </div>

    <c:if test="${rxallinfo.size()==0}">
        <div class="row">
            <div class="page-header">
                <h3 class="text-center">没有处方药的登记信息！</h3>
            </div>
        </div>
    </c:if>
    <c:if test="${rxallinfo.size()>0}">
        <!-- //////// -->
        <div class="row" style="padding-top:5px">
            <c:forEach items="${rxallinfo }" var="it">
                <div class="panel panel-success">
                    <div class="panel-heading">处方药登记记录,购药时间:${it.rxperson[0].time }</div>
                    <table class="table table-hover table-condensed table-bordered">
                        <tr>
                            <td>顾客姓名:</td>
                            <td colspan="2">${it.rxperson[0].name }</td>
                            <td>性别:</td>
                            <td colspan="2">${it.rxperson[0].gendar }</td>
                        </tr>
                        <tr>
                            <td>年龄:</td>
                            <td colspan="2">${it.rxperson[0].age }</td>
                            <td>联系方式:</td>
                            <td colspan="2">${it.rxperson[0].phone }</td>
                        </tr>
                        <tr>
                            <td>地址:</td>
                            <td colspan="2">${it.rxperson[0].location }</td>
                            <td>医疗机构名称:</td>
                            <td colspan="2">${it.rxperson[0].hospital }</td>
                        </tr>
                        <tr>
                            <td>就医日期:</td>
                            <td colspan="2">${it.rxperson[0].htime }</td>
                            <td>医嘱内容:</td>
                            <td colspan="2">${it.rxperson[0].yz }</td>
                        </tr>
                        <tr>
                            <td>医师姓名:</td>
                            <td colspan="2">${it.rxperson[0].ysname }</td>
                            <td>驻店药师签名:</td>
                            <td colspan="2">${it.rxperson[0].zdys }</td>
                        </tr>
                        <tr>
                            <th>购药时间</th>
                            <th>药品名称</th>
                            <th>厂商</th>
                            <th>有效日期</th>
                            <th>批号</th>
                            <th>购药数量</th>
                        </tr>
                        <c:forEach items="${it.rxdrug }" var="ds">
                            <tr>
                                <td>${ds.time }</td>
                                <td>${ds.drugname }</td>
                                <td>${ds.changshang }</td>
                                <td>${ds.date }</td>
                                <td>${ds.pihao }</td>
                                <td>${ds.count }</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="6">
                                <button type="button" class="btn btn-info btn-abcd" data-toggle="modal" data-target="#myModal" data-sss="${it.rxperson[0].time }">修改处方药登记记录</button>
                                <button type="button" class="btn btn-danger btn-acg" data-toggle="modal" data-target="#myModal2" data-delit="${it.rxperson[0].time }">删除</button>
                            </td>
                        </tr>
                    </table>
                    <br>
                </div>
            </c:forEach>
        </div>
        <!--  ////////////  -->
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
                <h4 class="modal-title text-center" style="color:red">处方药修改</h4>
            </div>
            <div class="modal-body">
                <form action="<%=basePath%>updaterxp_user" method="post">
                    <input type="hidden" id="input-time" name="time" value="">
                    <table class="table table-hover table-condensed table-bordered">
                        <tr>
                            <td>*顾客姓名:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-name" name="name" value=""></td>
                            <td>性别:</td>
                            <td colspan="2">
                                <label class="radio-inline"><input type="radio" name="gendar" value="男" checked>男</label>
                                <label class="radio-inline"><input type="radio" name="gendar" value="女">女</label>
                            </td>
                        </tr>
                        <tr>
                            <td>年龄:</td>
                            <td colspan="2"><input type="number" class="form-control" id="input-age" name="age"  value=""></td>
                            <td>*聊系方式:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-phone" name="phone"  value=""></td>
                        </tr>
                        <tr>
                            <td>*地址:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-loc" name="location"  value=""></td>
                            <td>医疗机构名称:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-hos" name="hospital"  value=""></td>
                        </tr>
                        <tr>
                            <td>就医日期:</td>
                            <td colspan="2"><input type="text" class="form-control input-sm picker" id="input-htime" name="htime" value="" readonly></td>
                            <td>医嘱内容:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-yz" name="yz" value=""></td>
                        </tr>
                        <tr>
                            <td>医师姓名:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-ysname" name="ysname"  value=""></td>
                            <td>驻店药师签名:</td>
                            <td colspan="2"><input type="text" class="form-control" id="input-zdys" name="zdys"  value=""></td>
                        </tr>

                    </table>
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary" id="checkbtn">确认修改</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>




<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
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
                <form action="<%=basePath%>delrxinfo_user" method="post">
                    <input type="hidden" name="del" id="fordel" value="">
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary" id="btn-edit-del">确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
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
    $("#btn-submit").click(function() {
        $("#queryname").val($("#queryname").val().trim());
    })

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
    $(".btn.btn-danger.btn-acg").click(function(){
        $("#fordel").val($(this).data("delit"));
    });
    $(".btn.btn-info.btn-abcd").click(function(){
        $("#input-time").val($(this).data("sss"));
        $.ajax({
            url:"<%=basePath%>getrxtime_user",
            type:"POST",
            data:{time:$(this).data("sss")},
            success:function(res){
                $("#input-time").val(res.time);
                $("#input-name").val(res.name);
                $("#input-age").val(res.age);
                $("#input-phone").val(res.phone);
                $("#input-loc").val(res.location);
                $("#input-hos").val(res.hospital);
                $("#input-htime").val(res.htime);
                $("#input-yz").val(res.yz);
                $("#input-ysname").val(res.ysname);
                $("#input-zdys").val(res.zdys);
            }
        });
    });
</script>
</body>
</html>




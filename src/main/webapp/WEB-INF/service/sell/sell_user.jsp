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
<c:if test="${not empty msg }">
    <script type="text/javascript">
        alert('${msg}');
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


    <c:if test="${not empty requestScope.sellinfo }">
        <c:set var="countsum" value="0"></c:set>
        <c:forEach items="${sellinfo }" var="it">
                						<c:set var="countsum" value="${countsum+it.sum }"></c:set>
        </c:forEach>
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
                        <th>库存</th>
                        <th>单位</th>
                        <th>规格</th>
                        <th>数量</th>
                        <th>金额</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${sellinfo }" var="jh">
                        <tr>
                            <td>${jh.drugname }</td>
                            <td>${jh.changshang }</td>
                            <td>${jh.price }</td>
                            <td>${jh.date }</td>
                            <td>${jh.pihao }</td>
                            <td>${jh.beizhu }</td>
                            <td>${jh.count }</td>
                            <td>${jh.unit }</td>
                            <td>${jh.guige }</td>
                            <td>${jh.amount }</td>
                            <td>${jh.sum }</td>
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
            <div class="text-center">总金额:${countsum }元</div>
        </div>
    </c:if>

    <div class="row" style="height:50px">

    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <form action="<%=basePath%>queryselldruginfo_user" method="post">
                <div class="input-group input-group-lg">
                    <input type="text" class="form-control" placeholder="输入条形码或药品名"
                           name="querydrug"> <span class="input-group-btn">
							<button class="btn btn-default" type="submit">查询</button>
						</span>
                </div>
            </form>
        </div>
        <div>
            <a class="btn btn-info btn-lg" href="<%=basePath%>sellit_user" onclick="event.preventDefault(); check()" role="button">结算</a>
            <a class="btn btn-primary btn-lg" href="<%=basePath%>printsell_user" role="button">打印小票</a>
            <!-- printsell -->
            <c:if test="${not empty rxinfo }">
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>继续填写
                </button>
            </c:if>
        </div>
    </div>
</div>



<c:if test="${not empty rxinfo }">
    <script type="text/javascript">
        $(function(){
            $('#myModal').modal('show');
        })
    </script>
</c:if>
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
                <div class="row">
                    <h4 class="text-center">检测到${rxcount }条处方药信息还未记录,下面是刚才的一条.</h4>
                </div>
                <form action="<%=basePath%>addrxperson_user" method="post">
                    <input type="hidden" id="input-time" name="time" value="${rxinfo[0].time }">
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
                        <tr>
                            <th>购药时间</th>
                            <th>药品名称</th>
                            <th>厂商</th>
                            <th>有效日期</th>
                            <th>批号</th>
                            <th>购药数量</th>
                        </tr>
                        <c:forEach items="${rxinfo }" var="ds">
                            <tr>
                                <td>${ds.time }</td>
                                <td>${ds.drugname }</td>
                                <td>${ds.changshang }</td>
                                <td>${ds.date }</td>
                                <td>${ds.pihao }</td>
                                <td>${ds.count }</td>
                            </tr>
                        </c:forEach>
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
<form id="ff" action="<%=basePath%>deletesell_user" method="POST">
    <input type="hidden" name="drugname" value="" id="inputdn">
    <input type="hidden" name="changshang" value="" id="inputcs">
    <input type="hidden" name="pihao" value="" id="inputph">
    <input type="hidden" name="amount" value="" id="inputam">
</form>
<script type="text/javascript">
    $(".btn.btn-danger.btn-sm").click(function(){
        $("#inputdn").val($(this).parents("tr").children("td").eq(0).text());
        $("#inputcs").val($(this).parents("tr").children("td").eq(1).text());
        $("#inputph").val($(this).parents("tr").children("td").eq(4).text());
        $("#inputam").val($(this).parents("tr").children("td").eq(9).text());
        $("#ff").submit();
    });
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


    function check() {
        return new Promise((resolve, reject) => {
            $.ajax({
                url:"<%=basePath%>getlimitinfo_clerk",
                type:"POST",
                success(result) {
                    if(result.code == 200){
                        resolve(true);
                    }else {
                        alert(result.msg);
                        reject(false);
                    }
                },
                error(err) {
                    alert("请求出错");
                    reject(false);
                }
            });
        }).then(() => {
            window.location.href = "<%=basePath%>sellit_user";
        }).catch(() => {
            // Do nothing
        });
    }
</script>
</body>
</html>




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
    <link href="static-res/bootstrap-3.3.7-dist/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="static-res/bootstrap-3.3.7-dist/datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script src="static-res/bootstrap-3.3.7-dist/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>

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
                        <li class="active"><a href="<%=basePath%>tostore">进货信息</a></li>
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
            <li role="presentation" class="active"><a href="<%=basePath%>tostore">药品审核入库</a></li>
            <li role="presentation"><a href="<%=basePath%>jhrecords">查看进货记录</a></li>
            <li role="presentation"><a href="<%=basePath%>ghsinfo">供货商管理</a></li>
        </ul>
    </div>

    <c:if test="${empty druginfo }">
        <div class="row">
            <div class="page-header">
                <h3 class="text-center">没有药品信息！<a href="<%=basePath%>tostore">返回</a></h3>
            </div>
        </div>
    </c:if>

    <c:if test="${not empty druginfo }">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">添加入库药品信息</h3>
            </div>
            <form action="<%=basePath%>addjinhuo" method="post">
                <table class="table">
                    <tr>
                        <td>药品信息:</td>
                        <td><input type="text" class="form-control" name="drugname" value="${druginfo.drugname }"
                                   readonly></td>
                        <td>单位:</td>
                        <td><input type="text" class="form-control" name="unit" value="${druginfo.unit }" readonly></td>
                        <td>规格:</td>
                        <td><input type="text" class="form-control" name="guige" value="${druginfo.guige }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>生产厂商:</td>
                        <td><input type="text" class="form-control" name="changshang" value="${druginfo.changshang }"
                                   readonly></td>
                        <td>生产日期:</td>
                        <td><input type="text" class="form-control pickerbd" id="inputbd" name="begindate" value=""
                                   readonly></td>
                        <td>销售价格:</td>
                        <td><input type="number" step="0.0001" id="inputpri" class="form-control" name="price" value="">
                        </td>
                    </tr>
                    <tr>
                        <td>备注:</td>
                        <td><input type="text" class="form-control" name="beizhu" value="${druginfo.beizhu }" readonly>
                        </td>
                        <td>有效期至:</td>
                        <td><input type="text" class="form-control pickerda" id="inputda" name="date" value="" readonly>
                        </td>
                        <td>进价:</td>
                        <td><input type="number" step="0.0001" id="inputbp" class="form-control" name="beginprice"
                                   value=""></td>
                    </tr>
                    <tr>
                        <td>药品位置:</td>
                        <td><input type="text" class="form-control" name="location" value="${druginfo.location }"
                                   readonly></td>
                        <td>批号:</td>
                        <td><input type="text" id="inputph" class="form-control" name="pihao" value=""></td>
                        <td>数量:</td>
                        <td><input type="number" id="inputkc" class="form-control" name="amount" value=""></td>
                    </tr>
                    <tr>
                        <td>条形码:</td>
                        <td><input type="text" class="form-control" name="tiaoxingma" value="${druginfo.tiaoxingma }"
                                   readonly></td>
                        <td>进货时间:</td>
                        <td><input type="text" class="form-control picker" id="inputjht" name="jinhuo_time" value=""
                                   readonly></td>
                        <td>金额:</td>
                        <td><input type="number" step="0.0001" id="inputsum" class="form-control" name="sum" value="">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><span id="tips" style="color:red"></span></td>

                        <td>供货商:</td>
                        <td>
                            <select class="form-control" name="gonghuoshang" id="inputghs">
                                <option>点击选择供货商</option>
                                <c:if test="${not empty ghsinfo }">
                                    <c:forEach items="${ghsinfo }" var="ghs">
                                        <option>${ghs.gonghuoshang }</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </td>

                        <td></td>
                        <td>
                            <button type="submit" class="btn btn-primary btn-block" id="btn-submit">添加至入库列表
                            </button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </c:if>

</div>
<script type="text/javascript">
    $(".picker").datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        minView: 2,
        autoclose: true,
    });
    $(".pickerbd").datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        minView: 2,
        autoclose: true,
        endDate: new Date(),
    });
    $(".pickerda").datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        minView: 2,
        autoclose: true,
        startDate: new Date(),
    });
    $("#btn-submit").click(function () {
        var checkbp = valid_it(/^[1-9]\d*\.\d*|^0\.\d*[1-9]\d*$|^\d+$/, "#inputbp");
        var checkpri = valid_it(/^[1-9]\d*\.\d*|^0\.\d*[1-9]\d*$|^\d+$/, "#inputpri");
        var checkbd = valid_it(/^\d{4}-\d{2}-\d{2}$/, "#inputbd");
        var checkda = valid_it(/^\d{4}-\d{2}-\d{2}$/, "#inputda");
        var checkjht = valid_it(/^\d{4}-\d{2}-\d{2}$/, "#inputjht");
        var checkph = valid_it(/^.{1,30}$/, "#inputph");
        var checkkc = valid_it(/^[1-9]\d*$/, "#inputkc");
        var checksum = valid_it(/^[1-9]\d*\.\d*|^0\.\d*[1-9]\d*$|^\d+$/, "#inputsum");
        var checkghs = valid_ghs("#inputghs");
        if (checkbp && checkpri && checkbd && checkda && checkph && checkkc && checkjht && checksum && checkghs) {
            return true;
        } else {
            alert("输入信息有误,可能是以下原因:1.有空格信息,2.输入格式有误,3.没有选择供货商");
            return false;
        }
    });

    $("#inputbp").change(function () {
        var bp = $("#inputbp").val().trim();
        var kc = $("#inputkc").val().trim();
        if (bp == "" | kc == "") {
        } else {
            $("#inputsum").val(numMulti(bp, kc));
        }
    });
    $("#inputkc").change(function () {
        var bp = $("#inputbp").val().trim();
        var kc = $("#inputkc").val().trim();
        if (bp == "" | kc == "") {
        } else {
            $("#inputsum").val(numMulti(bp, kc));
        }
    });

    function valid_it(regstr, id) {
        if ($(id).val().trim() == "" || $(id).val().length == 0) {
            return false;
        } else if (!regstr.test($(id).val().trim())) {
            return false;
        } else {
            $(id).val($(id).val().trim());
            return true;
        }
    };

    function valid_ghs(id) {
        if ($(id).val().trim() == "点击选择供货商") {
            return false;
        } else {
            $(id).val($(id).val().trim());
            return true;
        }
    }


    function numMulti(num1, num2) {
        var baseNum = 0;
        try {
            baseNum += num1.toString().split(".")[1].length;
        } catch (e) {
        }
        try {
            baseNum += num2.toString().split(".")[1].length;
        } catch (e) {
        }
        return Number(num1.toString().replace(".", ""))
            * Number(num2.toString().replace(".", "")) / Math.pow(10, baseNum);
    };
</script>
</body>
</html>




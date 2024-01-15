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
            <li role="presentation"><a href="<%=basePath%>tostore">药品审核入库</a></li>
            <li role="presentation"><a href="<%=basePath%>jhrecords">查看进货记录</a></li>
            <li role="presentation"><a href="<%=basePath%>ghsinfo">供货商管理</a></li>
            <li role="presentation" class="active"><a href="<%=basePath%>limitinfo">药品限购</a></li>
        </ul>
    </div>


    <div class="row" style="padding-top:10px;width: 95%">
        <table>
            <thead>
            <tr>
                <th>药品名称</th>
                <th>生产厂商</th>
                <th>限购数量</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="limitsellList"></tbody>
        </table>
        <br>
        <input type="text" id="drugname">
        <input type="text" id="manufacturer">
        <input type="number" id="amount">
        <button onclick="create()">Create</button>
        <div id="result"></div>
    </div>

</div>


<script type="text/javascript">
    $(function () {
        read();
    });

    function renderLimitsell(data) {
        let html = "";
        data.forEach(item => {
            dd = item.drugname;
            cc = item.changshang;
            html += `<tr>
              <td>` + item.drugname + `</td>
              <td>` + item.changshang + `</td>
              <td>` + item.amount + `</td>
              <td>
                <button onclick=remove(dd,cc)>Remove</button>
              </td>
            </tr>`;
        });
        $("#limitsellList").html(html);
    }

    function create() {
        let drugname = $("#drugname").val();
        let changshang = $("#manufacturer").val();
        let amount = $("#amount").val();
        console.log(drugname + changshang + amount)
        $.ajax({
            url: "<%=basePath%>addlimit",
            type: "POST",
            data: {drugname: drugname, changshang: changshang, amount: amount},
            success(res) {
                $("#result").text("Created successfully.");
                read(); // 回显全部 limitsell 数据
            },
        });
    }

    function read() {
        $.ajax({
            url: "<%=basePath%>Alllimit",
            type: "POST",
            success(res) {
                renderLimitsell(res.data);
            },
            error(err) {
                $("#result").text("Error: " + err.responseJSON.message);
            }
        });
    }


    function remove(drugname, changshang) {
        console.log("thisis" + drugname + changshang)
        const confirmDelete = confirm("Do you want to delete this limitsell?");
        if (confirmDelete) {
            $.ajax({
                url: "<%=basePath%>dellimit",
                type: "POST",
                data: {drugname: drugname, changshang: changshang},
                success(res) {
                    $("#result").text("Deleted successfully.");
                    read(); // 回显全部 limitsell 数据
                },
                error(err) {
                    $("#result").text("Error: " + err.responseJSON.message);
                }
            });
        }
    }

</script>
</body>
</html>




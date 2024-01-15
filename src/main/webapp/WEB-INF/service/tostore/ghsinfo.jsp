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
            <li role="presentation" class="active"><a href="<%=basePath%>ghsinfo">供货商管理</a></li>
            <li role="presentation"><a href="<%=basePath%>limitinfo">药品限购</a></li>
        </ul>
    </div>
    <div class="row" style="padding-top:10px">
        <div class="col-md-6 col-md-offset-3">
            <div class="input-group input-group-lg">
                <input type="text" class="form-control" id="addghs" placeholder="输入新的供货商名称" value="">
                <span class="input-group-btn">
						<button class="btn btn-default" type="button" id="addbtn">新增供货商名称</button>
					</span>
            </div>
        </div>
    </div>
    <div class="row" style="padding-top:10px">
        <div class="col-md-6 col-md-offset-3">
            <table class="table table-hover table-bordered">

            </table>
        </div>
    </div>
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
                <h4 id="ddd"></h4>
                <form action="<%=basePath%>delghs-records" method="post">
                    <input type="hidden" id="input-del" name="confirmdel" value="">
                    <div class="form-group text-right">
                        <button type="submit" class="btn btn-primary">确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        getghs();
    });

    function getghs() {
        $.ajax({
            url: "<%=basePath%>getghsinfo",
            type: "POST",
            success: function (result) {
                $(".table.table-hover.table-bordered").empty();
                var one = $("<tr></tr>").append("<th>供货商名称</th><th>操作</th>");
                one.appendTo(".table.table-hover.table-bordered");
                $.each(result, function () {
                    var trele = $("<tr></tr>");
                    var tdele = $("<td></td>").append(this.gonghuoshang);
                    var spa = $("<span></span>").addClass("glyphicon glyphicon-ban-circle").attr("aria-hidden", "true");
                    var btn = $("<button></button>").addClass("btn btn-danger btn-sm").attr("type", "button").append(spa).append("删除");
                    var tdele2 = $("<td></td>").append(btn);
                    tdele.appendTo(trele);
                    tdele2.appendTo(trele);
                    trele.appendTo(".table.table-hover.table-bordered");
                });
            }
        });
    };
    $(".table.table-hover.table-bordered").on("click", ".btn.btn-danger.btn-sm", function () {
        $.ajax({
            url: "<%=basePath%>delghsinfo",
            type: "POST",
            data: {delargs: $(this).parents("tr").children("td").eq(0).text()},
            success: function (res) {
                if (res.status_code == "100") {
                    alert("删除成功!!!");
                    getghs();
                } else {
                    $("#input-del").val(res.msgcontext.grcount.first);
                    $("#ddd").text("数据库中有" + res.msgcontext.grcount.six +
                        "条该公司的进货记录。点击确定后将删除对应的"
                        + res.msgcontext.grcount.six + "条记录");
                    $('#myModal').modal('toggle');
                }
            }
        });
    });

    $("#addbtn").click(function () {
        var addval = $("#addghs").val().trim();
        if (addval == "" || !(/^.{1,22}$/).test(addval)) {
            alert("输入的供货商名称为空或者超过了字数上限！");
        } else {
            $.ajax({
                url: "<%=basePath%>addghsinfo",
                type: "POST",
                data: {addval: addval},
                success: function (res) {
                    if (res.status_code == "100") {
                        getghs();
                    } else {
                        alert("添加失败!!!");
                    }
                }
            });
        }
    });
</script>
</body>
</html>




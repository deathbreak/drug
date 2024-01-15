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
<c:if test="${not empty requestScope.msg }">
    <script type="text/javascript">
        alert('${requestScope.msg }');
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
                        <li class="active"><a href="<%=basePath%>main">药品基础信息</a></li>
                        <li><a href="<%=basePath%>tostore">进货信息</a></li>
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
            <li role="presentation" class="active"><a href="<%=basePath%>main">搜索药品信息</a></li>
            <li role="presentation"><a href="<%=basePath%>druginfo">查看药品信息</a></li>
            <li role="presentation"><a href="<%=basePath%>adddrug">添加药品信息</a></li>
        </ul>
    </div>
    <!--  -->
    <c:if test="${queryresult.list.size()==0}">
        <div class="row">
            <div class="page-header">
                <h3 class="text-center">没有查询到符合条件的药品信息！<a href="<%=basePath%>main">返回</a></h3>
                <div class="text-center">
                    <small>若用条形码查询没有结果,可尝试用名称查询,若还是没有,则无此药品信息</small></div>
            </div>
        </div>
    </c:if>
    <c:if test="${queryresult.list.size()>0}">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>药品名称</th>
                        <th>厂商</th>
                        <th>备注</th>
                        <th>药品位置</th>
                        <th>单位</th>
                        <th>规格</th>
                        <th>条形码</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${queryresult.list }" var="dq">
                        <tr>
                            <td>${dq.drugname }</td>
                            <td>${dq.changshang }</td>
                            <td>${dq.beizhu }</td>
                            <td>${dq.location }</td>
                            <td>${dq.unit }</td>
                            <td>${dq.guige }</td>
                            <td>${dq.tiaoxingma }</td>

                            <td>
                                <button type="button" class="btn btn-info btn-sm" data-toggle="modal"
                                        data-target="#myModal">
                                    <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>修改
                                </button>
                                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"
                                        data-target="#myModal2">
										<span class="glyphicon glyphicon-ban-circle"
                                              aria-hidden="true"></span>删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <!-- -->

        <div class="row">
            <div class="col-md-6" style="padding-top:27px"><strong>当前第${queryresult.pageNum}页,总${queryresult.pages}页,共${queryresult.total}条记录</strong>
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="<%=basePath%>querydrug?pn=1&querydrug=${querystring }">首页</a></li>
                        <c:if test="${queryresult.hasPreviousPage }">
                            <li><a href="<%=basePath%>querydrug?pn=${queryresult.pageNum - 1}&querydrug=${querystring }"
                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>


                        <c:forEach items="${queryresult.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == queryresult.pageNum}">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != queryresult.pageNum}">
                                <li>
                                    <a href="<%=basePath%>querydrug?pn=${page_Num }&querydrug=${querystring }">${page_Num }</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${queryresult.hasNextPage }">
                            <li><a href="<%=basePath%>querydrug?pn=${queryresult.pageNum + 1}&querydrug=${querystring }"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:if>

                        <li><a href="<%=basePath%>querydrug?pn=${queryresult.pages}&querydrug=${querystring }">末页</a>
                        </li>
                        <!--  -->
                        <li>
                            <div class="btn-group dropup">
                                <button type="button" class="btn btn-default dropdown-toggle"
                                        data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                    跳转 <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <c:forEach var="x" begin="1" end="${queryresult.pages}"
                                               step="10">
                                        <li><a
                                                href="<%=basePath%>querydrug?pn=${x}&querydrug=${querystring }">跳转至第${x }页</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>
                        <!--  -->
                    </ul>
                </nav>
            </div>
        </div>
        <!-- -->
    </c:if>
    <!--  -->
</div>

<!-- 模态框 1-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center" style="color:red">修改药品基础信息</h4>
            </div>
            <div class="modal-body">
                <form action="<%=basePath%>updatedrug" method="post">
                    <input type="hidden" name="olddn" id="latedn" value="">
                    <input type="hidden" name="oldcs" id="latecs" value="">
                    <input type="hidden" name="nowpage" value="${queryresult.pageNum}">
                    <input type="hidden" name="nowqd" value="${querystring }">
                    <div class="form-group">
                        <label for="inputdn" class="control-label">药品名称:</label><span class="forclean"
                                                                                          style="color:red"
                                                                                          id="span_dn"></span>
                        <input type="text" class="form-control" id="inputdn" name="drugname" value="">
                    </div>
                    <div class="form-group">
                        <label for="inputcs" class="control-label">厂商:</label><span class="forclean" style="color:red"
                                                                                      id="span_cs"></span>
                        <input type="text" class="form-control" id="inputcs" name="changshang" value="">
                    </div>
                    <div class="form-group">
                        <label for="inputbz" class="control-label">备注:</label><span class="forclean" style="color:red"
                                                                                      id="span_bz"></span>
                        <input type="text" class="form-control" id="inputbz" name="beizhu" value="">
                    </div>
                    <div class="form-group">
                        <label for="inputloc" class="control-label">药品位置:</label><span class="forclean"
                                                                                           style="color:red"
                                                                                           id="span_loc"></span>
                        <input type="text" class="form-control" id="inputloc" name="location" value="">
                    </div>
                    <div class="form-group">
                        <label for="inputdw" class="control-label">单位:</label><span class="forclean" style="color:red"
                                                                                      id="span_dw"></span>
                        <input type="text" class="form-control" id="inputdw" name="unit" value="">
                    </div>
                    <div class="form-group">
                        <label for="inputgg" class="control-label">规格:</label><span class="forclean" style="color:red"
                                                                                      id="span_gg"></span>
                        <input type="text" class="form-control" id="inputgg" name="guige" value="">
                    </div>
                    <div class="form-group">
                        <label for="inputti" class="control-label">条形码:</label><span class="forclean"
                                                                                        style="color:red"
                                                                                        id="span_ti"></span>
                        <input type="text" class="form-control" id="inputti" name="tiaoxingma" value="">
                    </div>
                    <div class="form-group text-right">
                        <button type="submit" class="btn btn-primary" id="btn-edit">确认修改</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--  -->

<!-- 模态框 2-->
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
                <form action="<%=basePath%>deletedrug" method="post">
                    <input type="hidden" name="pn" value="${queryresult.pageNum}">
                    <input type="hidden" name="qd" value="${querystring }">
                    <input type="hidden" id="inputdn-del" name="drugname" value="">
                    <input type="hidden" id="inputcs-del" name="changshang" value="">
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary" id="btn-edit-del">确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--  -->

<!--  -->
<script type="text/javascript">
    $(".btn.btn-info.btn-sm").click(function () {
        $("#latedn").val($(this).parents("tr").children("td").eq(0).text());
        $("#latecs").val($(this).parents("tr").children("td").eq(1).text());
        $("#inputdn").val($(this).parents("tr").children("td").eq(0).text());
        $("#inputcs").val($(this).parents("tr").children("td").eq(1).text());
        $("#inputbz").val($(this).parents("tr").children("td").eq(2).text());
        $("#inputloc").val($(this).parents("tr").children("td").eq(3).text());
        $("#inputdw").val($(this).parents("tr").children("td").eq(4).text());
        $("#inputgg").val($(this).parents("tr").children("td").eq(5).text());
        $("#inputti").val($(this).parents("tr").children("td").eq(6).text());
    });
    $("#btn-edit").click(function () {
        var tip = "格式错误或超过字数限制";
        var checkdn = valid_it(/^.{1,22}$/, "#inputdn", "#span_dn", "药品名称", tip);
        var checkcs = valid_it(/^.{1,22}$/, "#inputcs", "#span_cs", "厂商", tip);
        var checkbz = valid_it(/^.{1,22}$/, "#inputbz", "#span_bz", "备注", tip);
        var checkloc = valid_it(/^.{1,22}$/, "#inputloc", "#span_loc", "药品位置", tip);
        var checkdw = valid_it(/^.{1,10}$/, "#inputdw", "#span_dw", "单位", tip);
        var checkgg = valid_it(/^.{1,22}$/, "#inputgg", "#span_gg", "规格", tip);
        var checkti = valid_ti(/^[0-9]{6,22}$/, "#inputti", "#span_ti", "条形码", "不是条形码格式");
        if (checkdn && checkcs && checkbz && checkloc && checkdw && checkgg && checkti) {
            return true;
        } else {
            return false;
        }
    });
    $("#inputdn").change(function () {
        $("#span_dn").text("");
    });
    $("#inputcs").change(function () {
        $("#span_cs").text("");
    });
    $("#inputbz").change(function () {
        $("#span_bz").text("");
    });
    $("#inputloc").change(function () {
        $("#span_loc").text("");
    });
    $("#inputdw").change(function () {
        $("#span_dw").text("");
    });
    $("#inputgg").change(function () {
        $("#span_gg").text("");
    });
    $("#inputti").change(function () {
        $("#span_ti").text("");
    });

    function valid_ti(regstr, id, span, show, tips) {
        if ($(id).val().trim() == "" || $(id).val().length == 0) {
            $(id).val($(id).val().trim());
            return true;
        } else if (!regstr.test($(id).val())) {
            $(span).text(tips);
            return false;
        } else {
            return true;
        }
    };

    function valid_it(regstr, id, span, show, tips) {
        if ($(id).val().trim() == "" || $(id).val().length == 0) {
            $(span).text(show + "不能为空");
            return false;
        } else if (!regstr.test($(id).val().trim())) {
            $(span).text(tips);
            return false;
        } else {
            $(id).val($(id).val().trim());
            return true;
        }
    };
    $("#myModal").on('hide.bs.modal', function () {
        $(".forclean").text("");
    });


    $(".btn.btn-danger.btn-sm").click(function () {
        $("#inputdn-del").val($(this).parents("tr").children("td").eq(0).text());
        $("#inputcs-del").val($(this).parents("tr").children("td").eq(1).text());
    });
</script>
</body>
</html>




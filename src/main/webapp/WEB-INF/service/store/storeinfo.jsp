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
                        <li><a href="<%=basePath%>main">药品基础信息</a></li>
                        <li><a href="<%=basePath%>tostore">进货信息</a></li>
                        <li class="active"><a href="<%=basePath%>store">药品库存信息</a></li>
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
            <li role="presentation"><a href="<%=basePath%>store">库存药品查询</a></li>
            <li role="presentation" class="active"><a href="<%=basePath%>storeinfo">查看所有库存</a></li>
            <li role="presentation"><a href="<%=basePath%>addstore">新增库存药品</a></li>
        </ul>
    </div>

    <!--  -->
    <c:if test="${queryresult.list.size()==0}">
        <div class="row">
            <div class="page-header">
                <h3 class="text-center">没有查询到符合条件的药品信息！<a href="<%=basePath%>storeinfo">返回</a></h3>
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
                        <th>进价</th>
                        <th>销售价格</th>
                        <th>生产日期</th>
                        <th>有效日期</th>
                        <th>批号</th>
                        <th>备注</th>
                        <th>药品位置信息</th>
                        <th>库存</th>
                        <th>单位</th>
                        <th>规格</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${queryresult.list }" var="ds">
                        <tr>
                            <td>${ds.drugname }</td>
                            <td>${ds.changshang }</td>
                            <td>${ds.beginprice }</td>
                            <td>${ds.price }</td>
                            <td>${ds.begindate }</td>
                            <td>${ds.date }</td>
                            <td>${ds.pihao }</td>
                            <td>${ds.beizhu }</td>
                            <td>${ds.location }</td>
                            <td>${ds.count }</td>
                            <td>${ds.unit }</td>
                            <td>${ds.guige }</td>

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
                        <li><a href="<%=basePath%>querystore2?pn=1&querystore=${querystring }">首页</a></li>
                        <c:if test="${queryresult.hasPreviousPage }">
                            <li>
                                <a href="<%=basePath%>querystore2?pn=${queryresult.pageNum - 1}&querystore=${querystring }"
                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                </a></li>
                        </c:if>


                        <c:forEach items="${queryresult.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == queryresult.pageNum}">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != queryresult.pageNum}">
                                <li>
                                    <a href="<%=basePath%>querystore2?pn=${page_Num }&querystore=${querystring }">${page_Num }</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${queryresult.hasNextPage }">
                            <li>
                                <a href="<%=basePath%>querystore2?pn=${queryresult.pageNum + 1}&querystore=${querystring }"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                        </c:if>

                        <li>
                            <a href="<%=basePath%>querystore2?pn=${queryresult.pages}&querystore=${querystring }">末页</a>
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
                                                href="<%=basePath%>querystore2?pn=${x}&querystore=${querystring }">跳转至第${x }页</a>
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
                <h4 class="modal-title text-center" style="color:red">修改库存药品信息</h4>
            </div>
            <div class="modal-body">
                <form action="<%=basePath%>updatestore2" method="post">
                    <input type="hidden" name="nowpage" value="${queryresult.pageNum}">
                    <input type="hidden" name="nowqd" value="${querystring }">
                    <input type="hidden" name="drugname" value="" id="inputdn2">
                    <input type="hidden" name="changshang" value="" id="inputcs2">
                    <div class="form-group">
                        <label class="control-label">药品名称:</label><span style="color:#5bc0de" id="inputdn"></span>
                    </div>
                    <div class="form-group">
                        <label class="control-label">生产厂商:</label><span style="color:#5bc0de" id="inputcs"></span>
                    </div>
                    <div class="form-group">
                        <label for="inputbp" class="control-label">进价:</label><span class="forclean" style="color:red"
                                                                                      id="span_bp"></span>
                        <input type="number" step="0.0001" class="form-control input-sm" id="inputbp" name="beginprice"
                               value="" placeholder="如果不知道进价,就输入0">
                    </div>
                    <div class="form-group">
                        <label for="inputpri" class="control-label">销售价格:</label><span class="forclean"
                                                                                           style="color:red"
                                                                                           id="span_pri"></span>
                        <input type="number" step="0.0001" class="form-control input-sm" id="inputpri" name="price"
                               value="">
                    </div>
                    <div class="form-group">
                        <label for="inputbd" class="control-label">生产日期:</label><span class="forclean"
                                                                                          style="color:red"
                                                                                          id="span_bd"></span>
                        <input type="text" class="form-control input-sm picker" id="inputbd" name="begindate" value=""
                               readonly>
                    </div>
                    <div class="form-group">
                        <label for="inputda" class="control-label">有效期至:</label><span class="forclean"
                                                                                          style="color:red"
                                                                                          id="span_da"></span>
                        <input type="text" class="form-control input-sm picker" id="inputda" name="date" value=""
                               readonly>
                    </div>
                    <div class="form-group">
                        <label for="lateph" class="control-label">原批号:</label>
                        <input type="text" class="form-control input-sm" id="lateph" name="guige" value="" readonly>
                    </div>
                    <div class="form-group">
                        <label for="inputph" class="control-label">批号:</label><span class="forclean" style="color:red"
                                                                                      id="span_ph"></span>
                        <input type="text" class="form-control input-sm" id="inputph" name="pihao" value="">
                    </div>
                    <div class="form-group">
                        <label for="inputkc" class="control-label">库存:</label><span class="forclean" style="color:red"
                                                                                      id="span_kc"></span>
                        <input type="number" class="form-control input-sm" id="inputkc" name="count" value="">
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
                <form action="<%=basePath%>deletestore2" method="post">
                    <input type="hidden" name="pn" value="${queryresult.pageNum}">
                    <input type="hidden" name="qd" value="${querystring }">
                    <input type="hidden" id="inputdn-del" name="drugname" value="">
                    <input type="hidden" id="inputcs-del" name="changshang" value="">
                    <input type="hidden" id="inputph-del" name="pihao" value="">
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
        $("#lateph").val($(this).parents("tr").children("td").eq(6).text());
        $("#inputdn").text($(this).parents("tr").children("td").eq(0).text());
        $("#inputcs").text($(this).parents("tr").children("td").eq(1).text());
        $("#inputdn2").val($(this).parents("tr").children("td").eq(0).text());
        $("#inputcs2").val($(this).parents("tr").children("td").eq(1).text());
        $("#inputbp").val($(this).parents("tr").children("td").eq(2).text());
        $("#inputpri").val($(this).parents("tr").children("td").eq(3).text());
        $("#inputbd").val($(this).parents("tr").children("td").eq(4).text());
        $("#inputda").val($(this).parents("tr").children("td").eq(5).text());
        $("#inputph").val($(this).parents("tr").children("td").eq(6).text());
        $("#inputkc").val($(this).parents("tr").children("td").eq(9).text());
    });
    $("#btn-edit").click(function () {
        var checkbp = valid_it(/^[1-9]\d*\.\d*|^0\.\d*[1-9]\d*$|^\d+$/, "#inputbp", "#span_bp", "进价信息", "数字格式有误");
        var checkpri = valid_it(/^[1-9]\d*\.\d*|^0\.\d*[1-9]\d*$|^\d+$/, "#inputpri", "#span_pri", "销售价格", "数字格式有误");
        var checkbd = valid_it(/^\d{4}-\d{2}-\d{2}$/, "#inputbd", "#span_bd", "生产日期", "日期格式有误");
        var checkda = valid_it(/^\d{4}-\d{2}-\d{2}$/, "#inputda", "#span_da", "有效日期", "日期格式有误");
        var checkph = valid_it(/^.{1,30}$/, "#inputph", "#span_ph", "批号", "格式错误或超过字数限制");
        var checkkc = valid_it(/^[1-9]\d*$/, "#inputkc", "#span_kc", "库存", "数字格式有误");
        if (checkbp && checkpri && checkbd && checkda && checkph && checkkc) {
            return true;
        } else {
            return false;
        }
    });
    $("#inputbp").change(function () {
        $("#span_bp").text("");
    });
    $("#inputpri").change(function () {
        $("#span_pri").text("");
    });
    $("#inputbd").change(function () {
        $("#span_bd").text("");
    });
    $("#inputda").change(function () {
        $("#span_da").text("");
    });
    $("#inputph").change(function () {
        $("#span_ph").text("");
    });
    $("#inputkc").change(function () {
        $("#span_kc").text("");
    });

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
        $("#inputph-del").val($(this).parents("tr").children("td").eq(6).text());
    });
    $(".picker").datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        minView: 2,
        autoclose: true,
    });
</script>
</body>
</html>




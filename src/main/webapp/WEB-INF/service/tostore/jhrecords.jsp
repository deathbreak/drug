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
            <li role="presentation" class="active"><a href="<%=basePath%>jhrecords">查看进货记录</a></li>
            <li role="presentation"><a href="<%=basePath%>ghsinfo">供货商管理</a></li>
            <li role="presentation"><a href="<%=basePath%>limitinfo">药品限购</a></li>
        </ul>
    </div>

    <div class="row">
        <form action="<%=basePath%>jhrecords" method="post">
            <select style="height:20px" name="querydrug">
                <option>点击选择查看对应供货商的进货记录</option>
                <c:if test="${not empty ghsinfo }">
                    <c:forEach items="${ghsinfo }" var="ghs">
                        <option>${ghs.gonghuoshang }</option>
                    </c:forEach>
                </c:if>
            </select>
            <button type="submit" class="btn btn-info btn-sm">查看</button>
            <span>${queryresult.list[0].gonghuoshang }:</span>
        </form>
    </div>

    <!--  -->
    <c:if test="${queryresult.list.size()==0}">
        <div class="row">
            <div class="page-header">
                <h3 class="text-center">没有相关进货记录</h3>
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
                        <th>数量</th>
                        <th>有效期</th>
                        <th>批号</th>
                        <td>进货时间</td>
                        <th>供货商</th>
                    </tr>
                    <c:forEach items="${queryresult.list }" var="dq">
                        <tr>
                            <td>${dq.drugname }</td>
                            <td>${dq.changshang }</td>
                            <td>${dq.beizhu }</td>
                            <td>${dq.amount }</td>
                            <td>${dq.date }</td>
                            <td>${dq.pihao }</td>
                            <td>${dq.jinhuo_time }</td>
                            <td>${dq.gonghuoshang }</td>
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
                        <li><a href="<%=basePath%>jhrecords?pn=1&querydrug=${querystring }">首页</a></li>
                        <c:if test="${queryresult.hasPreviousPage }">
                            <li><a href="<%=basePath%>jhrecords?pn=${queryresult.pageNum - 1}&querydrug=${querystring }"
                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>


                        <c:forEach items="${queryresult.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == queryresult.pageNum}">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != queryresult.pageNum}">
                                <li>
                                    <a href="<%=basePath%>jhrecords?pn=${page_Num }&querydrug=${querystring }">${page_Num }</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${queryresult.hasNextPage }">
                            <li><a href="<%=basePath%>jhrecords?pn=${queryresult.pageNum + 1}&querydrug=${querystring }"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:if>

                        <li><a href="<%=basePath%>jhrecords?pn=${queryresult.pages}&querydrug=${querystring }">末页</a>
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
                                                href="<%=basePath%>jhrecords?pn=${x}&querydrug=${querystring }">跳转至第${x }页</a>
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
</body>
</html>




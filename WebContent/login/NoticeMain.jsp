<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告墙</title>
<script type="text/javascript">
${sessionScope.reHead }
</script>
		   <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<style type="text/css">
#reTable_head_footer{
	background-color: #99ccff;
}
#left_table{
	background-color: #f1f1f1;
	border-bottom-style: solid;
}
#right_table{
	background-color: #02fda7;
	border-bottom-style: solid;
}
</style>
</head>
<body>
<div align="center">
<h3>${admin.name }，欢迎你！</h3>
<c:if test="${Tab.totalCount!=0 }"><br />
<table id="reTable" cellspacing="0" cellpadding="5px">
<th colspan="5" id="reTable_head_footer">公告列表
</th>
<c:forEach items="${noticeList }" varStatus="s" var="notice">
<tr>
<td colspan="3" id="left_table">
${notice.id }.<b>标题</b><br />${notice.title }<br />
<b>时间</b><br />${notice.time }<br />
<td colspan="3" id="right_table">
	<b>${notice.content }</b><br />
</td>
</tr>
</c:forEach>
</table>
<br /><br />
<c:if test="${Tab.totalCount >0 }">
<ul class="pagination">
<li><a href="${pageContext.request.contextPath}/GetAdminNotices?index=1">首页</a></li>
<c:if test="${Tab.index != 1}">
	<li><a href="${pageContext.request.contextPath}/GetAdminNotices?index=${Tab.index-1}">&laquo;</a></li>
</c:if>
<c:forEach var="j" begin="${Tab.begin}" end="${Tab.end}">
<c:choose>  
 <c:when test="${j == Tab.index }">
 	<li class="active"><a href="${pageContext.request.contextPath}/GetAdminNotices?index=${Tab.index}"> ${Tab.index }</a></li>
</c:when>  
<c:otherwise>
	<li><a href="${pageContext.request.contextPath}/GetAdminNotices?index=${j }">${j }</a></li>
</c:otherwise>  
</c:choose>  
</c:forEach>
<c:if test="${Tab.index!=Tab.pageCount }">
	<li><a href="${pageContext.request.contextPath}/GetAdminNotices?index=${Tab.index+1}">&raquo;</a></li>
</c:if>
<li><a href="${pageContext.request.contextPath}/GetAdminNotices?index=${Tab.pageCount}">尾页</a></li>
</ul><br>
<form action="${pageContext.request.contextPath}/GetAdminNotices" name="myform">
第<input type="number" max="${Tab.pageCount }" min="1" id="numInput" name="index" value="${Tab.index }">页
&nbsp;&nbsp;<input type="submit" value="跳转" onclick="return check()">
</form>&nbsp;&nbsp;<br />
共<span style="color:red;"><b>${Tab.pageCount }</b></span>页，<span style="color:red;"><b>${Tab.totalCount }</b></span>条记录！
</c:if>
</c:if>
</div>
</body>
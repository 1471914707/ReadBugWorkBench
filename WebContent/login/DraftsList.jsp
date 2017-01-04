<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>草稿箱</title>
		   <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<style type="text/css">
.Layer1{width:100%;height:300px}
.Article{position:relative;top:30px;width:800px;background:#99ccff;margin:0 auto}
.Tr{background-color: #ececf4;}
#table td{width:200px;height:20px;border:1px solid #99ccff;text-align:center}
#numInput{width:25px;}
#table a{text-decoration: underline;}
body{font-weight: bolder;}
</style>
</head>
<body>
<div class="Layer1" align="center">
	<div class="Article">
		<table id="table">
		<caption><b>读虫草稿列表</b></caption>
		<tr class="Tr">
			<td>编号</td>
			<td>标题</td>
			<td>时间</td>
			<td>操作</td>
		</tr>
		<c:forEach var="draft" items="${DraftsList}">
			<tr bgcolor="white">
				<td>${draft.id }</td>
				<c:choose>
					<c:when test="${not empty draft.title}">
						<td><a href="${pageContext.request.contextPath }/login/HandleArticleDetail?articleId=${draft.id}">${draft.title }</a></td>
					</c:when>
					<c:otherwise>
						<td><a href="${pageContext.request.contextPath }/login/HandleArticleDetail?articleId=${draft.id}">（未填写）</a></td>
					</c:otherwise>
				</c:choose>
				<td><b>${draft.lastTime }</b></td>
				<td><a href="${pageContext.request.contextPath }/login/HandleDraftDelete?articleId=${draft.id}">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/login/HandleDraftEdit?articleId=${draft.id}">编辑</a></td>
		</c:forEach>
		</table>
	</div>
	<br >
	<c:if test="${Tab.totalCount >0 }">
		<ul class="pagination">
		<li><a href="${pageContext.request.contextPath}/login/GetArticleList?index=1">首页</a></li>
		<c:if test="${Tab.index != 1}">
			<li><a href="${pageContext.request.contextPath}/login/GetArticleList?index=${Tab.index-1}">&laquo;</a></li>
		</c:if>
		<c:forEach var="j" begin="${Tab.begin}" end="${Tab.end}">
		<c:choose>  
			<c:when test="${j == Tab.index }">
		 		<li class="active"><a href="${pageContext.request.contextPath}/login/GetArticleList?index=${Tab.index}"> ${Tab.index }</a></li>
			</c:when>  
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/login/GetArticleList?index=${j }">${j }</a></li>
			</c:otherwise>  
		</c:choose>  
		</c:forEach>
		<c:if test="${Tab.index!=Tab.pageCount }">
			<li><a href="${pageContext.request.contextPath}/login/GetArticleList?index=${Tab.index+1}">&raquo;</a></li>
		</c:if>
		<li><a href="${pageContext.request.contextPath}/login/GetArticleList?index=${Tab.pageCount}">尾页</a></li>
		</ul><br>
		<form action="${pageContext.request.contextPath}/login/GetArticleList" name="myform">
			第<input type="number" max="${Tab.pageCount }" min="1" id="numInput" name="index" value="${Tab.index }">页
			&nbsp;&nbsp;<input type="submit" value="跳转" onclick="return check()">
		</form>&nbsp;&nbsp;<br />
		共<span style="color:red;"><b>${Tab.pageCount }</b></span>页，<span style="color:red;"><b>${Tab.totalCount }</b></span>条记录！
	</c:if>
</div>
</body>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>读虫</title> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/demo.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
</head>
<body style="height: 300px;vertical-align: top;">
<table width="100%" cellpadding="0" cellspacing="0">
<!-- 搜索框 -->
<form action="">
	<tr height="30px">
		<td align="left">
			<img src="${pageContext.request.contextPath}/img/logo.jpg" width="70px;" height="50px">
		</td>
		<td align="right">
			<input type="text" name="searchContent" id="searchContent" />
				<select name="select">
				<option value="content">内容</option>
				<option value="user">用户</option>
				</select>
			<input type="submit" value="搜索" />
			&nbsp;
		</td>
	</tr>
</form>
<!-- end of 搜索框 -->
	<tr  height="30px" bgcolor="#E8EEF7">
	<c:choose>
	<c:when test="${sessionScope.admin!=null }">
		<td align="left">
			&nbsp;<font color="#7799DD" size="2"> ${admin.name },你好</font>
		</td>
		<td align="right">
	<font size="2">
		<a href="${pageContext.request.contextPath}/article/article-list.jsp">读虫</a>&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/user/logon/user-list1.jsp">后台管理</a>&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/user/logon/user-modify.jsp?userId=${admin.id}">修改基本信息</a>&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/user/user-logout.jsp">退出麦吧</a>&nbsp;&nbsp;&nbsp;
	</font>
	</c:when>
	<c:otherwise>
		<td align="left">
					&nbsp;<font color="#7799DD" size="2">你好</font>
					</td>
					<td align="right">
				<font size="2">
					<a href="${pageContext.request.contextPath}/article/article-list.jsp">读虫</a>&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/user/user-logon.jsp">登录</a>&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/user/user-register.jsp">注册</a>&nbsp;&nbsp;&nbsp;
				</font>
		</td>
					</c:otherwise>
			</c:choose>
	</tr>

</table>
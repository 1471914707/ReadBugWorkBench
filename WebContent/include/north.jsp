<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE table PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table width="100%" cellpadding="0" cellspacing="0">
<!-- 搜索框 -->

	<tr height="30px">
		<td align="left">
			<img src="${pageContext.request.contextPath}/img/logo.jpg">
		</td>
		<td align="right">
			<form action="">
			<input type="text" name="searchContent" id="searchContent" />
				<select name="select">
				<option value="content">内容</option>
				<option value="user">用户</option>
				</select>
			<input type="submit" value="搜索" /></form>
			&nbsp;
		</td>
	</tr>
<!-- end of 搜索框 -->
	<tr  height="30px" bgcolor="#E8EEF7">
	<c:choose>
	<c:when test="${sessionScope.admin!=null}">

		<td align="left"><font size="2">${sessionScope.admin.name },你好</font>
		</td>
		<td align="right">
	<font size="2">
		<a href="${pageContext.request.contextPath}/index.jsp">后台管理</a>&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/user/logon/user-modify.jsp?${sessionScope.admin.id}">修改个人基本信息</a>&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/AdminLogin.jsp">退出麦吧</a>&nbsp;&nbsp;&nbsp;
	</font>

</c:when>	
<c:otherwise>
		<td align="left">
			&nbsp;<font color="#7799DD" size="2">游客,你好</font>
		</td>
		<td align="right">
	<font size="2">
		<a href="${pageContext.request.contextPath}/AdminLogin.jsp">登录</a>&nbsp;&nbsp;&nbsp;
	</font>
</c:otherwise>
</c:choose>
	</tr>
</table>
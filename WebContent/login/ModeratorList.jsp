<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>版主管理</title>
<style type="text/css">
#reTable{
	position: relative;
	top:30px;
	width: 700px;
}
#reTable td{
	border:1px solid #99ccff;
	}
#reTable th{
	background-color:#99bcfc;
	}
#Table_header{
	background-color: #e8eef7;
}
#tr2{
	background-color: #ececf4;
}
#index{
	text-decoration: none;
	color: black;
}
#index2:VISITED{
	color:#2081d2;
}
#numInput{
	width: 25px;
}
#reTable a{
	text-decoration: underline;
}
body{
	font-weight: bolder;
}
</style>
</head>
<body>
<div align="center"  id="infotable">
<h3>${tip }</h3>
<table id="reTable" cellspacing="0" cellpadding="5px">
<tr>
<th colspan="5" id="reTable_head_footer">版主列表
<div style="position: absolute;right: 20px;top:5px;"></div>
</th>
</tr>
<tr id="tr2"><td>编号</td><td>账号</td><td>姓名</td><td>状态</td><td>操作</td></tr>
<c:forEach items="${moderatorList }" var="s">
		<tr bgcolor="white">
		<td>${s.id }</td>
		<td><a href="${pageContext.request.contextPath}/login/HandleGetModeratorDetail?id=${s.id}">${s.account }</a></td>
		<td>${s.name }</td>
		<td><c:if test="${s.isactive==1}">活跃</c:if>
		<c:if test="${s.isactive==0 }"><c:out value="不活跃"></c:out></c:if></td>
		<td><a href="${pageContext.request.contextPath}/login/HandleRemoveModerator?id=${s.id}">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</c:forEach>
</table>
</div>
</body>
</html>
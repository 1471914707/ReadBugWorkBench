<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>版主信息</title>
</head>
<style type="text/css">
#infotable{
	position: relative;
	top:20px;
}
#reTable td{
	border:1px solid #99ccff;
	}
#reInput{
	width: 300px;
	height: 25px;
	border:1px solid #99ccff;
}
#reTable_head_footer{
	background-color: #99ccff;
}
#reTable_left{
	background-color: #f1f1f1;
}
#articles{
	margin-left: 20px;
	margin-top: 20px;
	}
#articles a{
	text-decoration: underline;
}
</style>
<body>
	<div align="center"  id="infotable">
	<h3>${Mtip }</h3>
<table id="reTable" cellspacing="0" cellpadding="5px">
<tr>
<th colspan="4" id="reTable_head_footer"><center>具体信息</center></th>
</tr>
<tr>
<td id="reTable_left">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
<td colspan="3">${moderator.account }</td>
</tr>
<tr>
<td id="reTable_left">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
<td colspan="3">${moderator.password }</td>
</tr>
<tr>
<td id="reTable_left">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
<td colspan="3">${moderator.name }</td>
</tr>
<tr>
</tr>
<tr>
<td id="reTable_left">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：</td>
<td colspan="3">${type }</td>
</tr>
<tr>
<td colspan="4" id="reTable_head_footer"><center>
<a href="${pageContext.request.contextPath}/login/ModifyModerator.jsp"><button>修改</button></a>
</center></td>
</tr>
</table><br /></div>
</body>
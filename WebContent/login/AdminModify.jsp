<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改管理员信息</title>
</head>
<script type="text/javascript">
function Check() {

	if (myform.account.value == ""){
		alert("账号不能为空.....");
		return false;
	}
	if (myform.password.value == "" || myform.password.value.length < 6){
		alert("密码不能为空且长度大于6位.....");
		return false;
	}
	alert("格式正确，修改成功!");
	return true;
}	

</script>
<style type="text/css">
#infotable{position: relative;top:20px;}
#reTable td{border:1px solid #99ccff;}
#reInput{width: 300px;height: 25px;border:1px solid #99ccff;}
#reTable_head_footer{background-color: #99ccff;}
#reTable_left{background-color: #f1f1f1;}
#articles{margin-left: 20px;margin-top: 20px;}
#articles a{text-decoration: underline;}
</style>
<body>
	<div align="center"  id="infotable">
	<form action="${pageContext.request.contextPath}/HandleAdminModify?id=${admin_my.id}&isactive=${admin_my.isactive}&type=${admin_my.type}" method="post" name="myform">
		<table id="reTable" cellspacing="0" cellpadding="5px">
		<tr>
			<th colspan="4" id="reTable_head_footer"><center>修改信息</center></th>
		</tr>
		<tr>
			<td id="reTable_left">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
			<td colspan="3"><input name="account" type="text" id="reInput" value="${admin_my.account }"></td>
		</tr>
		<tr>
			<td id="reTable_left">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
			<td colspan="3"><input name="password" type="text" id="reInput" value="${admin_my.password }"></td>
		</tr>
		<tr>
			<td id="reTable_left">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
			<td colspan="3"><input name="name" type="text" id="reInput" value="${admin_my.name }"></td>
		</tr>
		</table>
		<br>
		<center><button type="submit" onclick="return Check()">修改</button></center>
	</form>
	</div>
</body>
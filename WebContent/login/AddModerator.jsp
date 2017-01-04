<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加版主</title>
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
	if(myform.name.value == ""){
		alert("姓名不能为空");
		return false;
	}
	alert("格式正确，提交页面!");
	return true;
}	

</script>
<style type="text/css">
#infotable{
	position: relative;
	top:20px;
}
#reTable td{
	border:1px solid #99ccff;
	}
#reInput{
	width: 150px;
	height: 25px;
	border:1px solid #99ccff;
}
#reTable_head_footer{
	background-color: #99ccff;
}
#reTable_left{
	background-color: #f1f1f1;
}

</style>
</head>
<body>
<div align="center" id="infotable">
<h3>${tip }</h3>
<form action="${pageContext.request.contextPath}/login/HandleAddModerator" method="post" name="myform">
<table id="reTable" cellspacing="0" cellpadding="5px">
<tr>
<th colspan="4" id="reTable_head_footer"><center>增加版主</center></th>
</tr>
<tr>
<td id="reTable_left">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
<td colspan="3"><input name="account" type="text" id="reInput" ></td>
</tr>
<tr>
<td id="reTable_left">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
<td colspan="3"><input name="password" type="password" id="reInput" ></td>
</tr>
<tr>
<td id="reTable_left">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
<td colspan="3"><input name="name" type="text" id="reInput" ></td>
</tr>
<tr>
<td id="reTable_left">版主类型：</td>
<td colspan="3">
<input type="radio" id="section" name="section"  value="sport"/>体育&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" id="section" name="section"  value="life"/>生活&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" id="section" name="section"  value="study"/>学习
  </td>
</tr>
<tr>
<td colspan="4" id="reTable_head_footer"><center>
<input value="提交" type="submit" onclick="return Check()">
</center></td>
</tr>
</table>
</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑草稿</title>
   <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
function Check() 
{
	if(myform.title.value == "")
	{
		alert("文章标题不能为空！");
		return false;
	}
	alert("格式正确，提交页面!");
	return true;
}	
</script>
<style type="text/css">
.Layer{margin:0 atuo;width:735px;}
.Publish{background-color:#e6edf7;font-weight:bold;padding-left:5px;padding-top:3px;border-top-style:ridge;border-bottom-style:dotted;border-bottom-width:1px;}
.ContentMain{background-color:#f4f3f1;font-weight:bold;padding-top:5px;padding-left:76px;padding-right:76px;height:800px;}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
</head>
<body>
<div class="Layer">
	<div class="Publish">编辑草稿</div>
	<div class="ContentMain">
		<form action="${pageContext.request.contextPath}/login/HandleArticle?draftId=${draft.id}" method="post" name="myform"><br>
		<input id="Title" type="text" size="78" name="title" value="${draft.title }" class="form-control">
		<br  />
		<textarea id="Content" cols="6" rows="10" name="content">${draft.content }</textarea>
		<script type="text/javascript">CKEDITOR.replace('content', { height: '500px', width: '580px' })</script>
		<input type="checkbox" name="setdraft" value="setdraft" checked>存为草稿
		<input value="发表" type="submit" onclick="return Check()">
		</form>
	</div>
</div>

</body>
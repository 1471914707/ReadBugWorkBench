<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.Layer3{width:100%;height:400px}
</style>
</head>
<body>
<div class="Layer3">
	<hr/>
	<p>${article.content }</p>
	<p><b>作者：</b>${author }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>发布时间：</b>${article.lastTime }</p>
	<hr/>
</div>
</body>
</html>
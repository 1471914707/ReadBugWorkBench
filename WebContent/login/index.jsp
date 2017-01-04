<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>读虫</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script>
		//功能：在页面加载完后，设置默认子菜单
		$(document).ready(function(){//将函数绑定到文档的就绪事件（当文档完成加载时）
			var node = $('#tt').tree('find','idmessager');//查找id为idmessager的子菜单
			$('#tt').tree('expandTo', node.target).tree('select', node.target);//设置为被选
		});
	</script>
</head>
<body class="easyui-layout">
<%-- 	<div data-options="region:'north',border:false" style="height:96px;padding:1px" id="ifrm2"><%@include file="/include/north.jsp" %></div> --%>
	<div data-options="region:'west',split:true,title:'菜单'" style="width:200px;border-bottom-style: solid;border-bottom-width: 15px;">
		<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="个人操作" style="padding: 10px">
						<ul class="easyui-tree">
							<li><a onclick="document.getElementById('ifrm1').src='${pageContext.request.contextPath }/login/GetAdminInfo'">
							具体信息</a></li>
							<li><a onclick="document.getElementById('ifrm1').src='${pageContext.request.contextPath }/login/AdminModify'">
							修改信息</a></li>
							<li><span><a onclick="window.location.href='AdminLogin.jsp'">
							退出登录</a></span></li>
						</ul>
					</div>
					<div title="文章管理" style="padding: 10px;">
						<ul class="easyui-tree">
							<li data-options="iconCls:'icon-add'">
							<span><a onclick="document.getElementById('ifrm1').src='login/ReleaseNew.jsp'">
							发布新闻</a></span></li>
							<li><a onclick="document.getElementById('ifrm1').src='${pageContext.request.contextPath }/login/GetArticleList'">
							新闻列表</a></li>
							<li><a onclick="document.getElementById('ifrm1').src='${pageContext.request.contextPath }/login/GetDraftsList'">
							我的草稿</a></li>
						</ul>
					</div>
					<div title="板块管理" style="padding: 10px">
						<ul class="easyui-tree">
							<li data-options="iconCls:'icon-add'">增加板块</li>
							<li>管理板块</li>
						</ul>
					</div>
					<div title="公告管理" style="padding: 10px">
						<ul class="easyui-tree">
							<li data-options="iconCls:'icon-add'">发布公告</li>
							<li>我的公告</li>
						</ul>
					</div>
					<c:if test="${admin.type == 0 }">
					<div title="用户管理" style="padding: 10px">
						<ul class="easyui-tree">
							<li data-options="iconCls:'icon-add'">
							<span><a onclick="document.getElementById('ifrm1').src='login/AddModerator.jsp'">
							增加版主</a></span></li>
							<li data-options="iconCls:'icon-add'">增加用户</li>
							<li><a onclick="document.getElementById('ifrm1').src='${pageContext.request.contextPath }/login/HandleGetModeratorList'">
							管理版主</a></li>
							<li><a onclick="document.getElementById('ifrm1').src='${pageContext.request.contextPath }/login/HandleGetUserList'">
							管理用户</a></li>
						</ul>
					</div>
					</c:if>
					<div title="系统信息" style="padding: 10px"><img src="${pageContext.request.contextPath}/img/logo.jpg" height="30px"><br />
						读虫 -- 瑜人堂出品
					</div>
		</div>
	</div>

<!--	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>-->
<%-- 	<div data-options="region:'south',border:false" style="padding:10px;"><%@include file="/include/south.jsp" %></div> --%>
	<div id="centertab" data-options="region:'center',title:'读虫发布系统'" style="text-align: center">
		<iframe id="ifrm1" name="ifrm1" width="100%" height="100%" src="${pageContext.request.contextPath}/GetAdminNotices"  scrolling="auto" frameborder="0" >
		</iframe>
	</div>
</body>
</html>
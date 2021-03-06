<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>密码重置</title>
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>online/css/login/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout login" id="nahaoModule" module="login" data_page="studentPage">
	<div class="pwd">
		<div class="findType">
            <div class=" box emailBox">
				<h2>邮箱找回密码</h2>
				<div class="progressBar cf">
					<span class="fl ">1. 验证邮箱</span>
					<span class="fl ">2. 设置新密码</span>
					<span class="fl ok current">3. 完成</span>
				</div>
				<p class="tips"></p>
					<ul>
						<li class="cf">
							<input type="submit" class="btn redBtn submit fl" onclick="javascript:window.location.href='<%=basePath %>login'" value="去登录" />
						</li>
					</ul>
			</div>
		</div>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
</body>
</html>
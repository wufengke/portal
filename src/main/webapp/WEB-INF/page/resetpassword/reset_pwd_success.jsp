<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>首页</title>
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="online/css/login/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head2.jsp" />
<!-- 主要内容开始 -->
<div class="wrap  login" id="nahaoModule" module="login" data_page="studentPage">
	<div class="pwd">
		<div class="setSuccess layout">
			<div class="box ">
				<h2>完成修改</h2>
				<div class="progressBar cf">
					<span class="fl ">1. 验证邮箱</span>
					<!-- <span class="fl ">1. 验证邮箱</span> -->
					<span class="fl currentPreve">2. 设置新密码</span>
					<span class="fl ok current">3. 完成</span>
				</div>	
				<h3>恭喜，密码修改成功！</h3>	
				<p class="tips"><span>5</span>秒后将自动返回登录，或点击登录按钮立即登录</p>
				<a href="javascript:void(0)" class="signIn btn redBtn">登录 </a>
			</div>
			
		</div>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
</body>
</html>
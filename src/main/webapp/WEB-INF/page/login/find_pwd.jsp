<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>首页</title>
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>online/css/login/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap  login" id="nahaoModule" module="login" data_page="studentPage">
	<div class="pwd layout">
		<div class="forget">
			<div class=" box forgetBox">
				<h2>忘记密码</h2>
				<div class="cBox">
					<p>只有<a href="javascript:void(0)">绑定手机</a>的用户才可使用</p>
					<a href="/login/find_pwd_way2_step1" class="btn redBtn phone">手机找回 </a>
					<a href="/login/find_pwd_way2_step1" class="btn redBtn email">邮箱找回 </a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
</body>
</html>
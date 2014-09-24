<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>邮箱激活</title>
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>online/css/login/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head2.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout login" id="nahaoModule" module="login" data_page="studentPage">
	<div class="pwd">
		<div class="findType">
            <div class=" box emailBox">
				<h2>邮箱激活</h2>
				<div class="progressBar cf">
				</div>
				<p class="tips">激活成功，请重新登录</p>
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
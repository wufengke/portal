<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>那好在线课程登录界面-那好网</title>
<meta name="description" content="那好在线课程登录界面" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/login/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body class="loginPage">
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout login" id="nahaoModule" module="login" data_page="studentPage">
	<div class="loginWrap cf">
		<div class="fl loginBgIco"></div>
		<div class="loginBox fr">
			<s:form action="login/submit" cssClass="loginForm" method="post" onsubmit="return check(this);">
				<br/>
				<p id="msgInfo" class="msgInfo" style="color:red;"></p>
				<ul>
					<li class="posr">
						<s:textfield id="username" name="username" value="%{#session.un}" cssClass="userName yh" autocomplete="off" placeholder="手机号/邮箱" />
						<div class="unBg loginInputBg"></div>
					</li>
					<li class="posr">
						<s:password id="password" name="password" value="" autocomplete="off" cssClass="pwd yh" placeholder="密码"/>
						<div class="pwdBg loginInputBg"></div>
					</li>
                    <input type="hidden" name="redirect_url" value="<%=basePath%>register" />
					<li class="cf autoLi posr">
						<input type="checkbox" checked name="rembme" id="autoLogin" class="fl autoLogin"/>
						<label for="autoLogin" class="fl">记住用户名</label>
						<a href="<%=basePath%>login/find_pwd" class="fr">忘记密码？</a>
					</li>
					<li>
						<input type="submit" class="redBtn yh btn redBtn submit" value="登录"/>
					</li>
					<li>
						<a href="<%=basePath%>register" class=" btn blueBtn">免费注册</a>
					</li>
				</ul>
			</s:form>
		</div>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
  	<script type="text/javascript" src="<%=basePath %>online/lib/jquery/1.8.2/jquery.js"></script>
  	<script type="text/javascript" src="<%=basePath %>online/lib/cookie/1.0.0/cookie.js"></script>
 	<script type="text/javascript">
	 	$(function(){
	 		var url = window.location.href;
	 		if(url.indexOf("error") != -1){
	 			$("#msgInfo").html("用户名或者密码错误！");
	 		}else{
	 			$("#msgInfo").html("");
	 	 	}
	 		getRememberInfo();
	 	});
		function check(form){
			var username = $("#username").val();
			var password = $("#password").val();
			if(username == null || username == ''){
				$("#msgInfo").html("请输入用户名！");
				return false;
			}else if(password == null || password == ''){
				$("#msgInfo").html("请输入密码！");
				return false;
			}else{
				$("#msgInfo").html("");
			}
			if($("#autoLogin").attr("checked")=="checked"){
				setCookie("username",username,24*10,"/");
			}
			return true;
		}
	 	
 	</script>
 	
</body>
</html>
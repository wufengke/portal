<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>9527在线课堂</title>
<meta name="description" content="9527在线课堂登录界面" />
<%@ include file="/common/JsCss.jsp" %>
<script src="<%=basePath%>js/common.js"></script>
</head>
<body class="loginContainer">
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="loginBg">
</div>
<div class="wrap layout login">
	<div class="loginWrap cf">
		<div class="loginBox fr">
		    <div class="ft18 loginTitle">登&nbsp;&nbsp;录</div>
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
                    <input type="hidden" name="redirect_url" value="<%=basePath%>register" ></input>
					<li class="cf autoLi posr">
						<input type="checkbox" checked name="rembme" id="autoLogin" class="fl autoLogin"/>
						<label for="autoLogin" class="fl">记住用户名</label>
						<a href="<%=basePath%>login/find_pwd_way2_step1" class="fr">忘记密码？</a>
					</li>
					<li>
						<input type="submit" class="greenBtn yh btn submit" value="登录"/>
					</li>
					<li class="link_white">
						<a href="<%=basePath%>register" class=" btn blueBtn">快速注册</a>
					</li>
				</ul>
			</s:form>
		</div>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
  	<script type="text/javascript" src="<%=basePath %>js/cookie.js"></script>
 	<script type="text/javascript">
	 	$(function(){
	 		var url = window.location.href;
	 		if(url.indexOf("error") != -1){
	 			$("#msgInfo").html("用户名或者密码错误！");
	 		}else{
	 			$("#msgInfo").html("");
	 	 	}
	 		getRememberInfo();
	 	    adJustContent();
	 	    $(window).resize(function () {
	 	        adJustContent();
	 	    });
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
		
	    function adJustContent() {
	        var win = $(window);
	        var width = win.width();
	        var height = win.height();
	        var hh = $(".lhb_header").height();
	        var fh = $(".footer").height();
	        var loginH = height - hh - fh-40;
	        $(".loginBg").height(loginH);
	    }
	 	
 	</script>
 	
</body>
</html>
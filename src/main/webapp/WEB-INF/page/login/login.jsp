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
<jsp:include page="/head2.jsp" />
<!-- 主要内容开始 -->
<div id="wraper">
	<div class="dl_w">
		<div class="dl">
		    <h3 class="ft18 loginTitle">登&nbsp;&nbsp;&nbsp;录</h3>
			<s:form action="login/submit" cssClass="loginForm" method="post" onsubmit="return check(this);">
				帐&nbsp;&nbsp;号：<s:textfield id="username" name="username" value="%{#session.un}" cssClass="userName yh zh" autocomplete="off" placeholder="请输入您的帐号...." />
				<br />
				密&nbsp;&nbsp;码：<s:password id="password" name="password" value="" autocomplete="off" cssClass="pwd yh zh" placeholder="请输入您的密码..."/>
				<span id="jz"><input type="checkbox" checked name="rembme" id="autoLogin" class="fl autoLogin mi"/>
				<a href="javascript:;">记住密码</a>
				</span>
				<span id="wj"><a href="<%=basePath%>login/find_pwd_way2_step1" >忘记密码？</a></span>
				<div class="dl_zc">
        		   <input type="submit" id="dl_dl" class="button" value="登&nbsp;&nbsp;录"/>
        		   <button id="zc" class="button"><a href="<%=basePath%>register" style="color: #fff;">注&nbsp;&nbsp;册</a></button>
        	    </div>
			</s:form>
		</div>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
  	<script type="text/javascript" src="<%=basePath %>js/cookie.js"></script>
 	<script type="text/javascript">
	 	$(function(){
	 		//var url = window.location.href;
	 		var error =$.getUrlParam("error");
	 		if(error!=null)
	 	    {
	 		   if(error==1){
	 			  alert("用户名或者密码错误！");
	 		   }else if(error==2){
	 			  alert("用户已被禁用！");
	 		   }	
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
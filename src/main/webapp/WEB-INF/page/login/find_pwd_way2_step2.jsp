<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>密码重置</title>
<meta name="description" content="" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout login" >
	<div class="pwd">
		<div class="setNewpwd layout">
            <div class=" box">
				<h2>邮箱找回密码</h2>
				<div class="progressBar cf">
					<span class="fl ">1. 验证邮箱</span>
					<span class="fl current">2. 设置新密码</span>
					<span class="fl ok">3. 完成</span>
				</div>
				<s:if test="#request.error == 1">
					<p class="tips" style="color:red;">参数不完整无法重置密码</p>
				</s:if>
				<s:if test="#request.error == 2">
					<p class="tips" style="color:red;">重置链接已经超时,请重新发送重置请求</p>
				</s:if>
				<s:if test="#request.error == 3">
					<p class="tips" style="color:red;">无效链接</p>
				</s:if>
				<s:if test="#request.error == 4">
					<p class="tips" style="color:red;">此链接已被使用,请重新发送重置请求</p>
				</s:if>
				<s:else>
					<p class="tips"></p>
				</s:else>
				
				<s:form action="/login/find_pwd_way2_step3" method="post" onsubmit="return formCheck(this);" cssClass="setPWForm">
					<s:hidden name="email" value="%{email}"></s:hidden>
					<s:hidden name="key" value="%{key}"></s:hidden>
					<s:hidden name="time" value="%{time}"></s:hidden>
					<s:hidden name="error" value="%{#request.error}"></s:hidden>
					<ul>
						<li class="cf">
							<p class="fl"><span>*</span>新密码</p>
							<div class="cf">
								<s:password id="password" cssClass="setPassword fl " placeholder="请输入新密码" validName="text" name='password' onblur="check(this);" maxlength="63"/>
								<span id="passwordchecktip" class="Validform_checktip fl undis"></span>
							</div>
						</li>
						<li class="cf">
							<p class="fl"><span>*</span>新密码确认</p>
							<div class="cf">
								<s:password  id="confirmPassword" cssClass="fl reSetPassword" placeholder="请再次输入新密码" validName="text" name='confirmPassword' onblur="check(this);" maxlength="63"/>
								<span id="confirmpasswordchecktip" class="Validform_checktip fl undis"></span>
							</div>
						</li>
						<li class="cf">
							<input type="submit" class="btn redBtn submit fl" value="确定" />
						</li>
					</ul>
				</s:form>
			</div>
		</div>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
 	<script type="text/javascript" src="<%=basePath %>online/lib/jquery/1.8.2/jquery.js"></script>
 	<script type="text/javascript">
 	 	(function($){
 			$.getUrlParam = function(name){
 				var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
 				var r = window.location.search.substr(1).match(reg);	
 				if (r!=null) return unescape(r[2]); return null;
 			}
 		})(jQuery);
	 	$(function(){
	 		var error = $.getUrlParam("error");
	 		if(error == 2){
				$("#passwordchecktip").html("密码不能为空");
				$("#passwordchecktip").removeClass("undis");
				$("#passwordchecktip").addClass("Validform_wrong");
		 	}else if(error == 3){
		 		$("#confirmpasswordchecktip").html("两次密码输入不一致");
				$("#confirmpasswordchecktip").removeClass("undis");
				$("#confirmpasswordchecktip").addClass("Validform_wrong");
			}else{
		 		$("#passwordchecktip").html("");
		 		$("#passwordchecktip").removeClass("Validform_wrong");
		 		$("#passwordchecktip").addClass("undis");
		 		$("#confirmpasswordchecktip").html("");
		 		$("#confirmpasswordchecktip").removeClass("Validform_wrong");
		 		$("#confirmpasswordchecktip").addClass("undis");
			}
	 	});
		function check(element){
			var v = $(element).val();
			if(typeof(v) == 'undefined' || v == null || v == ''){
				$(element).next().removeClass("undis");
				$(element).next().addClass("Validform_wrong");
				$(element).next().html("请输入新密码");
			}else if($(element).val().length < 6 || $(element).val().length > 63){
				$(element).next().removeClass("undis");
				$(element).next().addClass("Validform_wrong");
				$(element).next().html("新密码长度为6-63之间");
			}else{
				$(element).next().addClass("undis");
				$(element).next().removeClass("Validform_wrong");
			}
		}
	 	function formCheck(form){
		 	var password = $(form).find("#password").val();
		 	var confirmPassword = $(form).find("#confirmPassword").val();
		 	if(password == ''){
		 		$("#passwordchecktip").html("请输入新密码");
			 	$("#passwordchecktip").removeClass("undis");
			 	$("#passwordchecktip").addClass("Validform_wrong");
			 	
				return false;
			 }
		 	if(password.length < 6 || password.length > 63){
		 		$("#passwordchecktip").html("密码长度应为6~63个字符之间");
			 	$("#passwordchecktip").removeClass("undis");
			 	$("#passwordchecktip").addClass("Validform_wrong");
			 	
				return false;
			 }
		 	if(confirmPassword == ''){
		 		$("#confirmpasswordchecktip").html("请输入新密码确认");
			 	$("#confirmpasswordchecktip").removeClass("undis");
			 	$("#confirmpasswordchecktip").addClass("Validform_wrong");
			 	
				return false;
			 }
		 	if(confirmPassword.length < 6 || confirmPassword.length > 63){
		 		$("#confirmpasswordchecktip").html("密码长度应为6~63个字符之间");
			 	$("#confirmpasswordchecktip").removeClass("undis");
			 	$("#confirmpasswordchecktip").addClass("Validform_wrong");
			 	
				return false;
			 }
			 if(password != confirmPassword){
				$("#confirmpasswordchecktip").html("两次密码不一致,请重新输入");
			 	$("#confirmpasswordchecktip").removeClass("undis");
			 	$("#confirmpasswordchecktip").addClass("Validform_wrong");
			 	
				return false;
			 }
		 	return true;
		}
	</script>
</body>
</html>
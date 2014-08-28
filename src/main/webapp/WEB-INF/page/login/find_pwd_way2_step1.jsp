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
					<span class="fl current">1. 验证邮箱</span>
					<span class="fl ">2. 设置新密码</span>
					<span class="fl ok ">3. 完成</span>
				</div>
				<p class="tips">请填写您绑定的邮箱，我们会将邮件发送至您的邮箱，请注意查收</p>
				<s:form action="/login/find_pwd_way2_step2" method="post" onsubmit="return formCheck(this);" cssClass="EmailFindPW">
					<ul>
						<li class="cf">
							<p class="fl">邮箱</p>
							<div class="cf">
								<s:textfield  id="email" cssClass="fl inputEmail" placeholder="请输入注册时的邮箱" validName="text" name='email' onblur="check(this);" maxlength="63"/>
								<span id="emailchecktip" class="Validform_checktip fl undis"></span>
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
	 		if(error == 1){
				$("#emailchecktip").html("该邮箱在系统中不存在，请确认！");
				$("#emailchecktip").removeClass("undis");
				$("#emailchecktip").addClass("Validform_wrong");
		 	}else if(error == 2){
		 		$("#emailchecktip").html("请输入邮箱");
				$("#emailchecktip").removeClass("undis");
				$("#emailchecktip").addClass("Validform_wrong");
			}else if(error == 0){
		 		$("#emailchecktip").html("邮件已发送，请进入您的邮箱继续完成后续步骤");
				$("#emailchecktip").removeClass("undis");
				$("#emailchecktip").addClass("Validform_wrong");
			}else if(error == 4){
		 		$("#emailchecktip").html("每两小时只能申请一次密码重置");
				$("#emailchecktip").removeClass("undis");
				$("#emailchecktip").addClass("Validform_wrong");
			}else{
		 		$("#emailchecktip").html("");
		 		$("#emailchecktip").removeClass("Validform_wrong");
			}
	 	});
		function check(element){
			var v = $(element).val();
			if(typeof(v) == 'undefined' || v == null || v == ''){
				$(element).next().removeClass("undis");
				$(element).next().addClass("Validform_wrong");
				$(element).next().html("请输入邮箱");
			}else if($(element).val().length < 6 || $(element).val().length > 63){
				$(element).next().removeClass("undis");
				$(element).next().addClass("Validform_wrong");
				$(element).next().html("邮箱长度为6-63之间");
			}else{
				$(element).next().addClass("undis");
				$(element).next().removeClass("Validform_wrong");
			}
		}
	 	function formCheck(form){
		 	var email = $(form).find("#email").val();
		 	if(email == ''){
		 		$("#emailchecktip").html("请输入邮箱");
			 	$("#emailchecktip").removeClass("undis");
			 	$("#emailchecktip").addClass("Validform_wrong");
			 	
				return false;
			 }
		 	return true;
		}
	</script>
</body>
</html>
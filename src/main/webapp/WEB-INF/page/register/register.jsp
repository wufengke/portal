<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>那好在线课程注册界面-那好网</title>
<meta name="description" content="那好在线课程注册界面" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/login/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body class="loginPage">
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout login" id="nahaoModule" module="login" data_page="studentPage">
	<div class="regWrap cf">
		<div class="regBox fl">
			<h2>快速注册<span>一分钟改变你的学习方式</span></h2>
			<div class="regTab">
				<div class="tabBox cf">
					<a href="javascript:void(0)"  class="fl active">邮箱注册</a>
					<!-- <a href="javascript:void(0)"  class="fl" >手机注册</a> -->
				</div>
				<div class="contentBox">
					<div class="box emailBox">
						<s:form action="register/submit" cssClass="regEmailBox" method="post" onsubmit="return formCheck(this);" >
							<ul>
								<li>
									<p>邮箱</p>
									<s:textfield id="email" name="email" value="" cssClass="email regInput yh" placeholder="邮箱地址" onblur="check(this);" maxlength="63"/>
									<div id="emailCheck1" class="Validform_tip_info undis">请输入邮箱地址</div>
                          			<div class="Validform_checktip"></div>
								</li>
								<li>
									<p>密码</p>
									<s:password id="password" name="password" cssClass="pwd regInput yh" placeholder="6-63位字符"  onblur="check(this);" maxlength="63"/>
									<div id="passwordCheck1" class="Validform_tip_info undis">请输入密码</div>
                          			<div class="Validform_checktip"></div>
								</li>
								<li>
									<p>密码确认</p>
									<s:password id="confirmPassword" name="confirmPassword" cssClass="pwd regInput yh" placeholder="6-63位字符"  onblur="check(this);" maxlength="63"/>
									<div id="confirmPasswordCheck1" class="Validform_tip_info undis">请输入密码确认</div>
                          			<div class="Validform_checktip"></div>
								</li>
								<!-- 
								<li>
									<p>手机号（选填）</p>
									<s:textfield name="ephone" cssClass="ephone regInput yh" placeholder="填写手机号码，第一时间获知名师公开课"/>
								</li>
								 -->
								<li class="agreementLi">
									<input type="checkbox" checked id="agreementEmail"/>
									<label for="agreementEmail">我已阅读并同意</label>
									<a href="<%=basePath%>about/service" target="_blank">那好网服务使用协议</a>
								</li>
								<li>
									<input type="submit" class="btn redBtn regInput submit yh" value="免费注册 " />
								</li>
							</ul>
						</s:form>
					</div>
					<div class="box phoneBox undis" >
						<s:form action="register/submit" cssClass="regPhoneBox" method="post" onsubmit="return false">
							<ul>
								<li>
									<p>手机号</p>
									<s:textfield value="" name="phone" cssClass="phoneNum regInput yh" placeholder="使用手机注册，第一时间获知名师公开课" />
									<div id="" class="Validform_tip_info undis">请输入手机号</div>
                          			<div class="Validform_checktip"></div>
								</li>
								<li>
									<p>密码</p>
									<s:password  name="password" cssClass="pwd regInput yh" placeholder="6-63位字符，区分大小写" />
									<div class="Validform_tip_info undis">请输入密码</div>
                          			<div class="Validform_checktip"></div>
								</li>
								<li class="cf liPhoneCode">
									<input type="button" class="btn blueBtn pnoneCode fl sendPhoneCode" value="免费获取验证码"/>
									<div class="fr reg_validate_code">
										<s:textfield  name="captcha" cssClass="codeInput regInput yh" placeholder="请输入手机验证码" />
										<div class="Validform_tip_info undis">请输入手机验证码</div>
                          				<div class="Validform_checktip"></div>
									</div>
								</li>
								<li class="agreementLi">
									<input type="checkbox" checked id="agreementPhone" />
									<label for="agreementPhone">我已阅读并同意</label>
									<a href="<%=basePath%>about/service" target="_blank">那好网服务使用协议</a>
								</li>
								<li>
									<input type="submit" class="btn redBtn regInput submit yh" value="免费注册 " />
								</li>
							</ul>
						</s:form>
					</div>
				</div>
			</div>			
		</div>
		<div class="regRight fl">
			<!-- <p class="redText">在过去的几分钟</p> -->
			<div class="rollPar posr">
				<div class="rollBox">
					<ul class="rollUpDown">
					</ul>
					<ul class="rollUpDownCopy">
					</ul>
				</div>	
			</div>	
		</div>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
  	<script type="text/javascript" src="<%=basePath %>online/lib/jquery/1.8.2/jquery.js"></script>
 	<script type="text/javascript">
	 	$(function(){
	 		var url = window.location.href;
	 		if(url.indexOf("error") != -1){
	 			$("#emailCheck1").html("该账号已经被注册，请使用其他邮箱注册！");
	 			$("#emailCheck1").removeClass("undis");
	 			$("#emailCheck1").addClass("Validform_wrong");
	 		}else{
	 			$("#emailCheck1").html("");
	 			$("#emailCheck1").addClass("undis");
	 			$("#emailCheck1").removeClass("Validform_wrong");
	 	 	}

	 		//setInterval(timer,10000);
	 	});
		function check(element){
			var v = $(element).val();
			if(typeof(v) == 'undefined' || v == null || v == ''){
				$(element).next().removeClass("undis");
				$(element).next().addClass("Validform_wrong");
			}else if($(element).val().length < 6 || $(element).val().length > 63){
				$(element).next().removeClass("undis");
				$(element).next().addClass("Validform_wrong");
				$(element).next().html("用户名和密码长度为6-63之间");
			}else{
				$(element).next().addClass("undis");
				$(element).next().removeClass("Validform_wrong");
			}
		}
	 	function formCheck(form){
		 	var email = $(form).find("#email").val();
		 	var password = $(form).find("#password").val();
		 	var confirmPassword = $(form).find("#confirmPassword").val();
		 	
		 	if(email == ''){
			 	$("#emailCheck1").removeClass("undis");
			 	$("#emailCheck1").addClass("Validform_wrong");
			 	$("#emailCheck1").html("请输入邮箱地址");
				return false;
			 }
		 	if(password == ''){
			 	$("#passwordCheck1").removeClass("undis");
			 	$("#passwordCheck1").addClass("Validform_wrong");
			 	$("#passwordCheck1").html("请输入密码");
				return false;
			 }
		 	if(confirmPassword == ''){
			 	$("#confirmPasswordCheck1").removeClass("undis");
			 	$("#confirmPasswordCheck1").addClass("Validform_wrong");
			 	$("#confirmPasswordCheck1").html("请输入密码确认");
				return false;
			 }
		 	if(password.length < 6 || password.length > 63){
			 	$("#passwordCheck1").removeClass("undis");
			 	$("#passwordCheck1").addClass("Validform_wrong");
			 	$("#passwordCheck1").html("密码长度应为6~63个字符之间");
				return false;
			 }
		 	if(confirmPassword != password){
			 	$("#confirmPasswordCheck1").removeClass("undis");
			 	$("#confirmPasswordCheck1").addClass("Validform_wrong");
			 	$("#confirmPasswordCheck1").html("两次密码输入不一致");
				return false;
			 }
			 
		 	return true;
		}
		function timer(){
			$.post("/register/timer",function(data){
				if(data != null){
					$.each(data,function(index){
						$(".rollUpDown").append("<li><span class=\"usename\">"+data[index].username+"</span><span>刚加入了那好课堂</span></li>");
						$(".rollUpDownCopy").append("<li><span class=\"usename\">"+data[index].username+"</span><span>刚加入了那好课堂</span></li>");
					});
				}

			},"json");
		}
 	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>那好投诉与建议处理-那好网</title>
<meta name="description" content="那好在线教育平台投诉、建议及相关问题，请联系我们。我们会及时核查您有关那好投诉与建议的问题，解决您的投诉。您的参与将帮助我们改进产品与服务。那好网！（nahao.com）"/>
<meta name="keywords" content=""/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/about/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body class="aboutPage">
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout about" id="nahaoModule" module="about" data_page="studentPage">

	<!--关于我们 左侧 开始-->
	<div class="sideLeftNav fl" id="sideLeftNav">
	    <ul>
	<li class="aboutus">
		<a href="<%=basePath%>about/aboutus">关于我们</a>
	</li>
	<li class="classmode">
		<a href="<%=basePath%>about/joinus">加入我们</a>
	</li>
	<li class="userhelp">
		<a href="<%=basePath%>about/userhelp">用户帮助</a>
	</li>
	<li class="advise curNav">
		<a href="<%=basePath%>about/advise">意见反馈</a>
	</li>
	<li class="contactus">
		<a href="<%=basePath%>about/contactus">联系我们</a>
	</li>
	<li class="service">
		<a href="<%=basePath%>about/service">服务协议</a>
	</li>
</ul>
    </div>
    <!--关于我们 左侧 结束-->
    
	<!--关于我们 右侧 开始-->
		<!--提出建议-->
    <div class="aboutContent fr" id="aboutContent" module="advise">
	    <!--提出建议-->
<div class="adviseBox">
	<h2>意见反馈</h2>
	<s:form action="feedback" cssClass="" namespace="/about" method="get" onsubmit="return formcheck(this);">
		<ul>
			<li class="cf posr">
				<p class="fbText">如果您对我们的产品服务想提出意见或建议，或使用中遇到问题，可以在这里自由吐槽</p>
				<div class="cf">
					<s:textarea name="content" cssClass="fTextarea fl ctextarea" validname="textarea" datatype="*" nullmsg="请提出您宝贵的意见或者建议" onblur="check(this);"/>
					<span id="contentCheckTip"  class="Validform_checktip fl Validform_wrong" >
						<s:fielderror fieldName="contentCheckTip" ></s:fielderror>
					</span>
				</div>
			</li>
			<li class="posr">
				<p class="formName">您的称呼</p>
				<div class="cf">
					<s:textfield placeholder="请输入您的称呼，以便我们和您联系" name="nickname" cssClass="fname fl cInput" validname="text" datatype="*2-20" nullmsg="请输入称呼" errormsg="长度2-20个字符" onblur="check(this);" maxlength="20"/>
					<span id="nicknameCheckTip" class="Validform_checktip fl Validform_wrong">
						<s:fielderror fieldName="nicknameCheckTip" ></s:fielderror>
					</span>
				</div>
			</li>
			<li class="cf posr">
				<p class="formName">您的邮箱</p>
				<div class="cf">
					<s:textfield placeholder="请输入您的邮箱，以便尽快为您解决问题" name="email" cssClass="fEmail fl cInput" validname="text" datatype="e" nullmsg="请输入邮箱地址" errormsg="请输入正确的邮箱地址" onblur="check(this);" maxlength="64"/>
					<span id="emailCheckTip" class="Validform_checktip fl Validform_wrong">
						<s:fielderror fieldName="emailCheckTip" ></s:fielderror>
					</span>
				</div>
			</li>
			<li>
				<input type="submit" class="noShowBtn redBtn submit" value="提交" />
			</li>
		</ul>
	</s:form>
</div>
    </div>
	</div>
<!-- 主要内容结束 -->
 <jsp:include page="/login_pop.jsp" />
 <script type="text/javascript" src="<%=basePath %>online/lib/jquery/1.8.2/jquery.js"></script>
 	<script type="text/javascript">
	 	$(function(){
	 		var url = window.location.href;
	 		if(url.indexOf("error") != -1){
	 			if(confirm("您的建议已经提交，点击【确定】跳转到首页")){
					window.location.href="wwww.phas.cn/index";
		 		}
	 		}
	 	});
	 	function formcheck(form){
		 	return true;
		}
		function check(element){
			var v = $(element).val();
			if(typeof(v) == 'undefined' || v == null || v == ''){
				$(element).next().removeClass("undis");
				$(element).next().addClass("Validform_wrong");
				$(element).next().html("请输入内容");
			}else{
				$(element).next().addClass("undis");
				$(element).next().removeClass("Validform_wrong");
			}
		}
	 </script>
</body>
</html>
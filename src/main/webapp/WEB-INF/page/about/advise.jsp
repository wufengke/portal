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
<body class="aboutPage"><div class="aui_state_focus" style="position: absolute; left: -9999em; top: 164px; width: 485px; z-index: 1000;"><div class="aui_outer"><table class="aui_border"><tbody><tr><td class="aui_nw"></td><td class="aui_n"></td><td class="aui_ne"></td></tr><tr><td class="aui_w"></td><td class="aui_c"><div class="aui_inner"><table class="aui_dialog"><tbody><tr><td colspan="2" class="aui_header"><div class="aui_titleBar"><div class="aui_title" style="cursor: move;">系统提示</div><a class="aui_close" href="javascript:void(0);">×</a></div></td></tr><tr><td class="aui_icon"><div class="aui_iconBg" style="background-image: url(http://static.nahao.com/online/images/dialog/icon/warning.png);"></div></td><td class="aui_main" style="width: 420px; height: auto;"><div class="aui_content" style="padding: 20px;"><div class="aui_loading"><span>loading..</span></div></div></td></tr><tr><td colspan="2" class="aui_footer"><div class="aui_buttons"><button class="aui_state_highlight" type="button">确定</button></div></td></tr></tbody></table></div></td><td class="aui_e"></td></tr><tr><td class="aui_sw"></td><td class="aui_s"></td><td class="aui_se" style="cursor: auto;"></td></tr></tbody></table></div></div>
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
		<s:if test=""></s:if>
		<ul>
			<li class="cf posr">
				<p class="fbText">如果您对我们的产品服务想提出意见或建议，或使用中遇到问题，可以在这里自由吐槽</p>
				<div class="cf">
					<s:textarea name="content" cssClass="fTextarea fl ctextarea" validname="textarea" datatype="*" nullmsg="请提出您宝贵的意见或者建议" errormsg="" onblur="check(this);"/>
					<span id="contentCheckTip"  class="Validform_checktip fl Validform_wrong" >
						<s:fielderror fieldName="contentCheckTip" ></s:fielderror>
					</span>
				</div>
			</li>
			<li class="posr">
				<p class="formName">您的称呼</p>
				<div class="cf">
					<s:textfield type="text" placeholder="请输入您的称呼，以便我们和您联系" name="nickname" cssClass="fname fl cInput" validname="text" datatype="*2-20" nullmsg="请输入称呼" errormsg="长度2-20个字符" onblur="check(this);" maxlength="20"/>
					<span id="nicknameCheckTip" class="Validform_checktip fl Validform_wrong">
						<s:fielderror fieldName="nicknameCheckTip" ></s:fielderror>
					</span>
				</div>
			</li>
			<li class="cf posr">
				<p class="formName">您的邮箱</p>
				<div class="cf">
					<s:textfield type="text" placeholder="请输入您的邮箱，以便尽快为您解决问题" name="email" cssClass="fEmail fl cInput" validname="text" datatype="e" nullmsg="请输入邮箱地址" errormsg="请输入正确的邮箱地址" onblur="check(this);" maxlength="64"/>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>联系我们-那好网</title>
<meta name="description" content=""/>
<meta name="keywords" content=""/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/about/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body class="aboutPage"><div class="aui_state_focus" style="position: absolute; left: -9999em; top: 170px; width: 485px; z-index: 1000;"><div class="aui_outer"><table class="aui_border"><tbody><tr><td class="aui_nw"></td><td class="aui_n"></td><td class="aui_ne"></td></tr><tr><td class="aui_w"></td><td class="aui_c"><div class="aui_inner"><table class="aui_dialog"><tbody><tr><td colspan="2" class="aui_header"><div class="aui_titleBar"><div class="aui_title" style="cursor: move;">系统提示</div><a class="aui_close" href="javascript:void(0);">×</a></div></td></tr><tr><td class="aui_icon"><div class="aui_iconBg" style="background-image: url(http://static.nahao.com/online/images/dialog/icon/warning.png);"></div></td><td class="aui_main" style="width: 420px; height: auto;"><div class="aui_content" style="padding: 20px;"><div class="aui_loading"><span>loading..</span></div></div></td></tr><tr><td colspan="2" class="aui_footer"><div class="aui_buttons"><button class="aui_state_highlight" type="button">确定</button></div></td></tr></tbody></table></div></td><td class="aui_e"></td></tr><tr><td class="aui_sw"></td><td class="aui_s"></td><td class="aui_se" style="cursor: auto;"></td></tr></tbody></table></div></div>
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
	<li class="advise">
		<a href="<%=basePath%>about/advise">意见反馈</a>
	</li>
	<li class="contactus curNav">
		<a href="./联系我们-那好网_files/联系我们-那好网.htm">联系我们</a>
	</li>
	<li class="service">
		<a href="<%=basePath%>about/service">服务协议</a>
	</li>
</ul>
    </div>
    <!--关于我们 左侧 结束-->
    
	<!--关于我们 右侧 开始-->
		<!--联系我们-->
	<div class="aboutContent fr" id="aboutContent" module="contactus">
	    <!--联系我们-->
<div class="contactusBox"> 
 	<p>
		<strong>Email：</strong>
		<span>hezuo@nahao.com</span>
	</p>
	<p>
		<strong>联系电话：</strong>
		<span>400-864-8686</span>
	</p>
	<p>
		<strong>公司地址：</strong>
		<span>北京市海淀区中关村大街18号中关村数字物流港大厦0917</span>
	</p>
	<p>
		<strong>邮编：</strong>
		<span>100190</span>
	</p>
</div>
    </div>
	</div>
<!-- 主要内容结束 -->
 <jsp:include page="/login_pop.jsp" />
</body>
</html>
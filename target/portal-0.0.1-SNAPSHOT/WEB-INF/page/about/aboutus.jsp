<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>关于我们-那好网</title>
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
	<li class="aboutus curNav">
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
		<!--关于我们-->
	<div class="aboutContent fr" id="aboutContent" module="aboutus">
	    <!--关于我们-->
<div class="aboutusBox">
	<div>
		<h2>那好网(www.nahao.com )隶属于北京一朵云文化咨询有限公司，是中小学“直播互动”线上教育平台。</h2>
	</div>
	<div>
		<h3>那好网的使命是：</h3>
		<p>以科技推动教育进步</p>
		<p>以互联网助力教育资源均衡化</p>
		<p>帮助学生找到适合自己的教育，开发自身潜能</p>
		<p>帮助教师和学生的教与学，更优质、更高效、更愉快</p>
	</div>
	<div>
		<p>那好网荟萃全国名师，为教师提供实现自己教育梦想的平台。</p>
		<p>那好网为学生提供方便、高效、愉悦的学习体验，助力学生全面成长。</p>
	</div>
	<div>
		<p>师生之间的实时互动，是那好网的特点。我们相信：对于中小学生，人与人的直接互动是最有效的教育形式，学生即时表达，老师随时根据学生情况调整教学，才能真正做到因材施教、提升教学效能。</p>
	</div>
	<p class="redText">学习好，上那好！</p>
</div>
    </div>
	</div>
<!-- 主要内容结束 -->
 <jsp:include page="/login_pop.jsp" />
</body>
</html>
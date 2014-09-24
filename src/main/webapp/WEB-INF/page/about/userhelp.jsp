<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
 <title>9527在线课堂</title>
<meta name="keywords" content=""/>
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
	<li class="userhelp curNav">
		<a href="<%=basePath%>about/aboutus">用户帮助</a>
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
		<!--用户帮助-->
	<div class="aboutContent fr" id="aboutContent" module="userhelp">
	    <!--用户帮助-->
<div class="userhelpBox">
	<h2 class="redText">用户帮助</h2>
	<div>
		<h3>直播课程购买步骤</h3>
		<div class="buyStep">
			<span>1.选购适合您的相关课程</span>
			<span class="margin1">2.查看课程详情</span>
			<span>3.选择开课时间</span>
			<span class="margin2">4.支付</span>
			<span>5.购课成功</span>
			<span class="margin3">6.进入教室互动学习</span>
		</div>
	</div>
	<div>
		<h3>学员学习流程</h3>
		<ul class="process">
			<li>
				<h3>1、进入那好网站 www.nahao.com，输入手机号/邮箱和密码登录，登录成功后进入“我的课程”</h3>
				<img src="">
			</li>
			<li>
				<h3>2、查看已购买的课程，点击“进入课程”按钮，查看课程安排并提前下载课程讲义进行预习</h3>
				<img src="">
			</li>
			<li>
				<h3>3、查看即将开始的课程，点击“去上课”按钮即可进入教室学习（教室提前半小时开放）</h3>
				<img src="">
			</li>
		</ul>
	</div>	
	<div>
		<h3>讲义常见问题</h3>
		<ul class="comproblem">
			<li>
				<h3>1、课程讲义是否可以下载？</h3>
				<p>直播课程配套讲义，是提供下载的，并无下载次数的限制。</p>
			</li>
			<li>
				<h3>2、讲义是否有下载次数的限制？</h3>
				<p>那好直播课堂提供的讲义，没有下载次数的限制。</p>
			</li>
			<li>
				<h3>3、讲义打开后显示空白，怎么办？</h3>
				<p>请检查您的电脑是否安装了pdf阅读器，安装完成后若还是无法打开讲义，可能是由于讲义和pdf阅读器之间无法关联。您先打开pdf阅读器，然后把您下载的讲义拖拽到pdf阅读器里，就可以打开讲义了。</p>
			</li>
			<li>
				<h3>4、讲义的内容不全面怎么办？</h3>
				<p>那好直播课堂的配套讲义内容都是很全面的，如有缺失请联系客服老师 kefu@nahao.com。</p>
			</li>
		</ul>
	</div>	
	
</div>

    </div>
	</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
</body></html>
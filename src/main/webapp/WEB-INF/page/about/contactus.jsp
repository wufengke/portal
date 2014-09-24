<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
 <title>9527在线课堂</title>
<meta name="description" content=""/>
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
 <jsp:include page="/foot.jsp" />
</body>
</html>
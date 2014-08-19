<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>核对订单信息</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/studentCart/style.css" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentCart" id="nahaoModule" module="studentCart" data_page="studentPage">
	<div class="infoCheck">
		<!-- 进度条开始 -->
		<div class="progressBar cf">
			<div class="line"></div>
			<ul class="fr">
				<li class="fl">
					<em>1</em>
					<span>填写并核对订单信息</span>
				</li>				
				<li class="last fl">
					<em>●</em>
					<span>成功提交订单</span>
					<b class="lineBg"></b>
				</li>
			</ul>
		</div>		
		<!-- 进度条结束 -->
		
		<!-- 核对订单信息开始 -->
		<div class="checkForm outerBox">
			<h2><span>请核对订单信息</span></h2>
			<div class="innerBox">
				<dl>
					<dt>
						<!-- <span class="num">序号</span> -->
						<span class="name">课程名称</span>
						<span class="time">上课日期</span>
						<span class="oldPrice">原价</span>
						<span class="newPrice">优惠价</span>
						<!-- <span class="operation">操作</span> -->
					</dt>

					<dd>
						<!-- span class="num">1</span> -->
						<span class="name"><s:property value="%{course.courseTitle}"/></span>
						<span class="time"><s:date name="course.courseTime" format="yyyy/MM/dd" />--<s:date name="course.courseTime" format="yyyy/MM/dd" /></span>
						<span class="oldPrice">¥0.00<em></em></span>
						<span class="newPrice">¥0.00</span>
						<!-- <span class="operation"><a href="javascript:void(0)">删除</a></span> -->
					</dd>

				</dl>
			</div>
			
			<p class="total cf">
				<!-- <span>共选<em>1</em>门课程</span> -->
				<span class="price fr">总金额<em>¥0.00</em></span>
				<span class="save fr">您本次共节省了<em>0</em>元</span>
			</p>
		</div>
		
		<!-- 核对订单信息结束 -->
		<!-- 填写练习方式开始 -->
		<div class="contactInfo outerBox">
			<h2><span>请填写联系方式</span></h2>
			<div class="innerBox">
				<s:form action="/pay/submit" method="post">
					<s:hidden name="courseId" value="%{courseId}"></s:hidden>
					<s:hidden name="rank" value="%{rank}"></s:hidden>
					<ul>
						<li>
							<p class="title">真实姓名</p>
							<div class="cf inputBox">
								<s:textfield name="realName" id="realName" cssClass="inname fl yh cInput" validName="text" 
								value="%{#session.user.realName}" />
								<span class="Validform_checktip fl"></span>
							</div>
						</li>
						<li>
							<p class="title">联系电话</p>
							<div class="cf inputBox">
								<s:textfield name="phone" id="phone" cssClass="inname fl yh cInput" validName="text" 
								value="%{#session.account.phone}" />
								<span class="Validform_checktip fl"></span>
							</div>
						</li>
							
						<li>
							<input type="submit" class="btn redBtn submitBtn" value="提交订单">
						</li>
					</ul>
				</s:form>
			</div>
		</div>
		<!-- 填写练习方式结束 -->
		

	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
<jsp:include page="/right_side.jsp" />
</body>
</html>

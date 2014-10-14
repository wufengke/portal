<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>核对订单信息</title>
<%@ include file="/common/JsCss.jsp" %>
</head>
<body style="background-color: white;">
<jsp:include page="/head2.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentCourse" >
	<div class="toPay">
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
				</li>
			</ul>
		</div>		
		<!-- 进度条结束 -->
		<!-- 订单信息开始 -->
		<div class="orderForm">
			<h3>您已购买成功！</h3>
			<p>
				<span>订单编号<em class="red"><s:property value="%{orderId}"/></em></span>
				<span>应付金额<em class="red">¥0.00</em></span>
			</p>
			<p class="last"><a href="<%=basePath %>member/my_order_all" class="blueText">请点击去我的订单查看购买记录</a></p>
			
		</div>
		<!-- 支付方式 结束-->
		<!--弹窗开始 -->
		<!-- 成功与否选择开始 -->
		<div class="popBox undis">
			<div class="choiceBox">
				<p calss="title">请在打开的页面上完成付款，付款完成前不要关闭此窗口</p>
				<div class="cf">
					<div class="errorBox btnBox fl">
						<p>支付遇到问题？</p>
						<a href="javascript:void(0)"  class="btn3 cf check_pay" >
							<span class="fl">重新支付</span>
							<span class="fr"></span>
							<span id="ddd"></span>
						</a>

					</div>
					<div class="okBox btnBox fr">
						<p>已经支付成功！</p>
						<a href="javascript:void(0)"  class="btn3 blue cf check_pay" >
							<span class="fl">查看订单</span>
							<span class="fr"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 成功与否选择结束 -->
		<!--弹窗结束 -->
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
<jsp:include page="/right_side.jsp" />
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的课程</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/studentMyCourse/style.css">
<%@ include file="/common/JsCss.jsp" %>
</head>
<body class="myCoursePage"><div class="" style="display: none; position: absolute;"><div class="aui_outer"><table class="aui_border"><tbody><tr><td class="aui_nw"></td><td class="aui_n"></td><td class="aui_ne"></td></tr><tr><td class="aui_w"></td><td class="aui_c"><div class="aui_inner"><table class="aui_dialog"><tbody><tr><td colspan="2" class="aui_header"><div class="aui_titleBar"><div class="aui_title" style="cursor: move;"></div><a class="aui_close" href="javascript:void(0);">×</a></div></td></tr><tr><td class="aui_icon"><div class="aui_iconBg" style="background-image: url(http://static.nahao.com/online/images/dialog/icon/warning.png);"></div></td><td class="aui_main" style="width: 420px; height: auto;"><div class="aui_content" style="padding: 20px;"></div></td></tr><tr><td colspan="2" class="aui_footer"><div class="aui_buttons"></div></td></tr></tbody></table></div></td><td class="aui_e"></td></tr><tr><td class="aui_sw"></td><td class="aui_s"></td><td class="aui_se" style="cursor: auto;"></td></tr></tbody></table></div></div>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentMyCourse" id="nahaoModule" module="studentMyCourse" data_page="studentPage">
	<!-- 右侧框架开始 -->

   		    <div class="wrapContent fr myOrderCon" id="wrapContent" name="myOrderCon">
		    <!--我的订单-->
		    <!--我的订单-->
<h3 class="pageName">我的订单</h3>
<div class="orderComBox">
	<ul class="tabh cf">
		<li class="tabhOn"><a href="<%=basePath%>member/my_order_all">全部订单<span class="redText"><s:property value="%{allOrderCount}"/></span></a></li>

		<li><a href="<%=basePath%>member/my_order_nopay">未付款<span class="redText"><s:property value="%{notPaidOrderCount}"/></span></a></li>
		<li><a href="<%=basePath%>member/my_order_pay">已付款<span class="redText"><s:property value="%{paidOrderCount}"/></span></a></li>
		<li><a href="<%=basePath%>member/my_order_cancel">已取消/已关闭<span class="redText"><s:property value="%{canceledOrderCount}"/></span></a></li>
		<li class="norbor"><a href="<%=basePath%>member/my_order_refund">退款<span class="redText"><s:property value="%{refundOrderCount}"/></span></a></li>
	</ul>
	
	<div class="tabCon">
		<!-- 全部订单 -->
		<div class="tabBox">
			<table>
				<thead>
					<tr>
						<td class="orderName oInfor">订单信息</td>
						<td class="orderName">金额</td>
						<td class="orderName">下单时间</td>
						<td class="orderName">状态</td>
						<td class="orderName">操作</td>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#request.orderList" var="order" status="s">
						<tr class="payment">
							<td class="oInfor">
								<p class="ordernum">订单编号<span><s:property value="%{#order.orderId}"/></span></p>
								<div>
									<img src="${order.smallImageUrl}" alt="">
								</div>
								<p class="orderTitle" title="${order.courseTitle}"><s:property value="%{#order.courseTitle}"/></p>
							</td>
							<td><strong class="redText">¥0.00</strong></td>
							<td>
								<span class="time"><s:property value="%{#order.createTime}"/></span>
							</td>
							<td class="redText">已付款</td>
							<td>
								<a href="<%=basePath%>member/order_detail" target="_blank" class="blueText">查看</a>			
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		<!-- 已付款  -->
		<div class="undis tabBox">
			<table>
				<thead>
					<tr>
						<td class="orderName oInfor">订单信息</td>
						<td class="orderName">金额</td>
						<td class="orderName">下单时间</td>
						<td class="orderName">状态</td>
						<td class="orderName">操作</td>
					</tr>
				</thead>
				<tbody>
					<tr class="payment">
						<td class="oInfor">
							<p class="ordernum">订单编号<span>4765</span></p>
							<div>
								<img src="" alt="">
							</div>
							<p class="orderTitle" title="精彩数学抢先学---人教版七年级上（正数、负数及有理数的分类）">精彩数学抢先学---人教版七年...</p>
						</td>
						<td><strong class="redText">¥0.00</strong></td>
						<td>
							<span class="time">
								2014/08/10 11:57:10
							</span>
						</td>
						<td class="redText">已付款</td>
						<td>
							<a href="<%=basePath%>member/order_detail" target="_blank" class="blueText">查看</a>			
							<a href="<%=basePath%>member/doRefund" target="_blank" class="blueText">申请退课</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
		<!-- 未付款 -->
		<div class="undis tabBox">
			<table>
				<thead>
					<tr>
						<td class="orderName oInfor">订单信息</td>
						<td class="orderName">金额</td>
						<td class="orderName">下单时间</td>
						<td class="orderName">状态</td>
						<td class="orderName">操作</td>
					</tr>
				</thead>
				<tbody>
					<tr class="payment">
						<td class="oInfor">
							<p class="ordernum">订单编号<span>4765</span></p>
							<div>
								<img src="" alt="">
							</div>
							<p class="orderTitle" title="精彩数学抢先学---人教版七年级上（正数、负数及有理数的分类）">精彩数学抢先学---人教版七年...</p>
						</td>
						<td><strong class="redText">¥0.00</strong></td>
						<td>
							<span class="time">
								2014/08/10 11:57:10
							</span>
						</td>
						<td class="redText">已付款</td>
						<td>
							<a href="<%=basePath%>member/my_order_detail" target="_blank" class="blueText">查看</a>			
							<a href="<%=basePath%>member/my_order_doRefund" target="_blank" class="blueText">申请退课</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 已取消 -->
		<div class="undis tabBox">
			<table>
				<thead>
					<tr>
						<td class="orderName oInfor">订单信息</td>
						<td class="orderName">金额</td>
						<td class="orderName">下单时间</td>
						<td class="orderName">状态</td>
						<td class="orderName">操作</td>
					</tr>
				</thead>
				<tbody>
					<tr class="payment">
						<td class="oInfor">
							<p class="ordernum">订单编号<span>4765</span></p>
							<div>
								<img src="" alt="">
							</div>
							<p class="orderTitle" title="精彩数学抢先学---人教版七年级上（正数、负数及有理数的分类）">精彩数学抢先学---人教版七年...</p>
						</td>
						<td><strong class="redText">¥0.00</strong></td>
						<td>
							<span class="time">
								2014/08/10 11:57:10
							</span>
						</td>
						<td class="redText">已付款</td>
						<td>
							<a href="<%=basePath%>member/my_order_detail" target="_blank" class="blueText">查看</a>			
							<a href="<%=basePath%>member/my_order_doRefund" target="_blank" class="blueText">申请退课</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 已退款  -->
		<div class="undis tabBox">
			<table>
				<thead>
					<tr>
						<td class="orderName oInfor">订单信息</td>
						<td class="orderName">金额</td>
						<td class="orderName">下单时间</td>
						<td class="orderName">状态</td>
						<td class="orderName">操作</td>
					</tr>
				</thead>
				<tbody>
					<tr class="payment">
						<td class="oInfor">
							<p class="ordernum">订单编号<span>4765</span></p>
							<div>
								<img src="" alt="">
							</div>
							<p class="orderTitle" title="精彩数学抢先学---人教版七年级上（正数、负数及有理数的分类）">精彩数学抢先学---人教版七年...</p>
						</td>
						<td><strong class="redText">¥0.00</strong></td>
						<td>
							<span class="time">
								2014/08/10 11:57:10
							</span>
						</td>
						<td class="redText">已付款</td>
						<td>
							<a href="<%=basePath%>member/order_detail" target="_blank" class="blueText">查看</a>			
							<a href="<%=basePath%>member/doRefund" target="_blank" class="blueText">申请退课</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
</div>
</div> 
        <!-- 右侧框架结束 -->
  <jsp:include page="/left_side.jsp" />
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
</body>
</html>
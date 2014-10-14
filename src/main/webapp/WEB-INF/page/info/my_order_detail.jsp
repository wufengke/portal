<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的课程</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/studentMyCourse/style.css"/>
<%@ include file="/common/JsCss.jsp" %>
</head>
<body class="myCoursePage"><div class="" style="display: none; position: absolute;"><div class="aui_outer"><table class="aui_border"><tbody><tr><td class="aui_nw"></td><td class="aui_n"></td><td class="aui_ne"></td></tr><tr><td class="aui_w"></td><td class="aui_c"><div class="aui_inner"><table class="aui_dialog"><tbody><tr><td colspan="2" class="aui_header"><div class="aui_titleBar"><div class="aui_title" style="cursor: move;"></div><a class="aui_close" href="javascript:void(0);">×</a></div></td></tr><tr><td class="aui_icon"><div class="aui_iconBg" style="background-image: url(http://static.nahao.com/online/images/dialog/icon/warning.png);"></div></td><td class="aui_main" style="width: 420px; height: auto;"><div class="aui_content" style="padding: 20px;"></div></td></tr><tr><td colspan="2" class="aui_footer"><div class="aui_buttons"></div></td></tr></tbody></table></div></td><td class="aui_e"></td></tr><tr><td class="aui_sw"></td><td class="aui_s"></td><td class="aui_se" style="cursor: auto;"></td></tr></tbody></table></div></div>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentMyCourse" id="nahaoModule" module="studentMyCourse" data_page="studentPage">
	<!-- 右侧框架开始 -->
 <div class="wrapContent fr myOrderCon" id="wrapContent" name="myOrderCon">
<!--订单信息页-->
<!--订单详情-->
<h3 class="pageName">订单详情</h3>
<div class="detailBox">	
	<table class="orderDetail">
		<thead>
			<tr>
				<td>
					<span class="orderName">订单编号:</span>
					<span class="redText"><s:property value="%{userOrderModel.orderId}"/></span>
				</td>
				<td colspan="2">
					<span class="orderName">下单时间:</span>
					<span class="redText"><s:property value="%{userOrderModel.createTime}"/></span>
				</td>
				<td>
					<span class="orderName">订单状态:</span>
					<s:if test="userOrderModel.status ==0">
						<span class="redText">未付款</span>
					</s:if>
					<s:elseif test="userOrderModel.status ==1">
						<span class="redText">已付款</span>
					</s:elseif>
					<s:elseif test="userOrderModel.status ==2">
						<span class="redText">已取消</span>
					</s:elseif>
					<s:elseif test="userOrderModel.status ==3">
						<span class="redText">已退款</span>
					</s:elseif>
					<s:else>
						<span class="redText">未知</span>
					</s:else>
					
				</td>
			</tr>
		</thead>
	</table>
	<table class="orderDetail tableCon">		
		<tbody>
			<tr class="tName">
				<td class="textal">课程名称</td>
				<td>原价</td>
				<td>实际价格</td>
				<td>操作</td>
			</tr>
			<tr class="tCon">
				<td class="textal" title="<s:property value="%{userOrderModel.courseTitle}"/>"><s:property value="%{userOrderModel.courseTitle}"/></td>
				<td class="iniPrice">¥<s:property value="%{userOrderModel.originalPrice}"/></td>
				<td class="redText">¥<s:property value="%{userOrderModel.amount}"/></td>
				<td>
					<p><s:property value="%{userOrderModel.createTime}"/></p>
				</td>
			</tr>
		</tbody>
	</table>
</div> 
</div> 
<!-- 右侧框架结束 -->
<jsp:include page="/left_side.jsp" />
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
</body>
</html>
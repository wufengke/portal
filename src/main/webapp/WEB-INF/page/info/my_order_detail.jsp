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
		    <!--订单信息页-->
		    <!--订单详情-->
<h3 class="pageName">订单详情</h3>
<div class="detailBox">	
	<table class="orderDetail">
		<thead>
			<tr>
				<td>
					<span class="orderName">订单编号:</span>
					<span class="redText">4765</span>
				</td>
				<td colspan="2">
					<span class="orderName">下单时间:</span>
					<span class="redText">2014-08-10 11:57:10</span>
				</td>
				<td>
					<span class="orderName">订单状态:</span>
					<span class="redText">					
										已付款
										</span>
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
				<td class="textal" title="精彩数学抢先学---人教版七年级上（正数、负数及有理数的分类）">精彩数学抢先学---人教版七年...</td>
				<td class="iniPrice">¥40.00</td>
				<td class="redText">¥0.00</td>
				<td>
					<p>2014-08-10 11:57:10</p>

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
 <jsp:include page="/login_pop.jsp" />
</body>
</html>
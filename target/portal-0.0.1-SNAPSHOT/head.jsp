<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!-- 头部开始 -->
<div class="header">
	<div class="headLogin">
		<div class="layout headInfor">
			<div class="fr headLoginBox">
				<s:if test="#session.account == null">
					<!--登录之前 开始-->
	                <div class="loginBefor ">
						<a href="<%=basePath%>login" class="blueText">登录</a>
						<span>|</span>
						<a href="<%=basePath%>register" class="blueText">注册</a>
					</div>
					<!--登录之前 结束-->
				</s:if>
				<s:else>
					<!--登录之后 开始-->
					<div class="loginAfter">
						<span>|</span>
						<a href="<%=basePath%>member/my_infor?id=${sessionScope.account.id}" class="blueText">
							<s:if test="#session.account.nickName != null">
								<s:property value="%{#session.account.nickName}"/>
							</s:if>
							<s:else>
								<s:property value="%{#session.account.username}"/>
							</s:else>
						</a>
						<span>|</span>
						<a href="/login/logout" class="grayText">退出</a>
					</div>
                	<!--登录之后 结束-->
				</s:else>
				
			</div>
			<s:if test="#session.account != null">
				<s:if test="#session.account.applyStatus == 0">
					<a href="<%=basePath %>member/apply_teach?id=${sessionScope.account.id}" class="fr studentStartClass redText">我要开课</a>
				</s:if>
			</s:if>
		</div>
	</div>
	<div class="headNav">
		<div class="layout">
			<!--那好 logo-->
			<h1 class="fl"><a href="<%=basePath%>"></a></h1>
			<!--那好 nav-->
			<ul class="fl">
				<li class="fl studentHomePage"><a href="<%=basePath%>">首页</a></li>
				<li class="fl studentMyCourse"><a href="<%=basePath%>member/my_course">我的课程</a></li>
				<li class="fl studentMyOrder"><a href="<%=basePath%>member/my_order_all">我的订单</a></li>
			</ul>
			<div class="fr headR">
				<a href="javascript:vold(0);" class="phoneHref">400-864-8686</a>
			</div>
		</div>
	</div>
</div>


<!-- 头部结束 -->
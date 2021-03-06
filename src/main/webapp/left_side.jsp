<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- 左侧框架开始 -->
<div class="slide fl" id="slide">
	<div class="slideBox posr">
		<div class="memberInfo">
			<p class="memberImg">
				<s:if test="#session.user.imageUrl != null">
					<img src="${sessionScope.user.imageUrl }" alt="" class="head"/>
               	</s:if>
               	<s:else>
               		<img src="<%=basePath%>online/images/login/default_avatar.png?v=v1.01" />
               	</s:else>
				
			</p>
			<h2 class="cf">
				<span class="myGrade">
					<s:if test="#session.account.accountType != 1">
						<s:property value="%{#session.user.classes}" />
					</s:if>
					<s:else>
						讲师
					</s:else>
				</span>
				<span>
					<s:if test="#session.account.nickName != null">
						<s:property value="%{#session.account.nickName}"/>
					</s:if>
					<s:else>
						<s:property value="%{#session.account.username}"/>
					</s:else>
				</span>
			</h2>
		</div>
		<div class="menu">
			<ul>
				<s:if test="#session.account.accountType == 0">
					<li name="myCourseCon">
						<a href="<%=basePath %>member/my_course?id=${sessionScope.account.id}" class="mCourse">我的课程</a>
					</li>
					<li name="myOrderCon">
						<a href="<%=basePath %>member/my_order_all?id=${sessionScope.account.id}" class="mOrder">我的订单</a>
					</li>
				</s:if>
				<s:else>
					<li name="myPodiumCon">
						<a href="<%=basePath %>member/my_podium?id=${sessionScope.account.id}" class="mPodium">我的主讲</a>
					</li>
				</s:else>
				<li name="myInforCon">
					<a href="<%=basePath %>member/my_infor?id=${sessionScope.account.id}" class="mInfor">基本资料</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript" src="<%=basePath %>online/lib/jquery/1.8.2/jquery.js"></script>
<script type="text/javascript">
<!--
	var url = window.location.href;
	if(url.indexOf("my_course") != -1){
		$("li[name='myCourseCon']").addClass("menuOn");	
		$("li[name='myOrderCon']").removeClass("menuOn");	
		$("li[name='myInforCon']").removeClass("menuOn");
		$("li[name='myPodiumCon']").removeClass("menuOn");
	}
	if(url.indexOf("my_order") != -1){
		$("li[name='myCourseCon']").removeClass("menuOn");	
		$("li[name='myOrderCon']").addClass("menuOn");	
		$("li[name='myInforCon']").removeClass("menuOn");	
		$("li[name='myPodiumCon']").removeClass("menuOn");
	}
	if(url.indexOf("my_infor") != -1){
		$("li[name='myCourseCon']").removeClass("menuOn");	
		$("li[name='myOrderCon']").removeClass("menuOn");	
		$("li[name='myPodiumCon']").removeClass("menuOn");
		$("li[name='myInforCon']").addClass("menuOn");
	}
	if(url.indexOf("my_podium") != -1){
		$("li[name='myCourseCon']").removeClass("menuOn");	
		$("li[name='myOrderCon']").removeClass("menuOn");	
		$("li[name='myPodiumCon']").addClass("menuOn");
		$("li[name='myInforCon']").removeClass("menuOn");
	}
//-->
</script>
<!-- 左侧框架结束 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!-- start of header -->
 <div id="header" class="lhb_header">
        <div class="w980 fc">
            <div class="lhb_logo fl">
                <a href="/">
                    <img src="<%=basePath %>images/logo.png" width="200" height="40" alt="酷学网" /></a>
            </div>
            <ul class="lhb_mn ft18 link_white tdno fl">
                <li class="fl"><a href="<%=basePath%>index">首页</a></li>

                <li class="fl"><a href="<%=basePath%>member/my_course">私人课程</a></li>

                <li class="fl"><a href="<%=basePath%>public_online">公开课程</a></li>

                <li class="fl"><a href="<%=basePath%>member/my_infor">个人中心</a></li>
            </ul>
            <s:if test="#session.account == null">
	            <!-- 未登录 -->
	            <div class="lhb_login mt20 ft14 fr">
	                <a class="btn btn_blue2 tdno" href="<%=basePath%>login">
	                    <span class="btn_lft"></span>
	                    <span class="btn_mid" style="width:56px;">登录</span>
	                    <span class="btn_rgt"></span>
	                </a>
	                <a class="link_white ml25" href="<%=basePath%>register">注册</a>
	            </div>
	            <!-- 未登录 -->
            </s:if>
            <s:else>
	             <!--已登录 -->
	            <div class="lhb_login mt20 ft14 fr">
	                <a class="link_white mr10" href="<%=basePath%>member/my_infor">
                		<s:if test="#session.account.nickName != null">
							<s:property value="%{#session.account.nickName}"/>
						</s:if>
						<s:else>
							<s:property value="%{#session.account.username}"/>
						</s:else>
					</a> 
	                <a class="btn btn_blue2 tdno" href="<%=basePath%>login/logout">
	                	<span class="btn_lft"></span>
	                	<span class="btn_mid" style="width: 56px;">退出</span>
	                	<span class="btn_rgt"></span>
	                </a>
	            </div>
	            <!--已登录 -->
            </s:else>
        </div>
    </div>
    <!-- end of header -->
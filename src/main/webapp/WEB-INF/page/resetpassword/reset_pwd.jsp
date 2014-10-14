<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>首页</title>
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="online/css/login/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<!-- 头部开始 -->
<jsp:include page="/head2.jsp" />
<!-- 头部结束 -->
<!-- 主要内容开始 -->
<div class="wrap  login" id="nahaoModule" module="login" data_page="studentPage">
	<div class="pwd">
		<div class="setNewpwd layout">
			<div class="box">
				<h2>邮箱找回密码</h2>
				<div class="progressBar cf">
					<span class="fl currentPreve">1. 验证邮箱</span>
					<span class="fl current">2. 设置新密码</span>
					<span class="fl ok ">3. 完成</span>
				</div>			
                <form action="/login/ajax_reset_pwd" method="post"  class="setPWForm">
					<ul>
						<li class="cf">
							<p class="fl"><span>*</span>新密码</p>
							<div class="cf">
								<input type="password" name="set_password" class="setPassword fl" placeholder="请输入新密码" validName="text"/>
                                <input type="hidden" name="encrypt_set_password"/>
								<span class="Validform_checktip fl"></span>
							</div>
						</li>
						<li class="cf">
							<p class="fl"><span>*</span>确认新密码</p>
							<div class="cf">
								<input type="password" name="reSetPassword" placeholder="请再次输入新密码" class="reSetPassword fl" validName="text">
								<input type="hidden" name="encrypt_reset_password"/>
                                <span class="Validform_checktip fl"></span>
							</div>
						</li>
						<li class="cf">
							<input type="submit" id='submitNewPwd' class="btn redBtn submit fl" value="确定">
						</li>
					</ul>
                                        <input type="hidden" name="code" value="BTdTNwcyVWYFZgBrUD5Ub1tjU2YAEgQmUyUAKAFiBmxWaQ%3D%3D">
                    				</form>
			</div>
			
		</div>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
</body>
</html>
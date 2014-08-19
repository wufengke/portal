<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!-- 全站登录弹出层的html开始 -->
<div id="commonLogin" class="undis">
	<div id="comLogin">
		<form action="/login/submit" class="loginForm_beta" mothed="post" autocomplete="off" onSubmit="return false">
			<p id="msgInfo" class="msgInfo"></p>
			<ul>
				<li class="posr">
					<input type="text" name="username" value="" class="userName yh" autocomplete="off" placeholder="手机号/邮箱">
					<div class="unBg loginInputBg"></div>
					<div class="ValidInfo undis">
						<span class="Validform_checktip"></span>
						<span class="dec">
							<s class="dec1">&#9670;</s>
							<s class="dec2">&#9670;</s>
						</span>
					</div>
				</li>
				<li class="posr">
					<input type="hidden" name="password" class="epass">
					<input type="password" name="password" value="" autocomplete="off" class="pwd yh" placeholder="密码">
					<div class="pwdBg loginInputBg"></div>
					<div class="ValidInfo undis">
						<span class="Validform_checktip"></span>
						<span class="dec">
							<s class="dec1">&#9670;</s>
							<s class="dec2">&#9670;</s>
						</span>
					</div>
				</li>
				<li class="cf autoLi">
					<input type="hidden" name="redirect_url" value="reload">
					<input type="checkbox" checked name="rembme" id="autoLogin" class="fl autoLogin">
					<label for="autoLogin" class="fl">自动登录</label>
					<a href="http://www.demo.com/login/find_pwd" class="fr">忘记密码？</a>
				</li>
				<li>
					<input type="submit" class="redBtn yh btn redBtn submit" value="登录">
				</li>
				<li>
					<a href="<%=basePath%>register" class=" btn blueBtn">免费注册</a>
				</li>
			</ul>
		</form>
	</div>
</div>
<script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F50cc10260d72f2c1243402449fdfcf05' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- js引入开始 -->
<script type="text/javascript" src="<%=basePath %>online/public/sea.js"></script>
<script type="text/javascript" src="<%=basePath %>online/public/config.js"></script>
<!--js引入结束-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>9527在线课堂</title>
<meta name="description" content="9527在线课堂注册界面" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head.jsp" />
    <!--notice-->
  <div class="wrap layout login">
        <div class="pwd">
            <div class="setSuccess layout">
                <div class="box ">
                    <h2>邮件发送通知</h2>
                    <div style="text-align: left; margin-left: 200px; margin-bottom: 50px;">
                        <p class="tips">我们已向您的邮箱<a href="#"><span class="redText ml10 mr10"><s:property value="%{#session.account.username}"/></span></a>发送了一封验证邮件！</p>
                        <p class="tips">如果没有收到邮件！ 请查看一下垃圾邮件箱</p>
                    </div>
                    <input type="submit" id="submitNewPwd" class="btn greenBtn submit " value="再次发送验证邮件" />
                </div>
            </div>
        </div>
    </div>
    <!--end of notice -->
 	<jsp:include page="/foot.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>9527在线课堂</title>
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentMyCourse">
	<!-- 右侧框架开始 -->
 	<div class="wrapContent fr myInforCon" id="wrapContent">
	<div class="inforTab">
	<s:hidden name="tab" value="%{#session.tab}"></s:hidden>
	<ul class="tabh cf">
		<s:if test="#request.tab == 'tab2'">
			<li >个人资料</li>
			<li class="inforOn">修改密码</li>
			<li>修改头像</li>
		</s:if>
		<s:elseif test="#request.tab == 'tab3'">
			<li >个人资料</li>
			<li >修改密码</li>
			<li  class="inforOn">修改头像</li>
		</s:elseif>
		<s:else>
			<li class="inforOn">个人资料</li>
			<li>修改密码</li>
			<li>修改头像</li>
		</s:else>
		
	</ul>
	 <s:if test="#request.tab == 'tab2' || #request.tab == 'tab3' ">
    	<div class="inforTabBox undis">
    </s:if>
    <s:else>
    	<div class="inforTabBox">
    </s:else>
        <!--邮箱版-->
		<s:form action="/member/save_infor" method="post"  cssClass="emailForm posr" onsubmit="">
			<p class="formName">邮箱
				<span class="verWay"><s:property value="%{#session.account.username}"/></span>
				<s:if test="#session.account.isActivate == 0">
					<span class="hasVer">（未激活）</span>
				</s:if>
				<s:if test="#session.account.isActivate == 1">
					<span class="hasVer">（已激活）</span>
				</s:if>
			</p>
			<s:if test="#session.account.applyStatus == 0">
				<input type="button" class="redBtn applyTeacher" style="cursor:pointer;" value="我是老师,我要开课！" />
			</s:if>
			<ul>
				<li>
					<p class="formName"><span>*</span>昵称</p>
					<div class="cf">
                        <s:textfield  name="nickName" cssClass="pname fl cInput yh" validName="text" value="%{nickName}" />
						<div class="Validform_tip_info fl Validform_wrong">
							<s:fielderror fieldName="nickName_error1"></s:fielderror>
						</div>
                        <div class="Validform_checktip fl"></div>
					</div>
				</li>
				<li>
					<p class="formName"><span>*</span>年级</p>
					<div class="cf">
						<div class="fl">
							<div>
   								<s:select list="#{'一年级':'一年级','二年级':'二年级','三年级':'三年级','四年级':'四年级','五年级':'五年级',
   								'六年级':'六年级','初一':'初一','初二':'初二','初三':'初三','高一':'高一','高二':'高二','高三':'高三',
   								'其他':'其他'}" listKey="key" listValue="value" headerKey=" " headerValue="选择年级"
   								name="grade" id="grade" validName="select" cssClass="subjectInput select_beauty" cssStyle="height:30px;"></s:select>
							</div>
						</div>
						<span class="Validform_checktip fl Validform_wrong">
							<s:fielderror fieldName="grade_error1"></s:fielderror>
						</span>
					</div>
					<p class="detailText">提示：那好每年7月1日自动为您更新年级，如果信息有误，请您及时调整</p>
				</li>
				<li>
					<p class="optional noFillin">真实姓名</p>
					<div class="cf">
						<s:textfield name="realName" cssClass="pUname fl cInput yh" ignore="ignore" validName="text" value="%{realName}" />
						<span class="Validform_checktip fl"></span>
					</div>
				</li>
				<li>
					<p class="optional noFillin">性别</p>
					<div class="cf">
						<div class="fl">
							<s:radio name="gender" validName="radio"  ignore="ignore" cssClass="radio"  list="#{'1':'男','0':'女'}" listKey="key" listValue="value" value="gender"/>
                        </div>
						<span class="Validform_checktip fl"></span>
					</div>
				</li>
				<li>
					<p class="optional noFillin">手机号</p>
                    <div class="cf">
						<div class="fl">
                            <s:textfield cssClass="cInput phone_number" value="%{phone}" name="phone" validName="text" />
                            <span class="Validform_checktip"></span>
						</div>
					</div>
				</li>
				<li>
					<p class="optional noFillin">所属学校</p>
					<div class="cf schoolPar">
						<s:textfield cssClass="schoolFullName cInput yh" value="%{schoolName}" name="schoolName"/>
					</div>
				</li>
				<li>
					<input type="submit" class="btn redBtn" value="保存"/>
				</li>
			</ul>
		</s:form> 
		<!--手机版-->
    </div>
    <s:if test="#request.tab == 'tab2'">
    	<div class="inforTabBox">
    </s:if>
    <s:else>
    	<div class="inforTabBox undis">
    </s:else>
		<!--修改密码-->
		<s:form action="/member/changePwd" method="post" onsubmit="return formCheck(this);" >
			<br/>
			<p id="msgInfo" class="msgInfo" style="color:red;"></p>
			<ul>
				<li>
					<p class="formName"><span>*</span>当前密码</p>
					<div class="cf">
						<input type="password" id="password" name="password" class="iniPassword fl cInput yh" validName="text"  onblur="check(this);"/>
                        <input type="hidden" name="encrypt_password" value=""/>
						<span  id="p1" class="Validform_checktip fl Validform_wrong">
							<s:fielderror fieldName="password_error1"></s:fielderror>
						</span>
					</div>
				</li>
				<li>
					<p class="formName"><span>*</span>新密码</p>
					<div class="cf">
						<input type="password" id="newPassword" name="newPassword" class="setPassword fl cInput yh" validName="text"  onblur="check(this);"/>
                        <input type="hidden" name="encrypt_set_password" value=""/>
						<span  id="p2" class="Validform_checktip fl Validform_wrong">
							<s:fielderror fieldName="newPassword_error1"></s:fielderror>
						</span>
					</div>
				</li>
				<li>
					<p class="formName"><span>*</span>确认新密码</p>
					<div class="cf">
						<input type="password" id="confirmNewPassword"  name="confirmNewPassword" class="reSetPassword fl cInput yh" validName="text" onblur="check(this);"/>
                        <input type="hidden" name="encrypt_reset_password" value=""/>
                        <span  id="p3" class="Validform_checktip fl Validform_wrong">
                        	<s:fielderror fieldName="confirmNewPassword_error1"></s:fielderror>
                        </span>
					</div>
				</li>
				<li>
					<input type="submit" class="btn redBtn" value="保存"/>
				</li>
			</ul>
		</s:form>
	</div>
	<s:if test="#request.tab == 'tab3'">
		<div class="inforTabBox">
	</s:if>
	<s:else>
		<div class="inforTabBox undis">
	</s:else>
		<!--添加头像开始-->
        <div class="box modifyPic TiZiAvatar">
           <s:form action ="imageUpload" namespace="/member" method="post" enctype ="multipart/form-data">
           	<span><s:fielderror/></span>
           	<div>
           		<p class="formName">上传头像</p>
           		<span  class="Validform_checktip fl Validform_wrong" id="imageUpload"></span>
			</div>
           	<div>
           	   <s:if test="#imageUrl==null || #imageUrl==''">
           	      <img src="<%=basePath %>images/touxiang.png" alt="头像" />
           	   </s:if>
           		<img src="<%=basePath %>${imageUrl}" alt="头像" />
           	</div>
          	 <div>
          	 	<s:file name ="myFile" label ="中图（172）"/> 
          	 </div>
           		<s:submit name="" class="btn greenBtn" value="确定上传"></s:submit>
           	 <div style="line-height:30px;padding:20px 0;">
           	 <h4>仅支持image/bmp,image/png,image/gif,image/jpeg类型的图片,大小在200kb以内</h4>
           	 </div>	  
           </s:form>
        </div>
        
        <!--添加头像结束-->
	</div>
</div>
</div> 
<!-- 右侧框架结束 -->
<jsp:include page="/left_side.jsp" />
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <script type="text/javascript">
 	(function($){
		$.getUrlParam = function(name){
			var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			var r = window.location.search.substr(1).match(reg);	
			if (r!=null) return unescape(r[2]); return null;
		}
	})(jQuery);
 	$(function(){
		var tab = $.getUrlParam('tab');
		var error = $.getUrlParam('error');
		if(tab == 'tab2'){
			$(".inforTabBox:eq(0)").addClass("undis");
			$(".inforTabBox:eq(1)").removeClass("undis");
			$(".inforTabBox:eq(2)").addClass("undis");
			$(".tabh li").toggleClass("inforOn");
			if(error == 0){
				$("#msgInfo").html("参数不能为空!");
			}else if(error == 1){
				$("#msgInfo").html("原始密码错误!");
			}else{
				$("#msgInfo").html("修改成功请退出重新登录!");
			}
		}
		if(tab == 'tab3'){
			$(".inforTabBox:eq(0)").addClass("undis");
			$(".inforTabBox:eq(1)").addClass("undis");
			$(".inforTabBox:eq(2)").removeClass("undis");
			$(".tabh li").toggleClass("inforOn");
			if(error == 1){
				$("#imageUpload").html("请选择您要上传的图像");
			}
			if(error == 2){
				$("#imageUpload").html("请先完善您的个人资料页信息");
			}
		}
		 $("input.applyTeacher").click(function () {
		     window.location.href = "<%=basePath%>member/my_infor_teacher";
		 });
	});
	function check(element){
		var v = $(element).val();
		if(typeof(v) == 'undefined' || v == null || v == ''){
			$(element).parent().find(".Validform_checktip").addClass("Validform_wrong");
			$(element).parent().find(".Validform_checktip").removeClass("undis");
		}else if($(element).val().length < 6 || $(element).val().length > 63){
			$(element).parent().find(".Validform_checktip").addClass("Validform_wrong");
			$(element).parent().find(".Validform_checktip").removeClass("undis");
			$(element).parent().find(".Validform_checktip").html("密码长度为6-63之间");
		}else{
			$(element).parent().find(".Validform_checktip").removeClass("Validform_wrong");
			$(element).parent().find(".Validform_checktip").addClass("undis");
		}
	}
 	function formCheck(form){
	 	var password = $(form).find("#password").val();
	 	var newPassword = $(form).find("#newPassword").val();
	 	var confirmNewPassword = $(form).find("#confirmNewPassword").val();
	 	if(password == ''){
		 	$("#p1").addClass("Validform_wrong");
		 	$("#p1").removeClass("undis")
			return false;
		 }
	 	if(newPassword == ''){
	 		$("#p2").addClass("Validform_wrong");
	 		$("#p2").removeClass("undis")
			return false;
		 }

		if(confirmNewPassword == ''){
			$("#p3").addClass("Validform_wrong");
			return false;
		}
		if(confirmNewPassword != newPassword){
			$("#p3").addClass("Validform_wrong");
			$("#p3").removeClass("undis")
			$("#p3").html("两次密码不一致");
			return false;
		}
	 	return true;
	}
  </script>
</body>
</html>
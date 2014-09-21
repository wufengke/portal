<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>9527在线课堂</title>
<%@ include file="/common/JsCss.jsp" %>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentMyCourse">
	<!-- 右侧框架开始 -->
 	<div class="wrapContent fr myInforCon" id="wrapContent" name="myInforCon">
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
		<s:form action="/member/save_infor_teacher" method="post"  cssClass="emailForm" onsubmit="">
			 <p class="formName"> 请完善您的资料<span class="ft14">(以下信息会严格保密,请放心填写)</span></p>
             <ul>
                 <li>
                     <p class="formName"><span>*</span>真实姓名</p>
                     <div class="cf">
                         <s:textfield name="realName" cssClass="wUname fl textInput" validName="text" ></s:textfield>
							<div class="Validform_tip_info fl Validform_wrong">
								<s:fielderror name="realName_error1" fieldName="realName_error1"></s:fielderror>
							</div>
                          	<div class="Validform_checktip fl"></div>
                     </div>
                 </li>
                 <li>
                     <p class="optional noFillin">性别</p>
                     <div class="cf">
                         <div class="fl">
                         <s:if test='#request.gender == "0"'>
                         	<span class="jqTransformRadioWrapper">
                             	<a href="javascript:;" class="jqTransformRadio " rel="gender"></a>
                                 <input type="radio" name="gender" id="save_infor_gender1" value="1" class="radio jqTransformHidden" validname="radio" ignore="ignore" />
                              </span>
                              <label for="save_infor_gender1" class="radio" style="cursor: pointer;">男</label>
                              <span class="jqTransformRadioWrapper">
                             	 <a href="javascript:;" class="jqTransformRadio jqTransformChecked" rel="gender"></a>
                                 <input type="radio" name="gender" id="save_infor_gender0"  checked="checked" value="0" class="radio jqTransformHidden" validname="radio" ignore="ignore" />
                              </span>
                              <label for="save_infor_gender0" class="radio" style="cursor: pointer;">女</label>
                         </s:if>
                         <s:elseif test='#request.gender == "1"'>
                         	<span class="jqTransformRadioWrapper">
                             	<a href="javascript:;" class="jqTransformRadio jqTransformChecked" rel="gender"></a>
                                 <input type="radio" name="gender" id="save_infor_gender1" checked="checked" value="1" class="radio jqTransformHidden" validname="radio" ignore="ignore" />
                              </span>
                              <label for="save_infor_gender1" class="radio" style="cursor: pointer;">男</label>
                              <span class="jqTransformRadioWrapper">
                             	 <a href="javascript:;" class="jqTransformRadio" rel="gender"></a>
                                 <input type="radio" name="gender" id="save_infor_gender0" value="0" class="radio jqTransformHidden" validname="radio" ignore="ignore" />
                              </span>
                              <label for="save_infor_gender0" class="radio" style="cursor: pointer;">女</label>
                         </s:elseif>
                         <s:else>
                        	 <span class="jqTransformRadioWrapper">
                             	<a href="javascript:;" class="jqTransformRadio jqTransformChecked" rel="gender"></a>
                                 <input type="radio" name="gender" id="save_infor_gender1" checked="checked" value="1" class="radio jqTransformHidden" validname="radio" ignore="ignore" />
                              </span>
                              <label for="save_infor_gender1" class="radio" style="cursor: pointer;">男</label>
                              <span class="jqTransformRadioWrapper">
                             	 <a href="javascript:;" class="jqTransformRadio" rel="gender"></a>
                                 <input type="radio" name="gender" id="save_infor_gender0" value="0" class="radio jqTransformHidden" validname="radio" ignore="ignore" />
                              </span>
                              <label for="save_infor_gender0" class="radio" style="cursor: pointer;">女</label>
                         </s:else>
                             <span class="cf"></span>
                         </div>
                     </div>
                 </li>
                 <li class="locaSele">
                     <p class="formName"><span>*</span>地区</p>
                     <div class="cf" style="float: left">
                         <div class="fl">
                             <div>
                                 <s:select list="#request.provinceList" 
                                 			listKey="id" listValue="provinceName" 
                                 			headerKey="-1" headerValue="请选择" 
                                 			name="province" id="province" validname="select" cssCclass="province">
                                    
                                 </s:select>
                             </div>
                         </div>
                         <span class="Validform_checktip fl"></span>
                     </div>
                     <div class="cf" style="float: left">
                         <div class="fl">
                             <div>
                                 <s:select list="#request.cityList" 
                                 			listKey="id" listValue="cityName" 
                                 			headerKey="-1" headerValue="请选择" 
                                 			name="city" id="city" validname="select" cssClass="city">
                                  
                                 </s:select>
                             </div>
                         </div>
                         <span class="Validform_checktip fl"></span>
                     </div>
                     <div class="cf">
                         <div class="fl">
                             <div id="area_div">
                             </div>
                         </div>
                         <span class="Validform_checktip fl"></span>
                     </div>
                 </li>
                 <li>
                     <p class="optional noFillin">QQ号</p>
                     <div class="cf">
                         <div class="fl">
                             <s:textfield  name="qq" cssClass="wQQ textInput fl" validName="text" ></s:textfield>
							<div class="Validform_tip_info fl Validform_wrong">
								<s:fielderror name="qq_error1" fieldName="qq_error1"></s:fielderror>
							</div>
                      		<div class="Validform_checktip fl"></div>
                         </div>
                     </div>
                 </li>
                 <li>
                     <p class="optional noFillin">手机号</p>
                     <div class="cf">
                         <div class="fl">
                             <s:textfield name="phone" cssClass="wphone textInput fl" id="phone"></s:textfield>
							<div class="Validform_tip_info fl Validform_wrong">
								<s:fielderror name="phone_error1" fieldName="phone_error1"></s:fielderror>
							</div>
                      		<div class="Validform_checktip fl"></div>

                         </div>
                     </div>
                     <p class="detailText">保密,方便我们与您电话沟通</p>
                 </li>
                 <li>
                     <p class="optional noFillin">验证码</p>
                     <div class="cf">
                         <div class="fl">
                             <input type="text" class="cInput phone_number" style="width: 150px;" value="" name="phoneVerifyCode" id="phoneVerifyCode" validname="text"/>
                             <input type="button" id="verifyButton" class="btn greenBtn" style="margin: 0 0 0 10px; font-weight: normal; font-size: 14px; height: 32px; line-height: 32px;" value="获取手机验证码" />
                             <span class="Validform_checktip Validform_wrong">
                             		<s:fielderror name="phone_verifyCode_rror1" fieldName="phone_verifyCode_rror1"></s:fielderror>
                             </span>
                         </div>
                     </div>
                 </li>
                 <li>
                     <p class="optional noFillin">所属学校</p>
                     <div class="cf schoolPar">
                         <s:textfield cssClass="schoolFullName cInput yh" validName="text" name="schoolName" ></s:textfield>
                     </div>
                 </li>
                 <li>
                     <p class="optional noFillin">教学阶段</p>
                     <div class="cf">
                         <div class="fl">
                         	<s:if test="#request.stage == 1">
                         	 <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio jqTransformChecked" rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level0" checked="checked"  value="1" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender1" class="radio" style="cursor: pointer;">小学</label>
                             <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio" rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level1" value="2" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender1" class="radio" style="cursor: pointer;">初中</label>
                             <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio" rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level2" value="3" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender2" class="radio" style="cursor: pointer;">高中</label>
                             
                         	</s:if>
                         	<s:elseif test="#request.stage == 2">
                         	 <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio " rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level0"  value="1" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender1" class="radio" style="cursor: pointer;">小学</label>
                             <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio jqTransformChecked" rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level1" checked="checked"  value="2" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender1" class="radio" style="cursor: pointer;">初中</label>
                             <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio" rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level2" value="3" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender2" class="radio" style="cursor: pointer;">高中</label>
                             
                         	</s:elseif>
                         	
                         	<s:elseif test="#request.stage == 3">
                         	 <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio " rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level0"  value="1" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender1" class="radio" style="cursor: pointer;">小学</label>
                             <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio" rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level1" value="2" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender1" class="radio" style="cursor: pointer;">初中</label>
                             <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio jqTransformChecked" rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level2" checked="checked"  value="3" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender2" class="radio" style="cursor: pointer;">高中</label>
                             
                         	</s:elseif>
                         	
                         	<s:else>
                         	  <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio jqTransformChecked" rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level0" checked="checked"  value="1" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender1" class="radio" style="cursor: pointer;">小学</label>
                             <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio" rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level1" value="2" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender1" class="radio" style="cursor: pointer;">初中</label>
                             <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio" rel="teachlevel"></a>
                                 <input type="radio" name="stage" id="save_apply_teach_level2" value="3" class="radioInput fl jqTransformHidden" validname="radio" /></span><label for="save_apply_teach_gender2" class="radio" style="cursor: pointer;">高中</label>
                             
                         	</s:else>
                            <span class="cf"></span>
                         </div>
                         <span class="Validform_checktip fl"></span>
                     </div>
                 </li>
                 <li>
                     <p class="optional noFillin">教师职称</p>
                     <div class="cf">
                         <div>
						<s:select list="#{'无职称':'无职称','正高级教师':'正高级教师','高级教师':'高级教师','一级教师':'一级教师','二级教师':'二级教师','三级教师':'三级教师'}"
						name="teacherTitle" id="" validName="select" cssClass="teaTitle" listKey="key" listValue="value" headerKey=" " headerValue="请选择职称"></s:select>
						</div>
                     </div>
                     <span class="Validform_checktip fl Validform_wrong">
							<s:fielderror name="teacherTitle_error1" fieldName="teacherTitle_error1"></s:fielderror>
					</span>	
                 </li>
                 <li>
                     <p class="optional noFillin">实际教龄</p>
                     <div class="cf">
                         <div>
                             <s:select headerKey="-1" headerValue="请选择教龄" 
								list="#{'1':'1年',
										'2':'2年',
										'3':'3年',
										'4':'4年',
										'5':'5年',
										'6':'6年',
										'7':'7年',
										'8':'8年',
										'9':'9年',
										'10':'10年',
										'11':'11年',
										'12':'12年',
										'13':'13年',
										'14':'14年',
										'15':'15年',
										'16':'16年',
										'17':'17年',
										'18':'18年',
										'19':'19年',
										'20':'20年',
										'21':'21年',
										'22':'22年',
										'23':'23年',
										'24':'24年',
										'25':'25年',
										'26':'26年',
										'27':'27年',
										'28':'28年',
										'29':'29年',
										'30':'30年'}" 
								 name="teachYears" id="teachYears" validName="select" cssClass="seniority"></s:select>
                         </div>
                     </div>
                     <span class="Validform_checktip fl Validform_wrong">
							<s:fielderror name="teachYears_error1" fieldName="teachYears_error1"></s:fielderror>
						</span>	
                 </li>
                 <li>
                     <p class="optional noFillin">身份证号</p>
                     <div class="cf">
                         <div class="fl">
                             <s:textfield cssClass="cInput phone_number" name="idCardNo" validname="text" />
                             <span class="Validform_checktip"></span>
                         </div>
                     </div>
                 </li>
				 <li>
					<p class="optional noFillin">个人简介</p>
					<div class="cf">
                         <div class="fl">
                         	<s:textarea name="teacherBrief" id="introEditor" cssStyle="visibility: hidden;"></s:textarea>
                             <span class="Validform_checktip"></span>
                         </div>
                     </div>
				</li>
                 <li>
                     <input type="submit" class="btn greenBtn" value="提交审核" />
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
		<div class="inforTabBox atareditorBox">
	</s:if>
	<s:else>
		<div class="inforTabBox atareditorBox undis">
	</s:else>
		<!--添加头像开始-->
        <div class="box modifyPic TiZiAvatar">
           <s:form action ="teacherImageUpload" namespace="/member" method="post" enctype ="multipart/form-data">
           	<span><s:fielderror/></span>
           	<div>
           		<h4>请选择要上传的头像,仅支持image/bmp,image/png,image/gif,image/jpeg类型的图片,大小在200kb以内</h4>
           		<span  class="Validform_checktip fl Validform_wrong" id="imageUpload"></span>
			</div>
           	<div>
           		<img src="http://www.phas.cn${imageUrl}" alt="头像" />
           	</div>
          	 <div>
          	 	<s:file name ="myFile" label ="中图（172）"/> 
          	 </div>
           		<s:submit name="" value="确定上传"></s:submit>
           		  
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
		     window.location.href = "newteacherinfo.html";
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
<script src="<%=basePath%>js/kindeditor/4.1.10/kindeditor.js"></script>
<script type="text/javascript">
    KindEditor.ready(function(K){
       K.create("#introEditor",{
            //简易版
            items : [
                        'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link'],
            //字符检测
           afterChange : function() {
                //（字数统计包含纯文本、IMG、EMBED，不包含换行符，IMG和EMBED算一个文字。）
                K('.word_count2').html(10000-this.count('text'));
                $('.word_count1').html(KindEditor.instances[0].html().length);
                this.sync();
            }
        });
    });
    
    $(function(){
    	$("#province").change(function(){
    		var provinceId = $("#province").val();
    		$.post("/member/getCityList.action",{"province":provinceId},
    		function(data){
    			$("#city").empty();
    			$("#city").append("<option value='-1'>请选择</option>");
    			$(data).each(function(index){
    				$("#city").append("<option value='"+data[index].id+"'>"+data[index].cityName+"</option>");
    			});
    		},"json");
    	});
    	$("#verifyButton").click(function(){
    		var phone = $("#phone").val();
    		if(phone == null || phone == ''){
    			alert("请输入正确的手机号");
    			return ;
    		}
    		$.post("/member/sendVerifyCode.action",{"phone":phone},
    		function(data){
    			sendMessage();
    		},"json");
    	});
    });
    
    /*-------------------------------------------*/
    var InterValObj; //timer变量，控制时间
	var count = 120; //间隔函数，1秒执行
	var curCount;//当前剩余秒数
	function sendMessage() {
        curCount = count;
        //设置button效果，开始计时
            $("#verifyButton").attr("disabled", "true");
            $("#verifyButton").val("请在(" + curCount + ")秒后重新发送");
            InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
    }
    //timer处理函数
	function SetRemainTime() {
        if (curCount == 0) {                
            window.clearInterval(InterValObj);//停止计时器
            $("#verifyButton").removeAttr("disabled");//启用按钮
            $("#verifyButton").val("重新发送验证码");
            code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
        }
        else {
            curCount--;
            $("#verifyButton").val("请在(" + curCount + ")秒内重新发送");
        }
    }
</script>
</body>
</html>
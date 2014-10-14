<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我要开课</title>
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/studentStartClass/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap  studentStartClass" id="nahaoModule" module="studentStartClass" data_page="studentPage">
	<div class="writeInfo">
		<div class="box layout">
			<h2>请填写试讲信息<span>(以下信息会严格保密，请您放心填写）</span></h2>
			<s:form action="save_apply_teach" namespace="/member" method="get">
				<s:hidden name="userId" value="%{userId}"/>
				<ul class="Oul">
					<li class="cf">
						<p class="fl">真实姓名</p>
						<div class="cf">
							<s:textfield name="realName" cssClass="wUname fl textInput" validName="text" ></s:textfield>
							<div class="Validform_tip_info fl Validform_wrong">
								<s:fielderror name="realName_error1" fieldName="realName_error1"></s:fielderror>
							</div>
                          	<div class="Validform_checktip fl"></div>
						</div>
						<p class="tips fl">保密，方便我们与您电话沟通详细情况</p>
					</li>
					<li class="cf">
						<p class="fl">所在地区与学校</p>
						<div class="cf">
							<div class="cf schoolPar">
								<s:textfield cssClass="schoolFullName cInput yh" validName="text" name="schoolName" ></s:textfield>
								<!-- <a href="javascript:void(0);" class="resetSchool optional" set="1" province="2" city="" county="500">选择学校</a> -->
								<!-- 
								<div class="Validform_tip_info undis">请选择就读学校</div>
                          		<div class="Validform_checktip"></div>
								<input type="hidden" value="2" name="province_id" id="province_id" />
								<input type="hidden" value="52" name="city_id" id="city_id" />
								<input type="hidden" value="88242" name="school_id" id="schoolVal" />
								<input type="hidden" value="500" name="area_county_id" id="area_county_id"/>
								<input type="hidden" value="1" name="school_type" id="school_type">
								<input type="hidden" value="" name="schoolname" id="schoolname" />
								 -->
								 
							</div>
							<div class="Validform_tip_info fl Validform_wrong">
								<s:fielderror name="schoolName_error1" fieldName="schoolName_error1"></s:fielderror>
							</div>
                          	<div class="Validform_checktip fl"></div>
						</div>
					</li>
					<li class="cf">
						<p class="fl">选择性别</p>
						<div class="cf">
							<div class="cf">
								<s:radio name="gender" cssClass="radioInput fl" validName="radio" list="#{'1':'男','0':'女'}" listKey="key" listValue="value" value="gender"/>
							</div>
							<span class="Validform_checktip fl"></span>
						</div>
					</li>
					<li class="cf">
						<p class="fl">年龄</p>
						<div class="cf">
							<s:textfield name="age" cssClass="wage fl textInput" validName="text"></s:textfield>
							<div class="Validform_tip_info fl Validform_wrong">
								<s:fielderror name="age_error1" fieldName="age_error1"></s:fielderror>
							</div>
                      		<div class="Validform_checktip fl"></div>
						</div>
					</li>
					<li class="cf">
						<p class="fl">教学阶段</p>
						<div class="cf">
							<div class="fl">
								<s:radio list="#{'1':'小学','2':'初中','3':'高中'}" 
								name="stage" id="high-1" cssClass="fl checkInput" validName="radio" ></s:radio>
				    		</div>
							<span class="Validform_checktip fl"></span>
				    	</div>
					</li>
					<li class="cf">
						<p class="fl">教师职称</p>
						<div class="fl">
							<div>
								<s:select list="#{'无职称':'无职称','正高级教师':'正高级教师','高级教师':'高级教师','一级教师':'一级教师','二级教师':'二级教师','三级教师':'三级教师'}"
								name="teacherTitle" id="" validName="select" cssClass="teaTitle" listKey="key" listValue="value" headerKey=" " headerValue="请选择职称"></s:select>
							</div>
						</div>
						<span class="Validform_checktip fl Validform_wrong">
							<s:fielderror name="teacherTitle_error1" fieldName="teacherTitle_error1"></s:fielderror>
						</span>								
					</li>
					<li class="cf">
						<p class="fl">实际教龄</p>
						<div class="fl">
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
						<p class="tips fl">提示：那好每年7月1日自动为您更新教龄，如果信息有误，请您及时调整</p>			
					</li>
					<li class="cf">
						<p class="fl">手机号码</p>						
						<div class="cf">
							<s:textfield name="phone" cssClass="wphone textInput fl" validName="text"></s:textfield>
							<div class="Validform_tip_info fl Validform_wrong">
								<s:fielderror name="phone_error1" fieldName="phone_error1"></s:fielderror>
							</div>
                      		<div class="Validform_checktip fl"></div>
						</div>
						<p class="tips fl">保密，方便我们与您电话沟通详细情况</p>	
					</li>
					<li class="cf">
						<p class="fl">常用邮箱</p>
						<div class="cf">
							<s:textfield name="email" cssClass="wEmail textInput fl" validName="text" ></s:textfield>
							<div class="Validform_tip_info fl Validform_wrong">
								<s:fielderror name="email_error1" fieldName="email_error1"></s:fielderror>
							</div>
                      		<div class="Validform_checktip fl"></div>
						</div>
					</li>
					<li class="cf">
						<p class="fl">QQ号</p>		
						<div class="cf">
							<s:textfield  name="qq" cssClass="wQQ textInput fl" validName="text" ></s:textfield>
							<div class="Validform_tip_info fl Validform_wrong">
								<s:fielderror name="qq_error1" fieldName="qq_error1"></s:fielderror>
							</div>
                      		<div class="Validform_checktip fl"></div>
						</div>
					</li>
					<li class="cf">
						<p class="fl">讲课方式</p>
						<div class="fl">
							<div>
								<s:select list="#{'一对一':'一对一','小班教育(15人以内)':'小班教育(15人以内)','大班教育不限人数':'大班教育不限人数'}"
								 headerKey=" " headerValue="请选择讲课方式" listKey="key" listValue="value" 
								 name="teachType" id="" validName="select" cssClass="lecture"></s:select>
							</div>
						</div>
						<span class="Validform_checktip fl Validform_wrong">
							<s:fielderror name="teachType_error1" fieldName="teachType_error1"></s:fielderror>
						</span>
					</li>
					<li class="cf">
						<p class="fl">试讲科目</p>
						<div class="fl">
							<div>
								<s:select list="#{'家庭教育':'家庭教育','数学':'数学','语文':'语文','英语':'英语','物理':'物理','心理学':'心理学','素质教育':'素质教育',
								'化学':'化学','生物':'生物','历史':'历史','地理':'地理','政治':'政治','其他':'其他'}"
								headerKey=" " headerValue="请选择试讲科目" listKey="key" listValue="value" 
								name="subject" id="" validName="select" cssClass="lectureSub"></s:select>
							</div>
						</div>
						<span class="Validform_checktip fl Validform_wrong">
							<s:fielderror name="subject_error1" fieldName="subject_error1"></s:fielderror>
						</span>			
					</li>
					<li class="cf cookedTime">
						<p>试讲时间</p>							
						<div class="cf">
							<div class="fl wtimeBox">
								<input type="text" name="startDate" class="wtime textInput" validName="text" />
								<div class="Validform_tip_info fl Validform_wrong">
									<s:fielderror name="startDate_error1" fieldName="startDate_error1"></s:fielderror>
								</div>
	                      		<div class="Validform_checktip fl"></div>
							</div>
							<div class="fl timeSecelt">
								<div>
									<div>
										<s:select list="#{'08:00':'08:00','09:00':'09:00','10:00':'10:00','11:00':'11:00','12:00':'12:00',
														  '13:00':'13:00','14:00':'14:00','15:00':'15:00','16:00':'16:00','17:00':'17:00',
														  '18:00':'18:00','19:00':'19:00','20:00':'20:00','21:00':'21:00','22:00':'22:00'}"
												headerKey=" " headerValue="选择开始时间" listKey="key" listValue="value" 
												name="startTime" id="" validName="select" cssClass="startTime"></s:select>
									</div>
								</div>
								<span class="Validform_checktip Validform_wrong">
									<s:fielderror name="startTime_error1" fieldName="startTime_error1"></s:fielderror>
								</span>	
							</div>
							<span class="fl underLine">—</span>
							<div class="fl timeSecelt">
								<div>
									<div>
										<s:select list="#{'08:00':'08:00','09:00':'09:00','10:00':'10:00','11:00':'11:00','12:00':'12:00',
														  '13:00':'13:00','14:00':'14:00','15:00':'15:00','16:00':'16:00','17:00':'17:00',
														  '18:00':'18:00','19:00':'19:00','20:00':'20:00','21:00':'21:00','22:00':'22:00'}"
												headerKey=" " headerValue="选择结束时间" listKey="key" listValue="value" 
												name="endTime" id="" validName="select" cssClass="endTime"></s:select>
									</div>
								</div>
								<span class="Validform_checktip Validform_wrong">
									<s:fielderror name="endTime_error1" fieldName="endTime_error1"></s:fielderror>
								</span>	
							</div>
						</div>
						<p class="tips">约定大概试讲时间，具体讲课时间需与工作人员协商</p>
					</li>
					<li class="cf">
						<p class="fl">课程名称</p>
						<div class="cf">
							<s:textfield  name="courseName" cssClass="subname textInput fl" validName="text" ></s:textfield>
							<div class="Validform_tip_info fl Validform_wrong">
								<s:fielderror name="courseName_error1" fieldName="courseName_error1"></s:fielderror>
							</div>
                      		<div class="Validform_checktip fl"></div>
						</div>
					</li>
					<!---->
					<li>
						<p>课程介绍</p>
						<textarea name="courseBrief" id="postEditor" style="visibility: hidden;"></textarea>		
					</li>
					<li>
						<p>个人简介</p>
						<textarea name="resume" id="introEditor" style="visibility: hidden;"></textarea>		
					</li>
					<li class="cf">
						<input id="apply_teach_submit" type="submit" value="提交申请" class="noShowBtn redBtn submit fl" />
					</li>
					  
				</ul>
			</s:form>
		</div>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
<script src="<%=basePath %>online/lib/jquery/1.8.2/jquery.js"></script>
<script src="<%=basePath %>online/lib/kindeditor/4.1.10/kindeditor.js"></script>
<script type="text/javascript">
	KindEditor.ready(function(K){
       K.create("#postEditor",{
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
</script>
</body>
</html>
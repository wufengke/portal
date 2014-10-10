<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>9527在线课堂</title>
<meta name="description" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/common/JsCss.jsp" %>
 <script type="text/javascript" src="/js/My97DatePicker/4.8/WdatePicker.js"></script>
 <script type="text/javascript" src="/js/common.js"></script>
</head>
<body class="myCoursePage">
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentMyCourse">
	<!-- 右侧框架开始 -->
 	<div class="wrapContent fr myCourseCon" id="wrapContent">
	 	<div class="inforTab">
	 	 <ul class="tabh cf">
                    <li >私人课程</li>
                    <li class="inforOn">公开课程</li>
                </ul>
                <div class="inforTabBox undis">
                    <div style="margin: 80px 0 0 50px;">
                        <input id="courseTitle" name="courseTitle" type="text" class="ft18" style="width: 350px; height: 45px;"
                            value="${requestScope.courseTitle}" placeholder="请输入课程名称" />
                    </div>
                     <s:if test="#request.courseTitle != null">
                    </s:if>
                    <s:else>
	                    <div class="" style="margin: 20px 0 0 50px;">
	                        <input id="createClass" type="button" class="btn greenBtn" value="创建私人课程" />
	                        <span style="font-size: 18px;">（同一时间段仅能创建一个私人课程）</span>
	                    </div>
                    </s:else>
                    <s:if test="#request.courseTitle != null">
                    	<div class="" style="margin: 30px 0 0 50px;">
                    </s:if>
                    <s:else>
                    	<div class="undis" style="margin: 30px 0 0 50px;">
                    </s:else>
                       <div>
                           <span style="font-size: 18px;">私人课程邀请码：</span>
                           <input id="code" name="code" type="text" readonly="true" style="font-size: 24px; font-weight: bold; width: 140px; height: 45px;" value="${requestScope.code}" />
                           <span class="link_blue"><a href="javascript:void(0);" id="resetCode">重新生成</a></span>
                       </div>
                       <div style="margin: 30px 0 0 0px">
                       	<input type="hidden" value="${sessionScope.account.userId}" id="userId"></input>
                           <input id="enterClass" type="button" class="btn greenBtn" value="进入课程" />
                       </div>
                       <div style="margin: 30px 0 0 0px">
                           <input id="sendCode" type="button" class="btn blueBtn" value="发送邀请码到我的手机" />
                       </div>
                   </div>
                </div>
                 <div class="inforTabBox">
                    <!--邮箱版-->
                    <s:form action="my_podium_newclass_add" method="post" class="emailForm posr" namespace="/member" >
                        <p class="formName">
                        	    请填写课程信息<span class="ft14">(以下信息会严格保密,请放心填写)</span>
                        </p>
                        <ul>
                            <li>
                                <p class="formName"><span>*</span>讲课方式</p>
                                <div class="cf">
                                    <div class="fl">
                                        <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio jqTransformChecked" rel="students"></a>
                                            <input type="radio" name="teachType" id="Radio1" checked="checked" value="一对一" class="radio jqTransformHidden" validname="radio" ignore="ignore"></span><label for="save_infor_gender1" class="radio" style="cursor: pointer;">一对一</label>
                                        <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio" rel="students"></a>
                                            <input type="radio" name="teachType" id="Radio2" value="15人以内" class="radio jqTransformHidden" validname="radio" ignore="ignore"></span><label for="save_infor_gender0" class="radio" style="cursor: pointer;">15人以内</label>
                                        <span class="jqTransformRadioWrapper"><a href="javascript:;" class="jqTransformRadio" rel="students"></a>
                                            <input type="radio" name="teachType" id="Radio3" value="15人-50人" class="radio jqTransformHidden" validname="radio" ignore="ignore"></span><label for="save_infor_gender0" class="radio" style="cursor: pointer;">15人-50人</label>
                                        <span class="cf"></span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <p class="optional noFillin">试讲科目</p>
                                <div class="cf">
                                    <div class="fl">
		                                 <s:select list="#{'家庭教育':'家庭教育','数学':'数学','语文':'语文','英语':'英语','物理':'物理','心理学':'心理学','素质教育':'素质教育',
										'化学':'化学','生物':'生物','历史':'历史','地理':'地理','政治':'政治','其他':'其他'}"
										headerKey=" " headerValue="请选择试讲科目" listKey="key" listValue="value" 
										name="subject" id="" validName="select" cssClass="lectureSub"></s:select>
                                    </div>
                                    <span class="Validform_checktip fl Validform_wrong">
										<s:fielderror name="subject_error1" fieldName="subject_error1"></s:fielderror>
									</span>
                                </div>
                            </li>
                            <li>
                                <p class="optional noFillin">试讲时间</p>
                                <div class="cf">
									<div class="fl wtimeBox">
										<input type="text" name="startDate" class="wtime textInput mr10"  style="width:155px" onClick="WdatePicker()" validname="text" datatype="*" nullmsg="请输入预约时间" errormsg="请输入正确的时间格式" />
										<div class="Validform_tip_info fl Validform_wrong">
											<s:fielderror name="startDate_error1" fieldName="startDate_error1"></s:fielderror>
										</div>
		                      			<div class="Validform_checktip fl"></div>
									</div>
									<div class="fl timeSecelt mr10">
										<div>
										<div>
										<div class="jqTransformSelectWrapper" style="z-index: 6; width: 122px;">
											<s:select list="#{'08:00':'08:00','09:00':'09:00','10:00':'10:00','11:00':'11:00','12:00':'12:00',
														  '13:00':'13:00','14:00':'14:00','15:00':'15:00','16:00':'16:00','17:00':'17:00',
														  '18:00':'18:00','19:00':'19:00','20:00':'20:00','21:00':'21:00','22:00':'22:00'}"
												headerKey=" " headerValue="选择开始时间" listKey="key" listValue="value" 
												name="startTime" id="" validName="select" cssClass="startTime"></s:select>
										</div>
										</div>
									</div>
									<span class="Validform_checktip Validform_wrong">
										<s:fielderror name="startTime_error1" fieldName="startTime_error1"></s:fielderror>
									</span>	
									</div>
									<span class="fl underLine">—</span>
									<div class="fl timeSecelt ml10">
									<div>
										<div>
										<div class="jqTransformSelectWrapper" style="z-index: 5; width: 122px;">
											<s:select list="#{'08:00':'08:00','09:00':'09:00','10:00':'10:00','11:00':'11:00','12:00':'12:00',
														  '13:00':'13:00','14:00':'14:00','15:00':'15:00','16:00':'16:00','17:00':'17:00',
														  '18:00':'18:00','19:00':'19:00','20:00':'20:00','21:00':'21:00','22:00':'22:00'}"
												headerKey=" " headerValue="选择结束时间" listKey="key" listValue="value" 
												name="endTime" id="" validName="select" cssClass="endTime"></s:select>
										</div>
										</div>
									</div>
								<span class="Validform_checktip Validform_wrong">
									<s:fielderror name="endTime_error1" fieldName="endTime_error1"></s:fielderror>
								</span>		
								</div>
							</div>
                            </li>
                            <li>
                                <p class="optional noFillin">课程名称</p>
                                <div class="cf">
                                    <div class="fl">
                                        <s:textfield  name="courseName" cssClass="subname textInput fl" validName="text" ></s:textfield>
										<div class="Validform_tip_info fl Validform_wrong">
											<s:fielderror name="courseName_error1" fieldName="courseName_error1"></s:fielderror>
										</div>
			                      		<div class="Validform_checktip fl"></div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <p class="optional noFillin">课程介绍</p>
                                <textarea name="courseBrief" id="postEditor" style="visibility: hidden;"></textarea>
                            </li>
                            <li>
                                <input type="submit" class="btn greenBtn" value="提交" />
                            </li>
                        </ul>
                    </s:form>
                    <!--手机版-->
                </div>
		</div>
	</div> 
<!-- 右侧框架结束 -->
<jsp:include page="/left_side.jsp" />
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <script src="<%=basePath%>js/kindeditor/4.1.10/kindeditor.js"></script>
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
	if($.getUrlParam("info")=="s")
	{
	  alert("已提交公开课程申请，请等待管理人员审核");
	}
</script>
</body>
</html>
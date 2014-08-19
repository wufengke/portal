<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我要开课</title>
<meta name="description" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/studentStartClass/style.css?v=v1.01" />
<style>
#teacherSetSchool #sName{font-weight: bold;}
#teacherSetSchool ul.schooLocation,
#teacherSetSchool .schoolInfo .school,
#teacherSetSchool .seacherResult{border: 1px solid #e7e7e7;padding:10px 8px;background: #f7f7f7;margin-bottom: 10px;width:798px;}
#teacherSetSchool ul.schooLocation li{float: left;padding: 0px 7px;line-height: 20px;cursor: pointer;white-space:nowrap;margin:0px!important;}
#teacherSetSchool ul li.default{ cursor: default; color: #bdbdbd}
#teacherSetSchool ul li.active{background: #f14211;color: #fff;}
#teacherSetSchool .schoolInfo .hd{padding-bottom:10px;}
#teacherSetSchool .schoolInfo .cInput{height:27px;line-height: 27px;border:1px solid #ccc;}
#teacherSetSchool .schoolInfo .hd .cBtnSilver{height:27px;line-height: 27px;margin-left:10px;background:#f14211;border-radius: 5px;color: #fff;cursor: pointer;border:0px; padding:0px 20px;}
#teacherSetSchool .schoolInfo .hd .cBtnSilver:hover{opacity: 0.9;filter: alpha(opacity=90);}
#teacherSetSchool .schoolInfo .noMySchollBtn,
#teacherSetSchool .schoolInfo .returnSetSchool{color:#F14211;margin-left:10px;}
#teacherSetSchool .schoolInfo .noMySchollBtn:hover,
#teacherSetSchool .schoolInfo .returnSetSchool:hover{color:#333;}
#teacherSetSchool .schoolInfo .school,
#teacherSetSchool .schoolInfo .seacherResult{height:90px;overflow-y: scroll;}
#teacherSetSchool .schoolInfo .school dt{width:20px;text-align: center;font-size:14px;}
#teacherSetSchool .schoolInfo .school dd{width: 760px;}
#teacherSetSchool .schoolInfo .school dt{font-weight:bold;}
#teacherSetSchool .schoolInfo span.reset{position: absolute;top: 8px;right:8px;background:url(http://static.nahao.com/online/images/common/close.gif) no-repeat;);width:11px;height:11px;text-indent: -999em; overflow: hidden;cursor: pointer;}
#teacherSetSchool .schoolInfo .school dd li{width:25%;padding:0px;display:block;float: left;height:24px;overflow: hidden; cursor: pointer; text-indent: 10px;}
#teacherSetSchool .seacherResult li{width:25%;padding:0px;display:block;float: left;height:24px;overflow: hidden; cursor: pointer; text-indent: 10px;}
</style>
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap  studentStartClass" id="nahaoModule" module="studentStartClass" data_page="studentPage">
	<div class="writeInfo">
		<div class="box layout">
			<h2>请填写试讲信息<span>(以下信息会严格保密，请您放心填写）</span></h2>
			<s:form action="save_apply_teach" method="post" namespace="member">
				<s:hidden name="userId" value="%{userId}"/>
				<ul class="Oul">
					<li class="cf">
						<p class="fl">真实姓名</p>
						<div class="cf">
							<s:textfield name="realName" cssClass="wUname fl textInput" validName="text" value="%{realName}" />
							<div class="Validform_tip_info fl undis">请输入真实姓名</div>
                          	<div class="Validform_checktip fl"></div>
						</div>
						<p class="tips fl">保密，方便我们与您电话沟通详细情况</p>
					</li>
					<li class="cf">
						<p class="fl">所在地区与学校</p>
						<div class="cf">
							<div class="cf schoolPar">
								<s:textfield cssClass="schoolFullName cInput yh" validName="text" value="%{schoolName}" name="schoolName" />
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
						</div>
					</li>
					<li class="cf">
						<p class="fl">选择性别</p>
						<div class="cf">
							<div class="cf">
								<input checked type="radio" name="gender" id="male" value="1" class="radioInput fl" validName="radio" /><label for="male" class="fl">男</label> 
								<input type="radio" name="gender" id="female" value="0" class="radioInput fl" validName="radio"/><label for="female" class="fl">女</label>  
							</div>
							<span class="Validform_checktip fl"></span>
						</div>
					</li>
					<li class="cf">
						<p class="fl">年龄</p>
						<div class="cf">
							<s:textfield name="age" cssClass="wage fl textInput" validName="text"/>
							<div class="Validform_tip_info fl undis">请输入年龄</div>
                      		<div class="Validform_checktip fl"></div>
						</div>
					</li>
					<li class="cf">
						<p class="fl">教学阶段</p>
						<div class="cf">
							<div class="fl">
				    			<input type="radio" checked value="1" name="stage" id="high-1" class="fl checkInput" validName="radio" />
								<label for="high-1" class="fl">小学</label>
				    		</div>
							<div class="fl">
				    			<input type="radio"  value="2" name="stage" id="high-2" class="fl checkInput" validName="radio" />
								<label for="high-2" class="fl">初中</label>
				    		</div>
							<div class="fl">
				    			<input type="radio"  value="3" name="stage" id="high-3" class="fl checkInput" validName="radio" />
								<label for="high-3" class="fl">高中</label>
				    		</div>
							<span class="Validform_checktip fl"></span>
				    	</div>
					</li>
					<li class="cf">
						<p class="fl">教师职称</p>
						<div class="fl">
							<div>
								<select name="teacherTitle" id="" validName="select" class="teaTitle" >
									<option value="">请选择职称</option>
									<option value="1">无职称</option>
									<option value="2">正高级教师</option>
									<option value="3">高级教师</option>
									<option value="4">一级教师</option>
									<option value="5">二级教师</option>
									<option value="6">三级教师</option>
								</select>
							</div>
						</div>
						<span class="Validform_checktip fl"></span>								
					</li>
					<li class="cf">
						<p class="fl">实际教龄</p>
						<div class="fl">
							<div>
								<select name="teachYears" id="" validName="select" class="seniority">
									<option value="">请选择教龄</option>
									<option value="1">1年</option>
									<option value="2">2年</option>
									<option value="3">3年</option>
									<option value="4">4年</option>
									<option value="5">5年</option>
									<option value="6">6年</option>
									<option value="7">7年</option>
									<option value="8">8年</option>
									<option value="9">9年</option>
									<option value="10">10年</option>
									<option value="11">11年</option>
									<option value="12">12年</option>
									<option value="13">13年</option>
									<option value="14">14年</option>
									<option value="15">15年</option>
									<option value="16">16年</option>
									<option value="17">17年</option>
									<option value="18">18年</option>
									<option value="19">19年</option>
									<option value="20">20年</option>
									<option value="21">21年</option>
									<option value="22">22年</option>
									<option value="23">23年</option>
									<option value="24">24年</option>
									<option value="25">25年</option>
									<option value="26">26年</option>
									<option value="27">27年</option>
									<option value="28">28年</option>
									<option value="29">29年</option>
									<option value="30">30年</option>
									<option value="31">31年</option>
									<option value="32">32年</option>
									<option value="33">33年</option>
									<option value="34">34年</option>
									<option value="35">35年</option>
									<option value="36">36年</option>
									<option value="37">37年</option>
									<option value="38">38年</option>
									<option value="39">39年</option>
									<option value="40">40年</option>
									<option value="41">41年</option>
									<option value="42">42年</option>
									<option value="43">43年</option>
									<option value="44">44年</option>
									<option value="45">45年</option>
									<option value="46">46年</option>
									<option value="47">47年</option>
									<option value="48">48年</option>
									<option value="49">49年</option>
									<option value="50">50年</option>
								</select>
							</div>
						</div>
						<span class="Validform_checktip fl"></span>		
						<p class="tips fl">提示：那好每年7月1日自动为您更新教龄，如果信息有误，请您及时调整</p>			
					</li>
					<li class="cf">
						<p class="fl">手机号码</p>						
						<div class="cf">
							<input type="text" name="phone" class="wphone textInput fl" validName="text" value="" />
							<div class="Validform_tip_info fl undis">请输入手机号码</div>
                      		<div class="Validform_checktip fl"></div>
						</div>
						<p class="tips fl">保密，方便我们与您电话沟通详细情况</p>	
					</li>
					<li class="cf">
						<p class="fl">常用邮箱</p>
						<div class="cf">
							<input type="text" name="email" class="wEmail textInput fl" validName="text" value="" />
							<div class="Validform_tip_info fl undis">请输入常用邮箱</div>
                      		<div class="Validform_checktip fl"></div>
						</div>
					</li>
					<li class="cf">
						<p class="fl">QQ号</p>		
						<div class="cf">
							<input type="text" name="qq" class="wQQ textInput fl" validName="text" value="" />
							<div class="Validform_tip_info fl undis">请输入QQ号</div>
                      		<div class="Validform_checktip fl"></div>
						</div>
					</li>
					<li class="cf">
						<p class="fl">讲课方式</p>
						<div class="fl">
							<div>
								<select name="teachType" id="" validName="select" class="lecture">
									<option value="">请选择讲课方式</option>
									<option value="1">一对一</option>
									<option value="2">小班教育(15人以内)</option>
									<option value="3">大班教育不限人数</option>
								</select>
							</div>
						</div>
						<span class="Validform_checktip fl"></span>
					</li>
					<li class="cf">
						<p class="fl">试讲科目</p>
						<div class="fl">
							<div>
								<select name="subject" id="" validName="select" class="lectureSub">
									<option value="">请选择试讲科目</option>
									<option value="1">家庭教育</option>
									<option value="2">数学</option>
									<option value="3">语文</option>
									<option value="4">英语</option>
									<option value="5">物理</option>
									<option value="7">心理学</option>
									<option value="8">素质教育</option>
									<option value="9">化学</option>
									<option value="10">生物</option>
									<option value="11">历史</option>
									<option value="12">地理</option>
									<option value="13">政治</option>
									<option value="14">其他</option>
								</select>
							</div>
						</div>
						<span class="Validform_checktip fl"></span>			
					</li>
					<li class="cf cookedTime">
						<p>试讲时间</p>							
						<div class="cf">
							<div class="fl wtimeBox">
								<input type="text" name="startDate" class="wtime textInput" validName="text" />
								<div class="Validform_tip_info fl undis">请输入试讲时间</div>
	                      		<div class="Validform_checktip fl"></div>
							</div>
							<div class="fl timeSecelt">
								<div>
									<div>
										<select name="startTime" id="" validName="select" class="startTime">
											<option value="">选择开始时间</option>
											<option value="08:00">08:00</option>
											<option value="09:00">09:00</option>
											<option value="10:00">10:00</option>
											<option value="11:00">11:00</option>
											<option value="12:00">12:00</option>
											<option value="13:00">13:00</option>
											<option value="14:00">14:00</option>
											<option value="15:00">15:00</option>
											<option value="16:00">16:00</option>
											<option value="17:00">17:00</option>
											<option value="18:00">18:00</option>
											<option value="19:00">19:00</option>
											<option value="20:00">20:00</option>
											<option value="21:00">21:00</option>
											<option value="22:00">22:00</option>
										</select>
									</div>
								</div>
								<span class="Validform_checktip"></span>	
							</div>
							<span class="fl underLine">—</span>
							<div class="fl timeSecelt">
								<div>
									<div>
										<select name="endTime" id="" validName="select" class="endTime">
											<option value="">选择结束时间</option>
											<option value="08:00">08:00</option>
											<option value="09:00">09:00</option>
											<option value="10:00">10:00</option>
											<option value="11:00">11:00</option>
											<option value="12:00">12:00</option>
											<option value="13:00">13:00</option>
											<option value="14:00">14:00</option>
											<option value="15:00">15:00</option>
											<option value="16:00">16:00</option>
											<option value="17:00">17:00</option>
											<option value="18:00">18:00</option>
											<option value="19:00">19:00</option>
											<option value="20:00">20:00</option>
											<option value="21:00">21:00</option>
											<option value="22:00">22:00</option>
										</select>
									</div>
								</div>
								<span class="Validform_checktip"></span>	
							</div>
						</div>
						<p class="tips">约定大概试讲时间，具体讲课时间需与工作人员协商</p>
					</li>
					<li class="cf">
						<p class="fl">课程名称</p>
						<div class="cf">
							<input type="text" name="courseName" class="subname textInput fl" validName="text" />
							<div class="Validform_tip_info fl undis">请输入课程名称</div>
                      		<div class="Validform_checktip fl"></div>
						</div>
					</li>
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
 <jsp:include page="/login_pop.jsp" />
<!--选择学校-->
<div id="resetSchoolPop" class="pop_box undis">
    <div id="teacherSetSchool">
        <div class="pop_main resetSchoolPopCon_beta">
            <!-- 选择省份开始 -->
            <ul class="schooLocation schoolProvice cf province undis"></ul>
            <!-- 选择省份结束 -->
            <!-- 选择城市开始 -->
            <ul class="schooLocation schoolCity cf city undis"></ul>
            <!-- 选择城市结束 -->
            <!-- 选择区县开始 -->
            <ul class="schooLocation schoolCounty cf county"></ul>
            <!-- 选择区县结束 -->
            <!-- 选择学校性质开始 -->
            <ul class="schooLocation schoolGrade cf sctype undis"></ul>
            <!-- 选择学校性质结束 -->
            <!-- 选择学校开始 -->
            <div class="schoolInfo undis">
                <div class="hd">
                    <form class="seacherSchoolForm" method="post">
                        <span class="fl">按选中的条件搜索：</span>
                        <div class="posr fl">
                            <input type="text" name="" class="cInput schoolNames" />
                            <div class="ValidformInfo">
                              <span class="Validform_checktip"></span>
                              <span class="dec">
                                <s class="dec1">&#9670;</s>
                                <s class="dec2">&#9670;</s>
                              </span>
                            </div>
                            <span class="reset undis" title="重置">X</span>
                        </div>
                        <input type="submit" value="搜索" class="cBtnSilver fl yh" />
                        <a href="javascript:void(0)" class="noMySchollBtn fl">没有我的学校？</a>
                    </form>
                </div>
                <div class="schooLocation schoolName school undis">
                </div>
                <!-- 搜索结果开始 -->
                <div class="seacherResult undis cf">
                    <ul></ul>
                </div>
                <!-- 搜索结果结束 -->
                <!-- 没有我的学校开始 -->
                <div class="bd undis">
                    <span class="fl">
                        请输入您的学校名称：
                    </span>
                    <input type="text" class="cInput fl writeSchoolName" />
                    <a href="javascript:void(0)" class="returnSetSchool fl">返回选择学校</a>
                </div>
                <!-- 没有我的学校结束 -->
            </div>
            <!-- 选择学校结束 -->
        </div>
    </div>
</div>
<script src="http://static.nahao.com/online/lib/jquery/1.8.2/jquery.js"></script>
<script src="http://static.nahao.com/online/lib/kindeditor/4.1.10/kindeditor.js"></script>
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
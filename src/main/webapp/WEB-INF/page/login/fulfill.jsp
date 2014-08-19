<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>那好在线课程登录界面-那好网</title>
<meta name="description" content="那好在线课程登录界面" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/login/style.css?v=v1.01" />
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
<body class="loginPage">
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap login" id="nahaoModule" module="login" data_page="studentPage">
	<div class="regSuccessBox layout">
		<h2 class="noIcon">关于我</h2>
		<s:form action="/login/fulfill/submit" method="post" cssClass="loginAfterForm">
			<ul class="Oul">
				<li class="cf">
					<p class="fl"><span>*</span>邮箱</p>
					<div class="cf">
                       <span class="fl hasEmail"><s:property value="%{#session.account.username}" /></span>
					</div>
				</li>
				<li class="cf">
					<p class="fl"><span>*</span>昵称</p>
					<div class="cf">
						<input type="text" name="nickName" class="lname textInput fl" validName="text"/>
						<div class="Validform_tip_info fl undis">请输入昵称</div>
          				<div class="Validform_checktip fl"></div>
					</div>
				</li>
				<li class="cf areaSelect">
					<p class="fl"><span>*</span>地区</p>
					<div class="cf" style="float:left">
						<div class="fl">
							<div>
								<select name="province" id="province" validName="select" class="loction">
									<option value="">选择省份</option>
                                                                        <option value="2">北京</option>
                                                                        <option value="3">安徽</option>
                                                                        <option value="4">福建</option>
                                                                        <option value="5">甘肃</option>
                                                                        <option value="6">广东</option>
                                                                        <option value="7">广西</option>
                                                                        <option value="8">贵州</option>
                                                                        <option value="9">海南</option>
                                                                        <option value="10">河北</option>
                                                                        <option value="11">河南</option>
                                                                        <option value="12">黑龙江</option>
                                                                        <option value="13">湖北</option>
                                                                        <option value="14">湖南</option>
                                                                        <option value="15">吉林</option>
                                                                        <option value="16">江苏</option>
                                                                        <option value="17">江西</option>
                                                                        <option value="18">辽宁</option>
                                                                        <option value="19">内蒙古</option>
                                                                        <option value="20">宁夏</option>
                                                                        <option value="21">青海</option>
                                                                        <option value="22">山东</option>
                                                                        <option value="23">山西</option>
                                                                        <option value="24">陕西</option>
                                                                        <option value="25">上海</option>
                                                                        <option value="26">四川</option>
                                                                        <option value="27">天津</option>
                                                                        <option value="28">西藏</option>
                                                                        <option value="29">新疆</option>
                                                                        <option value="30">云南</option>
                                                                        <option value="31">浙江</option>
                                                                        <option value="32">重庆</option>
                                                                        <option value="33">香港</option>
                                                                        <option value="34">澳门</option>
                                                                        <option value="35">台湾</option>
                                    								</select>
							</div>
						</div>
						<span class="Validform_checktip fl"></span>
					</div>
                    <div class="fl" style="float:left">
						<div class="fl">
							<div>
								<select name="city" id="city" validName="select" class="loction">
									<option value="">选择城市</option>
								</select>
							</div>
						</div>
						<span class="Validform_checktip fl"></span>
					</div>
                    <div class="fl">
						<div class="fl">
							<div id="area_div">
								<select name="area" id="area" validName="select">
									<option value="">选择地区</option>
								</select>
							</div>
						</div>
						<span class="Validform_checktip fl"></span>
					</div>
				</li>
				<li class="cf">
					<p class="fl"><span>*</span>年级</p>
					<div class="cf">
						<div class="fl">
							<div>
                            <select name="grade" id="grade" validName="select" class="subjectInput beauty_select">
                                <option value="">选择年级</option>
                                                                <option value="1">一年级</option>
                                                                <option value="2">二年级</option>
                                                                <option value="3">三年级</option>
                                                                <option value="4">四年级</option>
                                                                <option value="5">五年级</option>
                                                                <option value="6">六年级</option>
                                                                <option value="7">初一</option>
                                                                <option value="8">初二</option>
                                                                <option value="9">初三</option>
                                                                <option value="10">高一</option>
                                                                <option value="11">高二</option>
                                                                <option value="12">高三</option>
                                                                <option value="99">其他</option>
                                                            </select>
							</div>
						</div>
						<span class="Validform_checktip fl"></span>
					</div>
					<p class="tips2 fl">选择正确年级，专属活动等着你</p>			
				</li>
				<li class="cf optional">
					<p class="fl">真实姓名</p>
					<div class="cf">
						<input type="text" name="realName" class="pUname fl textInput" validName="text"/>
						<span class="Validform_checktip fl"></span>
					</div>
				</li>
				<li class="cf optional">
					<p class="fl">选择性别</p>
					<div class="cf">
						<div class="fl changeSex">
                            <input type="radio" name="gender" value="1" class="radio" ignore="ignore" validName="radio" checked/> 男
                            <input type="radio" name="gender" value="0" class="radio" ignore="ignore" validName="radio" /> 女
                        </div>
						<span class="Validform_checktip fl"></span>
					</div>
				</li>
				<li class="attent">
					<p class="optional">关注学科</p>
                    					<input type="button" name="focus_subjects" subject_id="1" value="家庭教育" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="2" value="数学" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="3" value="语文" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="4" value="英语" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="5" value="物理" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="7" value="心理学" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="8" value="素质教育" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="9" value="化学" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="10" value="生物" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="11" value="历史" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="12" value="地理" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="13" value="政治" class="btn "/>
                    					<input type="button" name="focus_subjects" subject_id="14" value="其他" class="btn "/>
                                        <input type="hidden" name="selected_subjects" id="selected_subjects" value=""/>
					<div class="cf">
						<div class="attNote fl">注：最多可选择3项</div>
						<span class="Validform_checktip fl"></span>
					</div>
				</li>
				<li class="cf">
					<p class="schooptional">所属学校</p>
					<div class="cf schoolPar">
						<input class="schoolFullName cInput yh" name="schoolName" value="" />
						<%--
						<a href="javascript:void(0);" class="resetSchool" set="1" province="2" city="" county="500">选择学校</a>
						<input type="hidden" value="" name="school_id" id="schoolVal" />
                        <input type="hidden" value="" name="province_id" id="province_id" />
                        <input type="hidden" value="" name="city_id" id="city_id" />
						<input type="hidden" value="" name="area_county_id" id="area_county_id"/>
						<input type="hidden" value="" name="school_type" id="school_type"/>
						<input type="hidden" value="" name="schoolname" id="schoolname" />
						--%>
					</div>
				</li>
				<li>
					<input type="submit" value="保存" class="btn redBtn submit"/>
				</li>
			</ul>
		</s:form>
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
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
</body>
</html>
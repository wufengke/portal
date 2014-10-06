<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>9527在线课堂</title>
<%@ include file="/common/JsCss.jsp" %>
<link rel="stylesheet" type="text/css" href="/js/jquery-ui-1.11.1/jquery-ui.min.css" />
<script type="text/javascript" src="/js/jquery-ui-1.11.1/jquery-ui.min.js"></script>
<style type="text/css">
.studentMyCourse {
    padding-top: 10px;
}
.studentMyCourse .newList li {
    margin: 0 20px 20px 0;
}
</style>
</head>
<body>
 <div id="header" class="lhb_header">
        <div class="w980 fc">
            <div class="lhb_logo fl">
                <a href="/">
                    <img src="<%=basePath %>images/logo.png" width="200" height="40" alt="酷学网" /></a>
            </div>
            <ul class="lhb_mn ft18 link_white tdno fl">
                <li class="fl"><a href="<%=basePath%>index">首页</a></li>

                <li class="fl"><a href="<%=basePath%>member/my_course">私人课程</a></li>

                <li class="fl"><a class="sel" href="<%=basePath%>public_online">公开课程</a></li>

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
<!--myinfo-->
    <div class="wrap layout studentMyCourse">
        <div class="zb_top_tab">
            <em class="zb_tab_tit fl">课程分类：</em>
            <ul id="search_level1" class="zb_top_lst fl">
                <li class="on" mid="-1">全部</li>
                <li mid="1">大学</li>
                <li mid="2">高中</li>
                <li mid="3">中学</li>
                <li mid="4">小学</li>
                <li mid="5">外语</li>
                <li mid="6">素质教育</li>
            </ul>
        </div>
        <div class="zb_tab_ct2 cf">
            <div id="search_jg" class="lft">
                <em class="zb_tab_tit">价格：</em>
                <a href="javascript:;" mid="-1" class="btn btn_gray8" pricesel="true"  id="fix">
                    <span class="btn_lft"></span>
                    <span class="btn_mid white"><span class="play_ico"></span>全部</span>
                    <span class="btn_rgt"></span>
                </a>
                <a href="javascript:;" mid="0" class="btn btn_gray8 zb_unbg">
                    <span class="btn_lft"></span>
                    <span class="btn_mid white"><span class="play_ico"></span>免费</span>
                    <span class="btn_rgt"></span>
                </a>
                <a href="javascript:;" mid="1" class="btn btn_gray8 zb_unbg">
                    <span class="btn_lft"></span>
                    <span class="btn_mid white"><span class="play_ico"></span>收费</span>
                    <span class="btn_rgt"></span>
                </a>
            </div>
            <div class="rgt">
                <em class="zb_tab_tit">直播时间：</em>
                <em class="zb_tab_tit">开始时间</em>
                <div class="text_input_box">
                    <input class="datepicker2 datepicker_ipt" style="width: 90px;" name="startDate" id="sel_startDate" type="text" value="2014-09-12"></input>
                </div>
                <em class="zb_tab_tit">结束时间</em>
                <div class="text_input_box">
                    <input class="datepicker2 datepicker_ipt" style="width: 90px; z-index: 9999;" name="endDate" id="sel_endDate" type="text" value="2014-12-13"></input>
                </div>
            </div>
        </div>
        <div class="courseConList newList" style="margin-top: 35px;">
            <ul class="cf">
                <!--  xuanzhuan-->
               	<s:iterator value="#request.courseList" var="course" status="s">
                    <li class="fl">
                        <div class="clBoxShaow iniBox">
                            <div class="courseFree"></div>
                            <img src="${course.mediumImageUrl}" alt=""></img>
                            <div class="iniInfor">
                                <p class="courseTitle"><s:property value="%{#course.courseTitle}"/></p>
                                <div class="cf">
                                    <span class="fl courseTime"><s:property value="%{#course.courseTimeDesc}"/>-<s:property value="%{#course.courseTimeDesc}"/></span> 
                                    <span class="fr"><em class="redText"><s:property value="%{#course.totalCount}"/></em>人</span>
                                </div>
                                <div class="cf fitGrade">
                                    <span class="fl"><s:property value="%{#course.courseDesc}"/></span> 
                                    <span class="fr"><s:property value="%{#course.lessonTimes}"/>课次</span>
                                </div>
                            </div>
                        </div>
                        <div class="clBoxShaow rotateBox posr undis" data-action="<%=basePath%>detail?detailId=${course.courseDetailId}" title="${course.courseTitle}"
                            title="${course.courseTitle}">
                            <div class="teaInfor cf">
                                <s:if test="#course.userImageUrl == null">
									<img src="<%=basePath%>images/default_avatar.png?v=v1.01" alt="头像" class="fl"></img>
								</s:if>
								<s:else>
									<img src="http://www.phas.cn${course.userImageUrl}" alt="头像" class="fl"></img>
								</s:else>
                                <div class="fl teaInforR">
                                    <h3 class="cf">
										<em class="fl"><s:property value="%{#course.userRealName}"/></em>
										<span class="fl"></span>
										<span class="fl"></span>
										<span class="fl"></span>
									</h3>
                                    <p class="detailInfor"></p>
                                </div>
                            </div>
                            <p class="brief"><s:property value="%{#course.courseBrief}"/></p>
							<p class="courseTitle" title="${course.courseTitle}">${course.courseTitle}</p>
                        </div>
                    </li>
                 </s:iterator>
            </ul>
        </div>
		<!--
        <div class="page">
            <span class="page_btn up">上一页</span>
            <ul class="page_lst">
                <li><span class="page_num page_on">1</span></li>
                <li><a href="javascript:;" class="page_num" onclick="changePage(2)">2</a></li>
                <li><a href="javascript:;" class="page_num" onclick="changePage(3)">3</a></li>
                <li><a href="javascript:;" class="page_num" onclick="changePage(4)">4</a></li>
                <li><a href="javascript:;" class="page_num" onclick="changePage(5)">5</a></li>
                <li><a href="javascript:;" class="page_num" onclick="changePage(6)">6</a></li>
                <li><span class="page_num">...</span></li>
                <li><a href="javascript:;" class="page_num" onclick="changePage(8)">8</a></li>
            </ul>
            <a href="javascript:;" class="page_btn next" onclick="changePage(2)">下一页</a>
            <span class="tip">每页显示8条记录（共计8页）</span>
        </div>
  		-->
    </div>
    <!--end of my info -->
     <jsp:include page="/foot.jsp" />
 	<script type="text/javascript">
     	$(function(){
     		initDate();
     		setParams();
     		$( "#sel_startDate" ).datepicker({
    			defaultDate: "+1w",
    			changeMonth: true,
    			numberOfMonths: 2,
    			dateFormat: 'yy-mm-dd',
    			onSelect:function()
    			{
    				onSelectChange();
    			},
    			onClose: function( selectedDate ) {
    				$( "#sel_endDate" ).datepicker( "option", "minDate", selectedDate );
    			}
    		});
    		$( "#sel_endDate" ).datepicker({
    			defaultDate: "+1w",
    			changeMonth: true,
    			numberOfMonths: 2,
    			dateFormat: 'yy-mm-dd',
    			onSelect:function()
    			{
    				onSelectChange();
    			},
    			onClose: function( selectedDate ) {
    				$( "#sel_startDate" ).datepicker( "option", "maxDate", selectedDate );
    			}
    		});
			$("#search_level1 li").click(function(){
				$(this).addClass("on");
				$("#search_level1 li").not(this).removeClass("on");
				
				onSelectChange();
			});     		
			$("#search_jg a").click(function(){
				$(this).removeClass("zb_unbg");
				$(this).attr("id","fix");
				$("#search_jg a").not(this).addClass("zb_unbg");
				$("#search_jg a").not(this).removeAttr("id");
				
				onSelectChange();
			});     		
     	});
     	
     	function onSelectChange()
     	{
     		var courseType = $("#search_level1 .on").attr("mid");
			var priceType = $("#fix").attr("mid");
			var startDate = $("#sel_startDate").val();
     		var endDate = $("#sel_endDate").val();
     		window.location.href = "<%=basePath%>public_online?courseType=" + courseType + "&priceType=" + priceType+ "&startDate=" + startDate + "&endDate=" + endDate;
     	}
     	
 		function addDate(dd,dadd){
	 		var a = new Date(dd)
	 		a = a.valueOf()
	 		a = a + dadd * 24 * 60 * 60 * 1000
	 		a = new Date(a)
	 		return a;
 		}
 	   function initDate(){
 			var now = new Date();
     		var years = now.getFullYear();
     		var months = now.getMonth()+1;
     		var days = now.getDate();
     		var startDate = years+"-"+ months + "-" + days;
     		var next = addDate(months+"/"+days+"/"+years,90);
     		years = next.getFullYear();
     		months = next.getMonth()+1;
     		days = next.getDate();
     		var endDate = years+"-"+ months + "-" + days;
     		$("#sel_startDate").val(startDate);
     		$("#sel_endDate").val(endDate);
 		} 
 		function setParams(){
 			var courseType = $.getUrlParam('courseType');
 			if(courseType != null){
 				$("#search_level1 li").each(function(index){
 					var mid = $(this).attr("mid");
 					if(mid == courseType){
 						$(this).addClass("on");
 						$("#search_level1 li").not(this).removeClass("on");
 					}
 				});
 			}
     		var priceType = $.getUrlParam('priceType');
     		if(priceType != null){
 				$("#search_jg a").each(function(index){
 					var mid = $(this).attr("mid");
 					if(mid == priceType){
 						$(this).removeClass("zb_unbg");
 						$(this).attr("id","fix");
 						$("#search_jg a").not(this).addClass("zb_unbg");
 						$("#search_jg a").not(this).removeAttr("id");
 					}
 				});
 			}
     		
     	    var startDate = $.getUrlParam('startDate');
     		if(startDate != null){
     			$("#sel_startDate").val(startDate);
     		}
     		var endDate = $.getUrlParam('endDate');
     		if(endDate != null){
     			$("#sel_endDate").val(endDate);
     		}
 		}
     </script>
</body>
</html>

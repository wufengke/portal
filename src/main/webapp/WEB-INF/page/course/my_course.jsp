<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>9527在线课堂</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta name="description" content="" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body class="myCoursePage">
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentMyCourse">
	<!-- 右侧框架开始 -->
 	<div class="wrapContent fr myCourseCon" id="wrapContent" name="myCourseCon">
 		<div class="inforTab">
			<ul class="tabh cf">
                 <li class="inforOn" id="first">私人课程</li>
                 <li>公开课程</li>
             </ul>
             <div class="inforTabBox">
                 <div style="margin: 80px 0 0 50px;">
                     <span style="font-size: 18px;">请输入课程密码：</span>
                     <input type="text" id="code" style="font-size: 24px; font-weight: bold; width: 153px; height: 45px;" value="" />
                 </div>
                 <div style="margin: 20px 0 0 50px;">
                 	<input type="hidden" value="${sessionScope.account.userId}" id="userId"></input>
                     <input type="button" name="enterclass" class="btn greenBtn" style="width: 160px;
                         height: 50px; color: white; font-size: 20px; font-family: 'Microsoft Yahei',Tahoma,Arial,sans-serif;"
                         value="进入教室" id="studentEnterClass" />
                 </div>
          	</div>
	        <div class="inforTabBox courseList undis">
			   	<!--我的课程-->
			    <div class="courseConList">
				<ul class="myCourseList cf">
					<!-- meiyou-->
					<li class="fl noCourse ">   
						<a href="<%=basePath%>public_online"><span>快来添加课程吧！</span></a>
					</li>
					<!-- kecheng yi wancheng -->
					<s:iterator value="#request.courseList" var="c" status="s">
						<li class="fl hasCourse  posr">
							<div class="courseFree"></div>
							<h3 title="${c.courseTitle }">${c.courseTitle }</h3>
							<a href="" ><img src="${c.mediumImageUrl }" alt="" title="${c.courseTitle }" class="cover" /></a>
							<div class="progress">
								<span class="bar" style="width:100%"></span>
							</div>
							<div class="courseInfor">
								<div class="lessons">
									<span class="redText">已上${c.haveLerned}节</span>/ 共1节
								</div>
								<s:if test="#c.isOver == 1">
									<div class="over">
										已结课
									</div>
								</s:if>
								<s:else>
									<div class="classTime">
										<p>下节课</p>
										<p class="redText">
											<span>${c.nextLession}</span>
										</p>
									</div>
								</s:else>
							</div>
							<s:if test="#c.isOver == 1">
								<a href="#" class="btn blueBtn"  target="_self">已经结束</a>				
							</s:if>
							<s:else>
								<a href="http://classroom.phas.cn/demo2.jsp?action=create&meetingID=${c.courseId}&username=${sessionScope.account.username}" class="btn blueBtn"  target="_blank">进入课程</a>				
							</s:else>
						</li>
					</s:iterator>
					</ul>
				</div>
			</div>
</div>
<div id="lastestNew" class="courseConList newList">
	<%-- --%>
	<h3 class="pageName">最新课程</h3>
	<ul class="cf">
		<!--  xuanzhuan-->
		<s:iterator value="#request.newCourseList" var="course" status="s">
			<li class="fl">
				<div class="clBoxShaow iniBox">
					<div class="courseFree"></div>
					<img src="${course.mediumImageUrl}" alt=""/>
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
				<div class="clBoxShaow rotateBox posr undis" data-action="<%=basePath%>detail?detailId=${course.courseDetailId}" title="${course.courseTitle}">
					<div class="teaInfor cf">
						<s:if test="#course.userImageUrl == null">
							<img src="<%=basePath %>images/default_avatar.png?v=v1.01" alt="头像" class="fl"/>
						</s:if>
						<s:else>
							<img src="${course.userImageUrl}" alt="头像" class="fl"/>
						</s:else>
						<div class="fl teaInforR">
							<!--工作证，称职证，教师证（1-5）-->
							<h3 class="cf">
								<em class="fl"><s:property value="%{#course.userRealName}"/></em>
								<span class=" fl"></span>
								<span class=" fl"></span>
								<span class=" fl"></span>
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
    	if($("#first").hasClass("inforOn")){
       		$(".newList").hide();
       	}else{
       		$(".newList").show();
       	} 
    	var error = $.getUrlParam('error');
    	
    	if(error == 1){
    		alert("教室暂时不可用，请稍后再试!");
    		return ;
    	}
    	if(error == 2){
    		alert("课程密码错误请确认!");
    		return ;
    	}
    
    });
</script>
</body>
</html>
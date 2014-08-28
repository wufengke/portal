<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的课程</title>
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/studentMyCourse/style.css?v=v1.01" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body class="myCoursePage">
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentMyCourse" id="nahaoModule" module="studentMyCourse" data_page="studentPage">
	<!-- 右侧框架开始 -->
 	<div class="wrapContent fr myCourseCon" id="wrapContent" name="myCourseCon">
   	<!--我的课程-->
    <div class="courseConList">
	<h3 class="pageName">我的主讲</h3>
	<ul class="myCourseList cf">
		<!-- kecheng yi wancheng -->
		<s:iterator value="#request.courseList" var="c" status="s">
			<li class="fl hasCourse  posr">
				<div class="courseFree"></div>
				<h3 title="${c.courseTitle }">${c.courseTitle }</h3>
				<a href="#" ><img src="${c.mediumImageUrl }" alt="" title="${c.courseTitle }" class="cover" /></a>
				<div class="progress">
					<span class="bar" style="width:100%"></span>
				</div>
				<div class="courseInfor">
					<div class="lessons">
						${c.courseTitle }
					</div>
					<div class="classTime">
						<p class="redText">
							<span>${c.courseTimeDesc}--${c.courseTimeDesc}</span>
						</p>
					</div>
				</div>
				<a href="http://online.demo.com/demo2.jsp?action=create&meetingID=${c.courseId}&username=${sessionScope.account.username}" class="btn blueBtn"  target="_blank">进入课程</a>				
			</li>
		</s:iterator>
	</ul>
	</div>
	<div class="courseConList newList">
	<%-- 
	<h3 class="pageName">最新课程</h3>
	<ul class="cf">
		<!--  xuanzhuan-->
		<li class="fl">
			<div class="clBoxShaow iniBox">
				<div class="courseFree"></div>
				<img src="http://img1.nahao.com/course_20140704113626_iQT8Wyx.png?imageView/2/w/230/h/172" alt="">
				<div class="iniInfor">
					<p class="courseTitle">谁不忆故人——唐诗中思念故人的诗歌鉴赏（寄全椒山中道士）</p>
					<div class="cf">
						<span class="fl courseTime">8月9日-8月9日</span>
						<span class="fr"><em class="redText">27</em>人</span>
					</div>
					<div class="cf fitGrade">
						<span class="fl">适合4-10年级</span>
						<span class="fr">1课次</span>
					</div>
				</div>
			</div>
			<div class="clBoxShaow rotateBox posr" data-action="<%=basePath%>ke_131.html" title="谁不忆故人——唐诗中思念故人的诗歌鉴赏（寄全椒山中道士）">
				<div class="teaInfor cf">
					<img src="http://img1.nahao.com/user_avartar_2520140704172829_ifC8u9I" alt="头像" class="fl" />
					<div class="fl teaInforR">
						<!--工作证，称职证，教师证（1-5）-->
						<h3 class="cf">
							<em class="fl">王勇</em>
							<span class=" fl"></span>
							<span class=" fl"></span>
							<span class=" fl"></span>
						</h3>
						<p class="detailInfor"></p>
					</div>
				</div>
				<p class="brief">本课程拟围绕“忆故人”这一主题，带领学生领略唐诗之美，了解传统文化中的隽永意蕴和人文精神。</p>
				<p class="courseTitle" title="谁不忆故人——唐诗中思念故人的诗歌鉴赏（寄全椒山中道士）">谁不忆故人——唐诗中思念故人的诗歌鉴赏（寄全椒山中道士）</p>
			</div>
		</li>
	</ul>
	--%>
</div>
</div> 
<!-- 右侧框架结束 -->
<jsp:include page="/left_side.jsp" />
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
</body>
</html>
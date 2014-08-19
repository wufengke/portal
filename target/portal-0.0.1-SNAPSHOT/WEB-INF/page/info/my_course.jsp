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
	<h3 class="pageName">我的课程</h3>
	<ul class="myCourseList cf">
		<!-- meiyou-->
				<li class="fl noCourse ">   
					<a href="<%=basePath%>"><span>快来添加课程吧！</span></a>
		</li>
		<!-- kecheng yi wancheng -->
						
		<li class="fl hasCourse  posr">
						<div class="courseFree"></div>
						<h3 title="精彩数学---人教版九年级（弧长、扇形计算）">精彩数学---人教版九年...</h3>
			

			<a href="/course/buy_after/61" ><img src="http://img1.nahao.com/course_20140707092533_i4N0k00.png?imageView/2/w/230/h/172" alt="" title="精彩数学---人教版九年级（弧长、扇形计算）" class="cover"></a>
			<div class="progress">
				<span class="bar" style="width:100%"></span>
			</div>
			<div class="courseInfor">
				<div class="lessons">
					<span class="redText">已上1节</span> / 共1节
				</div>
								<div class="over">
					已结课
				</div>
							</div>
			
			<a href="/course/buy_after/61" class="btn blueBtn">
				进入课程
		    </a>			
			
		</li>
					</ul>
</div>
<div class="courseConList newList">
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
					<img src="http://img1.nahao.com/user_avartar_2520140704172829_ifC8u9I" alt="头像" class="fl">
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
				<li class="fl">
			<div class="clBoxShaow iniBox">
								<div class="courseFree"></div>
								<img src="http://img1.nahao.com/course_20140710182537_irqi2jh?imageView/2/w/230/h/172" alt="">
				<div class="iniInfor">
					<p class="courseTitle">新概念第一册（上）——L45-48</p>
					<div class="cf">
						<span class="fl courseTime">8月9日-8月9日</span>
						<span class="fr"><em class="redText">9</em>人</span>
					</div>
					<div class="cf fitGrade">
						<span class="fl">适合3-6年级</span>
						<span class="fr">1课次</span>
					</div>
				</div>
			</div>
			<div class="clBoxShaow rotateBox posr" data-action="<%=basePath%>ke_1003.html" title="新概念第一册（上）——L45-48">
				<div class="teaInfor cf">
					<img src="http://img1.nahao.com/user_avatar_1920140705183607_igqyFQw" alt="头像" class="fl">
					<div class="fl teaInforR">
						<!--工作证，称职证，教师证（1-5）-->
						<h3 class="cf">
							<em class="fl">王冶</em>
							<span class=" fl"></span>
							<span class=" fl"></span>
							<span class=" fl"></span>
						</h3>
						<p class="detailInfor"></p>
					</div>
				</div>
				<p class="brief">艾宾浩斯曲线遗忘曲线研究表明，复现是英语学习最有效的手段。</p>
				<p class="courseTitle" title="新概念第一册（上）——L45-48">新概念第一册（上）——L45-48</p>
			</div>
		</li>
				<li class="fl">
			<div class="clBoxShaow iniBox">
								<div class="courseFree"></div>
								<img src="http://img1.nahao.com/course_20140730174805_i2FStfp?imageView/2/w/230/h/172" alt="">
				<div class="iniInfor">
					<p class="courseTitle">状元开讲——互动见面会（2009年江西文科状元李江燕）</p>
					<div class="cf">
						<span class="fl courseTime">8月18日-8月18日</span>
						<span class="fr"><em class="redText">64</em>人</span>
					</div>
					<div class="cf fitGrade">
						<span class="fl">适合4-12年级</span>
						<span class="fr">1课次</span>
					</div>
				</div>
			</div>
			<div class="clBoxShaow rotateBox posr" data-action="<%=basePath%>ke_194.html" title="状元开讲——互动见面会（2009年江西文科状元李江燕）">
				<div class="teaInfor cf">
					<img src="http://img1.nahao.com/user_avatar_3720140730181249_iBx306d" alt="头像" class="fl">
					<div class="fl teaInforR">
						<!--工作证，称职证，教师证（1-5）-->
						<h3 class="cf">
							<em class="fl">高考状元李江燕</em>
							<span class=" fl"></span>
							<span class=" fl"></span>
							<span class=" fl"></span>
						</h3>
						<p class="detailInfor"></p>
					</div>
				</div>
				<p class="brief">高考状元将与您面对面交流，分享学习秘诀，回答您的问题，帮助学生学得更好、更轻松。</p>
				<p class="courseTitle" title="状元开讲——互动见面会（2009年江西文科状元李江燕）">状元开讲——互动见面会（2009年江西文科状元李江燕）</p>
			</div>
		</li>
					</ul>
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
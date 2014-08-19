<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>那好在线课堂官网_网络课堂_网络课程_家教在线-那好网</title>
<meta name="keywords" content="那好网,网络课堂,网络课程,在线课堂"/>
<meta name="description" content="那好网荟萃全国名师，为教师提供实现自己教育梦想的在线课堂平台。致力于搭建最好的在线课堂网站，打造那好网络课堂，提供精品网络课程，为学生提供方便、高效，愉悦的网络学习体验。"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>online/css/studentHomePage/style.css" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap studentHomePage" id="nahaoModule" module="studentHomePage" data_page="studentPage">
	<div class="contop">
		<!-- 首页轮播 -->
		<div class="roll">
			<ul class="cf rollList">
            </ul>
			<ol class="cf rollNav">
            </ol>
		</div>
		<!-- course show -->
		<div class="courseBox">
			<div class="layout">
				<ul class="cf courseList">
					<s:iterator value="#request.courseList" var="course" status="s">
						<li class="fl">
							<div class="clBoxShaow iniBox">
								<div class="courseFree"></div>
								<img src="${course.mediumImageUrl}" alt="" />
								<div class="iniInfor">
									<p class="courseTitle"><s:property value="%{#course.courseTitle}"/></p>
									<div class="cf">
										<span class="fl courseTime"><s:property value="%{#course.courseTimeDesc}"/>-<s:property value="%{#course.courseTimeDesc}"/></span>
	                                    <span class="fr"><em class="redText"><s:property value="%{#course.totalCount}"/></em>人</span>
	                                </div>
									<div class="cf fitGrade">
										<span class="fl"><s:property value="%{#course.courseDesc}"/></span>
										<span class="fr"><s:property value="%{#course.lesson_times}"/>课次</span>
									</div>
								</div>
							</div>
							<div class="clBoxShaow rotateBox posr" data-action="<%=basePath%>detail?detailId=${course.courseDetailId}" title="${course.courseTitle}">
								<div class="teaInfor cf">
									<s:if test="#course.userImageUrl == null">
										<img src="<%=basePath %>online/images/login/default_avatar.png?v=v1.01" alt="头像" class="fl">
									</s:if>
									<s:else>
										<img src="${course.userImageUrl}" alt="头像" class="fl">
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
		</div>
	</div>
    <s:iterator value="#request.rollList" var="roll" status="s">
    	<input type="hidden" value="${roll.bigImageUrl},<%=basePath%>detail?detailId=${roll.courseDetailId},${roll.bigImageSideColor}" class="focus_photo_class" />
    </s:iterator>
    <input type="hidden" value="<%=basePath %>" class="qiniu" />
    
	<div class="conft layout">
		<div class="advantageBox">
			<ul class="advantage cf">
				<li class="fl ad1">
					<div class="adline"></div>
					<h2>专业师资</h2>
					<span class="line"></span>
					<p>全部教师经过严苛选拔、学术扎实、经验丰富</p>
				</li>
				<li class="fl ad2">
					<div class="adline"></div>
					<h2>互动直播</h2>
					<span class="line"></span>
					<p>师生仿佛面对面，拉近沟通距离</p>
				</li>
				<li class="fl ad3">
					<div class="adline"></div>
					<h2>贴心服务</h2>
					<span class="line"></span>
					<p>免费试听、随时退款、省时省力</p>
				</li>
			</ul>
		</div>
		<div class="coopBox">
			<div class="coopBoxh cf">
				<h3 class="fl coopComW">课程、师资合作</h3>
				<h3 class="fr coopComW">学校、机构合作</h3>
			</div>
			<div class="coopBoxCon">
				<div class="cf">
					<div class="fl coopComW">
						<p class="dt">如果您是某个领域的教学专家</p>
						<p class="dl">如果您有一门精彩的课程，希望让更多中小学生从中受益，<br>那好欢迎您！</p>
					</div>
					<div class="fr coopComW">
						<p class="dt">如果您是学校、机构</p>
						<p class="dl">您希望我们专门为您的学校提供定制的课程，<br>或者希望与我们开展更深入的合作！</p>
					</div>
				</div>
				<p class="fp">
					<a href="">那好期待与您的合作</a>
					<a href="javascript:vold(0);" class="phoneHref">400-864-8686</a>
					<a href="" class="mess">hezuo@nahao.com</a>
				</p>
			</div>
		</div>
		<!-- 师资 课程 学校 合作 结束 -->
	</div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/login_pop.jsp" />
<jsp:include page="/right_side.jsp" />
</body>
</html>

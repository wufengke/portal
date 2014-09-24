<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
 <title>9527在线课堂</title>
<meta name="description" content=""/>
<meta name="keywords" content=""/>
<%@ include file="/common/JsCss.jsp" %>
</head>
<body class="aboutPage">
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout about" id="nahaoModule" module="about" data_page="studentPage">

	<!--关于我们 左侧 开始-->
	<div class="sideLeftNav fl" id="sideLeftNav">
	    <ul>
	<li class="aboutus">
		<a href="<%=basePath%>about/aboutus">关于我们</a>
	</li>
	<li class="classmode curNav">
		<a href="<%=basePath%>about/joinus">加入我们</a>
	</li>
	<li class="userhelp">
		<a href="<%=basePath%>about/userhelp">用户帮助</a>
	</li>
	<li class="advise">
		<a href="<%=basePath%>about/advise">意见反馈</a>
	</li>
	<li class="contactus">
		<a href="<%=basePath%>about/contactus">联系我们</a>
	</li>
	<li class="service">
		<a href="<%=basePath%>about/service">服务协议</a>
	</li>
</ul>
    </div>
    <!--关于我们 左侧 结束-->
    
	<!--关于我们 右侧 开始-->
		<!--上课模式-->
    <div class="aboutContent fr" id="aboutContent" module="classmode">
	    <!--上课模式-->
<div class="addUsBox">
	<h2 class="redText">加入我们</h2>

	<div class="weneed">
		<p>我们寻找这样的你：</p>
		<p>你曾经很有梦想，却因现实而搁浅。你曾经很有激情，却因没有舞台而沉沦。你曾经想要改变世界，却因踽踽独行而力不从心。那么就请加入我们，一群正在战斗的人。舞台已经搭建，梦想，由我们一起实现！欢迎热爱教育，也热爱互联网，能吃苦耐劳，乐观自信，充满激情的你。那好课堂期待与你同行！</p>
		<h3 class="sendJL">请将简历发至：<span class="redText">zhaopin@nahao.com</span>（邮件标题注明应聘职位）</h3>
	</div>
	
	<p>下列岗位招聘贤才：</p>
	<div class="section">
		<h3>教学产品研发经理</h3>
		<p>职位描述：</p>
		<p>1、教学大纲设置及新课程研发</p>
		<p>2、教学产品设计与制作</p>
		<p>3、带领教研产品团队完善并整理教学课件</p>
		<p>职位要求：</p>
		<p>1、对K12阶段的语文、数学、英语教学都有一定的了解，其中有数学、英语和语文教学管理经验者优先</p>
		<p>2、3年以上中小学学科教学经验，1年以上教学管理经验</p>
		<p>3、数学/语文/英语专业，熟悉各地中高考大纲，具有敏锐的市场洞察力</p>
		<p>4、对于课程设置与研发有独特见解，工作细心，有责任心，可以承受一定的工作压力</p>
		<p>5、可以熟练使用Office办公软件</p>
		<p>6、善于学习新鲜事物，思维敏捷</p>
	</div>

	<div class="section">
		<h3>php开发工程师</h3>
		<p>职位描述：</p>
		<p>1、负责公司web产品的设计、开发及技术支持</p>
		<p>2、关键技术问题攻关工作、技术交流工作</p>
		<p>3、编写、维护开发文档</p>
		<p>职位要求：</p>
		<p>1、2年以上的php实际项目开发经验</p>
		<p>2、熟练掌握php的一种MVC开发框架，熟悉php的性能调优</p>
		<p>3、熟悉mysql、熟悉Linux操作系统</p>
		<p>4、具备扎实的编程基础、良好的编程习惯</p>
		<p>5、强烈的责任心和团队精神，善于合作，吃苦耐劳，能在高强度的压力下工作</p>
	</div>

	<div class="section">
		<h3>Android研发工程师</h3>
		<p>职位描述：</p>
		<p>1、负责公司Android平台下的产品应用程序设计、开发、维护</p>
		<p>2、学习和研究新技术以满足产品的需求，根据开发过程中的体验对产品提出改进建议</p>
		<p>3、撰写开发文档/设计测试用例和测试文档</p>
		<p>职位要求：</p>
		<p>1、至少完整经历过一个移动设备客户端产品的开发</p>
		<p>2、熟悉Android开发框架，具有良好的网络通讯开发基础</p>
		<p>3、对Android sdk各版本特性有清楚的了解</p>
		<p>4、强烈的责任心和团队精神，善于与合作，吃苦耐劳，能在高强度的压力下工作</p>
		<p>5、有移动互联网行业背景以及嵌入式软件开发经验者优先录用</p>
		<p>6、有音视频项目经历、能阅读英文文档者优先录用</p>
	</div>

	<div class="section">
		<h3>IOS研发工程师</h3>
		<p>职位描述：</p>
		<p>1、负责公司ios平台下的产品应用程序设计、开发、维护</p>
		<p>2、学习和研究新技术以满足产品的需求，根据开发过程中的体验对产品提出改进建议</p>
		<p>3、撰写开发文档/设计测试用例和测试文档</p>
		<p>职位要求：</p>
		<p>1、至少完整经历过一个移动设备客户端产品的开发</p>
		<p>2、具备扎实的c/c++、objective c编程基础，良好的编程习惯</p>
		<p>3、熟悉mac os x操作系统和xcode/dashcode开发环境</p>
		<p>4、有html5或者移动互联网行业背景以及嵌入式软件开发经验者优先</p>
		<p>5、强烈的责任心和团队精神，善于合作，吃苦耐劳，能在高强度的压力下工作</p>
		<p>6、有音视频项目经历、能阅读英文文档者优先录用</p>
	</div>

	<div class="section">
		<h3>教师培训经理</h3>
		<p>职位描述：</p>
		<p>1、完善新老师入职及晋级老师培训课程，编制培训流程</p>
		<p>2、安排新老师的工作内容和培训内容，并及时根据培训反馈进行调整</p>
		<p>3、分配和管理新老师的日常工作和事务</p>
		<p>4、参与晋级老师的推荐和选拔，安排晋级老师的培训内容，并对晋级老师学习效果进行评估</p>
		<p>5、配合其他部门的各项培训，提供老师、教务等支持，如市场部、咨询部和客服部等专项培训</p>
		<p>职位要求：</p>
		<p>1、英语或相关专业本科及以上学历</p>
		<p>2、三年以上中小学教育培训经验，熟悉各学科的教育体系</p>
		<p>3、接受过教师的基础技能培训及初步的管理能力培训</p>
		<p>4、熟悉培训流程，能独立完成培训任务</p>
		<p>5、持有教师资格证书</p>
		<p>6、有较强的团队合作、沟通协调能力及高度敬业的精神</p>
	</div>
	<h3 class="sendJL">请将简历发至：<span class="redText">zhaopin@nahao.com</span>（邮件标题注明应聘职位）</h3>
</div>
    </div>
	</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
</body>
</html>
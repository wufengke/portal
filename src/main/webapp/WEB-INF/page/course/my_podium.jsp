<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>9527在线课堂</title>
<meta name="description" content="" />
<%@ include file="/common/JsCss.jsp" %>
</head>
<body class="myCoursePage">
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentMyCourse">
	<!-- 右侧框架开始 -->
 	<div class="wrapContent fr myCourseCon" id="wrapContent">
	 	<div class="inforTab">
	 	 <ul class="tabh cf">
                    <li class="inforOn">私人课程</li>
                    <li>公开课程</li>
                </ul>
                <div class="inforTabBox">
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
                            <input id="code" name="code" type="text" readonly="true" style="font-size: 24px; font-weight: bold; width: 180px; height: 45px;" value="${requestScope.code}" />
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
                <div class="inforTabBox courseList undis">
				   	<!--我的课程-->
				    <div class="courseConList">
						<ul class="myCourseList cf">
						 	<li class="fl noCourse"><a style="text-decoration:none" href="<%=basePath%>member/my_podium_newclass"><span>快来创建课程吧！</span></a>
                            </li>
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
									<a href="http://meeting.agaokao.com/demo2.jsp?action=create&meetingID=${c.courseId}&username=${sessionScope.account.username}" class="btn blueBtn"  target="_blank">进入课程</a>				
								</li>
							</s:iterator>
						</ul>
					</div>
			</div>
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
    	var error = $.getUrlParam('error');
    	if(error == 1){
    		alert("教室暂时不可用，请稍后再试!");
    		return ;
    	}
    	if(error == 2){
    		alert("没有此课程请联系客服,确认");
    		return ;
    	}
    
    });
</script>
</body>
</html>
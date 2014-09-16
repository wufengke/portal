<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>9527在线课堂</title>
<%@ include file="/common/JsCss.jsp" %>
</head>
<body>
<jsp:include page="/head.jsp" />
<!-- 主要内容开始 -->
<div class="wrap layout studentMyCourse" id="nahaoModule">
    <div class="buyCourse buyBefore">
        <!-- 购买前 头部 -->
        <div class="buyHead">
            <div class="buyHeadt">
                <h2 title="${requestScope.c.courseTitle}">${requestScope.c.courseTitle}</h2>
                <p title="${requestScope.c.courseBrief}">${requestScope.c.courseBrief}</p>

            </div>
            <div class="buyHeadf cf">
      			<div class="posr fl">
  					<div class="courseFree"></div>
                	<img src="${requestScope.c.mediumImageUrl}" alt="" class="fl"/>
                </div>
                <div class="fl startTime">
                    <div class="cf timeTitle">
                        <span class="fl">开课时间</span>
                        <span class="fr">1次／${requestScope.cd.lessionTimes}课时</span>
                    </div>
                	<input type="hidden"  id="sell_endtime" value="2014-08-09 14:00:00" />
                	<s:hidden id="detailId" value="%{detailId}"/>
                    <ul class="cf">
                    	<s:iterator value="#request.lessionSchedule" var="ls" status="s">
                    		<s:if test="#s.index == 0">
                    			<s:hidden id="rank" value="%{#ls.rank}"/>
	                    		<li class="fl ctime ctimeOn">
		                            <a href="javascript:getRank(${s.index},${ls.rank});"><s:property value="%{#ls.date}"/>-<s:property value="%{#ls.date}"/></a>
		                        </li>
                    		</s:if>
	                    	<s:else>
		                    	<li class="fl ctime">
		                            <a href="javascript:getRank(${s.index},${ls.rank});"><s:property value="%{#ls.date}"/>-<s:property value="%{#ls.date}"/></a>
		                        </li>
	                    	</s:else>
                    	</s:iterator>
                         <li class="fl more">
                            <input type="hidden" name="" />更多班次敬请期待
                        </li>
                    </ul>
                    <p class="fromf cf">
                        <span class="fl oldPrice">原价<span>￥0</span></span>
                       	<input type="hidden" id="product_id" value=""/>
                       	<s:if test="#request.buyStatus == 1 && #request.lessionSchedule.size != 0">
	                       	<a href="javascript:buy();" class="fr btn greenBtn" id="soon_buy">
	                            <span class="fl">立即报名</span>
	                            <span class="fr"></span>
	                        </a>
							 <a href="javascript:void(0);" class="fr btn btn3" id="have_buy" style="display:none;" >
		                         <span class="fl">已购买</span>
		                         <span class="fr"></span>
		                    </a>
                       	</s:if>
						<s:else>
							<a href="javascript:buy();" class="fr btn greenBtn" id="soon_buy" style="display:none;">
	                            <span class="fl">立即报名</span>
	                            <span class="fr"></span>
	                        </a>
							 <a href="javascript:void(0);" class="fr btn btn3" id="have_buy">
		                         <span class="fl">已购买</span>
		                         <span class="fr"></span>
		                    </a>
						</s:else>
                        <strong class="fr">¥
                            <span class="redText">0</span>
                        </strong>
                    </p>
                </div>
                <!-- 
                <div class="fr endTime">
                    <div class="timeTitle">报名截止剩余时间</div>
                    <div class="countdown"></div>
                    <p class="cdp">仅剩 <span class="redText">  77 名额 </span>即售罄</p>
                    <p class="prompt ensure">第二节课前可退全部学费</p>
                    <p class="prompt retreat">未上课次可随时退款</p>
                    <div class="bdsharebuttonbox share">
                        <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                        <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                        <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                        <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
                        <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                        <a href="#" class="bds_more" data-cmd="more"></a>
                    </div>
                </div>
                -->
            </div>
        </div>
        <div class="cf">
            <!-- 购买前 左侧 -->
            <div class="buyLeft fl posr">
                <div class="slash"></div>
                <!-- 课程简介 -->
                <div class="introd cBox">
                    <p>${requestScope.cd.courseDetailBrief}</p>
                </div>
                <!-- 适合学生 -->
                <div class="fitStu cBox">
					${requestScope.cd.courseDetailDesc}
                </div>
                <!-- 课程大纲 -->
                <div class="outline cBox">
                	<div class="outlineList">
                		 <ul>
                        	<li class="cf">
		                       	<div class="fl"></div>
	                            <div class="fr listb">
	                                <p class="listh" title="${requestScope.outlline.lessionTitle }">${requestScope.outlline.lessionTitle }</p>
	                                <p class="listc">${requestScope.outlline.lessionTime }</p>
	                            </div>
	                        </li>
	                     </ul>
                    </div>
                 </div>
                <!-- 授课提要 -->
                <div class="summary cBox">
                    <div class="editorBox">
                       ${requestScope.cd.courseDetailSummary }
                    </div>  
                </div>
                <!-- 课程评价
                <div class="creview cBox">                    
                    <a name="review"></a>
                    <ul>
                     </ul>
                    <div class="fclick">
                                            <div class="cf">
                            <span class="fr allReview">所有评论（共2条）</span>
                        </div>
                                          
                            <input type="hidden" id="product_id_xia" value="131"/>
                            <a href="javascript:void(0);" class="btn redBtn applyBtn cf" id="soon_buy_xia">
                            <span class="fl">
                                ¥<strong>0</strong>
                            </span>
                            <span class="fr">
                                <span>购买课程</span>
                                <em>未上课次随时退款</em>
                            </span>
                        	</a>
                            							
                    </div>
                </div>
                -->
            </div>
            <!-- 购买前 右侧 -->
            <div class="buyRight fr">
                <ul>
                	<s:iterator value="#request.usersList" var="user" >
	                	<li>
	                        <div class="headBox posr">
	                        	<s:if test="#user.imageUrl == null">
	                        		<img src="<%=basePath%>images/default_avatar.png?v=v1.01" alt="" class="head"/>
	                        	</s:if>
	                        	<s:else>
	                        		<img src="${user.imageUrl }" alt="" class="head"/>
	                        	</s:else>
	                            <div class="headR">
	                                <div class="teaDetail">
	                                    <span class="redText cMan"><s:property value="%{#user.teacherTitle}"/></span>
	                                    <strong><s:property value="%{#user.realName}"/></strong>
	                                </div>
	                                <p>教龄<s:property value="%{#user.teachYear}"/>年</p>
	                            </div>
	                        </div>
	                        <p class="teaIntrod">
								<p><s:property value="%{#user.teacherBrief}"/></p>
	                        </p>
	                    </li>
                	</s:iterator>
				</ul>
            </div>
        </div>
    </div>
</div>
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
 <jsp:include page="/right_side.jsp" />
 <script type="text/javascript">
 function getRank(index,rank){
	 $("#rank").val(rank);
	 var detailId = $("#detailId").val();
	 $("ul[class='cf'] li").removeClass("ctimeOn");
	 $("ul[class='cf'] li:eq("+(index)+")").addClass("ctimeOn");
	 $.post("/checkBuyStatus",
			 {"detailId":detailId,"rank":rank},
			 function(data){
				 if(data.status == 0){
					 $("#soon_buy").css("display","none");
					 $("#have_buy").css("display","block");
				 }else{
					 $("#soon_buy").css("display","block");
					 $("#have_buy").css("display","none");
				 }
		 },"json");
 }
 function buy(){
	 var rank = $("#rank").val();
	 var buy_url = '<%=basePath %>pay/prepare?courseId=${requestScope.c.courseId}&rank=' + rank;	
	 window.location.href=buy_url;
 }
 </script>
</body>
</html>
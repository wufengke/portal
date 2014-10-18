<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>9527在线课堂</title>
<%@ include file="/common/JsCss.jsp" %>
<script type="text/javascript" src="/js/jssor.slider.mini.js"></script>
</head>
<body>
<!-- start of header -->
 <div id="header" class="lhb_header">
        <div class="w980 fc">
            <div class="lhb_logo fl">
                <a href="/">
                    <img src="<%=basePath %>images/logo.png" width="200" height="40" alt="酷学网" /></a>
            </div>
            <ul class="lhb_mn ft18 link_white tdno fl">
                <li class="fl"><a class="sel" href="<%=basePath%>index">首页</a></li>

                <li class="fl"><a href="<%=basePath%>member/my_course">私人课程</a></li>

                <li class="fl"><a href="<%=basePath%>public_online">公开课程</a></li>

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
    <!-- end of header -->
<script>
    jQuery(document).ready(function ($) {

        var _CaptionTransitions = [];
        _CaptionTransitions["L"] = { $Duration: 900, x: 0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
        _CaptionTransitions["R"] = { $Duration: 900, x: -0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
        _CaptionTransitions["T"] = { $Duration: 900, y: 0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
        _CaptionTransitions["B"] = { $Duration: 900, y: -0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
        _CaptionTransitions["ZMF|10"] = { $Duration: 900, $Zoom: 11, $Easing: { $Zoom: $JssorEasing$.$EaseOutQuad, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 };
        _CaptionTransitions["RTT|10"] = { $Duration: 900, $Zoom: 11, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseOutQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $Round: { $Rotate: 0.8 } };
        _CaptionTransitions["RTT|2"] = { $Duration: 900, $Zoom: 3, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Round: { $Rotate: 0.5 } };
        _CaptionTransitions["RTTL|BR"] = { $Duration: 900, x: -0.6, y: -0.6, $Zoom: 11, $Rotate: 1, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInCubic }, $Opacity: 2, $Round: { $Rotate: 0.8 } };
        _CaptionTransitions["CLIP|LR"] = { $Duration: 900, $Clip: 15, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2 };
        _CaptionTransitions["MCLIP|L"] = { $Duration: 900, $Clip: 1, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic } };
        _CaptionTransitions["MCLIP|R"] = { $Duration: 900, $Clip: 2, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic } };
        var _SlideshowTransitions = [
            { $Duration: 1000, $Zoom: 11, $Rotate: true, $SlideOut: true, $FlyDirection: 6, $Easing: { $Left: $JssorEasing$.$EaseInExpo, $Top: $JssorEasing$.$EaseInExpo, $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $ScaleHorizontal: 4, $ScaleVertical: 4, $Opacity: 2, $Round: { $Rotate: 0.8 } },
            { $Duration: 1200, $Zoom: 1, $Rotate: true, $During: { $Left: [0.2, 0.8], $Zoom: [0.2, 0.8], $Rotate: [0.2, 0.8] }, $FlyDirection: 1, $Easing: { $Left: $JssorEasing$.$EaseSwing, $Zoom: $JssorEasing$.$EaseSwing, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseSwing }, $ScaleHorizontal: 0.6, $Opacity: 2, $Round: { $Rotate: 0.5 } },
            { $Duration: 1200, $Zoom: 11, $Rotate: true, $FlyDirection: 8, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseOutQuad, $Rotate: $JssorEasing$.$EaseInCubic }, $ScaleVertical: 4, $Opacity: 2, $Round: { $Rotate: 0.7 } }
        ];

        var options = {
            $FillMode: 2,
            $AutoPlay: true,
            $AutoPlayInterval: 4000,
            $PauseOnHover: 0,

            $ArrowKeyNavigation: true,
            $SlideDuration: 800,
            $MinDragOffsetToSlide: 20,
            $SlideSpacing: 0,
            $DisplayPieces: 1,
            $ParkingPosition: 0,
            $UISearchMode: 1,
            $PlayOrientation: 1,
            $DragOrientation: 1,

            $SlideshowOptions: {
                $Class: $JssorSlideshowRunner$,
                $Transitions: _SlideshowTransitions,
                $TransitionsOrder: 1,
                $ShowLink: true
            },

            $CaptionSliderOptions: {
                $Class: $JssorCaptionSlider$,
                $CaptionTransitions: _CaptionTransitions,
                $PlayInMode: 1,
                $PlayOutMode: 3
            },

            $BulletNavigatorOptions: {
                $Class: $JssorBulletNavigator$,
                $ChanceToShow: 2,
                $AutoCenter: 1,
                $Steps: 1,
                $Lanes: 1,
                $SpacingX: 8,
                $SpacingY: 8,
                $Orientation: 1
            },

            $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$,
                $ChanceToShow: 1,
                $AutoCenter: 2,
                $Steps: 1
            }
        };

        var jssor_slider1 = new $JssorSlider$("slider1_container", options);

        function ScaleSlider() {
            var bodyWidth = document.body.clientWidth;
            if (bodyWidth)
                jssor_slider1.$SetScaleWidth(Math.min(bodyWidth, 1920));
            else
                window.setTimeout(ScaleSlider, 30);
        }

        ScaleSlider();

        if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
            $(window).bind('resize', ScaleSlider);
        }
    });
</script>
<body>
    <!--Animation -->
    <div id="slider1_container" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 1920px; height: 440px; overflow: hidden;">
        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;">
            </div>
            <div style="position: absolute; display: block; background: url(images/loading.gif) no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;">
            </div>
        </div>
        <!-- Slides Container -->
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 1920px; height: 440px; overflow: hidden;">
             <s:iterator value="#request.indexPicList" var="indexPic" status="s">
	            <div>
	                <img u="image" src="${indexPic.path}" ></img>
	            </div>
            </s:iterator>
        </div>
        <style>
            .jssorb21 div, .jssorb21 div:hover, .jssorb21 .av {
                background: url(images/b21.png) no-repeat;
                overflow: hidden;
                cursor: pointer;
            }

            .jssorb21 div {
                background-position: -5px -5px;
            }

                .jssorb21 div:hover, .jssorb21 .av:hover {
                    background-position: -35px -5px;
                }

            .jssorb21 .av {
                background-position: -65px -5px;
            }

            .jssorb21 .dn, .jssorb21 .dn:hover {
                background-position: -95px -5px;
            }
        </style>
        <!-- bullet navigator container -->
        <div u="navigator" class="jssorb21" style="position: absolute; bottom: 26px; left: 6px;">
            <!-- bullet navigator item prototype -->
            <div u="prototype" style="position: absolute; width: 19px; height: 19px; text-align: center; line-height: 19px; color: White; font-size: 12px;">
            </div>
        </div>
        <style>
            .jssora21l, .jssora21r, .jssora21ldn, .jssora21rdn {
                position: absolute;
                cursor: pointer;
                display: block;
                background: url(images/a21.png) center center no-repeat;
                overflow: hidden;
            }

            .jssora21l {
                background-position: -3px -33px;
            }

            .jssora21r {
                background-position: -63px -33px;
            }

            .jssora21l:hover {
                background-position: -123px -33px;
            }

            .jssora21r:hover {
                background-position: -183px -33px;
            }

            .jssora21ldn {
                background-position: -243px -33px;
            }

            .jssora21rdn {
                background-position: -303px -33px;
            }
        </style>
        <!-- Arrow Left -->
        <span u="arrowleft" class="jssora21l" style="width: 55px; height: 55px; top: 123px; left: 8px;"></span>
        <!-- Arrow Right -->
        <span u="arrowright" class="jssora21r" style="width: 55px; height: 55px; top: 123px; right: 8px"></span>
        <!-- Arrow Navigator Skin End -->
    </div>
    <!--end of Animation -->
    <style type="text/css">
        .studentMyCourse {
          padding-top:10px;
        }
        .studentMyCourse .newList li {
          margin:0 20px 20px 0;
        }
        </style>
<!-- 主要内容开始 -->
 <div class="wrap layout studentMyCourse" >
        <div class="courseConList newList">
                <h3 class="pageName">公开课程</h3>
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
										<img src="http://class.agaokao.com${course.userImageUrl}" alt="头像" class="fl"></img>
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
<!-- 主要内容结束 -->
 <jsp:include page="/foot.jsp" />
<jsp:include page="/right_side.jsp" />
<script>
    $(document).scroll(function () {
        var top = $(document).scrollTop();
        var obj = $(".returnTop");
        //alert(top);
        if (top > 50) {
            obj.show();
        } else {
            obj.hide();
        }
    });
    $(".returnTop").click(function () {
        $(document).scrollTop(0);
    });
</script>
</body>
</html>

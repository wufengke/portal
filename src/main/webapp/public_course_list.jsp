<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>9527在线课堂</title>
<%@ include file="/common/JsCss.jsp" %>
 <link href="/js/My97DatePicker/4.8/skin/WdatePicker.css" rel="stylesheet" type="text/css"></link>
 <script type="text/javascript" src="/js/My97DatePicker/4.8/WdatePicker.js"></script>
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
<jsp:include page="/head.jsp" />
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

                <a href="javascript:;" mid="-1" class="btn btn_gray8" pricesel="true">


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
                    <input class="datepicker2 datepicker_ipt hasDatepicker" onclick="WdatePicker()" style="width: 90px;" name="startDate" id="sel_startDate" type="text" value="2014-09-12">
                </div>
                <em class="zb_tab_tit">结束时间</em>
                <div class="text_input_box">
                    <input class="datepicker2 datepicker_ipt hasDatepicker" onclick="WdatePicker()" style="width: 90px; z-index: 9999;" name="endDate" id="sel_endDate" type="text" value="2014-12-13">
                </div>
            </div>
        </div>
        <div class="courseConList newList" style="margin-top: 35px;">
            <ul class="cf">
                <!--  xuanzhuan-->
                <li class="fl">
                    <div class="clBoxShaow iniBox">
                        <div class="courseFree">
                        </div>
                        <img src="http://img1.nahao.com/course_20140704113626_iQT8Wyx.png?imageView/2/w/230/h/172"
                            alt="">
                        <div class="iniInfor">
                            <p class="courseTitle">
                                谁不忆故人——唐诗中思念故人的诗歌鉴赏（寄全椒山中道士）
                            </p>
                            <div class="cf">
                                <span class="fl courseTime">8月9日-8月9日</span> <span class="fr"><em class="redText">27</em>人</span>
                            </div>
                            <div class="cf fitGrade">
                                <span class="fl">适合4-10年级</span> <span class="fr">1课次</span>
                            </div>
                        </div>
                    </div>
                    <div class="clBoxShaow rotateBox posr undis" data-action="newdetail.html"
                        title="谁不忆故人——唐诗中思念故人的诗歌鉴赏（寄全椒山中道士）">
                        <div class="teaInfor cf">
                            <img src="http://img1.nahao.com/user_avartar_2520140704172829_ifC8u9I" alt="头像" class="fl" />
                            <div class="fl teaInforR">
                                <!--工作证，称职证，教师证（1-5）-->
                                <h3 class="cf">
                                    <em class="fl">王勇</em> <span class=" fl"></span><span class=" fl"></span><span class=" fl"></span>
                                </h3>
                                <p class="detailInfor">
                                </p>
                            </div>
                        </div>
                        <p class="brief">
                            本课堂拟围绕“忆故人”这一主题，带领学生领略唐诗之美，了解传统文化中的隽永意蕴和人文精神。
                        </p>
                        <p class="courseTitle" title="谁不忆故人——唐诗中思念故人的诗歌鉴赏（寄全椒山中道士）">
                            谁不忆故人——唐诗中思念故人的诗歌鉴赏（寄全椒山中道士）
                        </p>
                    </div>
                </li>
                <li class="fl">
                    <div class="clBoxShaow iniBox">
                        <div class="courseFree">
                        </div>
                        <img src="http://img1.nahao.com/course_20140710182537_irqi2jh?imageView/2/w/230/h/172"
                            alt="">
                        <div class="iniInfor">
                            <p class="courseTitle">
                                新概念第一册（上）——L45-48
                            </p>
                            <div class="cf">
                                <span class="fl courseTime">8月9日-8月9日</span> <span class="fr"><em class="redText">9</em>人</span>
                            </div>
                            <div class="cf fitGrade">
                                <span class="fl">适合3-6年级</span> <span class="fr">1课次</span>
                            </div>
                        </div>
                    </div>
                    <div class="clBoxShaow rotateBox posr undis" data-action="newdetail.html"
                        title="新概念第一册（上）——L45-48">
                        <div class="teaInfor cf">
                            <img src="http://img1.nahao.com/user_avatar_1920140705183607_igqyFQw" alt="头像" class="fl">
                            <div class="fl teaInforR">
                                <!--工作证，称职证，教师证（1-5）-->
                                <h3 class="cf">
                                    <em class="fl">王冶</em> <span class=" fl"></span><span class=" fl"></span><span class=" fl"></span>
                                </h3>
                                <p class="detailInfor">
                                </p>
                            </div>
                        </div>
                        <p class="brief">
                            艾宾浩斯曲线遗忘曲线研究表明，复现是英语学习最有效的手段。
                        </p>
                        <p class="courseTitle" title="新概念第一册（上）——L45-48">
                            新概念第一册（上）——L45-48
                        </p>
                    </div>
                </li>
                <li class="fl">
                    <div class="clBoxShaow iniBox">
                        <div class="courseFree">
                        </div>
                        <img src="http://img1.nahao.com/course_20140710182537_irqi2jh?imageView/2/w/230/h/172"
                            alt="">
                        <div class="iniInfor">
                            <p class="courseTitle">
                                新概念第一册（上）——L45-48
                            </p>
                            <div class="cf">
                                <span class="fl courseTime">8月9日-8月9日</span> <span class="fr"><em class="redText">9</em>人</span>
                            </div>
                            <div class="cf fitGrade">
                                <span class="fl">适合3-6年级</span> <span class="fr">1课次</span>
                            </div>
                        </div>
                    </div>
                    <div class="clBoxShaow rotateBox posr undis" data-action="newdetail.html"
                        title="新概念第一册（上）——L45-48">
                        <div class="teaInfor cf">
                            <img src="http://img1.nahao.com/user_avatar_1920140705183607_igqyFQw" alt="头像" class="fl">
                            <div class="fl teaInforR">
                                <!--工作证，称职证，教师证（1-5）-->
                                <h3 class="cf">
                                    <em class="fl">王冶</em> <span class=" fl"></span><span class=" fl"></span><span class=" fl"></span>
                                </h3>
                                <p class="detailInfor">
                                </p>
                            </div>
                        </div>
                        <p class="brief">
                            艾宾浩斯曲线遗忘曲线研究表明，复现是英语学习最有效的手段。
                        </p>
                        <p class="courseTitle" title="新概念第一册（上）——L45-48">
                            新概念第一册（上）——L45-48
                        </p>
                    </div>
                </li>
                <li class="fl">
                    <div class="clBoxShaow iniBox">
                        <div class="courseFree">
                        </div>
                        <img src="http://img1.nahao.com/course_20140730174805_i2FStfp?imageView/2/w/230/h/172"
                            alt="">
                        <div class="iniInfor">
                            <p class="courseTitle">
                                状元开讲——互动见面会（2009年江西文科状元李江燕）
                            </p>
                            <div class="cf">
                                <span class="fl courseTime">8月18日-8月18日</span> <span class="fr"><em class="redText">64</em>人</span>
                            </div>
                            <div class="cf fitGrade">
                                <span class="fl">适合4-12年级</span> <span class="fr">1课次</span>
                            </div>
                        </div>
                    </div>
                    <div class="clBoxShaow rotateBox posr undis" data-action="newdetail.html"
                        title="状元开讲——互动见面会（2009年江西文科状元李江燕）">
                        <div class="teaInfor cf">
                            <img src="http://img1.nahao.com/user_avatar_3720140730181249_iBx306d" alt="头像" class="fl">
                            <div class="fl teaInforR">
                                <!--工作证，称职证，教师证（1-5）-->
                                <h3 class="cf">
                                    <em class="fl">高考状元李江燕</em> <span class=" fl"></span><span class=" fl"></span><span
                                        class=" fl"></span>
                                </h3>
                                <p class="detailInfor">
                                </p>
                            </div>
                        </div>
                        <p class="brief">
                            高考状元将与您面对面交流，分享学习秘诀，回答您的问题，帮助学生学得更好、更轻松。
                        </p>
                        <p class="courseTitle" title="状元开讲——互动见面会（2009年江西文科状元李江燕）">
                            状元开讲——互动见面会（2009年江西文科状元李江燕）
                        </p>
                    </div>
                </li>
            </ul>
        </div>

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

    </div>
    <!--end of my info -->
     <jsp:include page="/foot.jsp" />
</body>
</html>

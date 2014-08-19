define("module/studentStartClass/valid",["lib/Validform/5.3.2/Validform","lib/artDialog/4.1.7/artDialog","module/login/validFocus"],function(require,exports){function check_time_pick(){$(".timeSecelt").eq(1).find("li a").click(function(){var start=parseInt($(".startTime").val()),end=parseInt($(".endTime").val());start>=end&&$(".timeSecelt").eq(1).children(".Validform_checktip").removeClass("Validform_right").addClass("Validform_wrong").html("开始时间不能晚于结束时间")})}require("lib/Validform/5.3.2/Validform"),require("lib/artDialog/4.1.7/artDialog");var commonTipType=function(msg,o,cssctl){if(!o.obj.is("form")){if("text"==o.obj.attr("validName")||"textarea"==o.obj.attr("validName")||"captcha"==o.obj.attr("validName"))var objtip=o.obj.siblings(".Validform_checktip");else if("radio"==o.obj.attr("validName"))var objtip=o.obj.parent().parent().next(".Validform_checktip");else if("select"==o.obj.attr("validName")||"checkbox"==o.obj.attr("validName"))var objtip=o.obj.parent().parent().parent().next(".Validform_checktip");cssctl(objtip,o.type),objtip.text(msg)}};exports.writeInfoForm=function(){var _Form=$(".writeInfoForm").Validform({tiptype:commonTipType,showAllError:!1,ajaxPost:!0,beforeSubmit:function(){var start=parseInt($(".startTime").val()),end=parseInt($(".endTime").val());return start>=end?($(".timeSecelt").eq(1).children(".Validform_checktip").removeClass("Validform_right").addClass("Validform_wrong").html("开始时间不能晚于结束时间"),$.tiziDialog({icon:null,content:"开始时间不能晚于结束时间"}),!1):void 0},callback:function(data){"ok"==data.status?$.tiziDialog({icon:"succeed",content:"开课申请成功",ok:function(){window.location.href="/"}}):$.tiziDialog({icon:"error",content:data.msg})},usePlugin:{jqtransform:{selector:".select_beauty,:checkbox,:radio,.decorate"}}});_Form.tipmsg.r=" ",_Form.addRule([{ele:".wUname",datatype:"*2-15",nullmsg:"请输入称呼",errormsg:"长度2-15个字符"},{ele:".schoolFullName",datatype:"*",nullmsg:"请选择学校",errormsg:"请选择正确的学校"},{ele:".radioInput",datatype:"*",nullmsg:"请选择性别",errormsg:"请选择正确的性别"},{ele:".wage",datatype:"/^\\d{2}$/",nullmsg:"请输入年龄",errormsg:"请输入正确的年龄"},{ele:".checkInput",datatype:"*",nullmsg:"请选择教学阶段",errormsg:"您未选择教学阶段！"},{ele:".teaTitle",datatype:"*",nullmsg:"请选择教师职称",errormsg:"请选择正确的教师职称"},{ele:".seniority",datatype:"*",nullmsg:"请选择实际教龄",errormsg:"请选择正确的实际教龄"},{ele:".wphone",datatype:"m",nullmsg:"请输入手机号码",errormsg:"请输入正确的手机号码"},{ele:".wEmail",datatype:"e",nullmsg:"请输入邮箱地址",errormsg:"请输入正确的邮箱地址"},{ele:".wQQ",datatype:"/^\\d{5,12}$/",nullmsg:"请输入QQ号码！",errormsg:"长度5-12个数字"},{ele:".lecture",datatype:"*",nullmsg:"请选择讲课方式",errormsg:"请选择正确的讲课方式"},{ele:".lectureSub",datatype:"*",nullmsg:"请选择试讲科目",errormsg:"请选择正确的试讲科目"},{ele:".wtime",datatype:"*",nullmsg:"请输入预约时间",errormsg:"请输入正确的时间格式"},{ele:".startTime",datatype:"*",nullmsg:"请选择开始时间"},{ele:".endTime",datatype:"*",nullmsg:"请选择结束时间"},{ele:".subname",datatype:"*",nullmsg:"请输入课程名称",errormsg:"请输入正确的课程名称"}]),check_time_pick(),require("module/login/validFocus"),_Form.config({url:student_url+"index/save_apply_teach",ajaxurl:{success:function(json,obj){"ok"==json.status?($(obj).siblings(".Validform_checktip").html(json.msg),$(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"),$(obj).removeClass("Validform_error")):($(obj).siblings(".Validform_checktip").html(json.msg),$(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))}}})},exports.teaRegForm=function(){var _Form=$(".teaRegForm").Validform({tiptype:commonTipType,showAllError:!1,ajaxPost:!0,beforeSubmit:function(curform){return require("lib/Validform/5.3.2/Validform").checkCaptcha("TeacherBox",1)?(require("lib/Validform/5.3.2/Validform").md5(curform),void 0):!1},callback:function(data){alert("提交成功"),require("lib/Validform/5.3.2/Validform").reset_md5(".regTeacherForm"),data.errorcode||require.async("validForm",function(ex){ex.changeCaptcha("TeacherBox")})}});_Form.tipmsg.r=" ",_Form.addRule([{ele:".sEmail",datatype:"e",nullmsg:"请输入邮箱地址",errormsg:"请输入正确的邮箱地址"},{ele:".spassword",datatype:"*6-20",nullmsg:"请输入密码",errormsg:"长度6-20个字符之间"},{ele:".TeacherBoxWord",datatype:"/^\\w{4}$/",nullmsg:"请输入验证码",errormsg:"验证码长度是4位"}])}}),define("module/login/validFocus",[],function(){var getInfoObj=function(){return $(this).parent().find(".Validform_tip_info")};$("[datatype]").focusin(function(){this.timeout&&clearTimeout(this.timeout);var infoObj=getInfoObj.call(this);0==infoObj.siblings(".Validform_right").length&&infoObj.show().next().hide()}).focusout(function(){var infoObj=getInfoObj.call(this);this.timeout=setTimeout(function(){infoObj.hide().next(".Validform_wrong,.Validform_right,.Validform_loading").show()},0)})});
define("module/nahaoCommon/commonLogin", ["lib/Validform/5.3.2/Validform", "lib/artDialog/4.1.7/artDialog", "module/login/valid", "naHaoDialog", "validForm", "cryptoJs", "module/common/method/send", "module/login/validFocus", "module/login/resetPwd"], function(require, exports) {
    require("lib/Validform/5.3.2/Validform"), exports.loginForm = function() {
        $(".commonLoginBtn").click(function() {
            exports.cLogin(), $(".aui_content .userName").focus()
        })
    }, exports.cLogin = function() {
        require("lib/artDialog/4.1.7/artDialog"), $.dialog({title: "用户登录",content: $("#commonLogin").html().replace("loginForm_beta", "loginForm"),icon: null,width: 348,ok: !1}), $(".userName").focus(), require("module/login/valid").loginForm()
    }
}), define("module/login/valid", ["lib/artDialog/4.1.7/artDialog", "lib/Validform/5.3.2/Validform", "lib/cryptoJs/3.1.2/sha1", "module/common/method/send", "module/common/method/countDown", "module/login/validFocus", "module/login/resetPwd", "naHaoDialog"], function(require, exports) {
    function checkAttent(obj) {
        $(obj + " .attent .btn").click(function() {
            function va() {
                $(obj + " .attentd").length >= 3 ? $(this).parent().find(".Validform_checktip").show().html("最多只能选三科").addClass("Validform_wrong").removeClass("Validform_right") : $(this).parent().find(".Validform_checktip").show().html("").addClass("Validform_right").removeClass("Validform_wrong")
            }
            function va_blur() {
                $(obj + " .attentd").length <= 3 ? $(this).parent().find(".Validform_checktip").show().html("").addClass("Validform_right").removeClass("Validform_wrong") : $(this).parent().find(".Validform_checktip").show().html("最多只能选三科").addClass("Validform_wrong").removeClass("Validform_right")
            }
            $(obj + " .attentd").length < 3 ? $(this).hasClass("attentd") ? ($(this).removeClass("attentd"), _record_interested_subjects($("#selected_subjects"), $(this), "remove")) : ($(this).addClass("attentd"), _record_interested_subjects($("#selected_subjects"), $(this), "add")) : ($(this).hasClass("attentd") && ($(this).removeClass("attentd"), _record_interested_subjects($("#selected_subjects"), $(this), "remove")), va.call(this)), $(obj + " .attent .btn").focus(function() {
                va.call(this)
            }), $(obj + " .attent .btn").blur(function() {
                va_blur.call(this)
            })
        })
    }
    function _record_interested_subjects(container_obj, subject_obj, operation) {
        var selected_subjects = container_obj.val(), subject_id = subject_obj.attr("subject_id");
        if ("add" == operation)
            selected_subjects ? selected_subjects = selected_subjects + "-" + subject_id : selected_subjects += subject_id, container_obj.val(selected_subjects);
        else if ("remove" == operation) {
            var index = selected_subjects.indexOf(subject_id), opIndex = selected_subjects.indexOf("-");
            selected_subjects = 0 == index && opIndex > 0 ? selected_subjects.replace(subject_id + "-", "") : 0 == index && -1 == opIndex ? selected_subjects.replace(subject_id, "") : selected_subjects.replace("-" + subject_id, ""), container_obj.val(selected_subjects)
        }
    }
    require("lib/artDialog/4.1.7/artDialog"), require("lib/Validform/5.3.2/Validform");
    var commonTipType = function(msg, o, cssctl) {
        if (!o.obj.is("form")) {
            if ("text" == o.obj.attr("validName") || "textarea" == o.obj.attr("validName") || "captcha" == o.obj.attr("validName"))
                var objtip = o.obj.siblings(".Validform_checktip");
            else if ("radio" == o.obj.attr("validName"))
                var objtip = o.obj.parent().parent().next(".Validform_checktip");
            else if ("select" == o.obj.attr("validName") || "checkbox" == o.obj.attr("validName"))
                var objtip = o.obj.parent().parent().parent().next(".Validform_checktip");
            cssctl(objtip, o.type), objtip.text(msg)
        }
    };
    exports.regPhoneBoxForm = function() {
        $(".regPhoneBox .phoneNum").focus();
        var _Form = $(".regPhoneBox").Validform({tiptype: 3,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                require("lib/cryptoJs/3.1.2/sha1");
                var hash = CryptoJS.SHA1($(".regPhoneBox .pwd").val());
                $(".regPhoneBox .pwd").attr("disabled", !0), $(".regPhoneBox .epass").val(hash.toString())
            },callback: function(json) {
                "ok" == json.status ? window.location = perfectUrl : ($.dialog({content: json.msg}), $(".regPhoneBox .pwd").removeAttr("disabled"))
            }});
        _Form.addRule([{ele: ".phoneNum",datatype: "m",ajaxurl: siteUrl + "register/check_phone",ajaxUrlName: "phone",nullmsg: "请输入手机号",errormsg: "手机号输入错误"}, {ele: ".pwd",datatype: "*6-20",nullmsg: "请输入密码",errormsg: "密码长度只能在6-20位字符之间"}, {ele: ".codeInput",datatype: "/^\\d{4}$/",nullmsg: "请输入手机验证码",errormsg: "长度是四位数字"}, {ele: "checkbox:first",datatype: "*",nullmsg: "请同意服务协议",errormsg: "未同意服务协议"}]), _Form.config({ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}}), require("module/common/method/send").sendPhoneNum(1), seajs.use("module/login/validFocus")
    }, exports.regEmailBoxForm = function() {
        $(".regEmailBox .email").focus();
        var _Form = $(".regEmailBox").Validform({tiptype: 3,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                require("lib/cryptoJs/3.1.2/sha1");
                var hash = CryptoJS.SHA1($(".regEmailBox .pwd").val());
                $(".regEmailBox .pwd").attr("disabled", !0), $(".regEmailBox .epass").val(hash.toString())
            },callback: function(json) {
                "ok" == json.status ? window.location = perfectUrl : ($.dialog({content: json.msg}), $(".regEmailBox .pwd").removeAttr("disabled"))
            }});
        _Form.addRule([{ele: ".email",datatype: "e",ajaxurl: siteUrl + "register/check_email",ajaxUrlName: "email",nullmsg: "请输入邮箱地址",errormsg: "长度6-30个字符的邮箱地址"}, {ele: ".pwd",datatype: "*6-20",nullmsg: "请输入密码",errormsg: "密码输入错误"}, {ele: ".ephone",datatype: "m",nullmsg: "请输入手机号码",errormsg: "手机号码输入错误",ignore: "ignore"}, {ele: "radio:first",datatype: "*",nullmsg: "请同意服务协议",errormsg: "未同意服务协议"}]), _Form.config({ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}})
    }, exports.loginForm = function() {
        $(".userName").focus();
        var _Form = $(".loginForm").Validform({tiptype: function(msg, o, cssctl) {
                var objtip = $("#msgInfo");
                cssctl(objtip, o.type), objtip.text(msg)
            },showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                require("lib/cryptoJs/3.1.2/sha1");
                var hash = CryptoJS.SHA1($(".pwd").val());
                $(".pwd").attr("disabled", !0), $(".epass").val(hash.toString())
            },callback: function(data) {
                return "ok" == data.status ? "reload" == data.data.redirect_url ? window.location.reload() : window.location = data.data.redirect_url : ($.dialog({content: data.msg}), $(".pwd").removeAttr("disabled")), !1
            }});
        _Form.addRule([{ele: ".userName",datatype: "m|e",nullmsg: "请输入手机号/邮箱",errormsg: "请输入正确的手机号/邮箱"}, {ele: ".pwd",datatype: "*6-20",nullmsg: "请输入密码",errormsg: "密码输入错误"}]), _Form.config({url: "/login/submit",ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}})
    }, exports.loginAfterForm = function() {
        checkAttent(".loginAfterForm");
        var _Form = $(".loginAfterForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
            },callback: function(data) {
                $.dialog({content: data.info,icon: null,ok: function() {
                        "ok" == data.status && (window.location = data.url)
                    }})
            },usePlugin: {jqtransform: {selector: ".beauty_select,:checkbox,:radio,.decorate"}}});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".lEmail",datatype: "e",nullmsg: "请输入邮箱地址",errormsg: "请输入正确格式的邮箱",ajaxurl: "/member/check_email_availability",ajaxUrlName: "email"}, {ele: ".lname",datatype: "*2-15",nullmsg: "请输入昵称",errormsg: "长度2-15个字符",ajaxurl: "/login/check_unique_nickname",ajaxUrlName: "nickname"}, {ele: ".loction",datatype: "*",nullmsg: "请输入选择地区",errormsg: "请选择正确的地区"}, {ele: ".subjectInput",datatype: "*",nullmsg: "请选择年级",errormsg: "选择年级错误"}, {ele: ".pUname",ignore: "ignore",datatype: "*",nullmsg: "请输入真实姓名",errormsg: "长度4-25个字符",ajaxurl: "/login/check_realname_length",ajaxUrlName: "realname"}, {ele: ".sex",ignore: "ignore",datatype: "*",nullmsg: "请选择性别",errormsg: "请选择性别"}, {ele: ".schoolInput",ignore: "ignore",datatype: "*",nullmsg: "请输入就读学校名称",errormsg: "学校名称有误"}]), _Form.config({url: "/register/submit_personal_info",ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}}), require("module/login/validFocus")
    }, exports.phoneFindPW = function() {
        var _Form = $(".phoneFindPW").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                return require("module/login/resetPwd").sendValidateCode()
            },callback: function() {
                alert("提交成功")
            }});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".inputPhone",datatype: "m",nullmsg: "请输入手机号码",errormsg: "请输入正确的手机号码"}, {ele: ".inputPhoneCode",datatype: "/^\\d{4}$/",datatype_allownull: "/^\\d{4}$/ | /^\\w{0}$/",nullmsg: "请输入验证码",errormsg: "验证码长度是4位"}])
    }, exports.EmailFindPW = function() {
        var _Form = $(".EmailFindPW").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
            },callback: function(data) {
                $.dialog({content: data.info,icon: null})
            }});
        _Form.config({showAllError: !0,url: "/login/send_reset_email"}), _Form.tipmsg.r = " ", _Form.addRule([{ele: ".inputEmail",datatype: "e",nullmsg: "请输入邮箱",errormsg: "邮箱格式不正确",ajaxurl: "/login/check_user_email",ajaxUrlName: "email"}]), _Form.config({url: "/login/send_reset_email",ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}})
    }, exports.regAfterForm = function() {
        checkAttent(".regAfterForm");
        var _Form = $(".regAfterForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
            },callback: function() {
                alert("提交成功")
            },usePlugin: {jqtransform: {selector: "select,:checkbox,:radio,.decorate"}}});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".lEmail",datatype: "e",nullmsg: "请输入邮箱地址",errormsg: "请输入正确的邮箱地址"}, {ele: ".lname",datatype: "*2-15",nullmsg: "请输入昵称",errormsg: "长度2-15个字符"}, {ele: ".loction",datatype: "*",nullmsg: "请输入选择地区",errormsg: "请选择正确的地区"}, {ele: ".subjectInput",datatype: "*",nullmsg: "请选择年级",errormsg: "选择年级错误"}, {ele: ".pUname",ignore: "ignore",datatype: "*2-15",nullmsg: "请输入真实姓名",errormsg: "长度2-15个字符"}, {ele: ".sex",ignore: "ignore",datatype: "*",nullmsg: "请选择性别",errormsg: "请选择性别"}, {ele: ".schoolInput",ignore: "ignore",datatype: "*",nullmsg: "请输入就读学校名称",errormsg: "学校名称有误"}]), require("module/login/validFocus")
    }, exports.setPWForm = function() {
        var _Form = $(".setPWForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                require("lib/cryptoJs/3.1.2/sha1");
                var hash_set = CryptoJS.SHA1($(".setPassword").val());
                $("input[name='encrypt_set_password']").val(hash_set.toString()), $(".setPassword").attr("disabled", !0);
                var hash_reset = CryptoJS.SHA1($(".reSetPassword").val());
                $("input[name='encrypt_reset_password']").val(hash_reset.toString()), $(".reSetPassword").attr("disabled", !0)
            },callback: function(data) {
                "ok" == data.status ? window.location = data.url : $.dialog({content: data.info,icon: null,ok: function() {
                        window.location = student_url
                    }})
            }});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".setPassword",datatype: "*6-20",nullmsg: "新密码不能为空",errormsg: "长度6-16个字符之间"}, {ele: ".reSetPassword",datatype: "*6-20",recheck: "set_password",nullmsg: "请再次输入密码",errormsg: "两次密码不一致！"}]), _Form.config({ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}})
    }
}), define("module/common/method/send", ["module/common/method/countDown"], function(require, exports) {
    exports.sendPhoneNum = function(otype) {
        $(".sendPhoneCode").click(function() {
            var _this = $(this);
            _this.attr("disabled", !0);
            var _phoneNumber = $(this).parent().siblings().find(".phoneNum").val(), _regMobile = /^0?1[3|4|5|7|8][0-9]\d{8}$/, _testResult = _regMobile.test(_phoneNumber);
            _testResult ? $.ajax({url: "/register/check_phones/",type: "post",data: {phone: _phoneNumber},dataType: "json",success: function(result) {
                    "error" == result.status ? $.dialog({content: result.info,icon: null}) : $.ajax({url: "register/send_captcha",type: "POST",dataType: "json",data: {phone: _phoneNumber,type: otype},success: function(json) {
                            "ok" == json.status && $.dialog({content: json.msg,icon: "succeed"}), require("module/common/method/countDown").countDown(_this)
                        }})
                }}) : $.dialog({content: "手机号码输入有误，请重新输入。"})
        })
    }
}), define("module/login/validFocus", [], function() {
    var getInfoObj = function() {
        return $(this).parent().find(".Validform_tip_info")
    };
    $("[datatype]").focusin(function() {
        this.timeout && clearTimeout(this.timeout);
        var infoObj = getInfoObj.call(this);
        0 == infoObj.siblings(".Validform_right").length && infoObj.show().next().hide()
    }).focusout(function() {
        var infoObj = getInfoObj.call(this);
        this.timeout = setTimeout(function() {
            infoObj.hide().next(".Validform_wrong,.Validform_right,.Validform_loading").show()
        }, 0)
    })
}), define("module/login/resetPwd", ["lib/artDialog/4.1.7/artDialog", "module/common/method/countDown"], function(require, exports) {
    require("lib/artDialog/4.1.7/artDialog"), exports.sendValidateCode = function() {
        $(".code").click(function() {
            var _this = $(this);
            _this.attr("disabled", !0);
            var phone = $("input[name='phone_number']").val();
            return phone ? /^1[3|5|7|8]\d{9}$/.test(phone) ? ($.ajax({url: student_url + "login/send_reset_captcha",type: "post",data: {phone: phone,type: 3},dataType: "json",success: function(result) {
                    "error" == result.status ? $.tiziDialog({content: result.msg,icon: null}) : require("module/common/method/countDown").countDown(_this)
                }}), void 0) : ($.tiziDialog({content: "请输入正确的手机号",icon: null}), fasle) : ($.tiziDialog({content: "请填写手机号",icon: null}), !1)
        })
    }, exports.checkVerifyCode = function() {
        var phone = $("input[name='phone_number']").val(), code = $("input[name='code']").val();
        $.ajax({url: "/register/check_captcha",type: "post",dataType: "json",data: {phone: phone,verify_code: code,code_type: 3},success: function(result) {
                return result.effective ? ($(".phoneFindPW").submit(), void 0) : ($.tiziDialog({content: "验证码无效或已过期",icon: null}), !1)
            }})
    }, exports.setPwdSuccessJump = function() {
        var seconds = $(".tips span").text();
        seconds -= 1, 0 == seconds && (window.location = "/login"), $(".tips span").text(seconds), setTimeout(exports.setPwdSuccessJump, 1e3)
    }, exports.scrollUpAndDown = function() {
        function roll() {
            ind++, ind > $(".rollUpDown li").length && ($(".rollBox").css("top", 0), ind = 1), $(".rollBox").animate({top: -ind * $(".rollUpDown li").eq(0).outerHeight(!0)}, 300)
        }
        var ind = 0;
        $(".rollUpDownCopy").html($(".rollUpDown").html()), roll();
        setInterval(roll, 2e3)
    }
});

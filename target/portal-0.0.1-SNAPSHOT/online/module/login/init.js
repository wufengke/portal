define("module/login/init", ["module/lib/select", "module/login/tab", "module/login/valid", "naHaoDialog", "validForm", "cryptoJs", "module/common/method/send", "module/login/validFocus", "module/login/resetPwd", "module/common/method/setSchool", "module/common/method/countDown", "module/studentMyCourse/area"], function(require) {
    require("module/lib/select"), require("module/login/tab").tab();
    var _valid = require("module/login/valid");
    // _valid.loginForm(), 
    require("module/common/method/setSchool"), 
    //$(".regPhoneBox").length > 0 && _valid.regPhoneBoxForm(), 
    //$(".regEmailBox").length > 0 && _valid.regEmailBoxForm(), 
    $(".regSuccessBox").length > 0 && $("input[type=radio]").jqTransRadio();
    var _resetPwd = require("module/login/resetPwd");
    //_valid.loginAfterForm(), _valid.EmailFindPW(), _valid.regAfterForm(), _valid.setPWForm(), 
    $(".code").length > 0 && _resetPwd.sendValidateCode(), 
    $("#findSubmit").length > 0 && $("#findSubmit").click(function() {
        _resetPwd.checkVerifyCode()
    }), 
    $(".setSuccess").length > 0 && setTimeout(_resetPwd.setPwdSuccessJump, 1e3), 
    $("#province").length > 0 && require("module/studentMyCourse/area").change_area(), _resetPwd.scrollUpAndDown()
}), 
define("module/lib/select", [], function() {
    !function($) {
        var defaultOptions = {preloadImg: !0}, jqTransformGetLabel = function(objfield) {
            var selfForm = $(objfield.get(0).form), oLabel = objfield.next();
            if (!oLabel.is("label") && (oLabel = objfield.prev(), oLabel.is("label"))) {
                var inputname = objfield.attr("id");
                inputname && (oLabel = selfForm.find('label[for="' + inputname + '"]'))
            }
            return oLabel.is("label") ? oLabel.css("cursor", "pointer") : !1
        }, jqTransformHideSelect = function(oTarget) {
            var ulVisible = $(".jqTransformSelectWrapper ul:visible");
            ulVisible.each(function() {
                var oSelect = $(this).parents(".jqTransformSelectWrapper:first").find("select").get(0);
                oTarget && oSelect.oLabel && oSelect.oLabel.get(0) == oTarget.get(0) || $(this).hide()
            })
        }, jqTransformCheckExternalClick = function(event) {
            0 === $(event.target).parents(".jqTransformSelectWrapper").length && jqTransformHideSelect($(event.target))
        }, jqTransformAddDocumentListener = function() {
            $(document).mousedown(jqTransformCheckExternalClick)
        }, jqTransformReset = function(f) {
            var sel;
            $(".jqTransformSelectWrapper select", f).each(function() {
                sel = this.selectedIndex < 0 ? 0 : this.selectedIndex, $("ul", $(this).parent()).each(function() {
                    $("a:eq(" + sel + ")", this).click()
                })
            }), $("a.jqTransformCheckbox, a.jqTransformRadio", f).removeClass("jqTransformChecked"), $("input:checkbox, input:radio", f).each(function() {
                this.checked && $("a", $(this).parent()).addClass("jqTransformChecked")
            })
        };
        $.fn.jqTransInputButton = function() {
            return this.each(function() {
                var newBtn = $('<button id="' + this.id + '" name="' + this.name + '" type="' + this.type + '" class="' + this.className + ' jqTransformButton"><span><span>' + $(this).attr("value") + "</span></span>").hover(function() {
                    newBtn.addClass("jqTransformButton_hover")
                }, function() {
                    newBtn.removeClass("jqTransformButton_hover")
                }).mousedown(function() {
                    newBtn.addClass("jqTransformButton_click")
                }).mouseup(function() {
                    newBtn.removeClass("jqTransformButton_click")
                });
                $(this).replaceWith(newBtn)
            })
        }, $.fn.jqTransInputText = function() {
            return this.each(function() {
                var $input = $(this);
                if (!$input.hasClass("jqtranformdone") && $input.is("input")) {
                    $input.addClass("jqtranformdone");
                    var oLabel = jqTransformGetLabel($(this));
                    oLabel && oLabel.bind("click", function() {
                        $input.focus()
                    });
                    var inputSize = $input.width();
                    $input.attr("size") && (inputSize = 10 * $input.attr("size"), $input.css("width", inputSize)), $input.addClass("jqTransformInput").wrap('<div class="jqTransformInputWrapper"><div class="jqTransformInputInner"><div></div></div></div>');
                    var $wrapper = $input.parent().parent().parent();
                    $wrapper.css("width", inputSize + 10), $input.focus(function() {
                        $wrapper.addClass("jqTransformInputWrapper_focus")
                    }).blur(function() {
                        $wrapper.removeClass("jqTransformInputWrapper_focus")
                    }).hover(function() {
                        $wrapper.addClass("jqTransformInputWrapper_hover")
                    }, function() {
                        $wrapper.removeClass("jqTransformInputWrapper_hover")
                    }), $.browser.safari && $wrapper.addClass("jqTransformSafari"), $.browser.safari && $input.css("width", $wrapper.width() + 16), this.wrapper = $wrapper
                }
            })
        }, $.fn.jqTransCheckBox = function() {
            return this.each(function() {
                if (!$(this).hasClass("jqTransformHidden")) {
                    var $input = $(this), oLabel = jqTransformGetLabel($input);
                    oLabel && oLabel.click(function() {
                        aLink.trigger("click")
                    });
                    var aLink = $('<a href="#" class="jqTransformCheckbox"></a>');
                    $input.addClass("jqTransformHidden").wrap('<span class="jqTransformCheckboxWrapper"></span>').parent().prepend(aLink), $input.change(function() {
                        return this.checked && aLink.addClass("jqTransformChecked") || aLink.removeClass("jqTransformChecked"), !0
                    }), aLink.click(function() {
                        return $input.attr("disabled") ? !1 : ($input.trigger("click").trigger("change"), !1)
                    }), this.checked && aLink.addClass("jqTransformChecked")
                }
            })
        }, $.fn.jqTransRadio = function() {
            return this.each(function() {
                if (!$(this).hasClass("jqTransformHidden")) {
                    var $input = $(this), inputSelf = this;
                    oLabel = jqTransformGetLabel($input), oLabel && oLabel.click(function() {
                        aLink.trigger("click")
                    });
                    var aLink = $('<a href="#" class="jqTransformRadio" rel="' + this.name + '"></a>');
                    $input.addClass("jqTransformHidden").wrap('<span class="jqTransformRadioWrapper"></span>').parent().prepend(aLink), $input.change(function() {
                        return inputSelf.checked && aLink.addClass("jqTransformChecked") || aLink.removeClass("jqTransformChecked"), !0
                    }), aLink.click(function() {
                        return $input.attr("disabled") ? !1 : ($input.trigger("click").trigger("change"), $('input[name="' + $input.attr("name") + '"]', inputSelf.form).not($input).each(function() {
                            "radio" == $(this).attr("type") && $(this).trigger("change")
                        }), !1)
                    }), inputSelf.checked && aLink.addClass("jqTransformChecked")
                }
            })
        }, $.fn.jqTransTextarea = function() {
            return this.each(function() {
                var textarea = $(this);
                if (!textarea.hasClass("jqtransformdone")) {
                    textarea.addClass("jqtransformdone"), oLabel = jqTransformGetLabel(textarea), oLabel && oLabel.click(function() {
                        textarea.focus()
                    });
                    var strTable = '<table cellspacing="0" cellpadding="0" border="0" class="jqTransformTextarea">';
                    strTable += '<tr><td id="jqTransformTextarea-tl"></td><td id="jqTransformTextarea-tm"></td><td id="jqTransformTextarea-tr"></td></tr>', strTable += '<tr><td id="jqTransformTextarea-ml">&nbsp;</td><td id="jqTransformTextarea-mm"><div></div></td><td id="jqTransformTextarea-mr">&nbsp;</td></tr>', strTable += '<tr><td id="jqTransformTextarea-bl"></td><td id="jqTransformTextarea-bm"></td><td id="jqTransformTextarea-br"></td></tr>', strTable += "</table>";
                    var oTable = $(strTable).insertAfter(textarea).hover(function() {
                        !oTable.hasClass("jqTransformTextarea-focus") && oTable.addClass("jqTransformTextarea-hover")
                    }, function() {
                        oTable.removeClass("jqTransformTextarea-hover")
                    });
                    textarea.focus(function() {
                        oTable.removeClass("jqTransformTextarea-hover").addClass("jqTransformTextarea-focus")
                    }).blur(function() {
                        oTable.removeClass("jqTransformTextarea-focus")
                    }).appendTo($("#jqTransformTextarea-mm div", oTable)), this.oTable = oTable, $.browser.safari && $("#jqTransformTextarea-mm", oTable).addClass("jqTransformSafariTextarea").find("div").css("height", textarea.height()).css("width", textarea.width())
                }
            })
        }, $.fn.jqTransSelect = function() {
            return this.each(function(index) {
                var $select = $(this);
                if (!$select.hasClass("jqTransformHidden") && !$select.attr("multiple")) {
                    var oLabel = jqTransformGetLabel($select), $wrapper = $select.addClass("jqTransformHidden").wrap('<div class="jqTransformSelectWrapper"></div>').parent().css({zIndex: 10 - index});
                    $wrapper.prepend('<div><span></span><a href="#" class="jqTransformSelectOpen"></a></div><ul></ul>');
                    var $ul = $("ul", $wrapper).css("width", $select.width()).hide();
                    $("option", this).each(function(i) {
                        var oLi = $('<li><a href="#" index="' + i + '">' + $(this).html() + "</a></li>");
                        $ul.append(oLi)
                    }), $ul.find("a").click(function() {
                        return $("a.selected", $wrapper).removeClass("selected"), $(this).addClass("selected"), $select[0].selectedIndex != $(this).attr("index") && $select[0].onchange && ($select[0].selectedIndex = $(this).attr("index"), $select[0].onchange()), $select[0].selectedIndex = $(this).attr("index"), $("span:eq(0)", $wrapper).html($(this).html()), $ul.hide(), !1
                    }), $("a:eq(" + this.selectedIndex + ")", $ul).click(), $("span:first", $wrapper).click(function() {
                        $("a.jqTransformSelectOpen", $wrapper).trigger("click")
                    }), oLabel && oLabel.click(function() {
                        $("a.jqTransformSelectOpen", $wrapper).trigger("click")
                    }), this.oLabel = oLabel;
                    var oLinkOpen = $("a.jqTransformSelectOpen", $wrapper).click(function() {
                        return "none" == $ul.css("display") && jqTransformHideSelect(), $select.attr("disabled") ? !1 : ($ul.slideToggle("fast", function() {
                            var offSet = $("a.selected", $ul).offset().top - $ul.offset().top;
                            $ul.animate({scrollTop: offSet})
                        }), !1)
                    }), iSelectWidth = $select.outerWidth(), oSpan = $("span:first", $wrapper), newWidth = iSelectWidth > oSpan.innerWidth() ? iSelectWidth + oLinkOpen.outerWidth() : $wrapper.width();
                    $wrapper.css("width", newWidth), $ul.css("width", newWidth - 2), oSpan.css({width: iSelectWidth}), $ul.css({display: "block",visibility: "hidden"});
                    var iSelectHeight = $("li", $ul).length * $("li:first", $ul).height();
                    iSelectHeight < $ul.height() && $ul.css({height: iSelectHeight,overflow: "hidden"}), $ul.css({display: "none",visibility: "visible"})
                }
            })
        }, $.fn.jqTransform = function(options) {
            $.extend({}, defaultOptions, options);
            return this.each(function() {
                var selfForm = $(this);
                selfForm.hasClass("jqtransformdone") || (selfForm.addClass("jqtransformdone"), $('input:submit, input:reset, input[type="button"]', this).jqTransInputButton(), $("input:text, input:password", this).jqTransInputText(), $("input:checkbox", this).jqTransCheckBox(), $("input:radio", this).jqTransRadio(), $("textarea", this).jqTransTextarea(), $("select", this).jqTransSelect().length > 0 && jqTransformAddDocumentListener(), selfForm.bind("reset", function() {
                    var action = function() {
                        jqTransformReset(this)
                    };
                    window.setTimeout(action, 10)
                }))
            })
        }
    }(jQuery)
}), 
define("module/login/tab", [], function(require, exports) {
    exports.tab = function() {
        $(".tabBox a").click(function() {
            var _index = $(this).index();
            $(this).addClass("active").siblings("a").removeClass("active"), $(".contentBox .box").eq(_index).show().siblings(".box").hide(), seajs.use("module/login/validFocus"), $(".box:eq(" + _index + ") form input").eq(0).focus()
        })
    }
}), 
define("module/login/valid", ["lib/artDialog/4.1.7/artDialog", "lib/Validform/5.3.2/Validform", "lib/cryptoJs/3.1.2/sha1", "module/common/method/send", "module/common/method/countDown", "module/login/validFocus", "module/login/resetPwd", "naHaoDialog"], function(require, exports) {
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
    /**
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
    }, 
    exports.regEmailBoxForm = function() {
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
    }, 
    exports.loginForm = function() {
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
    }, 
    exports.loginAfterForm = function() {
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
    }, 
    exports.phoneFindPW = function() {
        var _Form = $(".phoneFindPW").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                return require("module/login/resetPwd").sendValidateCode()
            },callback: function() {
                alert("提交成功")
            }});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".inputPhone",datatype: "m",nullmsg: "请输入手机号码",errormsg: "请输入正确的手机号码"}, {ele: ".inputPhoneCode",datatype: "/^\\d{4}$/",datatype_allownull: "/^\\d{4}$/ | /^\\w{0}$/",nullmsg: "请输入验证码",errormsg: "验证码长度是4位"}])
    }, 
    exports.EmailFindPW = function() {
        var _Form = $(".EmailFindPW").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
            },callback: function(data) {
                $.dialog({content: data.info,icon: null})
            }});
        _Form.config({showAllError: !0,url: "/login/send_reset_email"}), _Form.tipmsg.r = " ", _Form.addRule([{ele: ".inputEmail",datatype: "e",nullmsg: "请输入邮箱",errormsg: "邮箱格式不正确",ajaxurl: "/login/check_user_email",ajaxUrlName: "email"}]), _Form.config({url: "/login/send_reset_email",ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}})
    }, 
    exports.regAfterForm = function() {
        checkAttent(".regAfterForm");
        var _Form = $(".regAfterForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
            },callback: function() {
                alert("提交成功")
            },usePlugin: {jqtransform: {selector: "select,:checkbox,:radio,.decorate"}}});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".lEmail",datatype: "e",nullmsg: "请输入邮箱地址",errormsg: "请输入正确的邮箱地址"}, {ele: ".lname",datatype: "*2-15",nullmsg: "请输入昵称",errormsg: "长度2-15个字符"}, {ele: ".loction",datatype: "*",nullmsg: "请输入选择地区",errormsg: "请选择正确的地区"}, {ele: ".subjectInput",datatype: "*",nullmsg: "请选择年级",errormsg: "选择年级错误"}, {ele: ".pUname",ignore: "ignore",datatype: "*2-15",nullmsg: "请输入真实姓名",errormsg: "长度2-15个字符"}, {ele: ".sex",ignore: "ignore",datatype: "*",nullmsg: "请选择性别",errormsg: "请选择性别"}, {ele: ".schoolInput",ignore: "ignore",datatype: "*",nullmsg: "请输入就读学校名称",errormsg: "学校名称有误"}]), require("module/login/validFocus")
    }, 
    exports.setPWForm = function() {
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
    **/
}), 
define("module/common/method/send", ["module/common/method/countDown"], function(require, exports) {
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
}), 
define("module/login/validFocus", [], function() {
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
}), 
define("module/login/resetPwd", ["lib/artDialog/4.1.7/artDialog", "module/common/method/countDown"], function(require, exports) {
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
}), 
define("module/common/method/setSchool", ["lib/artDialog/4.1.7/artDialog", "lib/Validform/5.3.2/Validform"], function(require, exports) {
    $(".resetSchool").live("click", function() {
        var _this = $(this);
        $.ajax({url: siteUrl + "school?id=1",type: "GET",dataType: "json",success: function(json) {
                for (var listr = "", i = 0; i < json.length; ++i)
                    listr += '<li data-id="' + json[i].id + '" ismunicipality="' + json[i].ismunicipality + '">' + json[i].name + "</li>";
                if ($(".resetSchoolPopCon .province").html(listr), $(".resetSchoolPopCon .province").fadeIn(), "1" == _this.attr("set")) {
                    var _province = _this.attr("province"), _city = _this.attr("city"), _county = _this.attr("county");
                    exports.normalData({province: _province,city: _city,county: _county})
                }
            }}), require("lib/artDialog/4.1.7/artDialog"), $.dialog({id: "setSchollID",title: "选择学校",top: 100,content: $("#resetSchoolPop").html().replace("resetSchoolPopCon_beta", "resetSchoolPopCon"),icon: null,width: 800,ok: function() {
                $(".theGenusScholl_n").addClass("undis"), $(".theGenusScholl_y").removeClass("undis");
                var school_id = ($("#class_id").val(), $(".aui_content .school li.active").attr("data-id")), province = $(".resetSchoolPopCon .schoolProvice li.active").html(), city = $(".resetSchoolPopCon .schoolCity li.active").html(), county = $(".resetSchoolPopCon .schoolCounty li.active").html(), province_id = $(".resetSchoolPopCon .province li.active").attr("data-id"), city_id = $(".resetSchoolPopCon .city li.active").attr("data-id"), county_id = $(".resetSchoolPopCon .schoolCounty li.active").attr("data-id"), sctype_id = $(".resetSchoolPopCon .schoolGrade li.active").attr("data-id"), schoolname = $(".resetSchoolPopCon .schoolName li.active").html(), seacherResultname = $(".resetSchoolPopCon .schoolInfo .seacherResult li.active").html(), searcherResultid = $(".schoolInfo .seacherResult li.active").attr("data-id"), writeSchoolName = $(".resetSchoolPopCon .writeSchoolName").val();
                if ("undefined" == typeof province && (province = ""), "undefined" == typeof city && (city = ""), "undefined" == typeof county && (county = ""), "undefined" == typeof writeSchoolName && (writeSchoolName = ""), "undefined" == typeof seacherResultname && (seacherResultname = ""), "undefined" == typeof schoolname && (schoolname = ""), "undefined" == typeof city && (city = ""), "" == schoolname && "" == seacherResultname && "" == writeSchoolName)
                    return this.close(), !1;
                var fullname = province + city + county + schoolname + seacherResultname + writeSchoolName;
                searcherResultid && (school_id = searcherResultid), _this.hasClass("resetSchool") ? ($(".theGenusScholl_n").add("undis"), $(".schoolFullName").val(fullname), $(".resetSchool").text("重设学校"), $("#schoolVal").val(school_id)) : ($("#schoolVal").val(school_id), $(".schoolFullName").val(fullname), $(".resetSchool").text("重设学校"), $("#schoolVal").val() > 0 && $(".schoolBox").find(".ValidformInfo,.Validform_checktip").hide()), $("#province_id").val(province_id), $("#city_id").val(city_id), $("#schoolname").val(writeSchoolName), $("#area_county_id").val(county_id), $("#school_type").val(sctype_id)
            },cancel: !0,close: function() {
                $(".resetSchoolPopCon .city,.resetSchoolPopCon .county,.resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide()
            }}), exports.showSchool(), exports.noMyScholl(), exports.seacherSchoolValid(), exports.seacheSchoolResult()
    }), exports.seacheSchoolResult = function() {
        $("span.reset").click(function() {
            $(".schoolNames").val(""), $(".seacherResult").hide(), $(".school").fadeIn(), $("span.reset").addClass("undis")
        })
    }, exports.seacherSchoolValid = function() {
        require("lib/Validform/5.3.2/Validform");
        var _Form = $(".seacherSchoolForm").Validform({tiptype: function(msg, o) {
                if (!o.obj.is("form")) {
                    var objtip = o.obj.next().find(".Validform_checktip");
                    objtip.text(msg), o.obj.next().show();
                    var objtip = o.obj.next().find(".Validform_checktip");
                    objtip.text(msg);
                    var infoObj = o.obj.next(".ValidformTips");
                    2 == o.type && (infoObj.show(), o.obj.next().hide())
                }
            },showAllError: !1,ajaxPost: !0,callback: function() {
                var words = $(".schoolNames").val();
                "" != $.trim(words) ? /.*[\u4e00-\u9fa5]+.*$/.test(words) ? $.ajax({url: siteUrl + "school/convert?chinese=" + encodeURIComponent(words),type: "GET",dataType: "json",success: function(json) {
                        words = json.py, exports.query(words)
                    }}) : exports.query(words) : exports.buildSchool(), $(".school").hide(), $(".seacherResult").fadeIn(), $("span.reset").removeClass("undis").show()
            }});
        _Form.addRule([{ele: ".schoolNames",datatype: "*",nullmsg: "请输入学校名称",errormsg: "学校名称输入错误"}])
    }, exports.query = function(words) {
        var _li = "";
        $.each(school_array, function(k, v) {
            $.each(v, function(k2, v2) {
                "undefined" != typeof words && "" != $.trim(words) && (-1 != v2.schoolname.indexOf(words) || -1 != v2.py.indexOf(words) || -1 != v2.first_py.indexOf(words)) && (_li += '<li data-id="' + v2.id + '">' + v2.schoolname + "</li>")
            })
        }), "" == _li && (_li = "没有找到相关学校，请重新输入关键词。"), $(".seacherResult ul").html(_li)
    }, exports.buildSchool = function(query) {
        $(".resetSchoolPopCon .schoolInfo").fadeIn();
        var listr = "";
        $.each(school_array, function(k, v) {
            var total = 0, asort = "<dl class='cf'><dt class='fl'>" + k.toUpperCase() + "</dt><dd class='fr'><ul>";
            $.each(v, function(k2, v2) {
                "undefined" != typeof query && "" != $.trim(query) ? (-1 != v2.schoolname.indexOf(query) || -1 != v2.py.indexOf(query) || -1 != v2.first_py.indexOf(query)) && (listr += '<li data-id="' + v2.id + '" title="' + v2.schoolname + '">' + v2.schoolname + "</li>") : (asort += '<li data-id="' + v2.id + '" title="' + v2.schoolname + '">' + v2.schoolname + "</li>", total++)
            }), asort += "</ul></dd></dl>", total > 0 && (listr += asort)
        }), "undefined" != typeof query && "" != $.trim(query) ? $(".school").html("<dl>" + listr + "</dl>") : $(".school").html(listr), $(".school").css("display", "block")
    }, exports.showSchool = function() {
        $(".resetSchoolPopCon .province li").live("click", function() {
            $(".resetSchoolPopCon .schoolNames").focus(function() {
                return !1
            }), $(".seacherResult").hide(), $("span.reset").addClass("undis"), $(".resetSchoolPopCon .seacherSchoolForm").Validform().resetForm(), $(".ValidformInfo").hide();
            $(this);
            $(".resetSchoolPopCon .sctype").hide();
            var _cityName = 2 == $(this).attr("data-id") || 25 == $(this).attr("data-id") || 27 == $(this).attr("data-id") || 32 == $(this).attr("data-id") || 33 == $(this).attr("data-id") || 34 == $(this).attr("data-id") || 35 == $(this).attr("data-id");
            if (_cityName ? $(".resetSchoolPopCon .city,.resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide() : $(".resetSchoolPopCon .county,.resetSchoolPopCon .schoolInfo").hide(), "active" !== $(this).attr("class")) {
                var id = $(this).attr("data-id"), ismunicipality = $(this).attr("ismunicipality");
                $.ajax({url: siteUrl + "school?id=" + id,type: "GET",dataType: "json",success: function(json) {
                        for (var listr = "", i = 0; i < json.length; ++i)
                            listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                        if (1 == ismunicipality) {
                            $(".resetSchoolPopCon .county").html(listr).fadeIn(), $(".resetSchoolPopCon .county li").first().addClass("active");
                            var _this = $(".resetSchoolPopCon .county li.active");
                            $(".resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide(), $.ajax({url: siteUrl + "school/type",type: "GET",dataType: "json",success: function(json) {
                                    for (var listr = "", i = 0; i < json.length; ++i)
                                        listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                                    $(".resetSchoolPopCon .sctype").html(listr).fadeIn(), $(".resetSchoolPopCon .sctype li").first().addClass("active");
                                    var sctype = 1, county_id = $(".resetSchoolPopCon .county li").first().attr("data-id");
                                    $.ajax({url: siteUrl + "school/get_school",type: "GET",dataType: "json",data: {id: county_id,sctype: sctype},success: function(json) {
                                            school_array = json, exports.buildSchool()
                                        }})
                                }})
                        } else {
                            $(".resetSchoolPopCon .city").html(listr).fadeIn(), $(".resetSchoolPopCon .city li").first().addClass("active");
                            var _this = $(".resetSchoolPopCon .city li.active");
                            $(".resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide();
                            var id = _this.attr("data-id");
                            $.ajax({url: siteUrl + "school?id=" + id,type: "GET",dataType: "json",success: function(json) {
                                    for (var listr = "", i = 0; i < json.length; ++i)
                                        listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                                    $(".resetSchoolPopCon .county").html(listr).show(), $(".resetSchoolPopCon .county li").first().addClass("active");
                                    $(".resetSchoolPopCon .county li.active");
                                    $(".resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide(), $.ajax({url: siteUrl + "school/type",type: "GET",dataType: "json",success: function(json) {
                                            for (var listr = "", i = 0; i < json.length; ++i)
                                                listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                                            $(".resetSchoolPopCon .sctype").html(listr).fadeIn(), $(".resetSchoolPopCon .sctype li").first().addClass("active");
                                            var sctype = 1, county_id = $(".resetSchoolPopCon .county li").first().attr("data-id");
                                            $.ajax({url: siteUrl + "school/get_school",type: "GET",dataType: "json",data: {id: county_id,sctype: sctype},success: function(json) {
                                                    school_array = json, exports.buildSchool(), exports.seacherSchoolValid()
                                                }})
                                        }})
                                }})
                        }
                    }})
            }
        }), $(".resetSchoolPopCon .city li").live("click", function() {
            if ($(".resetSchoolPopCon .schoolNames").focus(function() {
                return !1
            }), $(".seacherResult").hide(), $("span.reset").addClass("undis"), $(".resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide(), $(".resetSchoolPopCon .seacherSchoolForm").Validform().resetForm(), $(".ValidformInfo").hide(), "active" !== $(this).attr("class")) {
                var id = $(this).attr("data-id");
                $.ajax({url: siteUrl + "school?id=" + id,type: "GET",dataType: "json",success: function(json) {
                        for (var listr = "", i = 0; i < json.length; ++i)
                            listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                        $(".resetSchoolPopCon .county").html(listr).show(), $(".resetSchoolPopCon .county li").first().addClass("active");
                        $(".resetSchoolPopCon .county li.active");
                        $(".resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide(), $.ajax({url: siteUrl + "school/type",type: "GET",dataType: "json",success: function(json) {
                                for (var listr = "", i = 0; i < json.length; ++i)
                                    listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                                $(".resetSchoolPopCon .sctype").html(listr).fadeIn(), $(".resetSchoolPopCon .sctype li").first().addClass("active");
                                var sctype = 1, county_id = $(".resetSchoolPopCon .county li").first().attr("data-id");
                                $.ajax({url: siteUrl + "school/get_school",type: "GET",dataType: "json",data: {id: county_id,sctype: sctype},success: function(json) {
                                        school_array = json, exports.buildSchool(), exports.seacherSchoolValid()
                                    }})
                            }})
                    }})
            }
        }), $(".resetSchoolPopCon .county li").live("click", function() {
            $(".resetSchoolPopCon .schoolNames").focus(function() {
                return !1
            }), _this = $(this), $(".seacherResult").hide(), $("span.reset").addClass("undis"), $(".resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide(), $(".resetSchoolPopCon .seacherSchoolForm").Validform().resetForm(), $(".ValidformInfo").hide(), $.ajax({url: siteUrl + "school/type",type: "GET",dataType: "json",success: function(json) {
                    for (var listr = "", i = 0; i < json.length; ++i)
                        listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                    $(".resetSchoolPopCon .sctype").html(listr).fadeIn(), $(".resetSchoolPopCon .sctype li").first().addClass("active");
                    var sctype = 1, county_id = _this.attr("data-id");
                    $.ajax({url: siteUrl + "school/get_school",type: "GET",dataType: "json",data: {id: county_id,sctype: sctype},success: function(json) {
                            school_array = json, exports.buildSchool()
                        }})
                }})
        }), $(".resetSchoolPopCon .sctype li").live("click", function() {
            if ($(".resetSchoolPopCon .schoolNames").focus(function() {
                return !1
            }), $(".seacherResult").hide(), $("span.reset").addClass("undis"), $(".resetSchoolPopCon .seacherSchoolForm").Validform().resetForm(), $(".ValidformInfo").hide(), $(".resetSchoolPopCon .schoolInfo,.resetSchoolPopCon .schoolInfo .hd").show(), $(".resetSchoolPopCon .schoolNames").val(""), $(".resetSchoolPopCon .schoolInfo .seacherResult,.resetSchoolPopCon .schoolInfo .reset,.resetSchoolPopCon .schoolInfo .bd").hide(), "active" !== $(this).attr("class")) {
                var sctype = $(this).attr("data-id"), county_id = $(".aui_content .county li.active").attr("data-id");
                $.ajax({url: siteUrl + "school/get_school",type: "GET",dataType: "json",data: {id: county_id,sctype: sctype},success: function(json) {
                        school_array = json, exports.buildSchool()
                    }})
            }
        }), $(".schooLocation li").live("click", function() {
            $(this).addClass("active").siblings().removeClass("active")
        }), $(".school li").live("click", function() {
            $(".seacherResult").hide(), $("span.reset").addClass("undis"), $(".school li").removeClass("active"), $(this).addClass("active")
        }), $(".seacherResult li").live("click", function() {
            $(".seacherResult li").removeClass("active"), $(this).addClass("active")
        })
    }, 
    exports.noMyScholl = function() {
        $(".noMySchollBtn").live("click", function() {
            $(".resetSchoolPopCon .schoolInfo .hd,.resetSchoolPopCon .schoolInfo .seacherResult").hide(), $(".resetSchoolPopCon .school").hide(), $(".resetSchoolPopCon .schoolInfo .bd").fadeIn()
        }), $(".returnSetSchool").live("click", function() {
            $(".resetSchoolPopCon .schoolInfo .bd").hide(), $(".resetSchoolPopCon .schoolInfo .hd").fadeIn(), $(".resetSchoolPopCon .school").fadeIn()
        })
    }, 
    exports.normalData = function(_json) {
        $(".resetSchoolPopCon .province li").each(function() {
            if ($(this).attr("data-id") == _json.province) {
                $(this).addClass("active");
                var _cityName = 2 == $(this).attr("data-id") || 25 == $(this).attr("data-id") || 27 == $(this).attr("data-id") || 32 == $(this).attr("data-id") || 33 == $(this).attr("data-id") || 34 == $(this).attr("data-id") || 35 == $(this).attr("data-id");
                _cityName ? $(".resetSchoolPopCon .city,.resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide() : $(".resetSchoolPopCon .county,.resetSchoolPopCon .schoolInfo").hide();
                var ismunicipality = $(this).attr("ismunicipality");
                $.ajax({url: siteUrl + "school?id=" + _json.province,type: "GET",dataType: "json",success: function(json) {
                        for (var listr = "", i = 0; i < json.length; ++i)
                            listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                        1 == ismunicipality ? ($(".resetSchoolPopCon .county").html(listr).fadeIn(), $(".resetSchoolPopCon .county li").each(function() {
                            $(this).attr("data-id") == _json.county && ($(this).addClass("active"), $(".resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide(), $.ajax({url: siteUrl + "school/type",type: "GET",dataType: "json",success: function(json) {
                                    for (var listr = "", i = 0; i < json.length; ++i)
                                        listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                                    $(".resetSchoolPopCon .sctype").html(listr).fadeIn(), $(".resetSchoolPopCon .sctype li").first().addClass("active");
                                    var sctype = 1, county_id = $(".resetSchoolPopCon .county li").first().attr("data-id");
                                    $.ajax({url: siteUrl + "school/get_school",type: "GET",dataType: "json",data: {id: county_id,sctype: sctype},success: function(json) {
                                            school_array = json, exports.buildSchool(), exports.seacherSchoolValid()
                                        }})
                                }}))
                        })) : ($(".resetSchoolPopCon .city").html(listr), $(".resetSchoolPopCon .city li").each(function() {
                            if ($(this).attr("data-id") == _json.city) {
                                $(this).addClass("active"), $(".resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide();
                                {
                                    $(this).attr("data-id")
                                }
                                $.ajax({url: siteUrl + "school?id=" + _json.city,type: "GET",dataType: "json",success: function(json) {
                                        for (var listr = "", i = 0; i < json.length; ++i)
                                            listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                                        $(".resetSchoolPopCon .county").html(listr).show(), $(".resetSchoolPopCon .county li").each(function() {
                                            $(this).attr("data-id") == _json.county && ($(this).addClass("active"), $(".resetSchoolPopCon .sctype,.resetSchoolPopCon .schoolInfo").hide(), $.ajax({url: siteUrl + "school/type",type: "GET",dataType: "json",success: function(json) {
                                                    for (var listr = "", i = 0; i < json.length; ++i)
                                                        listr += '<li data-id="' + json[i].id + '">' + json[i].name + "</li>";
                                                    $(".resetSchoolPopCon .sctype").html(listr), $(".resetSchoolPopCon .sctype").fadeIn()
                                                }}))
                                        })
                                    }})
                            }
                        }), $(".resetSchoolPopCon .city").fadeIn())
                    }})
            }
        })
    }
}), 
define("module/common/method/countDown", [], function(require, exports) {
    var ind = 60;
    exports.countDown = function(_this) {
        ind = 60;
        var timer = setInterval(function() {
            ind--, 0 > ind ? (clearInterval(timer), _this.removeAttr("disabled").css("background", "#6dcde6"), _this.val("重新获取验证码")) : _this.val(ind + "秒后获取验证码").css("background", "#dedede")
        }, 1e3)
    }
}), 
define("module/studentMyCourse/area", [], function(require, exports) {
    exports.change_area = function() {
        $("#province").change(function() {
        	/**
            $.ajax({type: "post",url: "/member/get_city_list",data: "province=" + $("#province").val(),dataType: "",success: function(msg) {
                    "" == msg && ($("#city").hide(), $("#area").hide()), $("#city").empty();
                    var city = eval(msg);
                    $.each(city, function(index, d) {
                        $("#city").show().append("<option value=" + d.id + ">" + d.name + "</option>")
                    }), $.ajax({type: "post",url: "/member/get_county_list",data: "city=" + $("#city").val(),dataType: "json",success: function(msg) {
                            var area_select = $("#area");
                            if (0 == area_select.length && (area_select = $("<select id='area' name='area' class='area'></select>"), $("#area_div").append(area_select)), "" == msg)
                                $("#area").remove();
                            else {
                                $("#area").empty();
                                var area = eval(msg);
                                $.each(area, function(index, d) {
                                    $("#area").append("<option value=" + d.id + ">" + d.name + "</option>")
                                })
                            }
                        }})
                }})
                **/
        }), $("#city").change(function() {
        	/**
            $.ajax({type: "post",url: "/member/get_county_list",data: "city=" + $("#city").val(),dataType: "json",success: function(msg) {
                    if ("" != msg) {
                        $("#area").empty();
                        var area = eval(msg);
                        $.each(area, function(index, d) {
                            $("#area").append("<option value=" + d.id + ">" + d.name + "</option>")
                        })
                    }
                }})
                **/
        })
    }
});

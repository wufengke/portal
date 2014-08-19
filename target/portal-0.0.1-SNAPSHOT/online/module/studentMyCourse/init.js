define("module/studentMyCourse/init", ["module/lib/select", "module/common/method/tab", "module/studentMyCourse/valid", "naHaoDialog", "validForm", "module/common/method/bankcard", "module/common/method/idCard", "module/login/validFocus", "cryptoJs", "module/studentMyCourse/myCourse", "module/common/method/popUp", "module/classRoom/valid", "module/common/method/countDown", "module/common/method/setSchool", "module/common/method/share", "module/studentMyCourse/area"], function(require) {
    require("module/lib/select"), $("input[type=radio]").jqTransRadio();
    var _tab = require("module/common/method/tab"), _valid = require("module/studentMyCourse/valid"), _myCourse = require("module/studentMyCourse/myCourse");
    require("module/common/method/setSchool"), $("#wrapContent").hasClass("myOrderCon") && (_valid.applyFrom(), _tab.tab($(".tabh li"), "tabhOn", $(".tabCon .tabBox"))), $("#wrapContent").hasClass("myInforCon") && (_tab.tab($(".inforTab .tabh li"), "inforOn", $(".inforTabBox")), _valid.ichangePWForm(), _valid.phoneForm(), _valid.emailForm(), _myCourse.sendValidateCode(), _myCourse.changedHead()), $("#wrapContent").hasClass("myCourseCon") && _myCourse.new_class_skip(), $(".buyAfter").length ? ($(".manInfor").height() > 179 && $(".manInfor").css({"overflow-y": "scroll",height: "179px"}), _tab.tab($(".abuyTabh h3"), "curShow", $(".abuyTabBox")), _myCourse.cNote(), _myCourse.overCourse(), _myCourse.countDown($(".classCDcon"), "stime", 2)) : $(".buyBefore").length ? (_myCourse.timeToggle(), _myCourse.countDown($(".countdown"), "sell_endtime", 1), _myCourse.soon_buy(), _myCourse.soon_buy_xia(), require("module/common/method/share").shareInsertBg()) : (_myCourse.leftNav(), _myCourse.doDelMyOrder(), _myCourse.doCancelMyOrder()), $("#province").length > 0 && require("module/studentMyCourse/area").change_area(), $(".videoPlay").length > 0 && $(".videoPlay").children().children(".container").each(function() {
        var curfile = $(this).attr("title"), curimg = $(this).children("img").attr("src");
        curimg.length > 0 || (curimg = "http://img1.nahao.com/course_description_20140710182330_iVnD5YB?imageView/2/w/600");
        var playlist = [{domain: "",file: curfile,image: curimg}];
        TiZiplayer($(this).attr("id")).setup({playlist: playlist,primary: "flash",height: 405,width: 600})
    })
}), define("module/lib/select", [], function() {
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
}), define("module/common/method/tab", [], function(require, exports) {
    exports.tab = function(clickObj, className, showObj) {
        clickObj.click(function() {
            var index = clickObj.index($(this));
            clickObj.removeClass(className), $(this).addClass(className), showObj.addClass("undis"), showObj.eq(index).removeClass("undis")
        })
    }
}), define("module/studentMyCourse/valid", ["lib/artDialog/4.1.7/artDialog", "lib/Validform/5.3.2/Validform", "module/common/method/bankcard", "module/common/method/idCard", "module/login/validFocus", "lib/cryptoJs/3.1.2/sha1"], function(require, exports) {
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
    exports.applyFrom = function() {
        function cardReg() {
            0 == _card.luhmCheck($(".bankCode").val()) && "" != $(".bankCode").val() && ($(".bankCode").addClass("Validform_error"), $(".bankCode").next(".Validform_checktip").addClass("Validform_wrong").removeClass("Validform_right").html("请输入正确的银行卡账号"))
        }
        function idcardReg() {
            0 == _idcard.idCard($(".IDnum").val()) && "" != $(".IDnum").val() && ($(".IDnum").addClass("Validform_error"), $(".IDnum").next(".Validform_checktip").addClass("Validform_wrong").removeClass("Validform_right").html("请输入正确的身份证号"))
        }
        var _card = require("module/common/method/bankcard"), _idcard = require("module/common/method/idCard"), _Form = $(".applyFrom").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                return cardReg(), idcardReg(), $(".IDnum").hasClass("Validform_error") && !$(".bankCode").hasClass("Validform_error") ? ($.dialog({content: "请输入正确的身份证号",icon: null}), !1) : $(".bankCode").hasClass("Validform_error") && !$(".IDnum").hasClass("Validform_error") ? ($.dialog({content: "请输入正确的银行卡账号",icon: null}), !1) : $(".bankCode").hasClass("Validform_error") && $(".IDnum").hasClass("Validform_error") ? ($.dialog({content: "请输入正确的银行卡账号和身份证号",icon: null}), !1) : void 0
            },callback: function(data) {
                "ok" == data.status ? $.dialog({content: data.msg,icon: null,ok: function() {
                        window.location.href = "/member/my_order/all"
                    }}) : "error" == data.status && $.dialog({content: data.msg,icon: null})
            },usePlugin: {jqtransform: {selector: "select,:checkbox,:radio,.decorate"}}});
        _Form.config({showAllError: !0,url: "/member/save_refund"}), _Form.tipmsg.r = " ", _Form.addRule([{ele: ".courseName",datatype: "*",nullmsg: "课程名称不能为空",errormsg: "请输入正确的课程名称"}, {ele: ".Uname",datatype: "*2-15",nullmsg: "请输入姓名",errormsg: "长度2-15个字符"}, {ele: ".contact",datatype: "m",nullmsg: "请输入联系方式",errormsg: "请输入正确的手机号码"}, {ele: ".reason",datatype: "*",nullmsg: "退课理由不能为空",errormsg: ""}, {ele: ".banks",datatype: "*",nullmsg: "请选择银行",errormsg: ""}, {ele: ".bankInfor",datatype: "*",nullmsg: "请填写具体支行信息",errormsg: "请输入正确的支行信息"}, {ele: ".bankCode",datatype: "*",nullmsg: "请输入银行卡账号",errormsg: "请输入正确的银行卡账号"}, {ele: ".IDnum",datatype: "*",nullmsg: "请输入身份证号",errormsg: "请输入正确的身份证号"}]), $(".bankCode").blur(function() {
            cardReg()
        }), $(".IDnum").blur(function() {
            idcardReg()
        })
    }, exports.phoneForm = function() {
        checkAttent(".phoneForm");
        var _Form = $(".phoneForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
            },callback: function(data) {
                $.dialog({content: data.msg,icon: null,ok: function() {
                        "ok" == data.status && window.location.reload()
                    }})
            },usePlugin: {jqtransform: {selector: ".select_beauty,:checkbox,:radio,.decorate"}}});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".pname",datatype: "*2-15",nullmsg: "请输入昵称",errormsg: "长度2-15个字符",ajaxurl: "/member/validate_user_nickname",ajaxUrlName: "nickname"}, {ele: ".loction",datatype: "*",nullmsg: "请输入选择地区",errormsg: "请选择正确的地区"}, {ele: ".pEmail",datatype: "e",nullmsg: "请输入邮箱地址",errormsg: "请输入正确的邮箱地址",ajaxurl: "/member/check_email_availability/",ajaxUrlName: "email"}, {ele: ".subjectInput",datatype: "*",nullmsg: "请选择年级",errormsg: "选择年级错误"}, {ele: ".pUname",datatype: "*2-15",nullmsg: "请输入真实姓名",ignore: "ignore",errormsg: "长度2-15个字符"}, {ele: ".sex",ignore: "ignore",datatype: "*",nullmsg: "请选择性别",errormsg: "请选择性别"}, {ele: ".pSchool",ignore: "ignore",datatype: "*",nullmsg: "请输入就读学校名称",errormsg: "学校名称有误"}]), _Form.config({url: "/member/my_infor",ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}}), require("module/login/validFocus")
    }, exports.emailForm = function() {
        checkAttent(".emailForm");
        var _Form = $(".emailForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
            },callback: function(data) {
                $.dialog({content: data.msg,icon: null,ok: function() {
                        "ok" == data.status && window.location.reload()
                    }})
            },usePlugin: {jqtransform: {selector: ".select_beauty,:checkbox,:radio,.decorate"}}});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".pname",datatype: "*",nullmsg: "请输入昵称",errormsg: "长度4-25个字符",ajaxurl: "/member/validate_user_nickname",ajaxUrlName: "nickname"}, {ele: ".phone_number",datatype: "m",ignore: "ignore",errormsg: "请输入正确的手机号"}, {ele: ".subjectInput",datatype: "*",nullmsg: "请选择年级",errormsg: "选择年级错误"}, {ele: ".pUname",ignore: "ignore",datatype: "*",nullmsg: "请输入真实姓名",errormsg: "长度4-25个字符",ajaxurl: "/member/check_realname_length",ajaxUrlName: "realname"}, {ele: ".sex",ignore: "ignore",datatype: "*",nullmsg: "请选择性别",errormsg: "请选择性别"}, {ele: ".pSchool",ignore: "ignore",datatype: "*",nullmsg: "请输入就读学校名称",errormsg: "学校名称有误"}]), _Form.config({url: "/member/my_infor",ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}}), require("module/login/validFocus")
    }, exports.ichangePWForm = function() {
        var _Form = $(".ichangePWForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                require("lib/cryptoJs/3.1.2/sha1");
                var hash = CryptoJS.SHA1($(".iniPassword").val());
                $("input[name='encrypt_password']").val(hash.toString()), $(".iniPassword").attr("disabled", !0);
                var hash_set = CryptoJS.SHA1($(".setPassword").val());
                $("input[name='encrypt_set_password']").val(hash_set.toString()), $(".setPassword").attr("disabled", !0);
                var hash_reset = CryptoJS.SHA1($(".reSetPassword").val());
                $("input[name='encrypt_reset_password']").val(hash_reset.toString()), $(".reSetPassword").attr("disabled", !0)
            },callback: function(data) {
                "ok" == data.status ? $.dialog({content: "密码修改成功, 页面将跳转到登陆页面",icon: null,ok: function() {
                        window.location = data.url
                    }}) : ($.dialog({content: data.info}), $(".iniPassword").removeAttr("disabled"), $(".setPassword").removeAttr("disabled"), $(".reSetPassword").removeAttr("disabled"))
            }});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".iniPassword",datatype: "*",nullmsg: "请输入密码",errormsg: "请输入正确的密码"}, {ele: ".setPassword",datatype: "*6-20",nullmsg: "新密码不能为空",errormsg: "长度6-20个字符之间"}, {ele: ".reSetPassword",datatype: "*6-20",recheck: "set_password",nullmsg: "请再次输入密码",errormsg: "两次密码不一致！"}]), _Form.config({url: "/member/front_modify_password",ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}})
    }
    **/
}), define("module/common/method/bankcard", [], function(require, exports) {
    exports.luhmCheck = function(bankno) {
        if (bankno.length < 16 || bankno.length > 19)
            return !1;
        var num = /^\d*$/;
        if (!num.exec(bankno))
            return !1;
        var strBin = "10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";
        if (-1 == strBin.indexOf(bankno.substring(0, 2)))
            return !1;
        for (var lastNum = bankno.substr(bankno.length - 1, 1), first15Num = bankno.substr(0, bankno.length - 1), newArr = new Array, i = first15Num.length - 1; i > -1; i--)
            newArr.push(first15Num.substr(i, 1));
        for (var arrJiShu = new Array, arrJiShu2 = new Array, arrOuShu = new Array, j = 0; j < newArr.length; j++)
            (j + 1) % 2 == 1 ? 2 * parseInt(newArr[j]) < 9 ? arrJiShu.push(2 * parseInt(newArr[j])) : arrJiShu2.push(2 * parseInt(newArr[j])) : arrOuShu.push(newArr[j]);
        for (var jishu_child1 = new Array, jishu_child2 = new Array, h = 0; h < arrJiShu2.length; h++)
            jishu_child1.push(parseInt(arrJiShu2[h]) % 10), jishu_child2.push(parseInt(arrJiShu2[h]) / 10);
        for (var sumJiShu = 0, sumOuShu = 0, sumJiShuChild1 = 0, sumJiShuChild2 = 0, sumTotal = 0, m = 0; m < arrJiShu.length; m++)
            sumJiShu += parseInt(arrJiShu[m]);
        for (var n = 0; n < arrOuShu.length; n++)
            sumOuShu += parseInt(arrOuShu[n]);
        for (var p = 0; p < jishu_child1.length; p++)
            sumJiShuChild1 += parseInt(jishu_child1[p]), sumJiShuChild2 += parseInt(jishu_child2[p]);
        sumTotal = parseInt(sumJiShu) + parseInt(sumOuShu) + parseInt(sumJiShuChild1) + parseInt(sumJiShuChild2);
        var k = parseInt(sumTotal) % 10 == 0 ? 10 : parseInt(sumTotal) % 10, luhm = 10 - k;
        return lastNum == luhm ? !0 : !1
    }
}), define("module/common/method/idCard", [], function(require, exports) {
    exports.idCard = function(idCard) {
        function ClsIDCard(CardNo) {
            this.Valid = !1, this.ID15 = "", this.ID18 = "", this.Local = "", null != CardNo && this.SetCardNo(CardNo)
        }
        ClsIDCard.prototype.SetCardNo = function(CardNo) {
            this.ID15 = "", this.ID18 = "", this.Local = "";
            var strCardNo;
            if (18 == CardNo.length) {
                if (pattern = /^\d{17}(\d|x|X)$/, null == pattern.exec(CardNo))
                    return;
                strCardNo = CardNo.toUpperCase()
            } else {
                if (pattern = /^\d{15}$/, null == pattern.exec(CardNo))
                    return;
                strCardNo = CardNo.substr(0, 6) + "19" + CardNo.substr(6, 9), strCardNo += this.GetVCode(strCardNo)
            }
            this.Valid = this.CheckValid(strCardNo)
        }, ClsIDCard.prototype.IsValid = function() {
            return this.Valid
        }, ClsIDCard.prototype.GetBirthDate = function() {
            var BirthDate = "";
            return this.Valid && (BirthDate = this.GetBirthYear() + "-" + this.GetBirthMonth() + "-" + this.GetBirthDay()), BirthDate
        }, ClsIDCard.prototype.GetBirthYear = function() {
            var BirthYear = "";
            return this.Valid && (BirthYear = this.ID18.substr(6, 4)), BirthYear
        }, ClsIDCard.prototype.GetBirthMonth = function() {
            var BirthMonth = "";
            return this.Valid && (BirthMonth = this.ID18.substr(10, 2)), "0" == BirthMonth.charAt(0) && (BirthMonth = BirthMonth.charAt(1)), BirthMonth
        }, ClsIDCard.prototype.GetBirthDay = function() {
            var BirthDay = "";
            return this.Valid && (BirthDay = this.ID18.substr(12, 2)), BirthDay
        }, ClsIDCard.prototype.GetSex = function() {
            var Sex = "";
            return this.Valid && (Sex = this.ID18.charAt(16) % 2), Sex
        }, ClsIDCard.prototype.Get15 = function() {
            var ID15 = "";
            return this.Valid && (ID15 = this.ID15), ID15
        }, ClsIDCard.prototype.Get18 = function() {
            var ID18 = "";
            return this.Valid && (ID18 = this.ID18), ID18
        }, ClsIDCard.prototype.GetLocal = function() {
            var Local = "";
            return this.Valid && (Local = this.Local), Local
        }, ClsIDCard.prototype.GetVCode = function(CardNo17) {
            for (var Wi = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1), Ai = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2"), cardNoSum = 0, i = 0; i < CardNo17.length; i++)
                cardNoSum += CardNo17.charAt(i) * Wi[i];
            var seq = cardNoSum % 11;
            return Ai[seq]
        }, ClsIDCard.prototype.CheckValid = function(CardNo18) {
            if (this.GetVCode(CardNo18.substr(0, 17)) != CardNo18.charAt(17))
                return !1;
            if (!this.IsDate(CardNo18.substr(6, 8)))
                return !1;
            var aCity = {11: "北京",12: "天津",13: "河北",14: "山西",15: "内蒙古",21: "辽宁",22: "吉林",23: "黑龙江 ",31: "上海",32: "江苏",33: "浙江",34: "安徽",35: "福建",36: "江西",37: "山东",41: "河南",42: "湖北 ",43: "湖南",44: "广东",45: "广西",46: "海南",50: "重庆",51: "四川",52: "贵州",53: "云南",54: "西藏 ",61: "陕西",62: "甘肃",63: "青海",64: "宁夏",65: "新疆",71: "台湾",81: "香港",82: "澳门",91: "国外"};
            return null == aCity[parseInt(CardNo18.substr(0, 2))] ? !1 : (this.ID18 = CardNo18, this.ID15 = CardNo18.substr(0, 6) + CardNo18.substr(8, 9), this.Local = aCity[parseInt(CardNo18.substr(0, 2))], !0)
        }, ClsIDCard.prototype.IsDate = function(strDate) {
            var r = strDate.match(/^(\d{1,4})(\d{1,2})(\d{1,2})$/);
            if (null == r)
                return !1;
            var d = new Date(r[1], r[2] - 1, r[3]);
            return d.getFullYear() == r[1] && d.getMonth() + 1 == r[2] && d.getDate() == r[3]
        };
        var checkFlag = new ClsIDCard(idCard);
        return checkFlag.IsValid() ? !0 : !1
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
}), define("module/studentMyCourse/myCourse", ["lib/artDialog/4.1.7/artDialog", "module/common/method/popUp", "naHaoDialog", "module/classRoom/valid", "validForm", "module/common/method/countDown"], function(require, exports) {
    require("lib/artDialog/4.1.7/artDialog");
    var _popUp = require("module/common/method/popUp");
    exports.leftNav = function() {
        if ($(".menu li").length)
            for (var i = 0; i < $(".menu li").length; i++)
                -1 != $(".menu li").eq(i).attr("name").indexOf($("#wrapContent").attr("name")) && ($(".menu li").removeClass("menuOn"), $(".menu li").eq(i).addClass("menuOn"))
    }, exports.changedHead = function() {
        $(".memberInfo .memberImg img").click(function() {
            $(".inforTab .tabh li").removeClass("inforOn"), $(".inforTab .tabh li").eq(1).addClass("inforOn"), $(".inforTabBox").addClass("undis"), $(".atareditorBox").removeClass("undis")
        })
    }, exports.cNote = function() {
        $(".cListHid").on("click", ".cloudNotes", function() {
            var shtml = "", btn = $(this), action = "/course/get_user_cloud_notes", data = {cid: btn.data("cid")};
            $.post(action, data, function(response) {
                "ok" == response.status ? (shtml += "<h2>" + response.data.class_title + "</h2>", shtml += '<div class="cnCon">', shtml += "<p>" + response.data.content + "</p>", shtml += "</div>", $(".cnDia").html(shtml), _popUp.popUp(".noteDia")) : "error" == response.status && $.dialog({content: response.msg,icon: null})
            }, "json")
        })
    }, exports.timeToggle = function() {
        $(".enlistForm .ctime").click(function() {
            $(this).hasClass("ctimeOn") ? $(this).removeClass("ctimeOn") : ($(".enlistForm .ctime").removeClass("ctimeOn"), $(this).addClass("ctimeOn"))
        })
    }, exports.countDown = function(obj, id, type) {
        function countDown() {
            var oDate = new Date;
            if ($("#" + id).val()) {
                array = $("#" + id).val().split(" "), FullYear = array["0"].split("-"), Hours = array["1"].split(":"), oDate.setFullYear(FullYear[0], FullYear[1], FullYear[2]), oDate.setHours(Hours[0], Hours[1], Hours[2]);
                var today = new Date;
                today.setFullYear(today.getFullYear(), today.getMonth() - "" + 1, today.getDate()), today.setHours(today.getHours(), today.getMinutes(), today.getSeconds());
                var s1 = parseInt(oDate.getTime()), s2 = parseInt(today.getTime()), s = parseInt((s1 - s2) / 1e3), days = parseInt(s / 86400);
                s %= 86400;
                var hours = parseInt(s / 3600);
                s %= 3600;
                var mins = parseInt(s / 60);
                s %= 60, 0 >= days && 0 >= hours && 0 >= mins && 0 >= s && (days = 0, hours = 0, mins = 0, s = 0, clearInterval(timer)), days = 10 > days ? "0" + days : days, hours = 10 > hours ? "0" + hours : hours, mins = 10 > mins ? "0" + mins : mins, s = 10 > s ? "0" + s : s, 1 == type ? obj.html(days + "天 " + hours + "小时 " + mins + "分 " + s + "秒") : obj.html("<strong>" + days + "</strong>天<strong>" + hours + "</strong>小时<strong>" + mins + "</strong>分<strong>" + s + "</strong>秒")
            }
        }
        var timer = null;
        countDown(), timer = setInterval(countDown, 1e3)
    }, exports.soon_buy = function() {
        $("#soon_buy").click(function() {
            var url = "/course/before_check_order/", data = {product_id: $("#product_id").val()};
            $.post(url, data, function(response) {
                "error" == response.status ? $.dialog({content: response.msg,icon: null,ok: function() {
                        return window.location.href = student_url + "member/my_order/all", !1
                    }}) : "ok" == response.status ? window.location.href = student_url + "pay/product/" + response.id : "no_login" == response.status ? seajs.use("module/nahaoCommon/commonLogin", function(_c) {
                    _c.cLogin()
                }) : "nerror" == response.status && $.dialog({content: response.msg,icon: null})
            }, "json")
        })
    }, exports.soon_buy_xia = function() {
        $("#soon_buy_xia").click(function() {
            var url = "/course/before_check_order/", data = {product_id: $("#product_id_xia").val()};
            $.post(url, data, function(response) {
                "error" == response.status ? $.dialog({content: response.msg,icon: null,ok: function() {
                        return window.location.href = student_url + "member/my_order/all", !1
                    }}) : "ok" == response.status ? window.location.href = student_url + "pay/product/" + response.id : "no_login" == response.status ? seajs.use("module/nahaoCommon/commonLogin", function(_c) {
                    _c.cLogin()
                }) : "nerror" == response.status && $.dialog({content: response.msg,icon: null})
            }, "json")
        })
    }, exports.doDelMyOrder = function() {
        $(".orderComBox").on("click", ".dodel", function() {
            var btn = $(this), action = "/member/action/" + btn.data("id") + "/" + btn.data("type"), data = {};
            $.get(action, data, function(response) {
                "ok" == response.status ? $.dialog({content: response.msg,icon: null,cancel: !1,ok: function() {
                        window.location.reload()
                    }}) : "error" == response.status && $.dialog({content: response.msg,icon: null})
            }, "json")
        })
    }, exports.doCancelMyOrder = function() {
        $(".orderComBox").on("click", ".docancel", function() {
            var btn = $(this), action = "/member/action/" + btn.data("id") + "/" + btn.data("type"), data = {};
            $.get(action, data, function(response) {
                "ok" == response.status ? $.dialog({content: response.msg,icon: null,cancel: !1,ok: function() {
                        window.location.reload()
                    }}) : "error" == response.status && $.dialog({content: response.msg,icon: null})
            }, "json")
        })
    }, exports.overCourse = function() {
        for (var i = 0; i < $(".outlineList li").length; i++)
            $(".outlineList li").eq(i).find(".replay").length && $(".outlineList li").eq(i).find(".rCon").addClass("rConOver");
        $(".evaluBtn").click(function() {
            var _this = $(this);
            $.dialog({id: "comment_close",title: !1,ok: !1,icon: !1,padding: 0,content: $(".evaluHtml").html()}), class_id = $(this).attr("evaluBtns"), $("#c_class_id").val(class_id), exports.starClick(), require("module/classRoom/valid").evaluForm(_this)
        })
    }, exports.starClick = function() {
        $(".evalu .starBg span").click(function() {
            for (var i = 0; i < $(".evalu .starBg span").length; i++)
                $(".evalu .starBg span").eq(i).removeClass("cStar");
            for (var _index = $(".evalu .starBg span").index($(this)), i = 0; _index + 1 > i; i++)
                $(".evalu .starBg span").eq(i).addClass("cStar");
            $("#c_score").val(_index + 1)
        })
    }, exports.sendValidateCode = function() {
        $(".sendPhoneCode").click(function() {
            var _this = $(this);
            _this.attr("disabled", !0);
            var phone = $("input[name='phone']").val(), verify_type = $("input[name='verify_type']").val();
            return phone ? /^1[3|5|7|8]\d{9}$/.test(phone) ? ($.ajax({url: "/register/send_captcha",type: "post",data: {phone: phone,type: verify_type},dataType: "json",success: function(result) {
                    "error" == result.status ? $.dialog({content: result.msg,icon: null}) : require("module/common/method/countDown").countDown(_this)
                }}), void 0) : ($.dialog({content: "请输入正确的手机号",icon: null}), fasle) : ($.dialog({content: "请填写手机号",icon: null}), !1)
        })
    }, exports.new_class_skip = function() {
        $(".newList").on("click", ".rotateBox", function() {
            var url = $(this).data("action");
            window.open(url)
        })
    }
}), define("module/common/method/popUp", ["lib/artDialog/4.1.7/artDialog"], function(require, exports) {
    require("lib/artDialog/4.1.7/artDialog"), exports.popUp = function(obj) {
        $.tiziDialog({title: !1,close: null,ok: !1,icon: null,padding: 0,content: $(obj).html()})
    }
}), define("module/classRoom/valid", ["lib/Validform/5.3.2/Validform"], function(require, exports) {
    require("lib/Validform/5.3.2/Validform");
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
    exports.feedbackForm = function() {
        var _Form = $(".feedbackForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
            },callback: function(data) {
                "ok" == data.status ? ($.dialog({content: data.msg,icon: null}), $(".feedback").length && $.dialog.list.feedback_close.close()) : $.dialog({content: data.msg,icon: null})
            }});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".fTextarea",datatype: "*",nullmsg: "请提出您宝贵的意见或者建议",errormsg: ""}, {ele: ".fname",datatype: "*2-20",nullmsg: "请输入称呼",errormsg: "长度2-20个字符"}, {ele: ".fEmail",datatype: "e",nullmsg: "请输入邮箱地址",errormsg: "请输入正确的邮箱地址"}])
    }, exports.evaluForm = function(_this) {
        var _Form = $(".evaluForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                return $(".aui_content .cStar") ? void 0 : ($.dialog({content: "请您为本节课打分",icon: null}), !1)
            },callback: function(data) {
                "ok" == data.status ? ($.dialog({content: data.msg,icon: null}), $.dialog.list.comment_close.close(), _this.parent().append('<span class="cevaluBtn fr sevaluBtn">已评价</span>'), _this.remove()) : "no_login" == data.status ? seajs.use("module/nahaoCommon/commonLogin", function(_c) {
                    _c.cLogin()
                }) : $.dialog({content: data.msg,icon: null})
            }});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".eTextarea",datatype: "*",nullmsg: "请提出您宝贵的意见或者建议",errormsg: ""}])
    }, exports.evaluForm_classroom = function() {
        var _Form = $(".evaluForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                return $(".aui_content .cStar") ? void 0 : ($.dialog({content: "请您为本节课打分",icon: null}), !1)
            },callback: function(data) {
                "ok" == data.status ? ($.dialog({content: data.msg,icon: null}), $.dialog.list.comment_close.close()) : $.dialog({content: data.msg,icon: null})
            }});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".eTextarea",datatype: "*",nullmsg: "请提出您宝贵的意见或者建议",errormsg: ""}])
    }
}), define("module/common/method/countDown", [], function(require, exports) {
    var ind = 60;
    exports.countDown = function(_this) {
        ind = 60;
        var timer = setInterval(function() {
            ind--, 0 > ind ? (clearInterval(timer), _this.removeAttr("disabled").css("background", "#6dcde6"), _this.val("重新获取验证码")) : _this.val(ind + "秒后获取验证码").css("background", "#dedede")
        }, 1e3)
    }
}), define("module/common/method/setSchool", ["lib/artDialog/4.1.7/artDialog", "lib/Validform/5.3.2/Validform"], function(require, exports) {
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
    }, exports.noMyScholl = function() {
        $(".noMySchollBtn").live("click", function() {
            $(".resetSchoolPopCon .schoolInfo .hd,.resetSchoolPopCon .schoolInfo .seacherResult").hide(), $(".resetSchoolPopCon .school").hide(), $(".resetSchoolPopCon .schoolInfo .bd").fadeIn()
        }), $(".returnSetSchool").live("click", function() {
            $(".resetSchoolPopCon .schoolInfo .bd").hide(), $(".resetSchoolPopCon .schoolInfo .hd").fadeIn(), $(".resetSchoolPopCon .school").fadeIn()
        })
    }, exports.normalData = function(_json) {
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
}), define("module/common/method/share", [], function(require, exports) {
    exports.shareInsertBg = function() {
        with (window._bd_share_config = {common: {bdSnsKey: {},bdText: "",bdDesc: "",bdMini: "2",bdPic: "",bdStyle: "0",bdSize: "24",bdUrl: "",onBeforeClick: function() {
                }},share: {}}, document)
            0[(getElementsByTagName("head")[0] || body).appendChild(createElement("script")).src = "http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=" + ~(-new Date / 36e5)]
    }
}), define("module/studentMyCourse/area", [], function(require, exports) {
    exports.change_area = function() {
        $("#province").change(function() {
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
        }), $("#city").change(function() {
            $.ajax({type: "post",url: "/member/get_county_list",data: "city=" + $("#city").val(),dataType: "json",success: function(msg) {
                    if ("" != msg) {
                        $("#area").empty();
                        var area = eval(msg);
                        $.each(area, function(index, d) {
                            $("#area").append("<option value=" + d.id + ">" + d.name + "</option>")
                        })
                    }
                }})
        })
    }
});

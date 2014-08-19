define("module/nahaoCommon/init", ["module/common/method/curNav", "module/common/method/floatBox", "module/classRoom/valid", "validForm", "module/lib/select"], function(require) {
    if (require("module/common/method/curNav").curNav(".headNav", "nahaoModule"), require("module/common/method/floatBox").floatBox($(".floatBox").get(0), $(".floatBox .returnTop")), $(".feedback").click(function() {
        $.dialog({id: "feedback_close",title: !1,ok: !1,icon: !1,padding: 0,content: $(".feedbackHtml").html()}), require("module/classRoom/valid").feedbackForm()
    }), void 0 == $("body").css("WebkitTransform") && -1 != window.navigator.userAgent.indexOf("MSIE") && ("studentHomePage" == $("#nahaoModule").attr("module") || "studentMyCourse" == $("#nahaoModule").attr("module")) && $("#nahaoModule").addClass("lowHomePage"), require("module/lib/select"), "studentPage" == $("#nahaoModule").attr("data_page") && seajs.use("module/nahaoCommon/commonLogin", function(ex) {
        ex.loginForm()
    }), -1 != window.navigator.userAgent.indexOf("MSIE 6") || -1 != window.navigator.userAgent.indexOf("MSIE 7")) {
        var ohref = student_url + "index/browser";
        $(".iebrowser").length || $(".header").prepend('<div class="iebrowser">您正在使用的浏览器无法支持那好的正常使用。为更好的浏览本站，建议您将浏览器升级到IE8或以下浏览器：360极速 / Chrome / Safari<span>下载地址：<a href="' + ohref + '">点击这里</a></span></div>')
    } else
        $(".iebrowser").length && $(".iebrowser").remove()
}), define("module/common/method/curNav", [], function(require, exports) {
    exports.curNav = function(obj, id) {
        if ($(obj + " li").length)
            for (var i = 0; i < $(obj + " li").length; i++)
                "nahaoModule" == id && "myOrderCon" == $("#wrapContent").attr("name") && ($(obj + " li").removeClass("curNav"), $(obj + " li").eq(2).addClass("curNav")), -1 != $(obj + " li").eq(i).attr("class").indexOf($("#" + id).attr("module")) && ($(obj + " li").removeClass("curNav"), $(obj + " li").eq(i).addClass("curNav"))
    }
}), define("module/common/method/floatBox", [], function(require, exports) {
    exports.floatBox = function(oDiv, returnBtn) {
        function scrollTopfn() {
            var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
            -1 != window.navigator.userAgent.indexOf("MSIE 6") && (oDiv.style.top = scrollTop + document.documentElement.clientHeight - oDiv.offsetHeight + "px"), 0 == scrollTop ? returnBtn.hide() : returnBtn.show()
        }
        window.onload = function() {
            scrollTopfn()
        }, window.onresize = function() {
            scrollTopfn()
        }, window.onscroll = function() {
            scrollTopfn()
        }, returnBtn.click(function() {
            $("html,body").animate({scrollTop: 0})
        })
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
});

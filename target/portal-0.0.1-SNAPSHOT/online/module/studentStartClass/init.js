define("module/studentStartClass/init", ["module/lib/select", "module/common/method/popUp", "naHaoDialog", "module/common/method/setSchool", "validForm", "module/studentStartClass/valid", "module/login/validFocus", "module/studentStartClass/datePlugin"], function(require) {
    $(function() {
        require("module/lib/select"), $(".popBox").length > 0 && require("module/common/method/popUp").popUp(".popBox"), require("module/common/method/setSchool");
        var _valid = require("module/studentStartClass/valid");
        $(".writeInfo").length > 0 && ($("select").jqTransSelect(), $("input[type=radio]").jqTransRadio(), $("input[type=checkbox]").jqTransCheckBox(), require("module/studentStartClass/datePlugin").addDatePlugin(), _valid.writeInfoForm()), $(".regTeacher").length && _valid.teaRegForm()
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
}), define("module/common/method/popUp", ["lib/artDialog/4.1.7/artDialog"], function(require, exports) {
    require("lib/artDialog/4.1.7/artDialog"), exports.popUp = function(obj) {
        $.tiziDialog({title: !1,close: null,ok: !1,icon: null,padding: 0,content: $(obj).html()})
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
}), define("module/studentStartClass/valid", ["lib/Validform/5.3.2/Validform", "lib/artDialog/4.1.7/artDialog", "module/login/validFocus"], function(require, exports) {
    function check_time_pick() {
        $(".timeSecelt").eq(1).find("li a").click(function() {
            var start = parseInt($(".startTime").val()), end = parseInt($(".endTime").val());
            start >= end && $(".timeSecelt").eq(1).children(".Validform_checktip").removeClass("Validform_right").addClass("Validform_wrong").html("开始时间不能晚于结束时间")
        })
    }
    require("lib/Validform/5.3.2/Validform"), require("lib/artDialog/4.1.7/artDialog");
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
    exports.writeInfoForm = function() {
        var _Form = $(".writeInfoForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
                var start = parseInt($(".startTime").val()), end = parseInt($(".endTime").val());
                return start >= end ? ($(".timeSecelt").eq(1).children(".Validform_checktip").removeClass("Validform_right").addClass("Validform_wrong").html("开始时间不能晚于结束时间"), $.tiziDialog({icon: null,content: "开始时间不能晚于结束时间"}), !1) : void 0
            },callback: function(data) {
                "ok" == data.status ? $.tiziDialog({icon: "succeed",content: "开课申请成功",ok: function() {
                        window.location.href = "/"
                    }}) : $.tiziDialog({icon: "error",content: data.msg})
            },usePlugin: {jqtransform: {selector: ".select_beauty,:checkbox,:radio,.decorate"}}});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".wUname",datatype: "*2-15",nullmsg: "请输入称呼",errormsg: "长度2-15个字符"}, {ele: ".schoolFullName",datatype: "*",nullmsg: "请选择学校",errormsg: "请选择正确的学校"}, {ele: ".radioInput",datatype: "*",nullmsg: "请选择性别",errormsg: "请选择正确的性别"}, {ele: ".wage",datatype: "/^\\d{2}$/",nullmsg: "请输入年龄",errormsg: "请输入正确的年龄"}, {ele: ".checkInput",datatype: "*",nullmsg: "请选择教学阶段",errormsg: "您未选择教学阶段！"}, {ele: ".teaTitle",datatype: "*",nullmsg: "请选择教师职称",errormsg: "请选择正确的教师职称"}, {ele: ".seniority",datatype: "*",nullmsg: "请选择实际教龄",errormsg: "请选择正确的实际教龄"}, {ele: ".wphone",datatype: "m",nullmsg: "请输入手机号码",errormsg: "请输入正确的手机号码"}, {ele: ".wEmail",datatype: "e",nullmsg: "请输入邮箱地址",errormsg: "请输入正确的邮箱地址"}, {ele: ".wQQ",datatype: "/^\\d{5,12}$/",nullmsg: "请输入QQ号码！",errormsg: "长度5-12个数字"}, {ele: ".lecture",datatype: "*",nullmsg: "请选择讲课方式",errormsg: "请选择正确的讲课方式"}, {ele: ".lectureSub",datatype: "*",nullmsg: "请选择试讲科目",errormsg: "请选择正确的试讲科目"}, {ele: ".wtime",datatype: "*",nullmsg: "请输入预约时间",errormsg: "请输入正确的时间格式"}, {ele: ".startTime",datatype: "*",nullmsg: "请选择开始时间"}, {ele: ".endTime",datatype: "*",nullmsg: "请选择结束时间"}, {ele: ".subname",datatype: "*",nullmsg: "请输入课程名称",errormsg: "请输入正确的课程名称"}]), check_time_pick(), require("module/login/validFocus"), _Form.config({url: student_url + "index/save_apply_teach",ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}})
    }, exports.teaRegForm = function() {
        var _Form = $(".teaRegForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function(curform) {
                return require("lib/Validform/5.3.2/Validform").checkCaptcha("TeacherBox", 1) ? (require("lib/Validform/5.3.2/Validform").md5(curform), void 0) : !1
            },callback: function(data) {
                alert("提交成功"), require("lib/Validform/5.3.2/Validform").reset_md5(".regTeacherForm"), data.errorcode || require.async("validForm", function(ex) {
                    ex.changeCaptcha("TeacherBox")
                })
            }});
        _Form.tipmsg.r = " ", _Form.addRule([{ele: ".sEmail",datatype: "e",nullmsg: "请输入邮箱地址",errormsg: "请输入正确的邮箱地址"}, {ele: ".spassword",datatype: "*6-20",nullmsg: "请输入密码",errormsg: "长度6-20个字符之间"}, {ele: ".TeacherBoxWord",datatype: "/^\\w{4}$/",nullmsg: "请输入验证码",errormsg: "验证码长度是4位"}])
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
}), define("module/studentStartClass/datePlugin", [], function(require, exports) {
    exports.addDatePlugin = function() {
        require.async("jQDate", function() {
            $(".wtime").on("click", function() {
                WdatePicker({dateFmt: "yyyy-MM-dd",minDate: "%y-%M-#{%d}",onpicked: function() {
                    }})
            })
        })
    }
});

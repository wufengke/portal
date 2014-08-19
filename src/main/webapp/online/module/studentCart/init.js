define("module/studentCart/init", ["module/studentCart/tab", "module/studentCart/payment", "naHaoDialog", "module/studentCart/valid", "validForm", "module/common/method/countDown"], function(require) {
    require("module/studentCart/tab").tab();
    var _studentCar = require("module/studentCart/payment");
    $(".toPay").length > 0 && _studentCar.pay_click_submit(), $(".innerBox").length > 0, _studentCar.pay_dialog(), require("module/studentCart/valid").inforCheckForm(), require("module/studentCart/valid").sendValidateCode()
}), define("module/studentCart/tab", [], function(require, exports) {
    exports.tab = function() {
        $(".payBox h3 a").click(function() {
            var _index = $(this).index();
            $(this).addClass("active").siblings("a").removeClass("active"), $(".payBox .box").eq(_index).show().siblings(".box").hide()
        }), $(".onlineBank li").click(function() {
            var _index = $(this).index();
            $(".li-table").eq(_index).show().siblings(".li-table").hide()
        })
    }
}), define("module/studentCart/payment", ["lib/artDialog/4.1.7/artDialog"], function(require, exports) {
    exports.pay_click_submit = function() {
        $("#click_banks").click(function() {
            $(".onlineBank form").submit()
        }), $("#click_credit").click(function() {
            $(".creditBox form").submit()
        }), $("#click_alipayLi").click(function() {
            $(".alipayBox form").submit()
        })
    }, exports.pay_dialog = function() {
        require("lib/artDialog/4.1.7/artDialog"), $(".ortherBtn").click(function() {
            $.dialog({id: "payFalse",title: !1,ok: !1,icon: !1,padding: 0,content: $(".popBox").html()}), $(".aui_close").hide(), $(".choiceBox").on("click", ".check_pay", function() {
                var url = "/pay/check_pay/", data = {order_id: $("#id").val()};
                $.post(url, data, function(response) {
                    "error" == response.status ? ($.dialog({content: response.msg,icon: null}), $.dialog.list.payFalse.close()) : "ok" == response.status && $.dialog({content: response.msg,icon: null,ok: function() {
                            window.location.href = "/member/my_order/all"
                        }})
                }, "json")
            })
        })
    }
}), define("module/studentCart/valid", ["lib/Validform/5.3.2/Validform", "module/common/method/countDown"], function(require, exports) {
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
    exports.inforCheckForm = function() {
        var _Form = $(".inforCheckForm").Validform({tiptype: commonTipType,showAllError: !1,ajaxPost: !0,beforeSubmit: function() {
            },callback: function(data) {
                "error" == data.status ? $.dialog({content: data.msg,icon: null}) : "been_buy" == data.status ? $.dialog({content: data.msg,icon: null,ok: function() {
                        window.location.href = "/member/my_order/all"
                    }}) : "ok" == data.status ? window.location.href = "/pay/neworder/" + data.data.product_id : "no_login" == data.status && seajs.use("module/nahaoCommon/commonLogin", function(_c) {
                    _c.cLogin()
                })
            }});
        _Form.config({showAllError: !0,url: "/pay/add_contact",ajaxurl: {success: function(json, obj) {
                    "ok" == json.status ? ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_right"), $(obj).removeClass("Validform_error")) : ($(obj).siblings(".Validform_checktip").html(json.msg), $(obj).siblings(".Validform_checktip").removeClass("Validform_loading").addClass("Validform_wrong"))
                }}}), _Form.tipmsg.r = " ", _Form.addRule([{ele: ".inname",datatype: "*2-15",nullmsg: "请输入真实姓名",errormsg: "长度2-15个字符"}, {ele: ".inPhone",datatype: "*",ajaxurl: siteUrl + "register/check_phones",ajaxUrlName: "phone",nullmsg: "请输入手机号",errormsg: "手机号输入错误"}, {ele: ".inPhoneCode",datatype: "/^\\d{4}$/",nullmsg: "请输入手机验证码",errormsg: "手机验证码输入错误"}])
    }, exports.sendValidateCode = function() {
        $(".getVerCodea").click(function() {
            var _this = $(this), phone = $("#phone").val();
            return phone ? /\d{11}/.test(phone) ? ($.ajax({url: "/register/check_phones/",type: "post",data: "phone=" + phone,dataType: "json",success: function(result) {
                    "error" == result.status ? $.dialog({content: result.info,icon: null}) : $.ajax({url: "/register/send_captcha/",type: "post",data: "phone=" + phone + "&type=2",dataType: "json",success: function(result) {
                            "error" == result.status && $.dialog({content: result.msg,icon: null}), require("module/common/method/countDown").countDown(_this), _this.attr("disabled", !0)
                        }})
                }}), void 0) : ($.dialog({content: "请输入正确的手机号",icon: null}), fasle) : ($.dialog({content: "请填写手机号",icon: null}), !1)
        })
    }
}), define("module/common/method/countDown", [], function(require, exports) {
    var ind = 60;
    exports.countDown = function(_this) {
        ind = 60;
        var timer = setInterval(function() {
            ind--, 0 > ind ? (clearInterval(timer), _this.removeAttr("disabled").css("background", "#6dcde6"), _this.val("重新获取验证码")) : _this.val(ind + "秒后获取验证码").css("background", "#dedede")
        }, 1e3)
    }
});

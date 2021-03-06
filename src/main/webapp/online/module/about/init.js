define("module/about/init", ["module/common/method/curNav", "module/classRoom/valid", "validForm"], function(require) {
    require("module/common/method/curNav").curNav(".sideLeftNav", "aboutContent"), require("module/classRoom/valid").feedbackForm(), $(".videoPlay").length > 0 && $(".videoPlay").children().children(".container").each(function() {
        var curfile = $(this).attr("title"), curimg = $(this).children("img").attr("src");
        curimg.length > 0 || (curimg = "http://img1.nahao.com/course_description_20140710182330_iVnD5YB?imageView/2/w/600");
        var playlist = [{domain: "",file: curfile,image: curimg}];
        TiZiplayer($(this).attr("id")).setup({playlist: playlist,primary: "flash",height: 405,width: 600})
    })
}), define("module/common/method/curNav", [], function(require, exports) {
    exports.curNav = function(obj, id) {
        if ($(obj + " li").length)
            for (var i = 0; i < $(obj + " li").length; i++)
                "nahaoModule" == id && "myOrderCon" == $("#wrapContent").attr("name") && ($(obj + " li").removeClass("curNav"), $(obj + " li").eq(2).addClass("curNav")), -1 != $(obj + " li").eq(i).attr("class").indexOf($("#" + id).attr("module")) && ($(obj + " li").removeClass("curNav"), $(obj + " li").eq(i).addClass("curNav"))
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
});

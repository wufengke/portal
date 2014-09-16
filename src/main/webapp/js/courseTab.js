// JavaScript Document
$(document).ready(function () {
    $("ul.tabh li").each(function (i) {
        $(this).click(function () {
            $("ul.tabh li").each(function (index) {
                if (i == index) {
                    $(this).addClass("inforOn");
                } else {
                    $(this).removeClass("inforOn");
                }
            });
            $(".inforTabBox").each(function (position) {
                if (i == position) {
                    $(this).removeClass("undis");
                } else {
                    $(this).addClass("undis");
                }
            });
        });
    });
    $("ul.tabh li").click(function () {
        $("ul.tabh li").attr("class", "");
        $(this).attr("class", "inforOn");
    });
    $("#createClass").click(function () {
        $(this).parent().hide();
        $(this).parent().next().attr("class", "");
    });
    $(".iniBox").each(function () {
        var obj = $(this);
        obj.parent().mouseover(function () {
            obj.next().removeClass("undis");
        });
        obj.parent().mouseout(function () {
            obj.next().addClass("undis");
        });
    });
    $(".jqTransformRadio").each(function (index) {
        $(this).click(function () {
            var obj = $(this);
            var rel = obj.attr("rel");
            $('[rel="' + rel + '"]').each(function (i) {
                if (obj.next().attr("value") == $(this).next().attr("value")) {
                    obj.addClass("jqTransformChecked");
                    obj.next().attr("checked","checked");
                } else {
                    $(this).removeClass("jqTransformChecked");
                    $(this).next().removeAttr("checked");
                }
            });
        });
    });
    $("div.rotateBox").click(function () {
        var dataurl = $(this).attr("data-action");
        window.location.href = dataurl;
    });
    //“≥√Ê»œ÷§
    function ValidateForm()
    {
        //$("[validname=]")
    }
});
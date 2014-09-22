(function ($) {
    $.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
    $.fn.whAdjust = function () {
        var container = $(this).parent();
        var widthC = container.width();
        var heightC = container.height();

        var widthI = $(this).width();
        var heightI = $(this).height();

        var scaleW = widthI / widthC;
        var scaleH = heightI / heightC;
        var scale = scaleW > scaleH ? scaleW : scaleH;
        $(this).width(widthI / scale);
        $(this).height(heightI / scale);
    };
})(jQuery);




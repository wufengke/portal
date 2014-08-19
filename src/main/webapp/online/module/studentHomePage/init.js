define("module/studentHomePage/init", ["module/studentHomePage/homePage"], function(require) {
    require("module/studentHomePage/homePage").skip(), require("module/studentHomePage/homePage").roll()
}), 
define("module/studentHomePage/homePage", [], function(require, exports) {
    exports.skip = function() {
        $(".courseBox").on("click", ".rotateBox", function() {
            var url = $(this).data("action");
            window.open(url)
        })
    }, exports.roll = function() {
        function oAnimate() {
            $navLi.removeClass("active"), $navLi.eq(ind).addClass("active"), $conLi.removeClass("rollshow").stop().animate({opacity: 0}), $conLi.eq(ind).addClass("rollshow").stop().animate({opacity: 1})
        }
        function move() {
            console.log(ind), ind++, ind >= $conLi.length && (ind = 0), oAnimate()
        }
        function otimer() {
            timer = setInterval(move, 5e3), console.log(ind)
        }
        function mouseObj(obj) {
            obj.mouseover(function() {
                clearInterval(timer), clearTimeout(timer2), ind = $(this).index(), oAnimate()
            }), obj.mouseout(function() {
                timer2 = setTimeout(function() {
                    otimer()
                }, 2e3)
            })
        }
        for (var baseSrc = $(".qiniu").val(), i = 0; i < $(".focus_photo_class").length; i++) {
            $(".rollList").append('<li class="fl"><a href="' + $(".focus_photo_class").eq(i).val().split(",")[1] + '" target="_blank" style="background:url(' + baseSrc + $(".focus_photo_class").eq(i).val().split(",")[0] + ") center top no-repeat " + $(".focus_photo_class").eq(i).val().split(",")[2] + '"></a></li>'), $(".rollNav").append('<li class="fl"></li>'), 0 == i && ($(".rollList li").eq(0).addClass("rollshow"), $(".rollNav li").eq(0).addClass("active"));
            var $navLi = $(".rollNav li"), $conLi = $(".roll ul li")
        }
        var ind = 0, timer = null, timer2 = null;
        otimer(), mouseObj($navLi), mouseObj($conLi)
    }
});

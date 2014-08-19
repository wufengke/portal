define("module/common/method/countDown", [], function(require, exports) {
    var ind = 60;
    exports.countDown = function(_this) {
        ind = 60;
        var timer = setInterval(function() {
            ind--, 0 > ind ? (clearInterval(timer), _this.removeAttr("disabled").css("background", "#6dcde6"), _this.val("重新获取验证码")) : _this.val(ind + "秒后获取验证码").css("background", "#dedede")
        }, 1e3)
    }
});

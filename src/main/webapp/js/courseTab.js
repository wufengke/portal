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
              	if($("#first").hasClass("inforOn")){
               		$(".newList").hide();
               	}else{
               		$(".newList").show();
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
        $("#courseTitle").attr("readonly","true");
        var courseTitle = $("#courseTitle").val();
        if(courseTitle == null || courseTitle == ''){
        	alert("请输入课程标题(100文字以内)");
        	return ;
        }
        $.post("/member/createPrivateClass.action",
        		{"courseTitle":$("#courseTitle").val()},
        function(data){
			if(data.code != 0 && data.code != 2 && data.code != 3){
				$("#code").val(data.code);
			}
        	
        },"json");
    });
    $("#sendCode").click(function () {
    	$.post("/member/sendCode.action",
    			{"code":$("#code").val()},
		function(data){
			if(data.code != 0 && data.code !=2){
				if(data.code == 1){
					alert("手机号码为空，请在我的资料页完善个人资料");
				}else{
					alert("已发送，请查收");
				}
			}
		},"json");
    });
    $("#resetCode").click(function () {
    	$.post("/member/resetCode.action",
    			{},
		function(data){
			if(data.code != '0' && data.code != '1' ){
				$("#code").val(data.code);
			}
		},"json");
    });
    $("#enterClass").click(function () {
    	var userId = $("#userId").val();
    	var classroom = "http://classroom.phas.cn/demo3.jsp?action=create&username="+ userId + "&password=111&meetingID=111";
    	window.location.href = classroom;
    });
    
    $("#studentEnterClass").click(function () {
    	var userId = $("#userId").val();
    	var code = $("#code").val();
    	if(userId == null || userId == ''){
    		alert("请先登录");
    		return ;
    	}
    	if(code == null || code == ''){
    		alert("请输入老师发给你您的课程密码");
    		return ;
    	}
    	var classroom = "http://classroom.phas.cn/demo3.jsp?action=join&username="+ userId + "&password=111&meetingID=111&code=" + code;
    	window.location.href = classroom;
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
    
    function ValidateForm()
    {
        //$("[validname=]")
    }
});
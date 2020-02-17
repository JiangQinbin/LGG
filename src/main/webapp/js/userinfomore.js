function showCidDiv(){
    $("#cidShowDiv").hide();
    $("#cidInputDIv").show();
}

//提交用户基本信息修改
function updateMoreUserInfo() {
    if($("input[name=maritalStatus]:checked").val()==null||$("input[name=maritalStatus]:checked").val()==""){
        alert("请选择婚姻状况");
        return;
    }
    var monthlyIncome=$("#monthlyIncome").val();
    var cid=$("#cid").val();
    if(!validCid(cid)){
        return;
    }
    var education=$("#education").val();
    var industryInfo=$("#industryInfo").val();
    var datas = "1=1";
    datas += "&userVo.maritalStatus=" + $("input[name=userVo.maritalStatus]:checked").val();
    datas += "&userVo.monthlyIncome=" + monthlyIncome;
    datas += "&userVo.cid=" + cid;
    datas += "&userVo.education=" + education;
    datas += "&userVo.industryInfo=" + industryInfo;
    jQuery.ajax({
        type : "post",
        url : "/user/userinfo/updateMoreUserInfo.action",
        data : datas,
        //timeout: 4000,
        success : function(html) {
            if (html=="2") {
                newBox();
                setTimeout("window.location.reload(true);", 3000);
            } else {
                alert("保存失败，请稍后再试...");
            }
        },
        error : function() {
            alert("网络连接超时，请您稍后重试");
        }
    });
}


function newBox() {
    jQuery.jdThickBox({
        type: "text",
        title: "提示",
        width: 300,
        height:80,
        source: "<div class=\"tip-box icon-box\"><span class=\"succ-icon m-icon\"></span><div class=\"item-fore\">" +
        "<h3 class=\"ftx02\">资料保存成功</h3><div class=\"op-btns\"><a href=\"javascript:void(0)\" class=\"btn-9 delNewBox-btn\" " +
        ">关闭</a></div></div></div>",
        _autoReposi: true
    });
}
$('body').delegate('.delNewBox-btn ','click',function(){
    window.location.reload(true);
});


function validCid(ucid){
    var reg = null; //判断是否为数字的正则表达式
    //判断是否为空
    if(ucid==null || ucid==""){
        return true;
    }else if(ucid.length==15){
        reg=/^[0-9]+$/;
        if(reg.test(ucid)){
            $("#cid_msg").html("");
        }else{
            $("#cid_msg").parent().addClass("prompt-error");
            $("#cid_msg").parent().removeClass("prompt-06");
            $("#cid").attr("class","itxt itxt-error");
            $("#cid_msg").html("请输入正确的身份证号码！15位居民身份证号码应由纯数字构成");
            $("#cidShowDiv").hide();
            $("#cidInputDIv").show();
            return false;
        }
    }else if(ucid.length==18){
        reg=/^[0-9]+[xX]{0,1}$/;
        if(reg.test(ucid)){
            $("#cid_msg").html("");
            ucid=ucid.replace("x","X");
            $("#cid").val(ucid);
        }else{
            $("#cid_msg").parent().addClass("prompt-error");
            $("#cid_msg").parent().removeClass("prompt-06");
            $("#cid").attr("class","itxt itxt-error");
            $("#cid_msg").html("请输入正确的身份证号码！18位居民身份证号码应由数字或X构成");
            $("#cidShowDiv").hide();
            $("#cidInputDIv").show();
            return false;
        }
    }else{
        $("#cid_msg").parent().addClass("prompt-error");
        $("#cid_msg").parent().removeClass("prompt-06");
        $("#cid").attr("class","itxt itxt-error");
        $("#cid_msg").html("请输入正确的身份证号码！居民身份证号码为15或18位");
        $("#cidShowDiv").hide();
        $("#cidInputDIv").show();
        return false;
    }
    return true;
}

$("#cid").focus(function() {
    $("#cid_msg").parent().removeClass("prompt-error");
    $("#cid_msg").parent().addClass("prompt-06");
    $("#cid_msg").html("请输入正确的身份证号码！居民身份证号码为15或18位");
    $("#cid").attr("class","itxt");
});


//校验uCid是否正确
$("#cid").blur( function (){
    var ucid = $("#cid").val();
    var reg = null; //判断是否为数字的正则表达式
    //判断是否为空
    if(ucid==null || ucid==""){
        $("#cid_msg").html("");
    }else if(ucid.length==15){
        reg=/^[0-9]+$/;
        if(reg.test(ucid)){
            $("#cid_msg").parent().removeClass("prompt-error");
            $("#cid_msg").parent().addClass("prompt-06");
            $("#cid_msg").html("");
            $("#cid").attr("class","itxt itxt-succ");
        }else{
            $("#cid_msg").parent().addClass("prompt-error");
            $("#cid_msg").parent().removeClass("prompt-06");
            $("#cid").attr("class","itxt itxt-error");
            $("#cid_msg").html("请输入正确的身份证号码！15位居民身份证号码应由纯数字构成");
        }
    }else if(ucid.length==18){
        reg=/^[0-9]+[xX]{0,1}$/;
        if(reg.test(ucid)){
            ucid=ucid.replace("x","X");
            $("#cid").val(ucid);
            $("#cid_msg").parent().removeClass("prompt-error");
            $("#cid_msg").parent().addClass("prompt-06");
            $("#cid_msg").html("");
            $("#cid").attr("class","itxt itxt-succ");
        }else{
            $("#cid_msg").parent().addClass("prompt-error");
            $("#cid_msg").parent().removeClass("prompt-06");
            $("#cid").attr("class","itxt itxt-error");
            $("#cid_msg").html("请输入正确的身份证号码！18位居民身份证号码应由数字或X构成");
        }
    }else{
        $("#cid_msg").parent().addClass("prompt-error");
        $("#cid_msg").parent().removeClass("prompt-06");
        $("#cid").attr("class","itxt itxt-error");
        $("#cid_msg").html("请输入正确的身份证号码！居民身份证号码为15或18位");
    }
});
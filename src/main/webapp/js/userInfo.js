
$("#nickName").focus(function() {
    $("#nickName_msg").parent().removeClass("prompt-error");
    $("#nickName_msg").parent().addClass("prompt-06");
});

//校验petName是否正确
$("#nickName").blur(function() {
    var nickName = $("#nickName").val();
    nickName=$.trim(nickName);
    $("#nickName").val(nickName);
    if (!validNickname(nickName)) {
        return;
    }
    checkNickName(nickName);
});

$("#realName").focus(function() {
    $("#realName_msg").parent().removeClass("prompt-error");
    $("#realName_msg").parent().addClass("prompt-06");
    $("#realName_msg").html("请输入真实姓名，20个英文或10个汉字");
    $("#realName").attr("class","itxt");
});

$("#realName").blur(function() {
    var realName = $("#realName").val();
    realName =  $.trim(realName);
    $("#realName").val(realName);
    if (!validRealname(realName)) {
        return;
    }
});


$("#address").blur(function() {
    delspace("address"); //首先去掉空格
    var addr = $("#address").val();
    // 判断是否为空
    if (addr.replace(/[^\x00-\xff]/g, "**").length > 120) {
        $("#address_msg").parent().addClass("prompt-error");
        $("#address_msg").parent().removeClass("prompt-06");
        $("#address_msg").html("长度超长");
    } else {
        $("#address_msg").html("");
    }
});


/**
 * 地址规则
 * @param address
 */
function validAddress(address){
    delspace("address");
    if (address == null || address == "") {
    }else if(address.replace(/[^\x00-\xff]/g, "**").length > 120) {
        $("#address_msg").parent().addClass("prompt-error");
        $("#address_msg").parent().removeClass("prompt-06");
        $("#address_msg").html("长度超长");
        return false;
    }
    return true;
}


// 提交用户基本信息修改
function updateUserInfo() {
    var nickName=$("#nickName").val();
    //var realName=$("#realName").val();
    var sex=$("input[name=sex]:checked").val();
    var birthday=$("#birthdayYear").val() + "-" + $("#birthdayMonth").val() + "-" + $("#birthdayDay").val();
    var province=$("#province").val();
    var city=$("#city").val();
    var county=$("#county").val();
    var address=$("#address").val();
    var code=$("#code").val();
    var rkey=$("#rkey").val();
    var newAliasName =$.trim($("#aliasName").val());
    var oldAliasName = $("#hiddenAliasName").val();
    if(newAliasName != oldAliasName){
        if ( !$("#aliasArea").is(":hidden") && !validAliasName(newAliasName)) {
            scroller("aliasName", 200);
            return;
        }
    }
    if($("#birthdayYear").val()=='0'^$("#birthdayMonth").val()=='0'){
        alert("请选择完整的生日");
        return;
    }
    if (!validNickname(nickName)) {
        scroller("nickName", 200);
        return;
    }
    if(sex==null||sex==""){
        alert("请选择性别");
        return;
    }
    /*if(!validRealname(realName)){
        scroller("realName", 200);
        return;
    }*/
    var hobby="";
    $(".hobul").children().each(function(){
        if($(this).attr("class")=="selected i-li"){
            hobby+=$(this).val()+",";
        }
    });
    var name=$("#otherId").attr("name");
    var other=$("#otherId").val();
    var datas = "1=1";
    datas += "&userVo.nickName=" + encodeURI(encodeURI(nickName));
    //datas += "&userVo.realName=" + encodeURI(encodeURI(realName));
    datas += "&userVo.sex=" + sex;
    datas += "&userVo.birthday=" + birthday;
    datas += "&userVo.hobby=" + hobby;
    datas += "&"+name+"=" + other;
    datas += "&userVo.code=" + code;
    datas += "&userVo.rkey=" + rkey;


    if(newAliasName != $.trim(oldAliasName)){
        datas += "&newAliasName=" + encodeURI(encodeURI(newAliasName));
    }
    datas+="&now=" + new Date().getTime();

    jQuery.ajax({
        type : "post",
        url : "/user/userinfo/updateUserInfo.action",
        data : datas,
        timeout: 10000,
        success : function(html) {
            if (html=="2") {
                newBox();
                setTimeout("window.location.reload(true);", 3000);
            } else if(html == "nicknameUsed"){
                $("#nickName_msg").parent().addClass("prompt-error");
                $("#nickName_msg").parent().removeClass("prompt-06");
                $("#nickName_msg").html("此昵称已被其他用户抢注，请修改");
                $("#nickName").attr("class","itxt itxt-error");
                scroller("nickName", 200);
            } else if(html == "aliasnameUsed"){
                $("#aliasName_msg").parent().addClass("prompt-error");
                $("#aliasName_msg").parent().removeClass("prompt-06");
                $("#aliasName_msg").html("此登录名已被其他用户抢注，请修改");
                $("#aliasName").attr("class","itxt itxt-error");
                scroller("aliasName", 200);
            }else if(html == "threeMore"){
                $("#aliasName_msg").parent().addClass("prompt-error");
                $("#aliasName_msg").parent().removeClass("prompt-06");
                $("#aliasName_msg").html("您今日已超出修改次数限制，请24小时后重试");
                $("#aliasName").attr("class","itxt itxt-error");
                scroller("aliasName", 200);
            }
            else if(html != "1"){
                newBoxSensitiveWord(html);
                setTimeout("jdThickBoxclose()", 3000);
            }else {
                alert("保存失败，请稍后再试...");
            }
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
$('body').delegate('.delNewBox-btn','click',function(){
    window.location.reload(true);
});


function newBoxSensitiveWord(sensitiveWord) {
    jQuery.jdThickBox({
        type: "text",
        title: "提示",
        width: 300,
        height:150,
        source: "<div class=\"tip-box icon-box\"><span class=\"warn-icon m-icon\"></span><div class=\"item-fore\"><h3 class=\"ftx-04\"> 内容中含有屏蔽词  \""+sensitiveWord+"\" 请重新填写</h3><div class=\"op-btns\"><a href=\"javascript:void(0)\" class=\"btn-9\" onclick=\"jdThickBoxclose()\">关闭</a></div></div></div>",
        _autoReposi: true
    });
}

/**
 * 昵称规则
 * @param nickname
 */
function validNickname(nickName){
    if (nickName == "") {
        $("#nickName_msg").parent().addClass("prompt-error");
        $("#nickName_msg").parent().removeClass("prompt-06");
        $("#nickName").attr("class","itxt itxt-error");
        $("#nickName_msg").html("请输入昵称");
        return false;
    }
    var reg = new RegExp("^([a-zA-Z0-9_-]|[\\u4E00-\\u9FFF])+$", "g");
    var reg_number = /^[0-9]+$/; // 判断是否为数字的正则表达式
    if (reg_number.test(nickName)) {
        $("#nickName_msg").parent().addClass("prompt-error");
        $("#nickName_msg").parent().removeClass("prompt-06");
        $("#nickName_msg").html("昵称不能设置为手机号等纯数字格式，请您更换哦^^");
        $("#nickName").attr("class","itxt itxt-error");
        return false;
    } else if (nickName.replace(/[^\x00-\xff]/g, "**").length < 4 || nickName.replace(/[^\x00-\xff]/g, "**").length > 20) {
        $("#nickName_msg").parent().addClass("prompt-error");
        $("#nickName_msg").parent().removeClass("prompt-06");
        $("#nickName_msg").html("4-20个字符，可由中英文、数字、“_”、“-”组成");
        $("#nickName").attr("class","itxt itxt-error");
        return false;
    } else if (!reg.test(nickName)) {
        $("#nickName_msg").parent().addClass("prompt-error");
        $("#nickName_msg").parent().removeClass("prompt-06");
        $("#nickName_msg").html("昵称格式不正确");
        $("#nickName").attr("class","itxt itxt-error");
        return false;
    }
    return true;
}

/**
 * 真实姓名规则
 * @param realName
 */
function validRealname(realName){
    var uname_ = replaceChar(realName, "·"); // 去掉姓名中的·
    var reg = new RegExp("^([a-zA-Z]|[\\u4E00-\\u9FFF])+$", "g");
    if (realName == null || realName == "") {
        $("#realName").addClass("red");
        $("#realName_msg").parent().addClass("prompt-error");
        $("#realName_msg").parent().removeClass("prompt-06");
        $("#realName_msg").html("真实姓名不能为空");
        $("#realName").attr("class","itxt itxt-error");
        return false;
    } else if (realName.indexOf("··") != -1) {
        // 姓名中不允许有连续多个·
        $("#realName").addClass("red");
        $("#realName_msg").parent().addClass("prompt-error");
        $("#realName_msg").parent().removeClass("prompt-06");
        $("#realName_msg").html("真实姓名中不允许有连续多个·");
        $("#realName").attr("class","itxt itxt-error");
        return false;
    } else if (realName.substring(0, 1) == "·" || realName.substring(realName.length - 1) == "·") {
        // 姓名前后不能加·
        $("#realName_msg").parent().addClass("prompt-error");
        $("#realName_msg").parent().removeClass("prompt-06");
        $("#realName_msg").html("真实姓名前后不能加·");
        $("#realName").attr("class","itxt itxt-error");
        return false;
    } else if (!reg.test(uname_)) {
        $("#realName_msg").parent().addClass("prompt-error");
        $("#realName_msg").parent().removeClass("prompt-06");
        $("#realName_msg").html("真实姓名中包含不符合规范的字符");
        $("#realName").attr("class","itxt itxt-error");
        return false;
    } else if (realName.replace(/[^\x00-\xff]/g, "**").length < 4 || realName.replace(/[^\x00-\xff]/g, "**").length > 20) {
        $("#realName_msg").parent().addClass("prompt-error");
        $("#realName_msg").parent().removeClass("prompt-06");
        $("#realName_msg").html("请输入真实姓名，英文长度:4-20   中文长度:2-10");
        $("#realName").attr("class","itxt itxt-error");
        return false;
    }
    $("#realName").attr("class","itxt itxt-succ");
    $("#realName_msg").html("");
    return true;
}

function checkNickName(nickName) {
    $("#nickName_msg").html("昵称唯一性验证中，请稍等...");
    jQuery.ajax({
        type: "GET",
        url : "/user/petName/checkPetName.action?callback=?",
        data : "petNewName=" + encodeURI(encodeURI(nickName)),
        dataType: "jsonp",
        timeout: 6000,
        success : function(obj) {
            if ("0" == obj.type) {
                $("#nickName_msg").parent().removeClass("prompt-error");
                $("#nickName_msg").parent().addClass("prompt-06");
                $("#nickName_msg").html("");
                $("#nickName").attr("class","itxt itxt-succ");
            }
            else if ("1" == obj.type) {
                $("#nickName_msg").parent().addClass("prompt-error");
                $("#nickName_msg").parent().removeClass("prompt-06");
                $("#nickName_msg").html("此昵称已被其他用户抢注，请修改");
                $("#nickName").attr("class","itxt itxt-error");
            }else{
                $("#nickName_msg").parent().addClass("prompt-error");
                $("#nickName_msg").parent().removeClass("prompt-06");
                $("#nickName_msg").html("内容中含有屏蔽词  \""+obj.type+"\" 请重新填写");
                $("#nickName").attr("class","itxt itxt-error");
            }
        },
        error: function(){
            alert("网络异常，请稍后再试！");
        }
    });
}


// deal userName
$("#aliasName").focus(function() {
    // alert("aliasName focus");
    $("#aliasName_msg").parent().removeClass("prompt-error");
    $("#aliasName_msg").parent().addClass("prompt-06");
    $("#aliasName_msg").html("支持中文、字母、数字、“-”、“_”两种及以上的组合，4-20个字符");
    $("#aliasName").attr("class","itxt");
});

//校验别名是否正确
$("#aliasName").blur(function() {
    // alert("aliasName blur");
    var aliasName = $.trim($("#aliasName").val());
    var oldAliasName = $("#hiddenAliasName").val();
    console.info(aliasName);
    console.info(oldAliasName);
    $("#aliasName").val(aliasName);
    if(oldAliasName == aliasName){
        $("#aliasName_msg").parent().removeClass("prompt-error");
        $("#aliasName_msg").parent().addClass("prompt-06");
        $("#aliasName_msg").html("");
        $("#aliasName").attr("class","itxt itxt-succ");
        return;
    }
    if (!validAliasName(aliasName)) {
        return;
    }
    checkAliasName(aliasName);
});

/**
 * 别名校验规则
 */
/**
 * 昵称规则
 * @param aliasName
 */
function validAliasName(aliasName){
    if (aliasName == "") {
        $("#aliasName_msg").parent().addClass("prompt-error");
        $("#aliasName_msg").parent().removeClass("prompt-06");
        $("#aliasName").attr("class","itxt itxt-error");
        $("#aliasName_msg").html("请输入登录名");
        return false;
    }
    var reg = new RegExp("^([a-zA-Z0-9_-]|[\\u4E00-\\u9FFF])+$", "g");
    var reg_number = /^[0-9]+$/; // 判断是否为数字的正则表达式
    if (reg_number.test(aliasName)) {
        $("#aliasName_msg").parent().addClass("prompt-error");
        $("#aliasName_msg").parent().removeClass("prompt-06");
        $("#aliasName_msg").html("登录名不能设置为手机号等纯数字格式，请您更换哦^^");
        $("#aliasName").attr("class","itxt itxt-error");
        return false;
    } else if (aliasName.replace(/[^\x00-\xff]/g, "**").length < 4 || aliasName.replace(/[^\x00-\xff]/g, "**").length > 20) {
        $("#aliasName_msg").parent().addClass("prompt-error");
        $("#aliasName_msg").parent().removeClass("prompt-06");
        $("#aliasName_msg").html("长度只能在4-20个字符之间");
        $("#aliasName").attr("class","itxt itxt-error");
        return false;
    } else if (!reg.test(aliasName)) {
        $("#aliasName_msg").parent().addClass("prompt-error");
        $("#aliasName_msg").parent().removeClass("prompt-06");
        $("#aliasName_msg").html("支持中文、字母、数字、“-”、“_”两种及以上的组合，4-20个字符");
        $("#aliasName").attr("class","itxt itxt-error");
        return false;
    }
    return true;
}

function checkAliasName(aliasName) {
    $("#aliasName_msg").html("登录名唯一性验证中，请稍等...");
    jQuery.ajax({
        type: "GET",
        url : "/user/petName/checkAliasName.action?callback=?",
        data : "aliasNewName=" + encodeURI(encodeURI(aliasName)),
        dataType: "jsonp",
        timeout: 6000,
        success : function(obj) {
            if ("0" == obj.type) {
                $("#aliasName_msg").parent().removeClass("prompt-error");
                $("#aliasName_msg").parent().addClass("prompt-06");
                $("#aliasName_msg").html("");
                $("#aliasName").attr("class","itxt itxt-succ");
            } else if ("3" == obj.type||"1" == obj.type) {
                $("#aliasName_msg").parent().addClass("prompt-error");
                $("#aliasName_msg").parent().removeClass("prompt-06");
                if (obj.moreAlias != null && obj.moreAlias.length > 0) {
                    var html = "<dl class='recommend-names;'>";
                    html += "<dt>已注册，推荐您使用</dt>";
                    for (var i = 0; i < obj.moreAlias.length; i++) {
                        html+=" <dd><input name='moreAliasRadio' onclick='selectMe(this);' type='radio' class ='radio' value ='"+obj.moreAlias[i]+"'><span>"+ obj.moreAlias[i] +"</span></dd>";
                    }
                    html+="</dl>";
                    $("#aliasName_msg").html(html);
                }else{
                    $("#aliasName_msg").html("此登录名已被其他用户抢注，请修改");
                }
                $("#aliasName").attr("class","itxt itxt-error");
            }else {
                $("#aliasName_msg").parent().addClass("prompt-error");
                $("#aliasName_msg").parent().removeClass("prompt-06");
                $("#aliasName_msg").html("内容中含有屏蔽词  \""+obj.type+"\" 请重新填写");
                $("#aliasName").attr("class","itxt itxt-error");
            }
        },
        error: function(){
            alert("网络异常，请稍后再试！");
        }
    });
}
/**
 * 选中用户名
 * @param option
 */
function selectMe(option) {
    $("#aliasName_msg").parent().removeClass("prompt-error");
    $("#aliasName_msg").parent().addClass("prompt-06");
    $("#aliasName_msg").html("");
    $("#aliasName").attr("class","itxt itxt-succ");
    $("#aliasName").val(option.value);
}
/**
 * 修改用户别名
 */
function changeAliasName(){    
                //绑定了手机 可以进行修改
                $("#aliasBefore").hide();
                $("#aliasAfter").show();
                var _aliasName =$.trim($("#aliasName").val());
                $("#aliasName").focus().val(_aliasName);
}

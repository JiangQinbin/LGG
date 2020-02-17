/**
 * show birthday
 */
var nowdate = new Date(); // 获取当前时间的年份
var nowYear = nowdate.getFullYear();// 当前年份
var nowMonth = nowdate.getMonth() + 1;// 当前月份
// 清空年份、月份的下拉框 进行重新添加选项
$("#birthdayYear").empty();
$("#birthdayMonth").empty();

// 首先为年份字段 添加选项
$("<option value='0' disabled='' selected='selected'>请选择：</option>").appendTo(
    "#birthdayYear");
for (var startYear = nowYear; startYear >= 1930; startYear--) {
    var year;
    if ((startYear + 11) % 10 == 0) { // 模糊年份
        year = (startYear - 9 + "").substring(2);
        $("<option value='" + year + "后'>" + year + "后</option>").appendTo(
            "#birthdayYear");
    }
    $("<option value='" + startYear + "'>" + startYear + "</option>").appendTo(
        "#birthdayYear");
}
$("<option value='0' disabled='' selected='selected'>请选择：</option>").appendTo(
    "#birthdayMonth");
for (var startMonth = 1; startMonth <= 12; startMonth++) {
    $("<option value='" + startMonth + "'>" + startMonth + "</option>")
        .appendTo("#birthdayMonth");
}
$("<option value='0' disabled='' selected='selected'>请选择：</option>").appendTo(
    "#birthdayDay");
if (originalBirthdayYear == null || originalBirthdayYear == ""
    || originalBirthdayYear == "1") {
    $("#birthdayYear").val(0);
    $("#birthdayMonth").val(0);
    $("#birthdayDay").val(0);
} else {
    $("#birthdayYear").val(originalBirthdayYear);
    $("#birthdayMonth").val(originalBirthdayMonth);
    changeSelectBrithdayDay();
    // setTimeout(function() {$("#birthdayDay").val(originalBirthdayMonth);},
    // 1);
}

// 选择生日年份后触发
$("#birthdayYear").change(function() {
    changeSelectBrithdayDay();
});

// 选择生日月份后触发
$("#birthdayMonth").change(function() {
    changeSelectBrithdayDay();
});

// 根据所选择的年份、月份计算月最大天数,并重新填充生日下拉框中的日期项
function changeSelectBrithdayDay() {

    var maxNum;
    var month = $("#birthdayMonth").val();
    var year = $("#birthdayYear").val();
    if (year == 0) { // 如果年份没有选择，则按照闰年计算日期(借用2004年为闰年)
        year = 2004;
    }
    if (month == 0) {
        maxNum = 31;
    } else if (month == 2) {
        if (year.toString().substring(2) == "后") { // 判断年份是否为模糊年份
            // 如果是模糊年份则天数设为29
            maxNum = 29;
        } else {
            if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) { // 判断闰年
                maxNum = 29;
            } else {
                maxNum = 28;
            }
        }
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
        maxNum = 30;
    } else {
        maxNum = 31;
    }

    // 清空日期的下拉框 进行重新添加选项
    $("#birthdayDay").empty();
    if (month == 0) {
        $("<option value='0' disabled='' selected='selected'>请选择：</option>")
            .appendTo("#birthdayDay");
    } else {
        for (var startDay = 1; startDay <= maxNum; startDay++) {
            $("<option value='" + startDay + "'>" + startDay + "</option>")
                .appendTo("#birthdayDay");
        }
        if (maxNum >= originalBirthdayDay) {
            setTimeout(function() {
                $("#birthdayDay").val(originalBirthdayDay);
            }, 1);
            // $("#birthdayDay").val(originalBirthdayDay);//设置当前年份为所选
        } else {
            setTimeout(function() {
                $("#birthdayDay").val(1);
            }, 1);
            // $("#birthdayDay").val(1);//设置当前年份为所选
            originalBirthdayDay = 1;
        }
    }
}

/**
 * 地区联动
 */
$("#province").attr("value", originalProvince);// 设置当前省份
var initValue = 0;

$("#province").change(
    function() {
        if ($("#province").val() == -1) {
            $("#city").show();
            $("#county").show();
            $("#city").empty(); // 清空市区选项
            $("#county").empty(); // 清空县区选项
            return;
        }
        jQuery.ajax({
            type : "post",
            url : "/user/userinfo/queryAreaList.action",
            data : "areaId=" + $("#province").val(),
            success : function(html) {
                $("#city").empty(); // 清空市区选项
                var areaInfos = html.split(";");
                for (var i = 0; i < areaInfos.length - 1; i++) {
                    var info = areaInfos[i].split(":");
                    $(
                        "<option value='" + info[0] + "'>" + info[1]
                        + "</option>").appendTo("#city");
                }
                if (areaInfos.length > 1) {
                    if (initValue == 0) {
                        $("#city").attr("value", originalCity);// 设置当前省份
                    }
                }
                $("#city").change(); // 调用县区的连动

            },
            error : function(data) {
                // alert("网络传输异常，无法获取地区信息");
            }
        });

    });
$("#city").change(
    function() {
        if ($("#city").val() == -1) {
            $("#county").show();
            $("#county").empty(); // 清空县区选项
            // $("<option value='-1'>请选择位置</option>").appendTo("#county");
            return;
        }
        var nowProvName = $("#province").find("option:selected").text();
        if (nowProvName == "香港" || nowProvName == "澳门"
            || nowProvName == "台湾" || nowProvName == "海外") {
            $("#city").show();
            $("#city").hide();
        } else if (nowProvName == "重庆" || nowProvName == "天津") {
            $("#city").show();
            $("#city").hide();
        } else {
            $("#city").show();
        }
        jQuery.ajax({
            type : "post",
            url : '/user/userinfo/queryAreaList.action',
            data : "areaId=" + $("#city").val(),
            success : function(html) {
                $("#county").empty(); // 清空县区选项
                var areaInfos = html.split(";");
                for (var i = 0; i < areaInfos.length - 1; i++) {
                    var info = areaInfos[i].split(":");
                    $(
                        "<option value='" + info[0] + "'>" + info[1]
                        + "</option>").appendTo("#county");
                }
                if (areaInfos.length > 1) {
                    if (initValue == 0) {
                        $("#county").attr("value", originalCounty);// 设置当前省份
                        initValue = 1;
                    }
                }
                $("#county").change(); // 调用地区的连动
            },
            error : function(data) {
                // alert("网络传输异常，无法获取地区信息");
            }
        });

    });
$("#county").change(
    function() {
        var nowProvName = $("#province").find("option:selected").text();
        if (nowProvName == "香港" || nowProvName == "澳门"
            || nowProvName == "台湾" || nowProvName == "海外") {
            $("#county").show();
            $("#county").hide();
        } else if (nowProvName == "重庆" || nowProvName == "天津") {
            $("#county").show();
            $("#county").show();
        } else {
            $("#county").show();
        }
        $("#city_msg").html("");
    });

$("#province").change(); // 调用县区的连动

// 去掉空格 并用去掉空格后的字符串替代显示
function delspace(name) {
    var inputValue = $("#" + name).val();
    while (inputValue.indexOf(" ") != -1) {
        inputValue = inputValue.replace(" ", "");
    }
    $("#" + name).val(inputValue);
}

// 去掉左右尖括号 并用去掉空格后的字符串替代显示
function replaceBrackets(name) {
    var inputValue = $(name).val();
    while (inputValue.indexOf("<") != -1) {
        inputValue = inputValue.replace("<", "[");
    }
    while (inputValue.indexOf(">") != -1) {
        inputValue = inputValue.replace(">", "]");
    }
    while (inputValue.indexOf("&") != -1) {
        inputValue = inputValue.replace("&", " ");
    }
    $(name).val(inputValue);
}

// 去掉某个字符 （消除对后面验证正则表达式的判定影响）
function replaceChar(name, char) {
    var inputValue = name;
    while (inputValue.indexOf(char) != -1) { // 去掉-影响
        inputValue = inputValue.replace(char, "");
    }
    return inputValue;
}
$("#birthdayYear option[value='0']").removeAttr("disabled");
$("#birthdayMonth option[value='0']").removeAttr("disabled");
$("#birthdayDay option[value='0']").removeAttr("disabled");
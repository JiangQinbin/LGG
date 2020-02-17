
//提交用户基本信息修改
function uploadDefaultImg() {
    var img="";
    $(".imgUl").children().each(function(){
        if($(this).attr("class")=="selected"){
            img=$(this).val();
            return false;
        }
    });
    if(img==""){
        alert("请选择默认头像");
        return;
    }
    document.getElementById("loading").style.display = "inline";
    jQuery.ajax({
        type : "post",
        url : "/user/userinfo/uploadDefaultImg.action",
        data : "img="+img,
        //timeout: 10000,
        success : function(html) {
            if (html=="2") {
                alert("头像保存成功");
                window.location.reload(true);
            } else {
                alert("上传失败，请稍后再试...");
            }
            document.getElementById("loading").style.display = "none";
        }
    });
}
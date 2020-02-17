<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=UTF-8">
<title>农户开店|林果果</title>
</head>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/md5.js"></script>
<script type="text/javascript">
/* 这里所有的函数用来判断是否可以进入下一步 */
 var c=0;
 var k=1;
 var mhh=0;
 var countdown=60; 
	function m() {
		$.post("jianchaServlet",{username112:$("#username1").val()},
				function(date) {
					$("#nemt").html(date);
					if(date=="")
						 c=1;
			        else
			        	 c=0;
				}
				);
	}
	function GVCode() {
		var obj = $("#Send");
		if($("#MobilePhone").val().length==0){
			document.getElementById("cha").style.display="block";
			document.getElementById("geshi1").style.display="none";
			document.getElementById("cha1").style.display="none";
			document.getElementById("geshi2").style.display="block";
			document.getElementById("MobilePhone").style.border="0.5px solid red";
			k=1;
			return;
		}
		if(k==2){
			settime(obj);
		    $.post("SendVCodeServlet",{Mphoneno1:$("#MobilePhone").val()},
		    function(date){
				if(date!=""){
					document.getElementById("gou").style.display="block";
					document.getElementById("geshi3").style.display="block";
	                }
		        else
		        	alert("请检查你的网络！");
			}
		    )
		}
	    
	}

	function TheNextStep() {
							document.getElementById("mokuai1").style.display="block"; 
						    document.getElementById("mokuai2").style.display="none";
						    document.getElementById("san").style.color="black";
						    document.getElementById("san1").style.backgroundColor="red";
						    document.getElementById("san1").style.height="1.5px";
						    document.getElementById("san2").style.background="red";
						    document.getElementById("san2").style.border=" 1px solid red";
						} /* else {
							document.getElementById("mokuai4").style.display="block"; 
						    document.getElementById("mokuai2").style.display="none";
						    var b=""+date;
						    var a=b.length;
						    $("#hao").html(date.substring(0, 10));
						    $("#ming").html(date.substring(11, a));
						} */
						      
	function mm() {
		$("#nemt1").html("6~16位数字或字母，区分大小写");
	}
	function mmm() {
		if($("#password1").val().length>5&&$("#password1").val().length<17){
			$("#nemt1").html("");
		}else{
			$("#nemt1").html("密码格式不正确");
		}
	}
	
	function jjj12() {
		if ($("#password4").val()!=$("#password1").val()) {
			$("#nemt9").html("两次输入密码不一致！");
		} else {
			$("#nemt9").html("");
		}
	}

	function firstStep() {
		var name = $("#username1").val();
		var ma =  $("#password1").val();
		var dizhi = $("#password4").val();
		var src1 = $('#pic1').attr('src');
		var src2 = $('#pic2').attr('src');
		var src3 = $('#pic3').attr('src');
		if(name==""||ma==""||dizhi==""||src1==""||src2==""||src3==""){
			alert("请确认信息是否填写完整！");
		} else {
			var mycars = new Array(3);
			for (var i = 0; i <3 ; i++) {
				mycars[i] = document.getElementById('file' + i).files[0];
			}
			var formData = new FormData();
			formData.append("IdCardFront", mycars[0]);
			formData.append("IdCardVerso", mycars[1]);
			formData.append("HouseholdRegister", mycars[2]);
			formData.append("name", name);
			formData.append("ma", ma);
			formData.append("dizhi", dizhi);
			$.ajax({
	            type: "post",
	            url:"RealNameCertification",
	            data:formData,
	            contentType: false,
	            processData: false,
	            success: function(data) {
	            	if(data==1){
	            		document.getElementById("mokuai3").style.display="block"; 
					    document.getElementById("mokuai1").style.display="none";
					    document.getElementById("si").style.color="black";
					    document.getElementById("si1").style.backgroundColor="red";
					    document.getElementById("si1").style.height="1.5px";
					    document.getElementById("si2").style.background="red";
					    document.getElementById("si2").style.border=" 1px solid red";
	            	}
	            	else if(data==0){
	            		alert("抱歉！开店失败");
	            	}
	            	else if(data==2){
	            		alert("抱歉！您不符合开店条件");
	            	}
	            	else if(data==3){
	            		alert("抱歉！您上传的图片不符合规范");
	            	}
	            	else if(data==404){
	            		alert("该农户已开店");
	            	}
	            	else{
	            		alert("未知错误");
	            	}
	            },
			    error : function(returndata) {
				    alert("网络存在问题，请检查网络！");
			    }
	        });
 		}
	} 
	function shoujihao() {
		if($("#MobilePhone").val().length==0){
			document.getElementById("cha").style.display="block";
			document.getElementById("geshi1").style.display="none";
			document.getElementById("cha1").style.display="none";
			document.getElementById("geshi2").style.display="block";
			document.getElementById("MobilePhone").style.border="0.5px solid red";
			k=1;
		}else{
	    if($("#MobilePhone").val().length==11){
			var b=$("#MobilePhone").val();
			var c=Number(b);
			 if (!isNaN(c)){
				document.getElementById("cha").style.display="none";
				document.getElementById("cha1").style.display="block";
				document.getElementById("geshi1").style.display="none";
				document.getElementById("geshi2").style.display="none";
				document.getElementById("MobilePhone").style.border="0.5px solid gray";
				k=2
			}
			else{
				document.getElementById("cha").style.display="block";
				document.getElementById("geshi1").style.display="block";
				document.getElementById("cha1").style.display="none";
				document.getElementById("geshi2").style.display="none";
				document.getElementById("MobilePhone").style.border="0.5px solid red";
				k=1;
			}
		}
		else{
			document.getElementById("cha").style.display="block";
			document.getElementById("cha1").style.display="none";
			document.getElementById("geshi1").style.display="block";
			document.getElementById("geshi2").style.display="none";
			document.getElementById("MobilePhone").style.border="0.5px solid red";
			k=1;
		}
	}
	}
	
	function query(){
			if(mhh==0){
				document.getElementById("Determine").style.borderColor="rgb(255, 60, 60)";
			    document.getElementById("Determine").style.backgroundColor="rgb(255, 60, 60)"; 
			    document.getElementById("Determine").disabled=undefined;
				mhh=1;
			}
			else{
				mhh=0;
				document.getElementById("Determine").style.borderColor="rgb(220, 220, 220)";
			    document.getElementById("Determine").style.backgroundColor="rgb(220, 220, 220)"; 
			    document.getElementById("Determine").disabled="disabled";
			}
	}
	function showPic(obj, id) {
		var newPreview = document.getElementById('pic' + id);
		newPreview.src = window.URL.createObjectURL(obj.files.item(0));
	}
</script>
<style type="text/css">
span{
color:red;
}
ziti{
color: rgb(255,0,0);
font-weight: bold;
font-family: 方正舒体;
}
ziti3{
position:relative;
font-family: 宋体;
font-size: 30px;
top:-22px;
left: 86px;
}
.ziti1{
position:relative;
left:26px;
font-size:46px;
}
.ziti2{
position:relative;
left:56px;
font-size:25px;
}
.biaodan{
position:relative;
height: 26px;
width: 188px;
}
.biaodan1{
position:relative;
height: 22px;
width: 166px;
font-size: 14px;
left: 16px;

}
.biaodan2{
position:relative;
height: 34px;
width: 100px;
font-size: 18px;
left: 49px;
top: 22px;

}
.biaodan3{
position:relative;
height: 40px;
width: 133px;
font-size: 16px;
left: 62px;
top: 22px;
border:0.5px solid;
border-color:#000000;

background-color:rgb(230, 230, 250);
}
.biaodan4{
position:absolute;
height: 40px;
width: 100px;
font-size: 18px;
left: 363px;
top: 293px;
border: solid;
font-weight:bold;
border-color: rgb(220, 220, 220);
background-color:rgb(220, 220, 220);
color: #FFFFFF;
}
.zitik{
font-size: 22px;
color: #000000;
}
.zitik9{
position:relative;
left: 36px;
top: 18px;
}
zitik1{
font-size: 16px;
}
.bianju{
margin-left:0px;
}
.bianju1{
margin-left: -66px;
}
.bianju2{
margin-left: -40px;
}
.bianju2m{
margin-left: -66px;
}
.bianju3{
margin-left: -14px;
}
.zhuce{
margin-left: 18px;
font-size:16px;
height: 34px;
width:133px;
border: solid;
border-color: rgb(255, 60, 60);
background-color:rgb(255, 60, 60);
color: #FFFFFF;
}
.aa{
color: gray;
font-size: 16px;
font-weight: bold;
}
.aa1{
color:black;
position: absolute;
left: 398px;
}

.aa3{
position: absolute;
left: 598px;
}
.aa4{
position: absolute;
left: 808px;
}
.bb{
position: absolute;
width: 216px;
background-color: gray;
border: none;
top: 127px;
}
.aaa1{
position: absolute;
left: 328px;
background-color: red;
height:1.5px;
}

.aaa3{
position: absolute;
left: 544px;

}
.aaa4{
position: absolute;
left: 736px;

}
.container {
position:absolute;
left:244px;
text-align: center;
width: 760px;
height: 399px;
background-color: #FFFFFF;
padding: 20px;
}

.content1 {
border-top-width: 3px;
border-right-width: 1px;
border-bottom-width: 1px;
border-left-width: 1px;
border-top-style: solid;
border-right-style: solid;
border-bottom-style: solid;
border-left-style: solid;
border-top-color: #006400;
border-right-color: #CFCFCF;
border-bottom-color: #CFCFCF;
border-left-color: #CFCFCF;
background-color: #FFFFFF;
}
.round{
position:absolute;
width: 22px;
height: 22px;
background: #CFCFCF;
border: 1px solid #CFCFCF;
border-radius: 50%;
text-align: center;
line-height: 22px;
color: #FFFFFF;
top: 105px;
font-size: 18px;
font-weight: bold;
}
.round1{
background: red;
border: 1px solid red;
left: 367px;
}
.round3{
left: 567px;
}
.round4{
left: 767px;
}
.round5{
position:absolute;
background: rgb(255,215,0);
border: 1px solid rgb(255,215,0);
width: 14px;
height: 14px;
line-height: 14px;
top: 72px;
left: 126px;
}
.round56{
position:relative;
background: rgb(50,205,50);
border: 1px solid rgb(50,205,50);
top: 32px;
left: 346px;
display: none;
}
.round57{
position:absolute;
background: rgb(255,0,0);
border: 1px solid rgb(255,0,0);
top: 133px;
left: 542px;
display: none;
}
.round67{
position:absolute;
top: 133px;
left: 542px;
}
.bn{
position: relative;
left: -136px;
}
.bn1{
position: relative;
left: 116px;
display: none;
}
.bn2{
position: absolute;
color:red;
top: 120px;
left: 563px;
font-size:14px;
display: none;
}
.huan{
font-size:66px;
font-weight: bold;
color: #228822;
position: absolute;
left: 166px;
top:66px;
}
.huan1{
font-size:28px;
font-weight: bold;
color: #228822;
position: absolute;
left: 226px;
top:96px;
}
.huan2{
background: rgb(255, 60, 60);
border: 1px solid rgb(255, 60, 60);
position: absolute;
left: 228px;
top:156px;
}
.huan3{
position: absolute;
top: 228px;
left: 216px;
font-size: 14px;
font-weight:bold;
color: #575757;
}
.huan4{
top: 258px;
}
.exist{
position:relative;
top:88px;
color: #000000;
}
.exist1{
top:106px;
}
.exist2{
position:relative;
top:124px;
height: 40px;
width: 233px;
font-size: 18px;
border: solid;
font-weight:bold;
border-color: rgb(255, 60, 60);
background-color:rgb(255, 60, 60);
color: #FFFFFF;
border-radius: 3%;
}
.exist3{
position:relative;
top:142px;
color: #FF7256;
}
.exist4{
position:relative;
top:106px;
}
.xiyi{
position:absolute;
left:20%;
}
.fileinput-button {
            position: relative;
            display: inline-block;
            overflow: hidden;
        }

        .fileinput-button input{
            position:absolute;
            right: 0px;
            top: 0px;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            font-size: 200px;
        }
.img{
position: relative;
float:left;
width: 200px;
height: 180px;
border: 1px solid #0000ff;
left:66px;
}
.img1{
left:82px;
}
.img2{
left:100px;
}
.imgg{
position: relative;
width: 100%;
height: 100%;
}
</style>
<body>
<%session.setMaxInactiveInterval(1200); %>
<ziti class="ziti1">林果果</ziti><br/>
<ziti class="ziti2">L&nbsp;&nbsp;G&nbsp;&nbsp;G</ziti>
<ziti3>农户开店</ziti3>
<br><br>
<span id="yi" class="aa aa1">开店协议 </span><div class="round round1">1</div><hr id="yi1" class="bb aaa1" >
<span id="san" class="aa aa3">实名认证</span><div id="san2" class="round  round3">2</div><hr id="san1" class="bb aaa3" >
<span id="si" class="aa aa4">开店成功</span><div id="si2" class="round round4">√</div><hr id="si1" class="bb aaa4" >
<br><hr><br/>
<div  class="content1 container">
<div id="mokuai1" style="display:none;">
<form  method="post"  enctype="multipart/form-data" >
<span class="bianju zitik">姓名</span>&nbsp;&nbsp;&nbsp;<input class="biaodan" type="text" name="username" id="username1" tabindex="1" placeholder="户主姓名" ><br/>
<span class="bianju2 zitik">身份证号</span>&nbsp;&nbsp;&nbsp;<input class="biaodan" type="text" name="password" id="password1" tabindex="2" placeholder="户主身份证号"   > <br/>
<span class="bianju2m zitik">户口所在地</span>&nbsp;&nbsp;&nbsp;<input class="biaodan" type="text" name="password3" id="password4" tabindex="3" placeholder="户口详细地址" ><br/><br>
<span class="btn btn-success fileinput-button">
            <span>上传身份证（正面）</span>
            <input type="file" id="file0"  accept=".gif,.jpg,.png" onchange="showPic(this, 1)">
        </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="btn btn-success fileinput-button">
            <span>上传身份证（反面）</span>
            <input type="file" id="file1"  accept=".gif,.jpg,.png" onchange="showPic(this, 2)">
        </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="btn btn-success fileinput-button">
            <span>上传户口簿主页</span>
            <input type="file" id="file2"  accept=".gif,.jpg,.png" onchange="showPic(this, 3)">
        </span>
        <br>
        <div class="img">
        <img class="imgg" id="pic1" alt="" src="">
        </div>
        <div  class="img img1">
        <img class="imgg" id="pic2" alt="" src="">
        </div>
        <div class="img img2">
        <img class="imgg" id="pic3" alt="" src="">
        </div>
        <br><br><br><br><br><br><br><br><br><br>
<input class="zhuce" id="xiayibu"  name="xiayibu" type="button" value="开店" onclick="firstStep()"/><br/>
</form>
</div>

<div id="mokuai2" style="display:block;">
<br/><br/>
<span class="xiyi">1、农户户口所在地需在特产产地区域;</span><br>
<span class="xiyi">2、只能由户口簿中户主的身份证号认证;</span><br>
<span class="xiyi">3、不能将户口簿和省份证交由他人注册;</span><br>
<span class="xiyi">4、不能在店铺中售卖非自家特产;</span><br>
<span class="xiyi">5、违犯开店条例将永久取消农户的开店权力。</span><br><br><br>
<input id="checkbox" type="checkbox"  onclick="query()"/>我已认真阅读，并同意协议。
<input class="biaodan4" id="Determine" type="button" value="下一步"  onclick="TheNextStep()">
</div>
<div id="mokuai3" style="display:none;">
<div id="gougong" class="huan">√</div>
<div id="gougong1" class="huan1">恭喜，开店成功！</div>
<form action="FarmersCenter.jsp" method="post">
<input type="submit" value="农户中心" class="biaodan4 huan2">
</form>
<p class="huan3">欢迎您使用林果果，店名默认为登录名</p>
<p class="huan3 huan4">如您在使用过程中遇到什么问题，请及时反馈给我们</p>
</div>

</div>

<body>
</html>
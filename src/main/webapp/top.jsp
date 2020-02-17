<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/md5.js"></script>
<script type="text/javascript">
function myfunction() {
	 $.post("LoginToJudge.do",{},
			 function(date){
		 if(date==""){
			 document.getElementById("kaidian").style.display="none";
			 document.getElementById("denglu").style.display="block";
		 }
		 else if(date.substr(0,1)==2){
			 var yonghu = date.substr(1);
			 $("#yoonghu1").html(yonghu);
			 document.getElementById("denglu").style.display="none";
			 document.getElementById("kaidian").style.display="none";
			 $("#aa2").prop("href","goodsManagement.jsp");
			 $("#aa3").prop("href","createGoods.jsp");
			 $("#aa4").prop("href","storeManagement.jsp");
			 $("#aa5").prop("href","QuaryNonghuRrder.do");
		 }else if(date.substr(0,1)==1){
			 var yonghu =date.substr(1);
			 $("#yoonghu1").html(yonghu);
			 document.getElementById("denglu").style.display="none";
		 }
	 });
}
function biaozhi(a){
	var yonghu = "<%=session.getAttribute("yonghu")%>";
	for(var i =1 ;i <= 5;i++)
		document.getElementById("aa"+i).style.color="#FFFFFF";
	document.getElementById("aa"+a).style.color="#7FFFD4";
}
</script>
<style type="text/css">
body{
background-color: #111111;
color:#FFFFFF;
}
.div1{
position: relative;
width: 100%;
}
.zhu{
position:relative;
font-size: 24px;
font-weight: bold;
left:33px;
}
.zhu1{
position:relative;
left:26%;
}
.ziti{
position:relative;
color: #FFFFFF;
text-decoration: none;
font-size: 17px;
font-weight: bold;
top:5px;
}
.ziti1{
left:88px;
}
.ziti2{
left:108px;
}
.ziti3{
left:128px;
}
.ziti4{
left:148px;
}
.ziti5{
left:168px;
}
.kaidian{
position: relative;
float:right;
right: 32px;
color: #FFFFFF;
text-decoration: none;	
}
.denglu{
position: relative;
float:right;
right: 16px;
color: #FFFFFF;
text-decoration: none;
}
</style>
<body onload="myfunction()">
<div class="div1">
<span class="zhu">林果果&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;买家中心</span> 
<span id="yonghu"  class="zhu1">Hello!<span id="yoonghu1"></span></span>
<a id="denglu" href="/LGG/yici11.jsp?nonghu=1" target="_parent" class="denglu">登录</a>
<a id="kaidian" href="Registered.jsp" target="_parent" class="kaidian">开店</a>

</div>
<hr>
<div class="aa1">
<a id="aa1" class="ziti ziti1" href="main.jsp"  target="mainFrame" onclick="biaozhi(1)">首页</a>
<a id="aa2" class="ziti ziti2" href="main.jsp"  target="mainFrame" onclick="biaozhi(2)">商品管理</a>
<a id="aa3" class="ziti ziti3" href="main.jsp"  target="mainFrame" onclick="biaozhi(3)">商品上传</a>
<a id="aa4" class="ziti ziti4" href="main.jsp"  target="mainFrame" onclick="biaozhi(4)">店铺管理</a>
<a id="aa5" class="ziti ziti5" href="main.jsp"  target="mainFrame" onclick="biaozhi(5)">订单管理</a>
</div>
</body>
</html>
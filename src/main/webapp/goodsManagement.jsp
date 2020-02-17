<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
</head>
<style type="text/css">
.ziti1 {
	position: relative;
	top: 33%;
	left: 44%;
	font-size: 26px;
	font-weight: bold;
	color: #0000EE
}

.top1 {
	height: 66px;
	background-color: #FFF5EE;
}

.top2 {
	position: relative;
	width: 100%;
	text-align: center;
}

.dixia {
	position: relative;
	width: 100%;
	text-align: center;
}

.span {
	position: relative;
	font-size: 24px;
	top: 45%;
}

.top {
	height: 200px;
}
.title-img {
	position: relative;
	width:266px;
	height: 166px;
	border-width: 1px;
	border-style: solid;
	border-color: #FFFFFF;
	background-color: #EDEDED;
	border-radius: 2%;
	margin: 0px;
	text-align: center;
	overflow: hidden;
	display: inline-block;
}
.title-img1 {
	position: relative;
	width: 266px;
	height: 222px;
	border-width: 1px;
	border-style: solid;
	border-color: #FFFFFF;
	background-color: #EDEDED;
	border-radius: 2%;
	margin: 0px;
	text-align: center;
	overflow: hidden;
	display: inline-block;
}
.sapn{
font-size: 14px;
font-weight: bold;
color: #135612;
}
a{
cursor:pointer;
font-weight: bold;
color: #eb0a14;
}
.liang{
font-weight:bold;
color: #135612;
}
.di{
position: relative;
text-align: center;
width: 100%;
top:66px;
height: 66px;
}
.xiajia{
font-weight: bold;
font-size: 26px;
color: #135612;
}
.hhh{
font-size: 14px;
}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function start(){
	$.post("QueryGoods.do",{},
		    function(date){
		var leng = date.length;
		if(leng>0){
			document.getElementById("kkk").style.display = "none";
		var html = "";
		for(var i = 0; i<leng; i++){
			var manguo = date[i];
			html = html + "<div class='title-img1'>"
			+"<div class='title-img' onclick=update('"+manguo['manguoID']+"') onMouseOver=\"this.style.borderColor='#F00'\"  onMouseOut=\"this.style.borderColor='#FFFFFF'\">"
			+"<span class='sapn'>"+manguo['manguoname']+"</span>"
			+"<img height='88%' width='80%' alt='' src='http://www.linguoguo.com.cn:8080/farmers_picture/"+manguo['username']+"/"+manguo['manguoname']+"/file1.jpg'>"
				+"</div>"
				+"<span class='hhh'>销售量(件)：</span><span class='liang'>"+manguo['yeshouliang']+"</span>&nbsp;&nbsp;&nbsp;&nbsp;"
				+"<span class='hhh'>可售量(件)：</span><span class='liang'>"+manguo['keshouliang']+"</span><br>"
				+"<a onclick=delete2('"+manguo['manguoID']+"','"+manguo['username']+"','"+manguo['manguoname']+"')>删除</a>"
				+"</div>";
		}
		document.getElementById("ttt").innerHTML=html;
		}
	});
}
function delete2(manguoID,yonghu,manguoname){
	$.post("GoodsDelete.do",{manguoID:manguoID,yonghu:yonghu,manguoname:manguoname},
		    function(date){
		if(date==1){
			window.history.go(0);
		}
		else
			alert("删除失败！");
	});
}
function update(manguoID){
	var f=document.createElement('form');
    f.style.display='none';
    f.action='update.do';
    f.method='post';
    f.innerHTML='<input type="hidden" id="manguoID" name="manguoID" value="'+manguoID+'"/>';
    document.body.appendChild(f);
    f.submit();
}
</script>
<body onload="start()">
	<div class="top1">
		<span class="ziti1">我的商品</span>
	</div>
	<div id="kkk" class="dixia top">
		<span class="span">抱歉！您还没有上传任何商品</span>
	</div>
	<div id="ttt" class="top2">
		<!-- <div class="title-img1">
			<div class="title-img" onclick="start()" onMouseOver="this.style.borderColor='#F00'"  onMouseOut="this.style.borderColor='#FFFFFF'">
			<span class="sapn">攀枝花凯特芒果</span>
			<img height="88%" width="80%" alt="" src="F:/kkkk.jpg">
			</div>
			<span>销售量(件)：</span><span class="liang">259</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span>可售量(件)：</span><span class="liang">259</span><br>
			<a onclick=delete2('dsdfsfd')>删除</a>
		</div> -->
	</div>
	<div class="di">
	<span class="xiajia">将商品的可销售量改为0即为下架商品</span>
	</div>
</body>
</html>
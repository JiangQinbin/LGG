<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店铺管理</title>
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
.title-img {
	position: relative;
	width:288px;
	height: 200px;
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
.vodeo1 {
	position: relative;
	width:288px;
	height: 200px;
	border-width: 1px;
	border-style: solid;
	border-color: #FFFFFF;
	background-color: #EDEDED;
	border-radius: 2%;
	margin: 0px;
	text-align: center;
	overflow: hidden;
}
.vodeo {
	position: relative;
	width:288px;
	height: 244px;
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
	width: 288px;
	height: 225px;
	border-width: 1px;
	border-style: solid;
	border-color: #FFFFFF;
	background-color: #FFFFFF;
	border-radius: 2%;
	margin: 0px;
	text-align: center;
	overflow: hidden;
	display: inline-block;
}
.j {
	position: relative;
	opacity: 0.0;
	filter: Alpha(opacity = 0);
	width: 100%;
	height: 10%;
}
.fileLabel {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	color: #949494;
}

.fileLabel1 {
	text-align: center;
	font-size: 111px;
	font-weight: bold;
	color: #949494;
}
.h {
	width: 88px;
	height: 20px;
	border-width: 1px;
	border-style: solid;
	border-color: #FFFFFF;
	color: #949494;
}
.dixia{
position: relative;
width: 100%;
text-align: center;
}
.span{
position:relative;
font-size: 24px;
top:45%;
}
.top{
height: 200px;
}
.k {
	position: relative;
	width: 100%;
	height: 100%;
	top: -19px;
}
.input{
position: relative;
width: 88px;
height: 36px;
background-color: #fdfcfc;
font-size: 18px;
color: #f67037;
}
a{
text-decoration: none;
cursor:pointer
}
.a{
font-weight: bold;
}
.div{
position: relative;
width: 100%;
text-align: center;
}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/video.min.js"></script>
<script type="text/javascript">
function showVideo(obj, id) {
	var pathm = obj.value;
	var noo = 1;
	var index = pathm.lastIndexOf("."); //（考虑严谨用lastIndexOf(".")得到）得到"."在第几位
	pathm = pathm.substring(index); //截断"."之前的，得到后缀
	if (pathm != ".mp4" && pathm != ".rmvb" && pathm != ".avi"
			&& pathm != ".ts") { //根据后缀，判断是否符合视频格式
		noo = 0
	}
	if (noo == 1) {
		document.getElementById('fileId' + id).style.display = "none";
		document.getElementById('label' + id).style.display = "none";
		document.getElementById('labe' + id).style.display = "none";
		document.getElementById('input' + id).style.display = "block";
		/* var html1 = "<video id='kk6' class='k' data-html5-video autoplay preload='metadata' controls preload='auto' data-setup='{}' ><source src='css/11.mp4' type='video/mp4'/></video>";
		 */
		 var html1 = document.getElementById("video6");
		 html1.innerHTML="<video id='pic6' class='k' data-html5-video autoplay preload='metadata' controls preload='auto' data-setup='{}' ><source src='"+window.URL.createObjectURL(obj.files.item(0))+"' type='video/mp4'/></video>";
	} else {
		alert("要求视频格式为mp4!");
	}
	return;
}
function choose(id) {
	var newPreview = document.getElementById('pic' + id);
	var newfile = document.getElementById('fileId' + id);
	newPreview.src = "";
	newfile.outerHTML = newfile.outerHTML;
	document.getElementById('fileId' + id).style.display = "block";
	document.getElementById('label' + id).style.display = "block";
	document.getElementById('labe' + id).style.display = "block";
	document.getElementById('input' + id).style.display = "none";
}
function addGoods(numberof) {
	var number = 0;
    var mycars = document.getElementById('fileId6').files;
		if (mycars.length != 0)
			number++;
	if (number < numberof) {
		alert("请先选择视频!");
		return;
	} else {
		var formData = new FormData();

			formData.append("file", mycars[0]);

		$.ajax({

			url : 'QueryVodeoServlet',

			type : 'post',

			cache : false,

			data : formData,

			processData : false,

			contentType : false,
			async : false,
			success : function(returndata) {
				if(returndata==0){
					alert("上传失败！");
				}
				if(returndata==1){
					alert("上传成功！");
					window.history.go(0);
				}
			},
			error : function(returndata) {
				alert("上传失败！");
			}
		});

	}
}
function start(){
	$.post("QueryVideo.do",{},
		    function(date){
           if(date==""){
        	   document.getElementById("kkk").style.display = "block";
        	   document.getElementById("kkkk").style.display = "none";
           }
           else{
        	   document.getElementById("kkk").style.display = "none";
        	   document.getElementById("kkkk").style.display = "block";
        	   /*  var html = "<video id='' class='k' data-html5-video autoplay preload='metadata' controls preload='auto' data-setup='{}' ><source src='http://www.linguoguo.com.cn:8080/farmers_picture/666666/6666661556267912024.mp4' type='video/mp4'/></video>"
        	   document.getElementById("kkkk").innerHTML=html;  */
        	   var leng = date.length;
        	   if(leng>=10){
        		   document.getElementById("shangchuan1").style.display = "none";
            	   document.getElementById("shangchuan2").style.display = "none";
        	   }
        	   var html = "";
        	   for(var i = 0;i<leng; i++){
        		   var vodeo = date[i];
        		   var shiqinmingk = "S"+vodeo['shipinming'];
        		   html = html+"<div class='vodeo'><div class='vodeo1'><video id='' class='k' data-html5-video autoplay preload='metadata' controls preload='auto' data-setup='{}' ><source src='http://www.linguoguo.com.cn:8080/farmers_picture/"+vodeo['yonghu']+"/"+vodeo['shipinming']+".mp4' type='video/mp4'/></video></div><span class='a'>"+vodeo['shijian']+"</span><br> <a class='a'  onclick=delete1('"+vodeo['shipinming']+"','"+vodeo['yonghu']+"')>删除</a></div>";
        	   }
        	   document.getElementById("kkkk").innerHTML=html;
           }
	});
}
function delete1(shipinming,yonghu){
	 $.post("DeleteVideo.do",{shipinming:shipinming,yonghu:yonghu},
		    function(date){
		if(date>0){
			window.history.go(0);
		}
		else
			alert("删除失败！");
	}); 
}
</script>
<body onload="start()">
	<div class="top1">
		<span class="ziti1">我的店铺</span>
	</div>
	<div id="kkk" class="dixia top"> 
	    <span class="span">抱歉！您还没有上传任何种植视频，请尽快上传种植视频提升店铺信任度。</span>  
	</div>
	<div id="kkkk" class="div" >
	    
	</div>
	<div id="shangchuan1" class="dixia">
		<div class="title-img1">
			<div class="title-img">
				<input class="j" type="file" id="fileId6" multiple="multiple"
					onchange="showVideo(this, 6)"> <label class="fileLabel1"
					id="label6" for="fileId6">+</label><br> <label
					class="fileLabel" id="labe6" for="fileId6">添加种植视频</label>
				<div id="video6" class="k"></div>
			</div>
			<input style="display: none;" class="h" id="input6" type="button"
				value="重选" onclick="choose(6)">
		</div>
	</div>
	<div id="shangchuan2" class="dixia">
         <input class="input" type="button" value="上传" onclick="addGoods(1)">	
	</div>
</body>
</html>
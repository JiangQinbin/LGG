<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/video-js.min.css" rel="stylesheet">
<title>商品修改</title>
<style type="text/css">
.title-img {
	position: relative;
	width: 88px;
	height: 100px;
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
	width: 88px;
	height: 100px;
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

.k {
	position: relative;
	width: 100%;
	height: 100%;
	top: 0px;
}
.k1 {
	position: relative;
	width: 100%;
	height: 100%;
	top: -19px;
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
	font-size: 12px;
	font-weight: bold;
	color: #949494;
}

.fileLabel1 {
	text-align: center;
	font-size: 55px;
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

.top1 {
	height: 66px;
	background-color: #FFF5EE;
}

.top2 {
	position: relative;
	width: 66%;
	left: 20%;
}

.ziti1 {
	position: relative;
	top: 33%;
	left: 44%;
	font-size: 26px;
	font-weight: bold;
	color: #0000EE
}

.wenzi {
	font-size: 18px;
	color: #1C1C1C;
}

.wenzi1 {
	position: relative;
	left: 16px;
	color: #4F4F4F;
}

.gao {
	position: relative;
	height: 56px;
	top: 26px;
}

.gao1 {
	top: 136px;
}
.gao2 {
	top: 176px;
}

.kuang {
	position: relative;
	left: 16px;
	height: 22px;
	width: 266px;
}

.kuang1 {
	width: 488px;
}

.juli {
	position: relative;
	left: 105px;
}

.da {
	position: relative;
	left: 16px;
	width: 55px;
	white-space: nowrap;
}

.xiao {
	left: 66px;
}

.xiao4 {
	left: 266px;
}

.ccc {
	color: #006400;
}

.xiao3 {
	position: relative;
	left: 106px;
	top: 16px;
}

.xiao4 {
	position: relative;
	left: 156px;
	top: 16px;
}

.bottom {
	position: relative;
	top: 199px;
	height: 199px;
}

.bottombutton {
	position: relative;
	left: 109px;
	height: 38px;
	width: 88px;
	font-size: 19px;
	font-weight: bold;
	border-color: #006400;
	background-color: #006400;
	color: #FFFFFF;
}

.instructions {
	position: relative;
	left: 18px;
	top: 88px;
	font-size: 12px;
	font-weight: bold;
	color: #4F4F4F;
}

.wenzin {
	position: relative;
	font-size: 14px;
	left: 20px;
	font-weight: bold;
	color: #828282;
}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/video.min.js"></script>
<script type="text/javascript">
	var myPlayer = videojs('pic6');
	videojs("pic6").ready(function() {
		var myPlayer = this;
		myPlayer.play();
	});
	function showVideo() {		
		 var html1 = document.getElementById("video6");
		 html1.innerHTML="<video id='pic6' class='k1' data-html5-video autoplay preload='metadata' controls preload='auto' data-setup='{}' ><source src='http://www.linguoguo.com.cn:8080/farmers_picture/${manguo.username }/攀枝花${manguo.manguoname }芒果/file6.mp4' type='video/mp4'/></video>";	
	}

	function showPic(obj, id) {
		var newPreview = document.getElementById('pic' + id);
		if (obj) {
			//ie浏览器兼容 
			if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
				obj.select();
				newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
				newPreview.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.selection
						.createRange().text;
				return;
			}
			//firefox浏览器兼容 
			else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
				if (obj.files) {
					newPreview.src = window.URL.createObjectURL(obj.files
							.item(0));
					return;
				}
				newPreview.src = obj.value;
				return;
			}
			var pathm = obj.value;
			var lage = judgeImgSuffix(pathm);
			if (lage) {
				newPreview.src = window.URL.createObjectURL(obj.files.item(0));
				document.getElementById('fileId' + id).style.display = "none";
				document.getElementById('label' + id).style.display = "none";
				document.getElementById('labe' + id).style.display = "none";
				document.getElementById('input' + id).style.display = "block";
			} else {
				alert("要求图片格式为png,jpg,jpeg,bmp");
			}
			return;
		}
	}

	function judgeImgSuffix(path) {
		var index = path.lastIndexOf('.');
		var suffix = "";
		if (index > 0) {
			suffix = path.substring(index + 1);
		}
		if ("png" == suffix || "jpg" == suffix || "jpeg" == suffix
				|| "bmp" == suffix || "PNG" == suffix || "JPG" == suffix
				|| "JPEG" == suffix || "BMP" == suffix) {
			return true;
		} else {
			return false;
		}

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
	function addGoods(manguoID) {
		var title = "攀枝花" + document.getElementById("title").value + "芒果";
		var introduce = document.getElementById("introduce").value;
		var weight1 = document.getElementById("weight1").value;
		var weight2 = document.getElementById("weight2").value;
		var price1 = document.getElementById("price1").value;
		var price2 = document.getElementById("price2").value;
		var price3 = document.getElementById("price3").value;
		var price4 = document.getElementById("price4").value;
		var number = document.getElementById("number").value;
		var ntitle = $("#title").val().length;
		var nintroduce = $("#introduce").val().length;
		if (ntitle<2||ntitle>30 || nintroduce<15||nintroduce>50
				|| weight1 == "" || weight2 == "" || price1 == ""
				|| price2 == "" || price3 == "" || price4 == "") {
			alert("你的输入有误，请检查你的输入！");
			return;
		} else {
			$.post("updateManguo.do",{manguoID:manguoID,manguoname:title,introduce:introduce,junzhongda:weight1,junzhongxiao:weight2,danjiadahao:price1,danjiadazhong:price2,danjiaxiaohao:price3,danjiaxiaozhong:price4,keshouliang:number},
				    function(date){
				if(date>0){
					alert("修改成功！");
					window.history.go(-1);
				}
				else
					alert("修改失败！");
			}); 

		}
	}
	function funTitle() {
		var title = $("#title").val().length;
		if (title < 2) {
			alert("名称应大于等于2个字符！");
			document.getElementById("title").style.border = "1px solid red";
		} else if (title > 30) {
			alert("名称应小于等于30个字符！");
			document.getElementById("title").style.border = "1px solid red";
		} else {
			document.getElementById("title").style.border = "1px solid";
			return;
		}
	}
	function funIntroduce() {
		var introduce = $("#introduce").val().length;
		if (introduce < 15) {
			alert("名称应大于等于15个字符！");
			document.getElementById("introduce").style.border = "1px solid red";
		} else if (introduce > 30) {
			alert("名称应小于等于50个字符！");
			document.getElementById("introduce").style.border = "1px solid red";
		} else {
			document.getElementById("introduce").style.border = "1px solid";
			return;
		}
	}
</script>
</head>
<body onload="showVideo()">
	<div class="top1">
		<span class="ziti1">商品修改</span>
	</div>
	<div class="top2">
		<div class="gao">
			<span class="wenzi">商品名称：</span><input id="title" name="title" value="${manguo.manguoname }"
				class="kuang" type="text" placeholder="2到30个字符" onblur="funTitle()">
			<span class="wenzin">系统会自动加载成 " 攀枝花...芒果 "</span>
		</div>
		<div class="gao">
			<span class="wenzi">商品简介：</span><input id="introduce"
				name="introduce" class="kuang kuang1" type="text" value="${manguo.introduce }"
				placeholder="15到50个字符" onblur="funIntroduce()">
		</div>
		<div class="gao">
			<div>
				<span class="wenzi">图片添加：</span>
			</div>
			<div class="juli">
				<div class="title-img1">
					<div class="title-img">
						 <img class="k" id="pic1" alt="" src="http://www.linguoguo.com.cn:8080/farmers_picture/${manguo.username }/攀枝花${manguo.manguoname }芒果/file1.jpg">
					</div>
					
				</div>

				<div class="title-img1">
					<div class="title-img">
						 <img class="k" id="pic2" alt="" src="http://www.linguoguo.com.cn:8080/farmers_picture/${manguo.username }/攀枝花${manguo.manguoname }芒果/file2.jpg">
					</div>
					
				</div>

				<div class="title-img1">
					<div class="title-img">
						 <img class="k" id="pic3" alt="" src="http://www.linguoguo.com.cn:8080/farmers_picture/${manguo.username }/攀枝花${manguo.manguoname }芒果/file3.jpg">
					</div>
					
				</div>

				<div class="title-img1">
					<div class="title-img">
						 <img class="k" id="pic4" alt="" src="http://www.linguoguo.com.cn:8080/farmers_picture/${manguo.username }/攀枝花${manguo.manguoname }芒果/file4.jpg">
					</div>
					
				</div>

				<div class="title-img1">
					<div class="title-img">
						 <img class="k" id="pic5" alt="" src="http://www.linguoguo.com.cn:8080/farmers_picture/${manguo.username }/攀枝花${manguo.manguoname }芒果/file5.jpg">
					</div>
					
				</div>
				<div class="title-img1">
					<div class="title-img">
						<div id="video6" class="k1"></div>
					</div>

				</div>
			</div>
		</div>

		<div class="gao gao1">
			<span class="wenzi">商品均重：</span><span class="wenzi1">大果：</span><input
				id="weight1" name="weight1" type="text" class="da" value="${manguo.dapingjun }"
				onkeypress="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onkeyup="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onblur="if(!this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}">
			<span class="wenzi1">斤/个</span> <span class="wenzi1 xiao">小果：</span><input
				id="weight2" name="weight2" type="text" class="da xiao" value="${manguo.xiaopingjun }"
				onkeypress="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onkeyup="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onblur="if(!this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}">
			<span class="wenzi1 xiao">斤/个</span>
		</div>

		<div class="gao gao1">
			<span class="wenzi">商品价格：</span><span class="wenzi1 ccc">大果：</span><span
				class="wenzi1">精品果：</span><input id="price1" type="text" class="da" value="${manguo.danjiadahao }"
				onkeypress="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onkeyup="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onblur="if(!this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}">
			<span class="wenzi1">元/件</span> <span class="wenzi1 xiao">中级果：</span><input
				id="price2" type="text" class="da xiao" value="${manguo.danjiadazhong }"
				onkeypress="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onkeyup="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onblur="if(!this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}">
			<span class="wenzi1 xiao">元/件</span> <br> <span
				class="wenzi1 ccc xiao3">小果：</span><span class="wenzi1 xiao3">精品果：</span><input
				id="price3" type="text" class="da xiao3" value="${manguo.danjiaxiaohao }"
				onkeypress="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onkeyup="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onblur="if(!this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}">
			<span class="wenzi1 xiao3">元/件</span> <span class="wenzi1 xiao4">中级果：</span><input
				id="price4" type="text" class="da xiao4" value="${manguo.danjiaziaozhong }"
				onkeypress="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onkeyup="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onblur="if(!this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}">
			<span class="wenzi1 xiao4">元/件</span>
		</div>
		
		<div class="gao gao2">
			<span class="wenzi">商品可售量：</span><input
				id="number" name="number" type="text" class="da" value="${manguo.keshouliang }"
				onkeypress="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onkeyup="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value"
				onblur="if(!this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}">
		        <span class="wenzi1">件</span>
		</div>
		
		<div class="bottom">
			<input class="bottombutton" type="button" value="修改" name="button1"
				id="button1ID" onclick="addGoods('${manguo.manguoID }')"> <span
				class="instructions">说明：商品的价格填入10斤一件的价格</span>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店铺订单</title>
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
.div{
position: relative;
text-align: center;
}
.hh{
color: #FF0000;
}
.hh1{
color: #999999;
}
a{
cursor:pointer;
}
.biaoti{
position: relative;
height: 66px;
font-size: 18px;
font-weight:bolder;
text-align:center; 
}
.biaoti1{
position: relative;
left:-66px;
cursor:pointer;
}
.biaoti2{
cursor:pointer;
}
.biaoti3{
position: relative;
left:66px;
cursor:pointer;
}
.biaoti1:hover{
color: #66fae7;
}
.biaoti2:hover{
color: #66fae7;
}
.biaoti3:hover{
color: #66fae7;
}

</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function update(aid,orderid){
	$.post("OrderUpdate.do",{ordernumber:orderid},
		    function(date){
		if(date>0){
			document.getElementById("a"+aid).style.display = "none";
			document.getElementById("b"+aid).style.display = "block";
		}
		else {
			alert("操作失败，请重试");
		}
		
	});
}
function shop(n){
	for(var i = 1;i<4;i++)
		document.getElementById("biaoti"+i).style.color = "#000";
	document.getElementById("biaoti"+n).style.color = "#66fae7";
	for(var i = 0;i<4;i++)
		document.getElementById("order"+i).style.display = "none";
	document.getElementById("order"+n).style.display = "block";
}
</script>
<body>

<div class="top1">
		<span class="ziti1">店铺订单</span>
</div>
<div class="biaoti">
<span id="biaoti1" class="biaoti1" onclick="shop('1')">待发货</span>
<span id="biaoti2" class="biaoti2" onclick="shop('2')">待收货</span>
<span id="biaoti3" class="biaoti3" onclick="shop('3')">已收货</span>
</div>
<div class="div">
<hr>
	<div id="order0" style="display:block;">
   <c:forEach items="${NonghuOrders }" var="NonghuOrder" varStatus="status">
     <span>购买者：${NonghuOrder.username}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           商品：${NonghuOrder.manguoname}${NonghuOrder.guige}${NonghuOrder.number}件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           付款时间：${NonghuOrder.paymentTime} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           付款金额：${NonghuOrder.actualPayment}</span><br>
      <span>收获人:${NonghuOrder.consigneeName}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              地址：${NonghuOrder.fullAddress} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               电话：${NonghuOrder.mobile}</span><br>
       <c:if test="${NonghuOrder.delivery ==0&&NonghuOrder.harvest==0 }">
		  <span id="b${status.index}" style="display:none;">状态：已发货  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a></span>
		  <span id="a${status.index}">状态：未发货  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  class="hh" onclick="update('${status.index}','${NonghuOrder.ordernumber}')">我也发货</a></span>
	   </c:if>	
     <c:if test="${NonghuOrder.delivery ==1&&NonghuOrder.harvest==0 }">
		  <span>状态：已发货  </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a>
	   </c:if>
	   <c:if test="${NonghuOrder.delivery ==1&&NonghuOrder.harvest==1 }">
		  <span>状态：已收获 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a>
	   </c:if>
	      <hr>
   </c:forEach>
   </div>
   <div id="order1" style="display:none;">
   <c:forEach items="${NonghuOrders }" var="NonghuOrder" varStatus="status">
     <c:if test="${NonghuOrder.delivery ==0&&NonghuOrder.harvest==0 }">
     <span>购买者：${NonghuOrder.username}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           商品：${NonghuOrder.manguoname}${NonghuOrder.guige}${NonghuOrder.number}件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           付款时间：${NonghuOrder.paymentTime} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           付款金额：${NonghuOrder.actualPayment}</span><br>
      <span>收获人:${NonghuOrder.consigneeName}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              地址：${NonghuOrder.fullAddress} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               电话：${NonghuOrder.mobile}</span><br>
       <c:if test="${NonghuOrder.delivery ==0&&NonghuOrder.harvest==0 }">
		  <span id="b${status.index}" style="display:none;">状态：已发货  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a></span>
		  <span id="a${status.index}">状态：未发货  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  class="hh" onclick="update('${status.index}','${NonghuOrder.ordernumber}')">我也发货</a></span>
	   </c:if>	
     <c:if test="${NonghuOrder.delivery ==1&&NonghuOrder.harvest==0 }">
		  <span>状态：已发货  </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a>
	   </c:if>
	   <c:if test="${NonghuOrder.delivery ==1&&NonghuOrder.harvest==1 }">
		  <span>状态：已收获 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a>
	   </c:if>
	   <hr>
	   </c:if>
	      
	      </c:forEach>
	   </div>
	   <div id="order2" style="display:none;">
	   <c:forEach items="${NonghuOrders }" var="NonghuOrder" varStatus="status">
     <c:if test="${NonghuOrder.delivery ==1&&NonghuOrder.harvest==0 }">
     <span>购买者：${NonghuOrder.username}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           商品：${NonghuOrder.manguoname}${NonghuOrder.guige}${NonghuOrder.number}件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           付款时间：${NonghuOrder.paymentTime} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           付款金额：${NonghuOrder.actualPayment}</span><br>
      <span>收获人:${NonghuOrder.consigneeName}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              地址：${NonghuOrder.fullAddress} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               电话：${NonghuOrder.mobile}</span><br>
       <c:if test="${NonghuOrder.delivery ==0&&NonghuOrder.harvest==0 }">
		  <span id="b${status.index}" style="display:none;">状态：已发货  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a></span>
		  <span id="a${status.index}">状态：未发货  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  class="hh" onclick="update('${status.index}','${NonghuOrder.ordernumber}')">我也发货</a></span>
	   </c:if>	
     <c:if test="${NonghuOrder.delivery ==1&&NonghuOrder.harvest==0 }">
		  <span>状态：已发货  </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a>
	   </c:if>
	   <c:if test="${NonghuOrder.delivery ==1&&NonghuOrder.harvest==1 }">
		  <span>状态：已收获 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a>
	   </c:if>
	   <hr>
	   </c:if>
	      
	      </c:forEach>
	   </div>
	   <div id="order3" style="display: none;">
	   <c:forEach items="${NonghuOrders }" var="NonghuOrder" varStatus="status">
     <c:if test="${NonghuOrder.delivery ==1&&NonghuOrder.harvest==1 }">
     <span>购买者：${NonghuOrder.username}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           商品：${NonghuOrder.manguoname}${NonghuOrder.guige}${NonghuOrder.number}件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           付款时间：${NonghuOrder.paymentTime} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           付款金额：${NonghuOrder.actualPayment}</span><br>
      <span>收获人:${NonghuOrder.consigneeName}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              地址：${NonghuOrder.fullAddress} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               电话：${NonghuOrder.mobile}</span><br>
       <c:if test="${NonghuOrder.delivery ==0&&NonghuOrder.harvest==0 }">
		  <span id="b${status.index}" style="display:none;">状态：已发货  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a></span>
		  <span id="a${status.index}">状态：未发货  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  class="hh" onclick="update('${status.index}','${NonghuOrder.ordernumber}')">我也发货</a></span>
	   </c:if>	
     <c:if test="${NonghuOrder.delivery ==1&&NonghuOrder.harvest==0 }">
		  <span>状态：已发货  </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a>
	   </c:if>
	   <c:if test="${NonghuOrder.delivery ==1&&NonghuOrder.harvest==1 }">
		  <span>状态：已收获 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="hh1">我也发货</a>
	   </c:if>
	   <hr>
	   </c:if>
	   
	   </c:forEach>
	   </div>

</div>
</body>
</html>
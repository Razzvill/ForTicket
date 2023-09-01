<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
	.mypage_right_wrap {
		margin: 0 auto;
	    float: center;
	    width: 800px;
	    min-height: 640px;
	    background: #fff;
	    border-radius: 10px;
	    text-align:center;
	    line-height:200%;
	}
	
	* {
	    margin: 0;
	    padding: 0;
	}
		
	div {
	    display: block;
	}
	
	body, table {
	    text-align: center;
	    word-break: break-all;
	    font-size: 13px;
	    font-weight: 400;
	}
	
	.overlay_t {
		background: #000;
		bottom: 0; 
		left: 0; 
		opacity: 0.7; 
		position: fixed; 
		right: 0; 
		top: 0; 
		z-index: 99; 
		display:none;
	}
	
	.popup_layer {
		width:500px; 
		border-radius:10px; 
		margin-bottom:0px; 
		background:#eeeeee; 
		border:solid 1px #ccc; 
		position:absolute; 
		top:0px; 
		left:35%; 
		z-index:100; 
		display:none;
	}
	
	.rows_my_buy_pop_top {
		font-size:14px; 
		color:#313131;
		padding:10px;
	}
	
	.rows_my_buy_pop_detail {
		text-align:left;
		padding:10px 15px 15px 10px;
		border-radius:0 0 10px 10px; 
		background-color:#fff; 
		line-height:180%;  
		vertical-align:bottom;
	}
	
	.rows_my_buy_pop_line {
		width:100%;
		height:1px; 
		border-top:1px solid #ccc; 
		padding:0; 
	}
	
	.rows_my_buy_pop_box {
		width:48%; 
		text-align:center; 
		padding:3px 0; 
		border:1px solid #ddd; 
		background:#eee; 
	}
	
	.buy_detail_title {
		float:left; 
		width:23%; 
		word-wrap:break-word; 
		word-break:break-all; 
		font-size:12px;
	}
	
	.buy_detail_info {
		float:left; 
		width:77%;
	}
	
	.detail{
		border:3px solid #d2d2d2;
		border-radius: 20px;
		background:#fff;
		padding:10px 25px;
		font-size:15px;
		color:#313131;
		line-height:280%;
		border-color: #FF6251;
		height: 700px;
	}
	
	.detail_title{
		width:150px;
		font-size:30px;
		font-weight:bold; 
		margin-bottom:30px;
		margin-top: 30px;
	}
	
	.option_title{
		width:170px;
		float:left;
		color:#888;
		font-size:20px;
		text-align: left;
		margin-left: 15px;
	}
	
	.option_title1{
		width:170px;
		float:left;
		color:#888;
		font-size:20px;
		text-align: left;
		margin-left: 15px;
		margin-top: 15px;
	}
	
	
	.option_con1{
		width:100%;
		font-size:20px;
		text-align:left;
		padding-left:150px;
		font-weight:bold;
		margin-top:15px;
	}
	
	.option_con2{
		width:100%; 
		vertical-align:bottom; 
		font-size:20px; 
		text-align:left; 
		padding-left:150px;
		font-weight:bold;
		margin-top:15px;
	}
</style>
</head>
<body>
<div class="mypage_right_wrap">
	<div class="detail">
        <div class="detail_title">상세 내역</div>
        
        <div class="option_title">티켓명</div>
        <div class="option_con1">${detail.goods_name}</div>
        
        <div class="option_title1">예매번호</div>
        <div class="option_con1">${detail.order_No}</div>
        
        <div class="option_title1">장소</div>
        <div class="option_con2">${detail.goods_place}</div>
        
        <div class="option_title1">날짜/시간</div>
        <div class="option_con2">${detail.orderDate} ${detail.goods_Time}</div>
        
        <div class="option_title1">수량</div>
        <div class="option_con2">${detail.totalQuantity}</div>
        
        <div class="option_title1">이용자</div>
        <div class="option_con2">${detail.receiver_name}</div>
        
        <div class="option_title1">티켓합계</div>
        <div class="option_con2">${detail.totalPrice}원</div>
        
        <div class="option_title1">환불기한</div>
        <div class="option_con2">이용 1일 전 자정까지 신청가능<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(환불규정에 따라 위약금이 발생할 수 있음)</div>
	</div>
</div>

<div style="padding:30px; text-align:center;">
	<span style="padding-left:20px;">
		<a href="${contextPath }/order/ticketrefund.do?order_No=${detail.order_No}"><button style="width:200px; height:50px; border:none; background:#ff4b4b; color:#fff; border-radius:5px; font-size:18px; font-weight:bold; cursor:pointer ">환불신청하기</button></a>
	</span>
</div>
<input type="text" name="order_No" value="${detail.order_No }">
</body>
</html>
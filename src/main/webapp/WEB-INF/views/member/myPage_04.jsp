<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>예매내역 페이지</title>
	<style>
	.search{
		width: 100%;
		border: 1px solid #FF6251;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	tr,td{
		border-bottom: 2px solid #FF6251;
		padding: 10px;
		font-size: 15px;
	}
	
	.inputSize{
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.clear {
	clear: both;
	height: 50px;
	}
	
	.result{
		width: 100%;
		border: 1px solid #FF6251;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	.reply{
		text-decoration: none;
		color: #FF6251;
	}
	</style>
</head>

<body>
<form method="post">
<div>
	<table class="search">
		<tr>
		<td>공연명</td>
		<td><input class="inputSize" type="text"></td>
		<td>공연일자</td>
		<td>
			<input class="inputSize" type="text"  size="4" value="${beginYear}" />년
			<input class="inputSize" type="text"  size="4" value="${beginMonth}"/>월	
			<input class="inputSize" type="text"  size="4" value="${beginDay}"/>일
		</td>
		<td colspan="3">
			<a href="javascript:search_goods_list('today')">
			   <img   src="/image/btn_search_one_day.jpg">
			</a>
			<a href="javascript:search_goods_list('one_week')">
			   <img   src="/image/btn_search_1_week.jpg">
			</a>
			<a href="javascript:search_goods_list('two_week')">
			   <img   src="/image/btn_search_2_week.jpg">
			</a>
			<a href="javascript:search_goods_list('one_month')">
			   <img   src="/image/btn_search_1_month.jpg">
			</a>
			<a href="javascript:search_goods_list('two_month')">
			   <img   src="/image/btn_search_2_month.jpg">
			</a>
			<a href="javascript:search_goods_list('three_month')">
			   <img   src="/image/btn_search_3_month.jpg">
			</a>
			<a href="javascript:search_goods_list('four_month')">
			   <img   src="/image/btn_search_4_month.jpg">
			</a>
			&nbsp;까지 조회
		</td>
		</tr>
		
		<tr>
		<td>예매번호</td>
		<td><input class="inputSize" type="text"></td>
		<td>조회기간</td>
		<td>
			<input class="inputSize" type="text"  size="4" value="${beginYear}" />년
			<input class="inputSize" type="text"  size="4" value="${beginMonth}"/>월	
			<input class="inputSize" type="text"  size="4" value="${beginDay}"/>일
		</td>
		<td>~</td>
		<td>
			<input class="inputSize" type="text"  size="4" value="${beginYear}" />년
			<input class="inputSize" type="text"  size="4" value="${beginMonth}"/>월	
			<input class="inputSize" type="text"  size="4" value="${beginDay}"/>일
		</td>
		<td>
			<input type="button" value="검색">
			<input type="button" value="초기화">
		</td>
	</table>
</div>
</form>

<div class="clear"></div>

<table class="result">
	<tr>
		<td>예매번호</td>
		<td>공연명</td>
		<td>공연일자</td>
		<td>공연시간</td>
		<td>공연장소</td>
		<td>인원</td>
		<td>좌석번호</td>
		<td>예매상태</td>
	</tr>
	
	<tr>
		<td>095-8176-601</td>
		<td>운빨로맨스</td>
		<td>2023.08.04</td>
		<td>19:30</td>
		<td>대전 xx구 xx로 xx길</td>
		<td>1</td>
		<td>C-1</td>
		<td>예매완료/<a href="#" class="reply">리뷰쓰기</a></td>
	</tr>
	
</table>
</body>
</html>
	<%-- 
	<c:choose>
	<c:when test="${empty ticketing }">
		<tr>
		<td colspan="8">
			<strong>조회된 예매내역이 없습니다.</strong>
		</td>		
	</c:when>
	<c:otherwise>
		<c:forEach var="item" items="${ticketing}">
			<tr>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			</tr>
		</c:forEach>
	</c:otherwise>
	</c:choose>
	--%>
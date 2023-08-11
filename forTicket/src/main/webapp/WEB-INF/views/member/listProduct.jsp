<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
.rolling_wrap {
	padding: 50px 0;
}

.wrap_1100 {
	margin: auto;
	position: relative;
}

.main_title {
	font-size: 25px;
	font-weight: 900;
	text-align: left;
	padding-left: 45px;
	padding-top: 50px;
}

.main_title_more {
	position: absolute;
	right: 0;
	font-size: 15px;
	padding-right: 20px;
	text-decoration: none;
}

#inline img {
	margin: 50px;
}

.swiper {
	margin-left: auto;
	margin-right: auto;
	position: relative;
	overflow: hidden;
	list-style: none;
	padding: 0;
	z-index: 1;
}
.category_sort{
	font-size: 16px;
    margin-top: 40px;
}

.category_sort li{
	display: inline-block;
    padding-left: 10px;
}
.price {
    display: flex;
    justify-content: space-between;
    margin-top: 15px;
    font-size: 18px;
    color: #000;
    font-weight: 600;
    text-align: left;
}
</style>
</head>

<body>
	<!-- 연극 -->
<section>
	<div class="wrap_1100">
	<!-- 상단 -->
	<div class="main_title">
	연극
	<div class="main_title_more">
		<ul class="category_sort">
		<li><a href="#" style="text-decoration: none;"> 인기순 </a></li>
		<li>|</li>
		<li><a href="#"	style="text-decoration: none;"> 별점순 </a></li>
		<li>|</li>
		<li><a href="#" style="text-decoration: none;"> 최저가순</a></li>
		<li>|</li>
		<li><a href="#" style="text-decoration: none;"> 최고가순 </a></li>
		</ul>
	</div>
	</div>
	<!-- 중단 -->
	<div style="margin-top: 80px;">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<!-- 상품 -->
	<tr>
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
							
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	
		<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	</tr>
	
	<tr>
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
							
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	</tr>
	<tr>
		<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	</tr>
	<tr>
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	<td valign="top" align="left">
	<a href="#" style="text-decoration: none;">
		<div>
		<img src="/image/1.png" alt="라면">
	<div></div>
	</div>
	<div>
		<p>🗂️ 연극 &gt; 로맨틱코미디</p>
		<p>라면</p>
		<div>
		<div class="price">
		<span class="stars" style=""><img src="/image/star.png" alt="별점">4.8 <span>(860)</span>
		</span>
		<span style="padding-right:30px;">16,800원</span>
		</div>
		</div>
	</div>
	</a></td>
	</tr>
	</tbody>
	</table>
	
	</section>
</body>

</html>
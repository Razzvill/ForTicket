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
<title>연극 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	.wrap_1100 {
		margin: auto;
		width: 1100px;
		position: relative;
	}
	
	.main_title {
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-top: 50px;
	}
	
	.main_title_more {
		position: absolute;
		right: 0;
		font-size: 15px;	
		text-decoration: none;
	}
	
	.category_sort{
		font-size: 16px;
	}
	
	.category_sort li{
		display: inline-block;
    	padding-left: 10px;
	}

	a, a.underline {
	   color: #000;
	   text-decoration: none;
		}
	
	.drama_list{
		position: relative;
	    width: 255px;
	    margin-right: 26px;
	    margin-bottom: 60px;
	    letter-spacing: -1px;
	    text-align: left;
	    transition: transform 0.3s ease-in-out;
	}

	.drama_list .thumb img{
		width: 255px;
	    height: 357px;
	    border-radius: 10px;
	    border: 1px solid #eee;
	}
	
	.drama_list:hover {
		transform: translateY(-5px);
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
	
	.stars{
		width: 20px;
	}
</style>
</head>

<body>
<section>
	<div class="wrap_1100">
	<!-- 상단 -->
	<div class="main_title">
	연극
	<div class="main_title_more">
			<ul class="category_sort">
				<li><a href="#"> 인기순 </a></li>
				<li>|</li>
				<li><a href="#"> 별점순 </a></li>
				<li>|</li>
				<li><a href="#"> 최저가순 </a></li>
				<li>|</li>
				<li><a href="#"> 최고가순 </a></li>
			</ul>
		</div>
		</div>
	<!-- 중단 상품 나열 -->
	<div style="padding-top: 50px;">
	<table style="width: 100%; border: 0; cellpadding: 0; cellspacing: 0;">
	<tbody>
	<tr>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
	</tr>
	<tr>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
	</tr>
	<tr>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
		<td valign="top" align="left">
			<a href="#">
				<div class="drama_list">
					<div class="thumb">
						<img src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1">
						<div></div>
					</div>
					<div class="text">
						<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
						<p style="font-size: 20px;">불편한 편의점</p>
					<div>
						<div class="price">
						<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
						<span style="padding-right:30px;">33,000원</span>
						</div>
					</div>
					</div>
				</div>
			</a>
		</td>
	</tr>
	</tbody>
	</table>
</div>	
</section>
</body>
</html>
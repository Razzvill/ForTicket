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
<title>메인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
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
	
	a, a.underline {
	   color: #000;
	   text-decoration: none;
	}
	
	.list{
		position: relative;
	    width: 255px;
	    margin-right: 26px;
	    margin-bottom: 60px;
	    letter-spacing: -1px;
	    text-align: left;
	    transition: transform 0.3s ease-in-out;
	}
	
	.list .thumb img{
		width: 255px;
	    height: 357px;
	    border-radius: 10px;
	    border: 1px solid #eee;
	}
	
	.list:hover {
		transform: translateY(-5px);
	}
	
	.text{
		margin-top: 10px;
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
	<!-- 메인 롤링배너 영역 시작 -->
	<div id="carouselExample" class="carousel slide" style="width: 1100px; margin: auto;">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${contextPath}/resources/images/carousel/carousel1.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${contextPath}/resources/images/carousel/carousel2.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${contextPath}/resources/images/carousel/carousel3.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${contextPath}/resources/images/carousel/carousel4.png" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev" style="padding-right: 105px;">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next" style="padding-left: 105px;">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- 메인 상품 노출 -->
	<section>
		<!-- 연극 -->
		<div class="wrap_1100">
			<div class="main_title">
			연극
			<div class="main_title_more">
				<a href="#"> 더보기 &gt; </a>
			</div>
			</div>
		<br>
		<div class="wrap_1100">	
			<table style="width: 100%; border: 0; cellpadding: 0; cellspacing: 0;">
			<tbody>
			<tr>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
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
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/drama/drama2.jpg" alt="연극2">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
								<p style="font-size: 20px;">망원동 브라더스</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.4 <span>(61)</span></span>
									<span style="padding-right:30px;">27,500원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/drama/drama3.jpg" alt="연극3">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
								<p style="font-size: 20px;">시간을 파는 상점</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(34)</span></span>
									<span style="padding-right:30px;">22,000원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/drama/drama4.jpg" alt="연극4">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
								<p style="font-size: 20px;">내일은 내일에게</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.5 <span>(74)</span></span>
									<span style="padding-right:30px;">19,800원</span>
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
		</div>
		
		<!-- 뮤지컬 -->
		<div class="wrap_1100">
			<div class="main_title">
			뮤지컬
			<div class="main_title_more">
				<a href="#"> 더보기 &gt; </a>
			</div>
			</div>
		<br>
		<div class="wrap_1100">	
			<table style="width: 100%; border: 0; cellpadding: 0; cellspacing: 0;">
			<tbody>
			<tr>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/musical/musical1.jpg" alt="뮤지컬1">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 뮤지컬 &gt; 퍼포먼스</p>
								<p style="font-size: 20px;">난타(NANTA)</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.9 <span>(56)</span></span>
									<span style="padding-right:30px;">26,400원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/musical/musical2.jpg" alt="뮤지컬2">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 뮤지컬 &gt; 드라마</p>
								<p style="font-size: 20px;">빨래</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.3 <span>(31)</span></span>
									<span style="padding-right:30px;">25,000원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/musical/musical3.jpg" alt="뮤지컬3">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 뮤지컬 &gt; 드라마</p>
								<p style="font-size: 20px;">언제나 행복하지 않은 순간이 있었나요</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(118)</span></span>
									<span style="padding-right:30px;">24,000원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/musical/musical4.jpg" alt="뮤지컬4">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 뮤지컬 &gt; 드라마</p>
								<p style="font-size: 20px;">코드네임X</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.3 <span>(87)</span></span>
									<span style="padding-right:30px;">21,900원</span>
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
		</div>
	
		<!-- 공연 -->
		<div class="wrap_1100">
			<div class="main_title">
			연극
			<div class="main_title_more">
				<a href="#"> 더보기 &gt; </a>
			</div>
			</div>
		<br>
		<div class="wrap_1100">	
			<table style="width: 100%; border: 0; cellpadding: 0; cellspacing: 0;">
			<tbody>
			<tr>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/concert/concert1.jpg" alt="공연1">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 공연</p>
								<p style="font-size: 20px;">아르뗌뮤지엄1</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.4 <span>(101)</span></span>
									<span style="padding-right:30px;">10,000원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/concert/concert2.jpg" alt="공연2">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 공연</p>
								<p style="font-size: 20px;">아르뗌뮤지엄2</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.2 <span>(74)</span></span>
									<span style="padding-right:30px;">10,000원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/concert/concert3.jpg" alt="공연3">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 공연</p>
								<p style="font-size: 20px;">이탈리안 라이프스타일</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.2 <span>(62)</span></span>
									<span style="padding-right:30px;">7,000원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/concert/concert4.jpg" alt="공연4">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 공연</p>
								<p style="font-size: 20px;">스니커즈 언박스드</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.0 <span>(50)</span></span>
									<span style="padding-right:30px;">15,000원</span>
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
		</div>
</section>
</body>

</html>
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
	padding-right: 100px;
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
</style>
</head>

<body>
	<!-- 메인 롤링배너 영역 시작 -->

	<div id="carouselExample" class="carousel slide"
		style="width: 90%; padding-left: 105px;">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/image/2.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/image/2.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/image/2.png" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExample" data-bs-slide="prev"
			style="padding-left: 105px;">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExample" data-bs-slide="next"
			style="padding-left: 105px;">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- 연극 -->
<section>
	<div class="wrap_1100">
		<div class="main_title">
			연극
			<div class="main_title_more">
				<a href="#" style="text-decoration: none;"> 더보기 &gt; </a>
			</div>
		</div>
		<br>
		<div class="swiper">
			<ul style="transform: translate3d(0px, 0px, 0px);">
				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">
							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">
							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">
							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">

							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

			</ul>
		</div>
	</div>
</section>	

	<!-- 뮤지컬 -->
<section>
	<div class="wrap_1100">
		<div class="main_title">
			뮤지컬
			<div class="main_title_more">
				<a href="#" style="text-decoration: none;"> 더보기 &gt; </a>
			</div>
		</div>
		<br>
		<div class="swiper">
			<ul style="transform: translate3d(0px, 0px, 0px);">
				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">
							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">
							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">
							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">

							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

			</ul>
		</div>
	</div>
</section>

<!-- 뮤지컬 -->
<section>
	<div class="wrap_1100">
		<div class="main_title">
			뮤지컬
			<div class="main_title_more">
				<a href="#" style="text-decoration: none;"> 더보기 &gt; </a>
			</div>
		</div>
		<br>
		<div class="swiper">
			<ul style="transform: translate3d(0px, 0px, 0px);">
				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">
							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">
							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">
							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

				<li style="width: 300px; margin-right: 15px;"><a href="#">
						<div>
							<div class="inline" style="width: 187.727px; margin-right: 15px;">
								<img src="/image/1.png" alt="내일은 스타">

							</div>
							<div>
								<p>NEW</p>
								<p>대학로</p>
								<p>🗂️ 연극 &gt; 드라마</p>
								<p>내일은 스타</p>
								<p>
									70%<span>15,000원</span>
								</p>
							</div>
						</div>
				</a></li>

			</ul>
		</div>
	</div>
</section>
</body>

</html>
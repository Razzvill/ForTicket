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
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/ajaxtabs.js"></script>

<script>
</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/calendar_theme.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/detail.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/user_review.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/common.css">
<style>
.main_tab_wrap {
	/* border: 1px solid #eee; */
	border-top: none;
	padding: 30px 59px;
	border-radius: 10px;
}

/* 상세 이미지 펼쳐보기 */
.info_detail_btn {
	position: absolute;
	bottom: 15px;
	width: 94%;
	height: 55px;
	line-height: 55px;
	margin-left: 3%;
	border: 1px solid #ccc;
	border-radius: 10px;
	background: #fff;
	color: #000;
	font-size: 20px;
	font-weight: 600;
	text-align: center;
	box-shadow: 1px 1px 3px 2px #ddd;
}

.info_detail_poster {
	position: relative;
	margin-top: 35px;
	width: 100%;
	height: 700px;
	color: #fff;
	font-size: 20px;
	background-size: 100%;
	background-repeat: no-repeat;
	background-position-y: 0%;
	background-image:
		url('./wys2/file_attach_thumb/2021/05/21/1621571534-67-0_wonbon_N_7_600x600_70_2.jpg');
}

.info_detail_gradient {
	width: 100%;
	height: 700px;
	background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0) 40%,
		rgba(255, 255, 255, 0.4) 60%, rgba(255, 255, 255, 0.8) 80%,
		rgb(255, 255, 255) 100%);
}

/* 상세 이미지 스타일   */
.main_img {
	margin-top: 35px;
	width: 700px;
	text-align: center;
}

.main_img img {
	display: block;
	width: 100%;
}

.viewpage_flex {
	display: flex;
	justify-content: flex-start;
}

.viewpage_flex div:nth-child(1) {
	padding-left: 10px;
	width: 120px;
	color: #888;
}

.viewpage_flex div:nth-child(2) {
	color: #000;
}

.viewpage_flex a {
	text-decoration: underline;
}

.border_box {
	border: 1px solid #eee;
	padding: 10px 20px;
	border-radius: 10px;
	margin-top: 5px;
}

.border_box .viewpage_flex {
	border-bottom: 1px solid #eee;
	padding-bottom: 8px;
	margin-bottom: 8px;
}

.border_box .viewpage_flex:last-child {
	border: none;
	padding-bottom: 0;
	margin-bottom: 0;
}

.now_engine {
	padding-bottom: 15px;
	font-size: 15px;
	font-weight: 400;
}

.now_engine a {
	color: #555;
}

.theater_list {
	position: relative;
	margin-right: 26px;
	margin-bottom: 60px;
	letter-spacing: -1px;
	text-align: left;
	transition: transform 0.3s ease-in-out;
}

.theater_list .theater_info {
	width: 95%;
	padding: 0 5px;
	letter-spacing: -0.5px;
}

.theater_list .theater_info .title {
	margin-top: 10px;
	font-size: 25px;
	color: #000;
	font-weight: 600;
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-align: left;
	word-break: break-all;
}

.theater_list .theater_info .detail {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
	font-size: 15px;
	color: #000;
	font-weight: 600;
	text-align: left;
}

.submit_btn button {
	display: inline-block;
	width: 45%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	background: #ff4b4b;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	border-radius: 10px;
	border: 0;
	cursor: pointer;
}
</style>

</head>

<body>
	<div style="padding-top: 20px; width: 815px; margin: 0 auto;">
		<div class="now_engine" style="margin-right: 680px;">
			🗂️ <a href="#">공연 &gt; </a><a href="#">${goods.goods_type} </a>
		</div>

		<div
			style="float: left; position: relative; width: 482px; margin-right: 20px; border-radius: 10px;">
			<img src="${contextPath}/goods/download.do?goods_id=${goods.goods_id}&goods_fileName=${goods.goods_fileName}"
				style="width: 482px; border-radius: 10px;">
			<div class="info_bg_gradient"></div>
		</div>
		
		<!-- 오른쪽  -->
		<section style="float: right; width: 307px;">
			<div class="theater_list">
				<div class="theater_info">
					<p class="title">${goods.goods_name}</p>
					<p class="detail">분류 : ${goods.goods_type}</p>
					<p class="detail">장르 : ${goods.goods_genre}</p>
					<p class="detail">공연기간 : ${goods.goods_startDate} ~ ${goods.goods_endDate}</p>
					<p class="detail">러닝타임 : ${goods.goods_runningTime}</p>
					<p class="detail">이용등급 : ${goods.goods_age}</p>
					<p class="detail">정가 : ${goods.goods_price}원</p>
					<c:if test="${goods.goods_discount != 0}">
						<p class="detail">할인율 : ${goods.goods_discount}%</p>
					</c:if>
				</div>
			</div>
			<div class="submit_btn">
				<c:choose>
					<c:when test="${goods.goods_seats == 'Y'}">
						<button onClick="location.href='${contextPath}/order/order_seat.do'" class="">예매하기</button>
					</c:when>
					<c:otherwise>
						<button onClick="location.href='${contextPath}/order/order_seatNone.do'" class="">예매하기</button>
					</c:otherwise>
				</c:choose>
				<button href="#" class="">관심 ☆</button>
			</div>
		</section>

		<div style="clear: both;"></div>

		<!-- 후기 영역 시작 -->
		<section style="width: 820px; margin: 0 auto; padding-top: 20px;">
			<div class="review_preview" style="">
				<div class="review_preview_container">
					<div class="review_preview_title_section">
						<div class="review_preview_left">
							<span class="review_preview_title">이용후기</span> <span
								class="review_preview_number">862</span> <span
								class="review_preview_title">평점</span> <span
								class="review_preview_number" style="color: #ff4b4b;">4.8/5</span>
						</div>
						<div class="review_preview_right">
							후기 더보기 <span class="review_preview_right_btn"></span>
						</div>
					</div>
					<div class="review_preview_samples">
						<div class="review_wrap" id="user_review_933478">
							<div class="review_title">
								<div class="review_title_left">
									<div class="review_title_left_stars">
										<div class="review_title_left_star">
											<div class="review_title_left_star_filled"
												style="width: calc(5 * 19px);"></div>
										</div>
									</div>
									<div class="review_title_left_name" style="padding-left: 10px;">
										김*정</div>
								</div>
								<div class="review_title_right" style="padding-right: 8px;">
									2023-08-11</div>
							</div>

							<div class="review_text">
								<div class="review_text_area" id="sample_review_0">
									우리 아이들과 모처럼 관람했는데 요 아이를 선택하기를 넘 잘했어요<br> 잔잔한 웃음과 함께 시원한
									여름을 잘 보내고왔어요
								</div>
								<div class="review_text_seemore" id="sample_seemore_0"
									onclick="showFullReviewForSample(0)" style="display: none;">
									... 더보기</div>
							</div>
						</div>

						<div class="review_wrap" id="user_review_799070">
							<div class="review_title">
								<div class="review_title_left">
									<div class="review_title_left_stars">
										<div class="review_title_left_star">
											<div class="review_title_left_star_filled"
												style="width: calc(5 * 19px);"></div>
										</div>
									</div>
									<div class="review_title_left_name" style="padding-left: 10px;">
										장*정</div>
								</div>
								<div class="review_title_right" style="padding-right: 8px;">
									2023-08-09</div>
							</div>

							<div class="review_text">
								<div class="review_text_area" id="sample_review_1">크
									멀티맨님.....ㅋㅋㅋㅋ 너무 귀여우시고 연기도 잘 하시고 감초같은 매력.. 최고였습니다... 남자친구랑 다 보고
									나와서 한참을 따라했어요..ㅋㅋㅋㅋㅋㅋ 너무너무 재밌었습니다!!!</div>
								<div class="review_text_seemore" id="sample_seemore_1"
									onclick="showFullReviewForSample(1)" style="display: none;">
									... 더보기</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- 상세정보 -->
		<section
			style="width: 820px; margin: 0 auto; padding-top: 20px; border-radius: 10px; border: 1px solid #eee;">
			<div id="ajaxcontentarea" class="contentstyle1">
				<div class="main_tab_wrap">
				
					<!-- 이용정보 -->
					<div style="margin-top: 25px;">
						<div class="viewpage_noti">이용정보</div>
						<div class="viewpage_text radius_box">
							<p>${goods.goods_info}</p>
						</div>
					</div>

					<!-- 상세이미지 -->
					<div class="info_detail_poster" alt="상세">
						<div class="info_detail_gradient"></div>
						<div class="info_detail_btn" onclick="showMoreDetailImage()">
							펼쳐보기 <img src="${contextPath}/resources/images/icon_down.png"
								style="width: 13px; vertical-align: 2px; padding-left: 10px;">
						</div>
						<script>
            function showMoreDetailImage() {
              document.querySelector('.info_detail_btn').remove();
              document.querySelector('.info_detail_gradient').remove();
              document.querySelector('.info_detail_poster').setAttribute("style", `display:none;`);
              let xhr = new XMLHttpRequest();
              xhr.open('GET', `./index.php?number=4343&mode=extend_detail_info`, true);
              xhr.send();
              xhr.onload = () => {
                  if (xhr.status === 200) {
                    document.querySelector('.main_img').innerHTML = xhr.response;
                    document.querySelector('.main_img').scrollIntoView({ behavior: 'smooth', block: 'start' });
                  }
                }
              }
          </script>
					</div>
					<div class="main_img"></div>

					<!-- 유의사항 -->
					<div style="margin-top: 25px;">
						<div class="viewpage_noti">유의사항</div>
						<div class="viewpage_text radius_box">
							<p>${goods.goods_notice}</p>
						</div>
					</div>

					<!--------- 장소안내 --------->
					<div style="margin-top: 25px;">
						<div class="viewpage_noti">장소안내</div>
						<div class="viewpage_text radius_box"
							style="border-radius: 10px 10px 0 0;">
							<p>${theater.theater_detail}</p>
						</div>
						<div align="center" style="margin-top: 10px;">
							<div style="z-index: -1;" id="daum_map">
								<div id="map"
									style="height: 350px; border-radius: 0px 0px 10px 10px; position: relative; overflow: hidden; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_tile.png&quot;);">
									<div
										style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;), default;">
										<div style="position: absolute;">
											<div
												style="position: absolute; z-index: 0; left: 0px; top: 0px;">
												<img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4011/1796.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 17.5px; top: 190.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4011/1797.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 145.5px; top: 190.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4011/1798.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 273.5px; top: 190.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4011/1799.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 401.5px; top: 190.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4012/1796.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 17.5px; top: 62.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4012/1797.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 145.5px; top: 62.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4012/1798.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 273.5px; top: 62.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4012/1799.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 401.5px; top: 62.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4013/1796.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 17.5px; top: -65.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4013/1797.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 145.5px; top: -65.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4013/1798.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 273.5px; top: -65.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4013/1799.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 401.5px; top: -65.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;">
											</div>
											<div
												style="position: absolute; z-index: 1; left: 0px; top: 0px;">
												<img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2005/897.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -238px; top: 190px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2005/898.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 18px; top: 190px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2005/899.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 274px; top: 190px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2005/900.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 530px; top: 190px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2006/897.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -238px; top: -66px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2006/898.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 18px; top: -66px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2006/899.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 274px; top: -66px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2006/900.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 530px; top: -66px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2007/897.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -238px; top: -322px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2007/898.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 18px; top: -322px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2007/899.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 274px; top: -322px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2007/900.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 530px; top: -322px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
											</div>
											<div style="position: absolute; z-index: 1;"></div>
											<div
												style="width: 700px; height: 350px; position: absolute; z-index: 1;"></div>
											<div style="position: absolute; z-index: 1;">
												<svg version="1.1"
													style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -1400px; top: -700px; width: 3500px; height: 1750px;"
													viewBox="0 0 3500 1750">
													<defs></defs></svg>
											</div>
											<div
												style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);">
												<div
													style="position: absolute; margin: -39px 0px 0px -14px; z-index: 0; left: 357px; top: 133px;">
													<img draggable="false"
														src="https://t1.daumcdn.net/mapjsapi/images/marker.png"
														alt="" role="presentation" title=""
														style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 29px, 42px, 0px); top: 0px; left: 0px; width: 29px; height: 42px;"><img
														src="https://t1.daumcdn.net/mapjsapi/images/transparent.gif"
														alt="" role="presentation" draggable="false"
														usemap="#daum.maps.Marker.Area:1"
														style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 29px; height: 42px;">
													<map id="daum.maps.Marker.Area:1"
														name="daum.maps.Marker.Area:1">
														<area href="javascript:void(0)" alt="" role="presentation"
															shape="poly"
															coords="14,39,9,27,4,21,1,16,1,10,4,4,11,0,18,0,25,4,28,10,28,16,25,21,20,27"
															title=""
															style="-webkit-tap-highlight-color: transparent;">
													</map>
												</div>
											</div>
										</div>
									</div>
									<div
										style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);">
										<div
											style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;">
											<div
												style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 46px;"></div>
											<div
												style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">50m</div>
										</div>
										<div style="margin: 0px 4px; float: left;">
											<a target="_blank" href="http://map.kakao.com/"
												title="Kakao 지도로 보시려면 클릭하세요."
												style="float: left; width: 32px; height: 10px;"><img
												src="https://t1.daumcdn.net/mapjsapi/images/m_bi_b.png"
												alt="Kakao 지도로 이동"
												style="float: left; width: 32px; height: 10px; border: none;"></a>
											<div
												style="font: 11px/11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div>
										</div>
									</div>
									<div
										style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;">
										<div
											style="width: 32px; border-radius: 3px; box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px; position: absolute; left: 665px; top: 3px;">
											<button draggable="false" title="확대" type="button"
												style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: none; border-right: none; border-bottom: 1px solid rgb(226, 226, 226); border-left: none; border-image: initial; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) -40px 0px/116px 264px no-repeat rgb(255, 255, 255); border-radius: 3px 3px 0px 0px;"></button>
											<div
												style="float: left; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_zoom_control.png&quot;) repeat; padding: 7px 0px; transition: height 0s ease 0s, margin 0.1s ease 0s;">
												<div
													style="cursor: pointer; position: relative; background-size: 116px 264px; transition: height 0.1s ease 0s; margin: 2px 0px; display: block; width: 32px; height: 104px;">
													<div
														style="position: absolute; width: 4px; height: 100%; background-color: rgb(51, 150, 255); left: 50%; margin: 0px 0px 0px -2px;">
														<div
															style="width: 4px; height: 2px; margin-bottom: -2px; bottom: 0px; position: absolute; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) -50px -127px/116px 264px;"></div>
														<div
															style="width: 4px; height: 2px; margin-top: -2px; top: 0px; position: absolute; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) -40px -100px/116px 264px;"></div>
													</div>
													<div
														style="position: absolute; background-color: rgb(204, 204, 204); transition: height 0.1s ease 0s; left: 50%; margin: 0px 0px 0px -2px; width: 4px; height: 16px;"></div>
													<div
														style="cursor: row-resize; position: absolute; width: 20px; height: 10px; margin: -4px 0px 0px -10px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) -40px -80px/116px 264px; left: 50%; transition: top 0.1s ease 0s; top: 16px;"></div>
												</div>
											</div>
											<button draggable="false" title="축소" type="button"
												style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: 1px solid rgb(226, 226, 226); border-right: none; border-bottom: none; border-left: none; border-image: initial; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) -40px -32px/116px 264px no-repeat rgb(255, 255, 255); border-radius: 0px 0px 3px 3px; margin: 0px;"></button>
											<div
												style="display: none; position: absolute; margin: 41px 0px 0px -30px; background-size: 116px 264px; width: 30px; height: 104px;">
												<div
													style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) 0px -80px/116px 264px; left: 0px; top: 8px;"></div>
												<div
													style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) 0px -100px/116px 264px; left: 0px; top: 32px;"></div>
												<div
													style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) 0px -120px/116px 264px; left: 0px; top: 64px;"></div>
												<div
													style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) 0px -140px/116px 264px; left: 0px; top: 80px;"></div>
												<div
													style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) 0px -160px/116px 264px; left: 0px; top: 96px;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="goods" value="${goodsMap.goodsVO}" />
<c:set var="imageList" value="${goodsMap.imageList }" />
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

.wrap_1100 {
	margin: auto;
	width: 1100px;
	position: relative;
	padding-top: 20px;
}


</style>

</head>

<body>
	<div class="wrap_1100">
		<div class="now_engine" style="margin-right: 680px;">
			🗂️ <a href="#">공연 &gt; </a><a href="#">${goods.goods_type} </a>
		</div>

		<div
			style="float: left; position: relative; width: 482px; margin-right: 20px; border-radius: 10px;">
			<img src="${contextPath}/goods/download.do?goods_id=${goods.goods_id}&goods_fileName=${goods.goods_fileName}"
				style="width: 482px; border-radius: 10px;">
		</div>
		
		<!-- 오른쪽  -->
		<section style="float: right; width: 307px;">
			<div class="theater_list">
				<div class="theater_info">
					<p class="title">${goods.goods_name}</p>
					<p class="detail">분류 : 
					<c:choose>
						<c:when test="${goods.goods_type == 'drama'}">
							연극
						</c:when>
						<c:when test="${goods.goods_type=='musical'}">
							뮤지컬
						</c:when>
						<c:otherwise>
							공연
						</c:otherwise>
					</c:choose></p>
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
						<button onClick="location.href='${contextPath}/order/order_seat.do?goods_id=${goods.goods_id}'" class="">예매하기</button>
					</c:when>
					<c:otherwise>
						<button onClick="location.href='${contextPath}/order/order_seatNone.do?goods_id=${goods.goods_id}'" class="">예매하기</button>
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
					<c:forEach var="image" items="${imageList }">
						<img src="${contextPath}/goods/download.do?goods_id=${goods.goods_id}&goods_fileName=${image.fileName}">
					</c:forEach>

					<%-- <!-- 상세이미지 -->
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
					</div> --%>
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
								<div id="map" style="height: 350px; border-radius: 0px 0px 10px 10px; position: relative; overflow: hidden;">
									<div id="clickLatlng" style="display:none"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4bbc1467ec79f5ab7103cd2a28dc98b&libraries=services"></script>
										<script>
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  
										
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
										
										// 주소-좌표 변환 객체를 생성합니다
										var geocoder = new kakao.maps.services.Geocoder();

										//주소, 공연장 이름 변수 설정
										var theater_address = "${theater.theater_address}";
										var theater_name = "${theater.theater_name}";
										
										// 주소로 좌표를 검색합니다
										geocoder.addressSearch(theater_address,function(result, status) {
											// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {

												var coords = new kakao.maps.LatLng(result[0].y,result[0].x);
												var message = 'latlng: new kakao.maps.LatLng('+ result[0].y + ', ' + result[0].x + ')';
												var resultDiv = document.getElementById('clickLatlng');
												resultDiv.innerHTML = message;

												// 결과값으로 받은 위치를 마커로 표시합니다
												var marker = new kakao.maps.Marker({
													map : map,
													position : coords
												});

												// 인포윈도우로 장소에 대한 설명을 표시합니다
												var infowindow = new kakao.maps.InfoWindow({
													content : '<div style="width:150px;text-align:center;padding:6px 0;">'+theater_name+'</div>'
												});
												infowindow.open(map,marker);

												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
												map.setCenter(coords);
											}
										});
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		</div>
</body>

</html>
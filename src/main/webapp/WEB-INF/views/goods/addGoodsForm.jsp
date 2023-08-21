<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
  var cnt=0;
  function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br>"+"<input  type='file' name='main_image' id='f_main_image' />");	  
	  }else{
		  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' />");
	  }
  	
  	cnt++;
  }
  function fn_add_new_goods(obj){
		 fileName = $('#f_main_image').val();
		 if(fileName != null && fileName != undefined){
			 obj.submit();
		 }else{
			 alert("메인 이미지는 반드시 첨부해야 합니다.");
			 return;
		 }
	}
</script>    
</head>
<style>
	hr {
		width: 90%;
		float: left;
	}
</style>
<body>
<form action="${contextPath}/goods/addGoods.do" method="post"  enctype="multipart/form-data">
		<h1>상품 등록</h1><hr>
<div class="tab_container">
	<!-- 내용 들어 가는 곳 -->
	<div class="tab_container" id="container">
		<ul class="tabs">
			<li><a href="#tab1">상품정보</a></li>
			<li><a href="#tab2">이용정보</a></li>
			<li><a href="#tab3">유의사항</a></li>
			<li><a href="#tab4">장소안내</a></li>
			<li><a href="#tab7">이미지</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<table>
					<tr>
						<td width=200>상품 분류</td>
						<td width=500>
							<select name="goods_type">
								<option value="drama">연극</option>
								<option value="musical">뮤지컬</option>
								<option value="concert">공연</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>장르</td>
						<td><input name="goods_genre" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input name="goods_name" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>공연 기간</td>
						<td><input name="goods_startDate" type="text" size="18"/> ~ 
						<input name="goods_endDate" type="text" size="18"/></td>
					</tr>
					<tr>
						<td>러닝타임</td>
						<td><input name="goods_runningTime" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>이용등급</td>
						<td><input name="goods_age" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>정가</td>
						<td><input name="goods_price" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>할인율</td>
						<td><input  name="goods_discount" type="text" size="40"/></td>
					</tr>
				</table>
			</div>
			<div class="tab_content" id="tab2">
				<H4>이용정보</H4>
				<table>	
				 <tr>
					<td>이용정보</td>
					<td><textarea  rows="100" cols="80" name="goods_info"></textarea></td>
				</tr>
				</table>
			</div>
			<div class="tab_content" id="tab3">
				<H4>유의사항</H4>
				<table>	
				 <tr>
					<td>유의사항</td>
					<td><textarea  rows="100" cols="80" name="goods_notice"></textarea></td>
				</tr>
				</table>	
			</div>
			<div class="tab_content" id="tab4">
				<H4>장소안내</H4>
				<table>	
				 <tr>
					<td>공연장</td>
					<td>
						<select name="goods_place">
							<c:forEach var="theater" items="theaterList" varStatus="theaterNum">
								<option value="${theater.theater_address}">${theater.theater_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div id="map" style="width: 450px; height: 400px;"></div>
									<div id="clickLatlng" style="display:none"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4bbc1467ec79f5ab7103cd2a28dc98b&libraries=services"></script>
										<script>
								            function displayTheaterLocation(selectElement) {
								                var theater_address = selectElement.value;
								                var theater_name = selectElement.options[selectElement.selectedIndex].text;
								
								                var mapContainer = document.getElementById('map');
								                var mapOption = {
								                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								                    level: 3 // 지도의 확대 레벨
								                };
								
								                var map = new kakao.maps.Map(mapContainer, mapOption);
								                var geocoder = new kakao.maps.services.Geocoder();
								
								                geocoder.addressSearch(theater_address, function(result, status) {
								                    if (status === kakao.maps.services.Status.OK) {
								                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								                        var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ' + result[0].x + ')';
								                        var resultDiv = document.getElementById('clickLatlng');
								                        resultDiv.innerHTML = message;
								
								                        var marker = new kakao.maps.Marker({
								                            map: map,
								                            position: coords
								                        });
								
								                        var infowindow = new kakao.maps.InfoWindow({
								                            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + theater_name + '</div>'
								                        });
								                        infowindow.open(map, marker);
								
								                        map.setCenter(coords);
								                    }
								                });
								            }
								        </script>
					</td>
				</tr>
				</table>	
			</div>
			<div class="tab_content" id="tab7">
				<h4>상품이미지</h4>
				<table>
					<tr>
						<td align="right">이미지파일 첨부</td>
			            <td  align="left"> <input type="button"  value="파일 추가" onClick="fn_addFile()"/></td>
			            <td>
				            <div id="d_file">
				            </div>
			            </td>
					</tr>
			</table>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<center>	
		 <table>
		 	<tr>
				<td align=center>
					<input  type="button" value="상품 등록하기"  onClick="fn_add_new_goods(this.form)">
				</td>
			</tr>
		 </table>
	</center>
</div>
</form>
</body>
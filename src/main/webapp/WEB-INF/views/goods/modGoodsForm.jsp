<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	
	var cnt = 0;
	function fn_addFile() {
		if (cnt == 0) {
			$("#d_file").append("<br>"+ "<input  type='file' name='main_image' id='f_main_image' />");
		} else {
			$("#d_file").append("<br>"+ "<input  type='file' name='detail_image"+cnt+"' />");
		}
		cnt++;
	}
	function readURL(input,preview) {
		//  alert(preview);
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#'+preview).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	  }
	var cnt =1;
	  function fn_addFile(){
		  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' id='detail_image"+cnt+"'  onchange=readURL(this,'previewImage"+cnt+"') />");
		  $("#d_file").append("<img  id='previewImage"+cnt+"'   width=200 height=200  />");
		  $("#d_file").append("<input  type='button' value='추가'  onClick=addNewImageFile('detail_image"+cnt+"','${imageFileList[0].goods_id}','detail_image')  />");
		  cnt++;
	  }
	  
	  function modifyImageFile(fileId,goods_id, image_id,fileType){
	    // alert(fileId);
		  var form = $('#FILE_FORM')[0];
	      var formData = new FormData(form);
	      formData.append("fileName", $('#'+fileId)[0].files[0]);
	      formData.append("goods_id", goods_id);
	      formData.append("image_id", image_id);
	      formData.append("fileType", fileType);
	      
	      $.ajax({
	        url: '${contextPath}/event/modGoodsImage.do',
	        processData: false,
	        contentType: false,
	        data: formData,
	        type: 'POST',
		      success: function(result){
		         alert("이미지를 수정했습니다!");
		       }
	      });
	  }
	  
	  function addNewImageFile(fileId,goods_id, fileType){
		   //  alert(fileId);
			  var form = $('#FILE_FORM')[0];
		      var formData = new FormData(form);
		      formData.append("uploadFile", $('#'+fileId)[0].files[0]);
		      formData.append("goods_id", goods_id);
		      formData.append("fileType", fileType);
		      
		      $.ajax({
		          url: '${contextPath}/event/addGoodsImage.do',
		                  processData: false,
		                  contentType: false,
		                  data: formData,
		                  type: 'post',
		                  success: function(result){
		                      alert("이미지를 수정했습니다!");
		                  }
		          });
		  }
	  
	  function deleteImageFile(goods_id,image_id,imageFileName,trId){
		var tr = document.getElementById(trId);

	      	$.ajax({
	    		type : "post",
	    		async : true, //false인 경우 동기식으로 처리한다.
	    		url : "${contextPath}/event/removeGoodsImage.do",
	    		data: {goods_id:goods_id,
	     	         image_id:image_id,
	     	         imageFileName:imageFileName},
	    		success : function(data, textStatus) {
	    			alert("이미지를 삭제했습니다!!");
	                tr.style.display = 'none';
	    		},
	    		error : function(data, textStatus) {
	    			alert("에러가 발생했습니다."+textStatus);
	    		},
	    		complete : function(data, textStatus) {
	    			//alert("작업을완료 했습니다");
	    			
	    		}
	    	}); //end ajax	
	  }
	//이벤트 유형 선택 변경 시 호출되는 함수
	function handleEventTypeChange() {
		var eventTypeSelect = document.getElementsByName("event_type")[0];
		var eventFinalDateInput = document.getElementsByName("event_finalDate")[0];

		if (eventTypeSelect.value === "disc") {
			eventFinalDateInput.disabled = true;
		} else {
			eventFinalDateInput.disabled = false;
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
	<form action="${contextPath}/event/modEvent.do" method="post"
		enctype="multipart/form-data">
		<h1>상품 수정</h1><hr>
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
						<input type="hidden" name="goods_id" value="${goods.goods_id}" />
						<table>
							<tr>
								<td width=200>상품 분류</td>
								<td width=500>
									<select name="goods_type">
										<c:choose>
											<c:when test="${goods.goods_type == drama}">
												<option value="drama" selected>연극</option>
												<option value="musical">뮤지컬</option>
												<option value="concert">공연</option>
											</c:when>
											<c:when test="${goods.goods_type == musical}">
												<option value="drama">연극</option>
												<option value="musical" selected>뮤지컬</option>
												<option value="concert">공연</option>
											</c:when>
											<c:otherwise>
												<option value="drama">연극</option>
												<option value="musical" selected>뮤지컬</option>
												<option value="concert">공연</option>
											</c:otherwise>
										</c:choose>
									</select>
								</td>
							</tr>
							<tr>
								<td>장르</td>
								<td><input name="goods_genre" value="${goods.goods_genre}"
									type="text" size="40" readonly /></td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><input name="goods_name" value="${goods.goods_name}" type="text" size="40"/></td>
							</tr>
							<tr>
								<td>공연 기간</td>
								<td><input name="goods_startDate"
									value="${goods.goods_startDate}" type="text" size="18" readonly />
									~ <input name="goods_endDate" value="${goods.goods_endDate}"
									type="text" size="18" readonly /></td>
							</tr>
							<tr>
								<td>러닝타임</td>
								<td><input name="goods_runningTime"
									value="${goods.goods_runningTime}" type="text" size="40"
									readonly /></td>
							</tr>
							<tr>
								<td>이용등급</td>
								<td><input name="goods_age" value="${goods.goods_age}"
									type="text" size="40" readonly /></td>
							</tr>
							<tr>
								<td>정가</td>
								<td><input name="goods_price" value="${goods.goods_price}"
									type="text" size="40" readonly /></td>
							</tr>
							<tr>
								<td>할인율</td>
								<td><input name="goods_discount"
									value="${goods.goods_discount}" type="text" size="40" /></td>
							</tr>
						</table>
					</div>
					<div class="tab_content" id="tab2">
						<H4>이용정보</H4>
						<table>	
							 <tr>
								<td>이용정보</td>
								<td><textarea  rows="100" cols="80" name="goods_info">${goods.goods_info}</textarea></td>
							</tr>
						</table>
					</div>
			<div class="tab_content" id="tab3">
				<H4>유의사항</H4>
				<table>	
				 <tr>
					<td>유의사항</td>
					<td><textarea  rows="100" cols="80" name="goods_notice">${goods.goods_notice}</textarea></td>
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
								<option value="${theater.theater_name}">${theater.theater_name}</option>
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
						<form id="FILE_FORM" method="post" enctype="multipart/form-data">
							<h4>상품이미지</h4>
							<table>
								<tr>
									<c:forEach var="item" items="${imageFileList }"
										varStatus="itemNum">
										<c:choose>
											<c:when test="${item.fileType=='main_image' }">
												<tr>
													<td>메인 이미지</td>
													<td><input type="file" id="main_image"
														name="main_image"
														onchange="readURL(this,'preview${itemNum.count}');" /> <%-- <input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  /> --%>
														<input type="hidden" name="image_id"
														value="${item.image_id}" /> <br></td>
													<td><img id="preview${itemNum.count }" width=200
														height=200
														src="${contextPath}/event/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" />
													</td>
													<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input type="button" value="수정"
														onClick="modifyImageFile('main_image','${item.goods_id}','${item.image_id}','${item.fileType}')" />
													</td>
												</tr>
												<tr>
													<td><br></td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr id="${itemNum.count-1}">
													<td>상세 이미지${itemNum.count-1 }</td>
													<td><input type="file" name="detail_image"
														id="detail_image"
														onchange="readURL(this,'preview${itemNum.count}');" /> <%-- <input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  /> --%>
														<input type="hidden" name="image_id"
														value="${item.image_id }" /> <br></td>
													<td><img id="preview${itemNum.count }" width=200
														height=200
														src="${contextPath}/event/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}">
													</td>
													<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input type="button" value="수정"
														onClick="modifyImageFile('detail_image','${item.goods_id}','${item.image_id}','${item.fileType}')" />
														<input type="button" value="삭제"
														onClick="deleteImageFile('${item.goods_id}','${item.image_id}','${item.fileName}','${itemNum.count-1}')" />
													</td>
												</tr>
												<tr>
													<td><br></td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								<tr align="center">
									<td colspan="3">
										<div id="d_file">
											<%-- <img  id="preview${itemNum.count }"   width=200 height=200 src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" /> --%>
										</div>
									</td>
								</tr>
								<tr>
									<td align=center colspan=2><input type="button"
										value="이미지파일추가하기" onClick="fn_addFile()" /></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<center>
				<table>
					<tr>
						<td align=center><input type="button" value="상품 등록하기"
							onClick="fn_add_new_goods(this.form)"></td>
					</tr>
				</table>
			</center>
		</div>
	</form>
</body>
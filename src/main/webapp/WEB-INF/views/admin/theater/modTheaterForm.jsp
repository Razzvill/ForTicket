<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>공연장 목록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<style>
a, a.underline {
	color: #000;
	text-decoration: none;
}

a.underline:hover {
	text-decoration: underline;
}

table {
	border-collapse: collapse;
}

object {
	display: block;
}

.wrap_1100 {
	margin: auto;
	width: 1100px;
	position: relative;
}

img {
	border: none;
	padding: 0;
	margin: 0;
}

img #map {
	width: 350px;
}

.clear {
	clear: both;
}

.theater_list {
	position: relative;
	margin-right: 26px;
	margin-bottom: 60px;
	letter-spacing: -1px;
	text-align: left;
	transition: transform 0.3s ease-in-out;
}

.theater_list .thumb img {
	width: 400px;
	border-radius: 10px;
	border: 1px solid #eee;
}

.theater_list .theater_info {
	width: 95%;
	padding: 0 5px;
	letter-spacing: -0.5px;
}

.theater_list .theater_info .area {
	display: inline-block;
	margin-top: 15px;
	padding: 5px 10px;
	font-size: 14px;
	color: #333;
	background: #eee;
	border-radius: 10px;
}

.theater_list .theater_info .category {
	display: block;
	margin-top: 10px;
	color: #999;
	font-size: 14px;
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

.theater_list .theater_info .price .stars {
	font-size: 15px;
	color: #333;
	font-weight: 600;
}

.theater_list .theater_info .price .stars img {
	width: 15px;
	vertical-align: -1px;
	padding-right: 3px;
}

.theater_list .theater_info .price .stars span {
	font-size: 14px;
	font-weight: 300;
}

.main_title {
	font-size: 15px;
	text-align: left;
	color: #333;
	padding-left: 30px;
	padding-top: 50px;
	padding-bottom: 20px;
}
</style>
</head>
<body>
	<div class="wrap_1100">
		<div class="main_title">공연장 목록 > ${theater_name}</div>
		<div style="margin-top: 25px;">
			<form name="frmTheater" method="get" action="${contextPath}/theater/addTheater.do" encType="multipart/form-data">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td valign="top" align="left">
							<div class="theater_list">
								<div class="thumb">
									<label for="inputImage">사진</label>
									<input type="file" name="theater_image" id="inputImage" onchange="readURL(this);" />
									<img id="preview" src="#" width="200" height="200" />
								</div>
							</div>
						</td>
						<td valign="top" align="left">
							<div class="theater_list">
								<div class="theater_info">
									<label for="inputName" class="title">공연장 이름 : 
									<input type="text" name="theater_name" id="inputName"/></label>
									<label for="inputCat" class="title">공연장 분류 : 
									<input type="text" name="theater_cat" id="inputCat"/></label>
									<label for="inputSeats" class="title">공연장 객석수 : 
									<input type="text" name="theater_seats" id="inputSeats"/></label>
									<label for="inputDetail" class="title">공연장 상세정보 : 
									<input type="text" name="theater_detail" id="inputDetail"/></label>
									<img src="${contextPath}/resources/images/mapExample.png"
										id="map" alt="지도">
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
	</div>
</body>
</html>
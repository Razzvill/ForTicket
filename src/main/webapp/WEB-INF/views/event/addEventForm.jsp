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

<body>
<form action="${contextPath}/event/addEvent.do" method="post"  enctype="multipart/form-data">
		<h1>이벤트 상품 등록창</h1>
<div class="tab_container">
	<!-- 내용 들어 가는 곳 -->
	<div class="tab_container" id="container">
		<ul class="tabs">
			<li><a href="#tab1">상품정보</a></li>
			<li><a href="#tab2">이벤트 정보</a></li>
			<li><a href="#tab7">이미지</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<table>
					<tr>
						<td width=200>상품 선택</td>
						<td width=500>
							<select name="goods_name">
								<c:forEach var="goods" items="goodsList">
									<option value="${goods.goods_id}">${goods.goods_name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>상품 분류</td>
						<td><input name="goods_type" value="${goods.goods_type}" type="text" size="40" readonly/></td>
					</tr>
					<tr>
						<td>장르</td>
						<td><input name="goods_genre" value="${goods.goods_genre}" type="text" size="40" readonly/></td>
					</tr>
					<tr>
						<td>공연 기간</td>
						<td><input name="goods_startDate" value="${goods.goods_startDate}" type="text" size="18" readonly/> ~ 
						<input name="goods_endDate" value="${goods.goods_endDate}" type="text" size="18" readonly/></td>
					</tr>
					<tr>
						<td>러닝타임</td>
						<td><input name="goods_runningTime" value="${goods.goods_runningTime}" type="text" size="40" readonly/></td>
					</tr>
					<tr>
						<td>이용등급</td>
						<td><input name="goods_age" value="${goods.goods_age}" type="text" size="40" readonly/></td>
					</tr>
					<tr>
						<td>정가</td>
						<td><input name="goods_price" value="${goods.goods_price}" type="text" size="40" readonly/></td>
					</tr>
					<tr>
						<td>할인율</td>
						<td><input  name="goods_discount" value="${goods.goods_discount}" type="text" size="40"/></td>
					</tr>
				</table>
			</div>
			<div class="tab_content" id="tab2">
				<table>
					<tr>
						<td width=200>이벤트 유형</td>
						<td width=500>
							<select name="event_type" onchange="handleEventTypeChange()">
								<option value="disc">예매 할인</option>
								<option value="inv" selected>초대권 증정</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>이벤트 기간</td>
						<td><input name="event_startDate" type="date" size="18"/> ~ 
						<input name="event_endDate" type="date" size="18"/></td>
					</tr>
					<tr>
						<td>당첨자 발표</td>
						<td><input name="event_finalDate" value="" type="date" size="40"/></td>
					</tr>
					<tr>
						<td>이벤트 제목</td>
						<td><input name="event_name" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>이벤트 내용</td>
						<td><textarea rows="100" cols="80" name="event_detail"></textarea></td>
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
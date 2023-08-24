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
<title>스케줄 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/calendar_theme.css">
<style>
	div #row1 {
		display: inline-block;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	var selectGoodsCode = "";
	var selectTheaterCode = "";
	var selectScheduleDate = "";
	
	/* 상품 코드 클릭 */
	function goodsCodeClick(goodsObj, goods){
		/* 상품 코드 css 변경 */
		$("#goodsList div").removeClass("bg-secondary").css("color","");
		$(goodsObj).addClass("bg-secondary").css("color","white");
		
		/* 선택 내용 출력 */
		$("#scGoodsCode").val(goods);
		selectGoodsCode = goods;
		getScRoomTime();
	}
	
	/* 공연장 코드 클릭 */
	function thCodeClick(thObj, theater){
		/* 공연장 코드 css 변경 */
		$("#thList div").removeClass("bg-secondary").css("color","");
		$(thObj).addClass("bg-secondary").css("color","white");
		
		/* 선택 내용 출력 */
		$("#scThCode").val(theater);
		selectTheaterCode = theater;
		getScRoomTime();
	}
	
	/* 달력 출력
	$(function() {
		$("#datepicker").datepicker();
	});
	$("#datepicker").datepicker({
		dateFormat : 'yy-mm-dd',
		yearSuffix : '년',
		showMonthAfterYear : true,
		changeMonth : true,
		dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
				'9', '10', '11', '12' ],
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		onSelect:function(selDate, inst){
			console.log(selDate);
			
			선택 내용 출력
			$("#scDate").val(selDate);
			selectScheduleDate = selDate;
			getScRoomTime();
		}
	}) */
	
	/* 상영관 출력 */
	function getScRoomTime(){
		if(selectTheaterCode.length>0 && selectGoodsCode.length>0 && selectScheduleDate.length>0){
			var thTimeList = ['10:00', '13:00', '16:00','19:00','22:00'];
			var output = "";
			/* for(var thTime=0; thTime<thTimeList.length; thTime++){
				output += "<input class=\"btn_dNone\""+thTimeList[thTime]+"\" type=\"checkbox\" name=\"scRoomTime\" value=\""+thTimeList[thTime]+"\">";
				output += "<label class=\"btn btn_sm font-weight-bold mx-1 my-2\" for=\""+thTimeList[thTime]+"\" onclick=\"ScRoomTime(this)\">"+thTimeList[thTime]+"</label>";
			} */
			$.ajax({
				type : "get",
				url : "getSelectedSchedule.do",
				data : {"theater_id" : selectTheaterCode, "s_date" : selectScheduleDate},
				dataType : "json",
				success : function(result){
					for(var thTime=0; thTime<thTimeList.length; thTime++){
						var registTime = [];
						var registGoodsName = [];
						for(var i=0; i<result.length; i++){
							registTime.push(result[i].s_date)
							registGoodsName.push(result[i].goods_name)
						}
						for(var thTime=0; thTime<thTimeList.length; thTime++){
							if(registTime.includes(thTimeList[thTime])){
								var mvNameIdx = registTime.indexOf(thTimeList[thTime]);
								output += "<button disabled title=\""+registGoodsName[mvNameIdx]+"\" class=\"btn btn-sm btn-danger font-weight-bold mx-1 my-2\" for=\""+thTimeList[thTime]+"\">"+thTimeList[thTime]+"</button>";
							} else {
								output += "<input class=\"btn_dNone\" id=\""+thTimeList[thTime]+"\" type=\"checkbox\" name=\"s_date\" value=\""+thTimeList[thTime]+"\">";
								output += "<label class=\"btn btn_sm font-weight-bold mx-1 my-2\" for=\""+thTimeList[thTime]+"\" onclick=\"ScRoomTime(this)\">"+thTimeList[thTime]+"</label>"; 
							}
						}
					}
					$("#scRoomAndTime").html(output);
				}
			});
		}
	}
	/* label 클릭 css */
	function ScRoomTime(selObj){
		if($(selObj).hasClass("bg-secondary")){
			$(selObj).removeClass("bg-secondary").css("color","");
		} else {
			$(selObj).addClass("bg-secondary").css("color","white");
		}
	}
	/* form 확인 */
	function scFormCheck(){
		if(selectGoodsCode.length==0){
			alert("공연이 선택되지 않았습니다.");
			return false;
		}
		if(selectTheaterCode.length==0){
			alert("공연장이 선택되지 않았습니다.");
			return false;
		}
		if(selectScheduleDate.length==0){
			alert("날짜가 선택되지 않았습니다.");
			return false;
		}
		var check = $("input[name=s_date]").is(":checked");
		console.log(check);
		if(!check){
			alert("공연 시간이 선택되지 않았습니다.");
			return false;
		}
	}
</script>
</head>
<body>
<form action="${contextPath}/schedule/addSchedule.do" method="get" onsubmit="return scFormCheck()">
	<div id="row1">
		<div class="col-xl-4 col-lg-4">
			<div class="card shadow mb-2">
				<div class="card-header py-3" style="text-align: center">
					<h6 class="m-0 font-weight-bold text-primary">상품 선택</h6>
				</div>
				<div class="card-body text-center scrollerline" id="goodsList">
					<c:forEach items="${goodsList}" var="goods">
						<div title="${goods.goods_name}" class="p-3 font-weight0bold text-dark" id="mygoods" onclick="goodsCodeClick(this, '${goods.goods_id}')">${goods.goods_name}</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="col-xl-4 col-lg-4">
			<div class="card shadow mb-2">
				<div class="card-header py-3" style="text-align: center">
					<h6 class="m-0 font-weight-bold text-primary">공연장 선택</h6>
				</div>
				<div class="card-body text-center scrollerline" id="thList">
					<c:forEach items="${theaterList}" var="theater">
						<div title="${theater.theater_name}" class="p-3 font-weight0bold text-dark" id="mytheater" onclick="thCodeClick(this, '${theater.theater_id}')">${theater.theater_name}</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="calendar_popup" class="col-xl-4 col-lg-4 calendar_popup_02 choice_day">
			<div class="card shadow mb-2">
				<div class="card-header py-3" style="text-align: center">
					<h6 class="m-0 font-weight-bold text-primary">날짜 선택</h6>
				</div>
				<div class="card-body text-center">
					<div id="datepicker" ></div>
					<script type="text/javascript">
						$(function() {
							$("#datepicker").datepicker();
						});
						$("#datepicker").datepicker({
							dateFormat : 'yy-mm-dd',
							yearSuffix : '년',
							showMonthAfterYear : true,
							changeMonth : true,
							dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
									'9', '10', '11', '12' ],
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
									'9월', '10월', '11월', '12월' ],
							onSelect:function(selDate){
								console.log(selDate);
								
								$("#scDate").val(selDate);
								selectScheduleDate = selDate;
								getScRoomTime();
							}
						})
					</script>
				</div>
			</div>
		</div>
	</div>
	<div id="row1">
		<div class="col-xl-8 col-lg-4">
			<div class="card shadow mb-2">
				<div class="card-header py-3" style="text-align: center">
					<h6 class="m-0 font-weight-bold text-primary">공연 시간</h6>
				</div>
			</div>
			<div class="card-body text-center" id="scRoomAndTime">
			</div>
		</div>
		<div class="col-xl-4 col-lg-4">
			<div class="card shadow mb-2">
				<div class="card-header py-3" style="text-align: center">
					<h6 class="m-0 font-weight-bold text-primary">스케줄 등록</h6>
				</div>
				<div class="card-body text-center" id="goodsList">
					<input type="text" name="scGoodsCode" id="scGoodsCode" placeholder="상품코드">
					<input type="text" name="scThCode" id="scThCode" placeholder="공연장코드">
					<input type="text" name="scDate" id="scDate" placeholder="날짜">
					<input type="text" name="seats" id="seats" placeholder="좌석수">
				</div>
				<button class="btn Secondary btn-user" type="submit">스케줄 등록</button>
			</div>
		</div>
	</div>
</form>
</body>
</html>
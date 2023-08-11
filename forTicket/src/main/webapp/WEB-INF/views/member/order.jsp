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
<style>
  .main_tab_wrap {
    border: 1px solid #eee;
    border-top: none;
    padding: 30px 59px;
    border-radius:0 0 10px 10px;
  }
  .react-datepicker {
    display: block;
    border: 0;
    border-radius: 0;
    font-family: "Notosans",-apple-system,BlinkMacSystemFont,Apple SD Gothic Neo,"Malgun Gothic",Arial,sans-serif;
}
</style>

</head>

<body>
	<div style="padding-top:20px; width:815px; margin-:0 auto;">
	<div class="" style="margin-right:680px;">
    🗂️ <a href="#">공연 &gt; </a><a href="#">연극 &gt; </a>
  	</div>
	
	<div style="float:left; position:relative; width:482px; margin-right:20px; border-radius:10px;">
    <img src="/image/1.png" style="width:482px; height: 482px; border-radius:10px;">
    <div class="info_bg_gradient">
    </div>

    <!-- 포스터 아래 좌석 정보영역 -->
    <div style="position:absolute; top:500px; left:150px;">
    
    <c:set var="seatCnt" value="1"></c:set>
 	<c:set var="isSeat" value="false"></c:set><!-- true : 예약완료, false : 예약 전 -->
	
	<div class="div2">
		<table class = "table2">
		<c:forEach var = "i" begin = "1" end = "5" step = "1">
			<tr align ="center">
			<c:forEach var = "j" begin = "1" end = "5" step = "1">
			<td class="c2">
			<c:choose>
			<c:when test="${empty findByMovie}">
				<a class="a1" href="${contextPath}/movie001/save.do?moviename=${movieTitle}&id=${movieId}&seat=${seatCnt}">${seatCnt}</a>
			</c:when>
			<c:otherwise>
				<c:forEach var ="n" items="${findByMovie }">
				<c:choose>
				<c:when test="${n.seat == seatCnt}">
				<c:set var="isSeat" value="true" />
				</c:when>
			</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${isSeat}">
				<div id = "c1">X</div>
			</c:when>
			<c:otherwise>
				<a class="a1" href="${contextPath}/movie001/save.do?moviename=${movieTitle}&id=${movieId}&seat=${seatCnt}">${seatCnt}</a>
			</c:otherwise>
			</c:choose>
	<c:set var="isSeat" value="false" />
			</c:otherwise>
			</c:choose>
			<c:set var="seatCnt" value = "${seatCnt + 1}"/>
			</td>
			</c:forEach>
			</tr>
			</c:forEach>
		</table>
	</div>
    </div>
 </div>

  <!-------- 우측 옵션선택영역 시작 -------->
  <section style="float: right; width: 307px;">
  	<div><div class="react-datepicker"><div class="react-datepicker__triangle"></div><div class="react-datepicker__month-container"><div class="react-datepicker__header react-datepicker__header--custom"><div class="calendar_custom_header"><div class="calendar_nav"><strong class="calendar_title">2023.08</strong><button type="button" class="calendar_nav_btn calendar_prev" disabled=""><span class="common_icon icon_arrow_left ty_xs"></span><span class="blind">이전 달로 이동</span></button><button type="button" class="calendar_nav_btn calendar_next"><span class="common_icon icon_arrow_right ty_xs"></span><span class="blind">다음 달로 이동</span></button></div></div><div class="react-datepicker__day-names"><div class="react-datepicker__day-name">일</div><div class="react-datepicker__day-name">월</div><div class="react-datepicker__day-name">화</div><div class="react-datepicker__day-name">수</div><div class="react-datepicker__day-name">목</div><div class="react-datepicker__day-name">금</div><div class="react-datepicker__day-name">토</div></div></div><div class="react-datepicker__month" aria-label="month  2023-08" role="listbox"><div class="react-datepicker__week"><div class="react-datepicker__day react-datepicker__day--030 react-datepicker__day--disabled react-datepicker__day--weekend react-datepicker__day--outside-month" tabindex="-1" aria-label="Not available 2023년 7월 30일 일요일" role="option" aria-disabled="true" aria-selected="false">30</div><div class="react-datepicker__day react-datepicker__day--031 react-datepicker__day--disabled react-datepicker__day--outside-month" tabindex="-1" aria-label="Not available 2023년 7월 31일 월요일" role="option" aria-disabled="true" aria-selected="false">31</div><div class="react-datepicker__day react-datepicker__day--001 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 1일 화요일" role="option" aria-disabled="true" aria-selected="false">1</div><div class="react-datepicker__day react-datepicker__day--002 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 2일 수요일" role="option" aria-disabled="true" aria-selected="false">2</div><div class="react-datepicker__day react-datepicker__day--003 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 3일 목요일" role="option" aria-disabled="true" aria-selected="false">3</div><div class="react-datepicker__day react-datepicker__day--004 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 4일 금요일" role="option" aria-disabled="true" aria-selected="false">4</div><div class="react-datepicker__day react-datepicker__day--005 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2023년 8월 5일 토요일" role="option" aria-disabled="true" aria-selected="false">5</div></div><div class="react-datepicker__week"><div class="react-datepicker__day react-datepicker__day--006 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2023년 8월 6일 일요일" role="option" aria-disabled="true" aria-selected="false">6</div><div class="react-datepicker__day react-datepicker__day--007 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 7일 월요일" role="option" aria-disabled="true" aria-selected="false">7</div><div class="react-datepicker__day react-datepicker__day--008 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 8일 화요일" role="option" aria-disabled="true" aria-selected="false">8</div><div class="react-datepicker__day react-datepicker__day--009 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 9일 수요일" role="option" aria-disabled="true" aria-selected="false">9</div><div class="react-datepicker__day react-datepicker__day--010 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 10일 목요일" role="option" aria-disabled="true" aria-selected="false">10</div><div class="react-datepicker__day react-datepicker__day--011 react-datepicker__day--disabled react-datepicker__day--today" tabindex="-1" aria-label="Not available 2023년 8월 11일 금요일" role="option" aria-disabled="true" aria-current="date" aria-selected="false">11</div><div class="react-datepicker__day react-datepicker__day--012 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2023년 8월 12일 토요일" role="option" aria-disabled="true" aria-selected="false">12</div></div><div class="react-datepicker__week"><div class="react-datepicker__day react-datepicker__day--013 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2023년 8월 13일 일요일" role="option" aria-disabled="true" aria-selected="false">13</div><div class="react-datepicker__day react-datepicker__day--014 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 14일 월요일" role="option" aria-disabled="true" aria-selected="false">14</div><div class="react-datepicker__day react-datepicker__day--015 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 15일 화요일" role="option" aria-disabled="true" aria-selected="false">15</div><div class="react-datepicker__day react-datepicker__day--016 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 16일 수요일" role="option" aria-disabled="true" aria-selected="false">16</div><div class="react-datepicker__day react-datepicker__day--017 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 17일 목요일" role="option" aria-disabled="true" aria-selected="false">17</div><div class="react-datepicker__day react-datepicker__day--018 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 18일 금요일" role="option" aria-disabled="true" aria-selected="false">18</div><div class="react-datepicker__day react-datepicker__day--019 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2023년 8월 19일 토요일" role="option" aria-disabled="true" aria-selected="false">19</div></div><div class="react-datepicker__week"><div class="react-datepicker__day react-datepicker__day--020 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2023년 8월 20일 일요일" role="option" aria-disabled="true" aria-selected="false">20</div><div class="react-datepicker__day react-datepicker__day--021 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 21일 월요일" role="option" aria-disabled="true" aria-selected="false">21</div><div class="react-datepicker__day react-datepicker__day--022 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 22일 화요일" role="option" aria-disabled="true" aria-selected="false">22</div><div class="react-datepicker__day react-datepicker__day--023 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 23일 수요일" role="option" aria-disabled="true" aria-selected="false">23</div><div class="react-datepicker__day react-datepicker__day--024 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 24일 목요일" role="option" aria-disabled="true" aria-selected="false">24</div><div class="react-datepicker__day react-datepicker__day--025 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 25일 금요일" role="option" aria-disabled="true" aria-selected="false">25</div><div class="react-datepicker__day react-datepicker__day--026 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2023년 8월 26일 토요일" role="option" aria-disabled="true" aria-selected="false">26</div></div><div class="react-datepicker__week"><div class="react-datepicker__day react-datepicker__day--027 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2023년 8월 27일 일요일" role="option" aria-disabled="true" aria-selected="false">27</div><div class="react-datepicker__day react-datepicker__day--028 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2023년 8월 28일 월요일" role="option" aria-disabled="true" aria-selected="false">28</div><div class="react-datepicker__day react-datepicker__day--029 react-datepicker__day--selected" tabindex="0" aria-label="Choose 2023년 8월 29일 화요일" role="option" aria-disabled="false" aria-selected="true">29</div><div class="react-datepicker__day react-datepicker__day--030" tabindex="-1" aria-label="Choose 2023년 8월 30일 수요일" role="option" aria-disabled="false" aria-selected="false">30</div><div class="react-datepicker__day react-datepicker__day--031" tabindex="-1" aria-label="Choose 2023년 8월 31일 목요일" role="option" aria-disabled="false" aria-selected="false">31</div><div class="react-datepicker__day react-datepicker__day--001 react-datepicker__day--outside-month" tabindex="-1" aria-label="Choose 2023년 9월 1일 금요일" role="option" aria-disabled="false" aria-selected="false">1</div><div class="react-datepicker__day react-datepicker__day--002 react-datepicker__day--weekend react-datepicker__day--outside-month" tabindex="-1" aria-label="Choose 2023년 9월 2일 토요일" role="option" aria-disabled="false" aria-selected="false">2</div></div></div></div></div></div>
        
    <form method="post" id="regiform" name="regiform" action="https://timeticket.co.kr/basket_order.php?number=3560&amp;returnUrl=https%3A%2F%2Ftimeticket.co.kr%2Fbasket_order.php">
         <div class="time_select selectBox" style="display: block;">
            <p class="selectbox_title" style="display: block;">시간선택<button type="button" class="time_btn" value="15:00"><span class="option_title">15:00</span></button><button type="button" class="time_btn active" value="17:20"><span class="option_title">17:20</span></button><button type="button" class="time_btn" value="19:30"><span class="option_title">19:30</span></button></p>
          </div>
          <div class="title1_select selectBox" style="display: none;">
            <p class="selectbox_title">옵션선택</p>
          </div>
          <div class="title2_select selectBox" style="display: block;">
            <p class="selectbox_title" style="display: block;">권종선택<button type="button" class="title2_btn btn_number_265705" name="265705" value="{&quot;number&quot;:&quot;265705&quot;,&quot;product_number&quot;:&quot;3560&quot;,&quot;run_date&quot;:&quot;2023-08-31 17:20:00&quot;,&quot;title1&quot;:&quot;★타임세일★&quot;,&quot;title2&quot;:&quot;&quot;,&quot;promo&quot;:&quot;timesale&quot;,&quot;full_price&quot;:&quot;50000&quot;,&quot;sale_price&quot;:&quot;15900&quot;,&quot;jaego&quot;:&quot;2&quot;,&quot;soldout&quot;:&quot;0&quot;,&quot;open_date&quot;:&quot;0000-00-00 00:00:00&quot;,&quot;close_date&quot;:&quot;2023-08-31 15:20:00&quot;,&quot;expire_date&quot;:&quot;0000-00-00 00:00:00&quot;}"><span style="color: #ff4b4b;" class="option_title">★타임세일★</span><span class="title2_left">남은티켓 2매</span><span style="color: #ff4b4b;" class="title2_price">15,900원</span></button><button type="button" class="title2_btn btn_number_257886 active" name="257886" value="{&quot;number&quot;:&quot;257886&quot;,&quot;product_number&quot;:&quot;3560&quot;,&quot;run_date&quot;:&quot;2023-08-31 17:20:00&quot;,&quot;title1&quot;:&quot;중고생할인&quot;,&quot;title2&quot;:&quot;&quot;,&quot;promo&quot;:&quot;&quot;,&quot;full_price&quot;:&quot;50000&quot;,&quot;sale_price&quot;:&quot;14900&quot;,&quot;jaego&quot;:&quot;10&quot;,&quot;soldout&quot;:&quot;0&quot;,&quot;open_date&quot;:&quot;0000-00-00 00:00:00&quot;,&quot;close_date&quot;:&quot;2023-08-31 15:20:00&quot;,&quot;expire_date&quot;:&quot;0000-00-00 00:00:00&quot;}"><span class="option_title">중고생할인</span><span class="title2_left">남은티켓 10매</span><span class="title2_price">14,900원</span></button><button type="button" class="title2_btn btn_number_257887" name="257887" value="{&quot;number&quot;:&quot;257887&quot;,&quot;product_number&quot;:&quot;3560&quot;,&quot;run_date&quot;:&quot;2023-08-31 17:20:00&quot;,&quot;title1&quot;:&quot;일반&quot;,&quot;title2&quot;:&quot;&quot;,&quot;promo&quot;:&quot;&quot;,&quot;full_price&quot;:&quot;50000&quot;,&quot;sale_price&quot;:&quot;16900&quot;,&quot;jaego&quot;:&quot;20&quot;,&quot;soldout&quot;:&quot;0&quot;,&quot;open_date&quot;:&quot;0000-00-00 00:00:00&quot;,&quot;close_date&quot;:&quot;2023-08-31 15:20:00&quot;,&quot;expire_date&quot;:&quot;0000-00-00 00:00:00&quot;}"><span class="option_title">일반</span><span class="title2_left">남은티켓 20매</span><span class="title2_price">16,900원</span></button></p>
          </div>
          <div class="choice_select" style="display: block;">
            <p class="title">수량선택</p>
            <div class="select_list"><div class="select_item" id="257886"><input type="hidden" name="cate_title[]" class="cate_title" value="8.31[목] 17:20 중고생할인"><div class="select_name" style="float:left;">8.31[목] 17:20&nbsp;중고생할인&nbsp;</div><div style="float:right;display: inline-block;"><a href="#item_close" class="close" data-store="257886"><span class="remove_ticket" style="font-size:14px; border:1px solid #888; border-radius:5px; width:16px; padding:0 6px; color:#fff; background:#888;" value="14900">X</span></a></div><div style="clear:both;"></div><div class="price_warp"><div class="quantity"><button type="button" class="remove_ticket" value="14900"><img src="mobile_img/detail/btn_minus_square.png" style="width:18px; vertical-align:-3px;"></button><span class="selected_quantity">1</span><button type="button" class="add_ticket" value="14900"><img src="mobile_img/detail/btn_plus_square.png" style="width:18px; vertical-align:-3px;"></button></div><p class="price">14,900원</p><input type="hidden" name="product_cate[]" value="257886"><input type="hidden" name="product_cate_price[]" class="item_price" value="14900"><input type="hidden" name="item_jaego" class="item_jaego" value="10"><input type="hidden" name="cate_date[]" class="cate_date" value="2023-08-31"><input type="hidden" name="want_quantity[]" class="item_ticket" value="1"></div></div></div>
          </div>
          <div class="total_warp" style="display: flex;">
            <p class="title">총 결제금액</p>
            <p class="total_price">14,900원</p>
          </div>
          <div class="submit_btn">
            <button href="#" class="">결제하기</button>
          </div>
        </form>
      </div>
    </div>
  </section>
</div>
</body>

</html>
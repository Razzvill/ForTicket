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
<title>환불 신청 화면</title>
<style>
.mypage_right_wrap {
    float: right;
    width: 780px;
    min-height: 640px;
    background: #fff;
    border-radius: 10px;
    margin-right: 40px;
}

#content {
    width: 78%;
    padding: 0px;
    margin-top: 50px;
    margin-left: 30px;
    float: left;
    border: 4px solid #FF6251;
    border-radius: 30px;
}

div, span {
    text-align: left;
}
* {
    margin: 0;
    padding: 0;
    font-family: 'Pretendard', 'Pretendard Variable';
}
user agent stylesheet
div {
    display: block;
}
body, table {
    word-break: break-all;
    font-size: 13px;
    font-weight: 400;
}
</style>
</head>
<body>
<div class="mypage_right_wrap">

      <div class="mypage_right_title" style="margin-bottom:20px; font-size: 18px; font-weight: 700;">
        환불 신청하기
      </div>

      <style>
  #loading_img_div {
    display: none; position: fixed; z-index: 1000; top: 0; left: 0; height: 100%; width: 100%; background: rgba(255, 255, 255, .8) url('mobile_img/loading.gif') 50% 40% no-repeat; background-size: 60px 60px;
  }

  div, span {
    text-align: left;
  }

  .section_box {
    padding: 0;
    margin-bottom: 25px;
    outline: 0px solid red;
  }

  .section_title {
    padding: 15px 20px;
    font-size: 18px;
    font-weight: 700;
    background: #f1f1f1;
    border: 1px solid #eee;
    border-bottom: none;
  }

  .section_content {
    padding: 20px 25px;
    border: 1px solid #eee;
  }

  .poster {
    width: 100px;
    height: 140px;
  }

  .poster img {
    width: 100px;
    border-radius: 10px;
  }

  .ticket_title {
    font-size: 18px;
    font-weight: 700;
    padding-top: 5px;
    padding-bottom: 15px;
  }

  .ticket_txt {
    display: flex;
    justify-content: flex-start;
    font-size: 15px;
    font-weight: 400;
  }

  .ticket_txt div:first-child {
    color: #999;
    width: 55px;
  }

  .ticket_txt div:last-child {
    color: #000;
    flex: 1;
  }

  .refund_notice {
    font-size: 16px;
    padding: 5px 0;
    font-weight: 700;
    color: #FF4B4B;
  }

  .sub_text span {
    font-size: 16px;
    margin: 6px 0;
  }

  .sub_text_grey {
    color: #999999;
  }

  .refund_detail div {
    padding: 5px 0;
    font-size: 16px;
    line-height: 180%;
  }

  .refund_account_info {
    display: flex;
    height: 50px;
    margin: 10px 0;
  }

  .refund__bank,
  .refund__account,
  .refund__account__holder {
    width: 300px;
    font-size: 16px;
    padding: 0 20px;
    border-radius: 10px;
    border: 1px solid #ddd;

  }

  .refund_account_info span {
    align-self: center;
    width: 100px;
  }

  #refund_bank {
    width: 250px;
    font-size: 16px;
    padding: 0 20px;

  }

  #refund_submit {
    width: 400px;
    height: 55px;
    background: #FF4B4B;
    border: none;
    border-radius: 10px;
    color:#FFF;
    font-size: 20px;
    font-weight: 700;
    cursor: pointer;
  }

</style>

<section class="section_box">
  <div class="section_title">
    <span>예매내역 확인</span>
  </div>
  <div class="section_content">
    <div style="display: flex;">
      <!-- left 105px fiexd -->
      <div class="poster">
        <img src="${contextPath}/resources/images/drama/drama3.jpg">
      </div>
      <!-- right flexible -->
      <div style="flex: 1; margin-left:25px; line-height: 180%;">
        <div class="ticket_title" style="border-bottom:1px solid #eee; margin-bottom:15px;">
          시간을 파는 상점
        </div>
        <div class="ticket_txt">
          <div>장소</div>
          <div>아신극장</div>
        </div>
        <div class="ticket_txt">
          <div>주소</div>
          <div>대전 xx구 xxxx길 xx</div>
        </div>
        <div class="ticket_txt">
          <div>연령</div>
          <div>만 12세 이상</div>
        </div>
      </div>
      <!-- right end -->
    </div>
    <div style="padding-top: 5px;">
    <div style="margin-top: 10px; border-radius: 10px; background: #f1f1f1; padding: 12px 20px; font-size: 14px; color: #000; line-height: 180%; ">
      <div style="display: flex; justify-content: space-between;">
        <div style="width: 40px; color: #999; font-weight: 600;">옵션</div>
        <div style="flex: 1; text-align: right;">8.31[목] 19:30 일반</div>
      </div>
      <div style="display: flex; justify-content: space-between;">
        <div style="width: 40px; color: #999; font-weight: 600;">가격</div>
        <div style="flex: 1; text-align: right;">16,900원 * 1매 = 16,900원</div>
      </div>
      <input type="hidden" name="row_price_value_257889" id="row_price_value_257889" value="16,900">
    </div></div>
  </div>
</section>

<section class="section_box">
  <div class="section_title">
    <span>환불금액</span>
  </div>

  <div class="section_content" style="border-bottom:none;">
    <div class="sub_text" style="display: flex; justify-content: space-between;">
      <span class="sub_text_grey">결제 금액</span>
      <span class="calcValue" value="16900">16,900원</span>
    </div>

    <div class="sub_text" style="display: none">
      <span class="sub_text_grey">포인트 사용</span>
      <span class="calcValue" value="0">0P</span>
    </div>
  </div>


  <div class="section_content sub_text_blue" style="display: none">
    <div class="sub_text" style="display: none">
      <span class="sub_text_grey" style="color: #0057FF;">공제율</span>
      <span class="calcValue" value="0" style="color: #0057FF;">0%</span>
    </div>

    <div class="sub_text" style="display: none">
      <span style="color: #0057FF;">공제금액</span>
      <span class="calcValue" value="0" style="color: #0057FF;">- 0원</span>
    </div>

    <div class="sub_text" style="display: none">
      <span style="color: #0057FF;">공제 포인트</span>
      <span class="calcValue" value="0" style="color: #0057FF;">- 0P</span>
    </div>
  </div>

  <div class="section_content">
    <div class="sub_text" style="display: flex; justify-content: space-between;">
      <span style="font-weight: bold;">최종 환불 금액</span>
      <span class="calcValue" value="16900" style="font-weight: bold;">16,900원</span>
    </div>

    <div class="sub_text" style="display: none">
      <span style="font-weight: bold;">최종 환불 포인트</span>
      <span class="calcValue" value="0" style="font-weight: bold;">0P</span>
    </div>
  </div>
</section>

<section class="section_box">
  <div class="section_title">
    <span>환불진행 안내</span>
  </div>
  <div class="section_content">
    <div class="refund_detail">
      
        <div>
          · <span class="txt_red">환불 금액에 대한 결제 취소가 진행됩니다.</span><br>
          · 신용카드는 익월 청구액에서 제외되며, 체크카드는 카드사에 따라 영업일 기준 3~5일 후<br>
            연결된 계좌로 입금됩니다.<br>
          · 환불신청 후 철회 또는 티켓 사용이 불가합니다. 결제/취소 세부사항은 네이버페이를 통해 확인해주세요.
        </div>
    </div>
  </div>
</section>



<section style="display: flex; flex-direction: column;">
  <div style="text-align: center; font-size: 16px;">
    <input class="refund__confirm" type="checkbox" id="confirm" required="required" value="true" style="width:18px; height:18px; transform: translateY(4px);">
    <label for="confirm" style="padding-left:3px;">환불진행 안내사항을 확인했습니다.</label>
  </div>
  <div style="text-align:center; padding: 30px 0 45px 0;">
    <button id="refund_submit" value="등록">환불 진행하기</button>
  </div>
</section>
<div id="loading_img_div"></div>


    </div>
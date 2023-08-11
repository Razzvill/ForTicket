<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<style>
.input_box {
    width: 350px;
    height: 55px;
    padding: 0 10px 0 60px;
    font-size: 18px;
    border-radius: 10px;
    border: 1px solid #ddd;
    background-repeat: no-repeat;
    background-size: 24px;
    background-position: 20px 15px;
}
section {
    display: block;
}
.section_wrap {
    margin-top: 7px;
}
body, table {
    word-break: break-all;
    font-size: 13px;
    font-weight: 400;
}
.join_wrap {
    width: 500px;
    margin: 50px auto;
    padding: 60px 0 50px 0;
    text-align: center;
    border: 3px solid #ffd1d1;
    border-radius: 30px;
    background-color: #fff;
}
:root {
    --swiper-navigation-size: 44px;
}
:root {
    --swiper-theme-color: #007aff;
}
.checkbox_group {
    width: 375px;
    padding: 5px 25px;
    margin-top: 20px;
    margin-left: 40px;
    border: none;
    border-radius: 10px;
    background: #f5f5f5;
    color: #333;
    text-align: left;
    line-height: 180%;
}
.btn_submit {
    
    width: 425px;
    height: 60px;
    border: 1px solid #ff4b4b;
    border-radius: 10px;
    background: #ff4b4b;
    color: #fff;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>회원 가입창</title>
</head>
<body>

  <div class="join_wrap">

    <div>
      <img src="${contextPath}/resources/image/logo.png" style="width:150px; height:102px;">
    </div>

    <form method="post">

      <input type="hidden" name="r" value="/">
      <input type="hidden" id="join_type" name="join_type" value="normal">
      <input type="hidden" id="user_hphone_check" name="user_hphone_check" value="">
      <input type="hidden" id="idKey" name="idKey" value="">

      <!-- 아이디 -->
            <section class="section_wrap_top">
        <input type="text" id="user_id" name="user_id" placeholder="아이디" class="input_box icon_id" oninput="removeSpace(this)" style="text-transform:lowercase;">
        <!-- 입력 형식에 맞지 않을 때 / 입력하지 않았을 때 얼럿 -->
        <div class="input_alret_id"></div>
      </section>

      <!-- 비밀번호 / 비밀번호 확인 -->
      <section class="section_wrap">
        <input type="password" id="user_pass" name="user_pass" placeholder="비밀번호" class="input_box icon_pass" autocomplete="new-password">
        <div class="input_alret_password"></div>
      </section>

      <section class="section_wrap">
        <input type="password" id="user_pass_verify" name="user_pass_verify" placeholder="비밀번호 확인" class="input_box icon_pass2" autocomplete="new-password">
        <div class="input_alret_password" style="visibility: hidden;"></div>
      </section>

      
      <!-- 이름 -->
      <section class="section_wrap">
        <input type="text" id="user_name" name="user_name" placeholder="이름" value="" class="input_box icon_name">
        <div class="input_alret_name"></div>
      </section>

      <!-- 이메일 -->
      <section class="section_wrap">
        <input type="text" id="user_email" name="user_email" placeholder="이메일" value="" class="input_box icon_email" oninput="removeSpace(this)">
        <div class="input_alret_email"></div>
      </section>
      
      <!-- 휴대폰 인증 -->
       <section class="section_wrap">
        <input type="text" id="user_phone" name="user_phone" placeholder="핸드폰번호" value="" class="input_box icon_email" oninput="removeSpace(this)">
        <div class="input_alret_phone"></div>
      </section>
      
      <!-- 주소 -->
      <section class="section_wrap">
         <div style="width:auto; height:55px; align-items: center; margin-left:13px;  ">
    <input style="width:220px; height:55px;" type="text" id="user_adress" name="user_adress" placeholder="우편번호" value="" class="input_box icon_email" oninput="removeSpace(this)" style="width: 270px;">
    <input style="width:150px; height:55px;" type="button" id="submitComplete" class="btn_submit" value="우편번호찾기" alt="우편번호찾기" style="width: 130px; height: 55px; margin-left: 10px; font-size: 18px;">
  </div>
      <section class="section_wrap">
        <input type="text" id="duinfo" name="duinfo" placeholder="세부주소1" value="" class="input_box icon_email">
      </section>
      <section class="section_wrap">
        <input type="text" id="duinfo" name="duinfo" placeholder="세부주소2" value="" class="input_box icon_email">
        <div class="flex_between">   
      </section>
      
      <section class="section_wrap" style="margin-top:30px;">
        <div class="section_title">이용약관 동의</div>

        <div class="checkbox_group" style="margin-top:0;">
          <div class="checkbox_line check_all">
            <input type="checkbox" id="check_all" class="checkbox">
            <label for="check_all">전체 동의</label>
          </div>
          <div class="checkbox_line">
            <input type="checkbox" id="check_1" class="checkbox">
            <label for="check_1">만 14세 이상입니다<span class="check_req">(필수)</span></label>
          </div>
          <div class="checkbox_line detail_seperate">
            <div>
              <input type="checkbox" id="check_2" class="checkbox">
              <label for="check_2">이용약관 동의<span class="check_req">(필수)</span></label>
            </div>
          <div class="checkbox_line detail_seperate" style="border:none;">
            <div>
              <input type="checkbox" id="check_3" class="checkbox">
              <label for="check_3">개인정보 수집·이용 동의<span class="check_req">(필수)</span></label>
            </div>
        </div>
      </section>

      <div>
        <div class="input_title" disabled="" id="recaptcha-container"><div class="grecaptcha-badge" data-style="bottomright" style="width: 256px; height: 60px; display: block; transition: right 0.3s ease 0s; position: fixed; bottom: 14px; right: -186px; box-shadow: gray 0px 0px 5px; border-radius: 2px; overflow: hidden;"><div class="grecaptcha-logo"><iframe title="reCAPTCHA" src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6LcMZR0UAAAAALgPMcgHwga7gY5p8QMg1Hj-bmUv&amp;co=aHR0cHM6Ly90aW1ldGlja2V0LmNvLmtyOjQ0Mw..&amp;hl=ko&amp;v=3kTz7WGoZLQTivI-amNftGZO&amp;size=invisible&amp;cb=sqgb2miiatpc" width="256" height="60" role="presentation" name="a-9xajmtra3vir" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox"></iframe></div><div class="grecaptcha-error"></div><textarea id="g-recaptcha-response" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea></div><iframe style="display: none;"></iframe></div>
      </div>

      <input type="button" id="submitComplete" class="btn_submit" value="가입완료" alt="가입완료">

    </form>

  </div>

  <br>

  <div class="loading_img_div"></div>

  <!-- 웹 통계 설정파일 -->
<!--
    - bottom_copyright.html에서 이 파일을 호출함
    - login/html 폴더의 html은 bottom_copyright.html을 호출하지 않기에 직접 include 함
    - 구글, 페이스북 픽셀 등 헤더 호출형은 config.php에서 가져옴
-->

<!-- 네이버 통계 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 -->
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_48e319c7dc98";

if (!_nasa) var _nasa={};
wcs.inflow("timeticket.co.kr");

wcs_do(_nasa);
</script>






<script>

  //// 회원가입 대문 페이지 ////
      // 휴대폰 번호 자동 하이픈(-) 스크립트
    function autoHypenPhone(str) {
      str = str.replace(/[^0-9]/g, '');
      if (str.length < 4) {
        return str;
      } else if (str.length < 8) {
        return `${str.substr(0, 3)}-${str.substr(3)}`;
      } else if (str.length < 12) {
        return `${str.substr(0, 3)}-${str.substr(3, 4)}-${str.substr(7)}`;
      }
      return str;
    }
    var cellPhone = document.getElementById('user_hphone');
    cellPhone.addEventListener('input', function() {
      var _val = this.value.trim();
      this.value = autoHypenPhone(_val);
    });

    // 가입 : 약관 체크박스 전체 선택
    $(".checkbox_group").on("click", "#check_all", function () {
      $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
    });

    // 가입 : 약관 체크박스 개별 선택
    $(".checkbox_group").on("click", ".checkbox", function() {
      var is_checked = true;
      $(".checkbox_group .checkbox").each(function(){
        is_checked = is_checked && $(this).is(":checked");
      });
      $("#check_all").prop("checked", is_checked);
    });

  // 수정 페이지
  

  // 로그인P or 회원가입 대문P : SNS로그인 처리
  
  function removeSpace(input) {
    var value = input.value.replace(/\s/g, ''); // 공백 제거
    input.value = value; // 수정된 값을 다시 입력란에 설정
  }

</script>

<script type="text/javascript" src="js/login.js?806617498"></script>
<script type="text/javascript" id="">(function(a,e,b,f,g,c,d){a[b]=a[b]||function(){(a[b].q=a[b].q||[]).push(arguments)};c=e.createElement(f);c.async=1;c.src="https://www.clarity.ms/tag/"+g+"?ref\x3dgtm2";d=e.getElementsByTagName(f)[0];d.parentNode.insertBefore(c,d)})(window,document,"clarity","script","hdgq117dnr");</script><div style="visibility: hidden; position: absolute; width: 100%; top: -10000px; left: 0px; right: 0px; transition: visibility 0s linear 0.3s, opacity 0.3s linear 0s; opacity: 0;"><div style="width: 100%; height: 100%; position: fixed; top: 0px; left: 0px; z-index: 2000000000; background-color: rgb(255, 255, 255); opacity: 0.5;"></div><div style="margin: 0px auto; top: 0px; left: 0px; right: 0px; position: fixed; border: 1px solid rgb(204, 204, 204); z-index: 2000000000; background-color: rgb(255, 255, 255); overflow: hidden;"><iframe title="reCAPTCHA&nbsp;보안문자 2분 후 만료" src="https://www.google.com/recaptcha/api2/bframe?hl=ko&amp;v=3kTz7WGoZLQTivI-amNftGZO&amp;k=6LcMZR0UAAAAALgPMcgHwga7gY5p8QMg1Hj-bmUv" name="c-9xajmtra3vir" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox" style="width: 100%; height: 100%;"></iframe></div></div></body>

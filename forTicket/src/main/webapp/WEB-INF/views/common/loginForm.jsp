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
body, table {
    word-break: break-all;
    font-size: 13px;
    font-weight: 400;
}
.login_btn {
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
.login_submenu {
    margin-top: 25px;
    font-size: 14px;
}

* {
    margin: 0;
    padding: 0;
    font-family: 'Pretendard', 'Pretendard Variable';
}
div {
    display: block;
}
</style>
  <meta charset="UTF-8">
  <title>로그인창</title>
</head>
   <link rel="stylesheet" href="/resources/css/login.css">
<body>
<body style="max-height:650px;">

  <div class="login_wrap">

    <div>
      <img src="${contextPath}/resources/image/logo.png" style="width:150px; height: 102px;">
    </div>

    <form action="/login/?mode=login_reg" method="post">
      <input type="hidden" name="r" value="/">

      <div style="margin-top: 50px;">
        <input type="text" name="member_id" placeholder="아이디" class="input_box icon_id">
      </div>
      <div style="margin-top: 20px;">
        <input type="password" name="member_pass" placeholder="비밀번호" class="input_box icon_pass">
      </div>
      <div style="margin-top: 20px;">
        <input type="submit" class="login_btn" value="로그인">
      </div>

      <div class="login_submenu">
        <a href="/happy_member.php?mode=find_id">아이디 찾기</a>
        <span>|</span>
        <a href="/happy_member.php?mode=find_pass">비밀번호 찾기</a>
        <span>|</span>
        <a href="${contextPath}/member/memberForm.do">회원가입</a>
      </div>
    </form>

    <div class="simple_title">
      <div class="simple_line">
        <span class="simple_text">간편 로그인</span>
      </div>
    </div>

    <div class="social_wrap">
      <div>
        <img src="${contextPath}/resources/image/kakao.png" id="login_kakao" class="social_join_btn" alt="카카오로그인">
      </div>
    </div>

    <div class="join_noti">
      <a href="/bbs_detail.php?bbs_num=65&amp;tb=board_faq" style="width:100px; height: 102px;" target="_blank" alt="불편사항">
        ※ 회원가입/로그인에 문제가 있어요! &gt;
      </a>
    </div>

  </div>

  <!-- 하단 공통 통계 스크립트 -->
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
  
    // 필요한 내용 없음.. 쿼리스트링 전달도 필요없음


  //// 회원가입 or 수정 페이지
  

  // 로그인P or 회원가입 대문P : SNS로그인 처리
      // SNS 아이디로 로그인/가입, app 스킴 예외처리
    var sns_login = function (site, r, scheme = null) {
      r = r || '';
      let url;
      let cid = '';
      if (scheme === 'y') {
        authorizeUrl = encodeURIComponent(`https://timeticket.co.kr/login/app${site}.php/?r=${r}`);
        url = `timeticket://sns_login?url=${authorizeUrl}&provider=${site}`;
      } else {
        url = `/login/authorize?t=${site}&r=${r}`;
      }
      window.location.href = url;
    }

    // app 스킴 예외처리
    const appScheme = '';

    // 간편 로그인 : 회원가입 일때는 join과 cid 함께 전달
    if (window.location.href.includes('join')) {
      r = encodeURI('&from=join&cid=');
    } else if (window.location.href.includes('login')) {
      r = '';
    }
    $('#login_kakao').click(function (e) {
      sns_login('kakao', r, appScheme);
    });
    $('#login_naver').click(function (e) {
      sns_login('naver', r, appScheme);
    });
    $('#login_apple').click(function (e) {
      sns_login('apple', r);
    });

  
  function removeSpace(input) {
    var value = input.value.replace(/\s/g, ''); // 공백 제거
    input.value = value; // 수정된 값을 다시 입력란에 설정
  }

</script>
  
</body>
</html>

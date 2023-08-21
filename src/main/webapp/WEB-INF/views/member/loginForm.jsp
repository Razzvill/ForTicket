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
  <meta charset="UTF-8">
  <title>로그인창</title>
	<style>
	body, table {
	    word-break: break-all;
	    font-size: 13px;
	    font-weight: 400;
	}

	.input_box {
	    width: 350px;
	    height: 55px;
	    padding: 0 10px 0 60px;
	    font-size: 18px;
	    border-radius: 20px;
	    border: 1px solid #ddd;
	    background-repeat: no-repeat;
	    background-size: 24px;
	    background-position: 20px 15px;
	}
	
	.icon_id {
    	background-image:url("${contextPath}/resources/images/member/user_id.png");
	}
	
	.icon_pass{
		background-image:url("${contextPath}/resources/images/member/user_pass.png")
	}	
	
	.login_btn {
	    width: 425px;
	    height: 60px;
	    border: 1px solid #ff4b4b;
	    border-radius: 20px;
	    background: #ff4b4b;
	    color: #fff;
	    font-size: 18px;
	    font-weight: 600;
	    cursor: pointer;
	}
	
	.login_submenu {
	    margin-top: 25px;
	    font-size: 18px;
	    margin-bottom: 25px;
	}
	
	.find{
		text-decoration: none;
	    color: black;
	}
	
	.social_wrap{
		margin-bottom: 50px;
	}
	
	.kakao{
		width: 425px;
		cursor: pointer;
	}
	</style>
</head>
<body style="max-height:650px;">
  <div>
    <div style="margin-top:50px;">
      <img src="${contextPath}/resources/images/logo.png" style="width:150px;">
    </div>
    <form name="frmLogin" method="post" action="${contextPath}/member/login.do" >
      <input type="hidden" name="r" value="/">
      <div style="margin-top: 30px;">
        <input type="text" name="mem_id" placeholder="아이디" class="input_box icon_id">
      </div>
      <div style="margin-top: 30px;">
        <input type="password" name="pwd" placeholder="비밀번호" class="input_box icon_pass">
      </div>
      <div style="margin-top: 30px;">
        <input type="submit" class="login_btn" value="로그인">
      </div>
<!-- 로그인 실패 메시지 -->
<c:if test="${param.result == 'loginFailed'}">
    <div style="color: red; margin-top: 10px;">
        아이디나 비밀번호가 잘못되었습니다. 다시 시도해주세요.
    </div>
</c:if>
      <div class="login_submenu">
        <a href="${contextPath}/member/findId.do" class="find">아이디 찾기</a>
        <span>|</span>
        <a href="${contextPath}/member/findId.do" class="find">비밀번호 찾기</a>
        <span>|</span>
        <a href="${contextPath}/member/join.do" class="find">회원가입</a>
      </div>
    </form>
    <div class="social_wrap">
      <div>
        <a id="login_kakao" class="kakao" 
        href="https://kauth.kakao.com/oauth/authorize?client_id=bef73bba323cabf247befa4488582672&redirect_uri=REDIRECT_URI&response_type=code">
          <img src="${contextPath}/resources/images/member/kakao.png" alt="카카오로그인">
        </a>
      </div>
    </div>
  </div>

<script>
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
    r = encodeURI('&from=join&mem_id=');
} else if (window.location.href.includes('login')) {
    r = '';
}

// 카카오톡 간편 로그인 버튼 클릭 시 실행되는 함수
var loginKakaoButton = document.getElementById('login_kakao');
loginKakaoButton.addEventListener('click', function (e) {
    e.preventDefault(); // 기본 클릭 동작 방지
    sns_login('kakao', r, appScheme); // sns_login 함수 호출
});
</script>
</body>
</html>

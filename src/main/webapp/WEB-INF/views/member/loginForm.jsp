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
        <a id="kakao-login-btn" href="javascript:loginWithKakao()">
          <img src="${contextPath}/resources/images/member/kakao.png" alt="카카오로그인">
        </a>
        <p id="token-result"></p>
      </div>

    </div>
  </div>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
  integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
<script>
Kakao.init('9c4ab2164685265e5b9aa5dd366cab70'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script>
function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://kauth.kakao.com/oauth/authorize',
    });
  }

displayToken()
function displayToken() {
  var token = getCookie('authorize-access-token');

  if(token) {
    Kakao.Auth.setAccessToken(token);
    Kakao.Auth.getStatusInfo()
      .then(function(res) {
        if (res.status === 'connected') {
          document.getElementById('token-result').innerText
            = 'login success, token: ' + Kakao.Auth.getAccessToken();
        }
      })
      .catch(function(err) {
        Kakao.Auth.setAccessToken(null);
      });
  }
}

function getCookie(name) {
  var parts = document.cookie.split(name + '=');
  if (parts.length === 2) { return parts[1].split(';')[0]; }
}
</script>
</body>
</html>

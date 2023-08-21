<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
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
<title>아이디찾기</title>
<style>
  .wrap_tab {
    display: flex;
  }

  .tab_find_id,
  .tab_find_pass {
    flex: 1;
    text-align: center;
    font-size: 22px;
    padding: 20px 0;
    color: #ccc;
    font-weight: 600;
    border-bottom: 3px solid #f1f1f1;
    cursor: pointer;
  }

  .tab_find_id.active,
  .tab_find_pass.active {
    color: #000;
    font-weight: 700;
    border-bottom: 6px solid #000;
  }

  .show_find_id,
  .show_find_pass {
    display: none;
  }

  .wrap_title { text-align:center; padding-top: 40px; color: #000; font-size: 24px; font-weight: 100; line-height: 150%; }
  .title_bold { font-weight: 600; }

  .section_wrap { margin: 40px 0; text-align:center; background: #fff; }

  .icon_id { background-image : url('mobile_img/member/user_id.png'); }
  .icon_email { background-image : url('mobile_img/member/user_email.png'); }
  .icon_hphone { background-image : url('/mobile_img/member/user_hphone.png'); }

  .input_box {
    width: 350px; height: 60px; padding: 0 10px 0 60px; font-size: 18px;
    border-radius: 10px; border: 1px solid #ddd; background-repeat : no-repeat; background-size : 27px;
    background-position: 20px 15px; /* 오른쪽, 아래 */
  }

  .btn_submit {
    width: 425px; height: 60px; margin-top:30px; border: 1px solid #ff4b4b; border-radius: 10px;
    background: #ff4b4b; color: #fff; font-size: 18px; font-weight: 600; cursor: pointer;
  }

  .noti { margin-top: 30px; margin-left:35px; width: 388px; padding: 20px; border:none; border-radius:10px; background: #f5f5f5; color:#333; font-size: 14px; text-align: justify; line-height: 180%; }
    .noti a { color: #0057FF; text-decoration: underline; }
    
    .icon_email {
background-image: url("${contextPath}/resources/images/member/user_email.png");
}
	
.icon_phone{
background-image: url("${contextPath}/resources/images/member/user_hphone.png");
}
</style>
</head>
<body>
<div style="width:500px; margin:0 auto; margin-bottom:40px; border:1px solid #ccc; border-radius: 20px;">

  <div class="wrap_tab">
    <div class="tab_find_id active">아이디</div>
    <div class="tab_find_pass">비밀번호</div>
  </div>

  <div class="show_find_id" style="display: block;">
    <section class="wrap_title">
    <img src="${contextPath}/resources/images/logo.png" style="width:150px;"><br>
      가입한 회원 정보로<br><span class="title_bold">아이디</span>를 확인하세요.
    </section>

    <div class="section_wrap">
      <form action="${contextPath}/member/findIdResult.do" method="post">
        <input type="text" name="mem_name" placeholder="이름" maxlength="13" class="input_box icon_phone" required="">
        <input type="text" name="phone" placeholder="휴대폰 번호" class="input_box icon_email" style="margin-top:15px;" required="">
        <button class="btn_submit">아이디 찾기</button>
      </form>
    </div>
  </div>


  <div class="show_find_pass" style="display: none;">
    <section class="wrap_title">
      가입한 이메일 주소로<br><span class="title_bold">임시 비밀번호</span>를 보내드려요.
    </section>

    <div class="section_wrap">
      <form action="happy_member.php?mode=find_pass_result" method="post">
        <input type="text" name="member_id" placeholder="아이디" class="input_box icon_id" required="">
        <input type="text" name="member_email" placeholder="이메일" class="input_box icon_email" style="margin-top:15px;" required="">
        <button class="btn_submit">임시 비밀번호 발급</button>
      </form>
    </div>
  </div>

</div>
</body>
</html>
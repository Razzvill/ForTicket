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
	<title>회원 가입창</title>
	<style>
	.join_wrap {
	    width: 500px;
	    margin: 50px auto;
	    padding: 60px 0 50px 0;
	    text-align: center;
	    border: 3px solid #ffd1d1;
	    border-radius: 30px;
	    background-color: #fff;
	}

	.dot_line {
		margin-top:10px;
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
    	background-image: url("${contextPath}/resources/images/member/user_id.png");
	}
	
	.icon_pass {
    	background-image: url("${contextPath}/resources/images/member/user_pass.png");
	}
	
	.icon_pass2 {
    	background-image: url("${contextPath}/resources/images/member/user_pass2.png");
	}
	
	.icon_name {
    	background-image: url("${contextPath}/resources/images/member/user_name.png");
	}
	
	.icon_email {
    	background-image: url("${contextPath}/resources/images/member/user_email.png");
	}
	
	.icon_phone{
		background-image: url("${contextPath}/resources/images/member/user_phone.png");
	}
		
	.post {
		margin-top: 10px;
	    width: 235px;
	    height: 55px;
	    padding: 0 10px 0 60px;
	    font-size: 18px;
	    border-radius: 20px;
	    border: 1px solid #ddd;
	    background-repeat: no-repeat;
	    background-size: 24px;
	    background-position: 20px 15px;
	}
	
	.post1{
		margin-top: 10px;
	    width: 100px;
	    height: 55px;
	    border: 1px solid #ff4b4b;
	    border-radius: 10px;
	    background: #ff4b4b;
	    color: #fff;
	    font-size: 18px;
	    font-weight: 600;
	    cursor: pointer;
	    text-decoration: none;
	}

	.section_wrap {
	    margin-top: 7px;
	}

	:root {
	    --swiper-navigation-size: 44px;
	}
	
	:root {
	    --swiper-theme-color: #007aff;
	}
	
	.checkbox_group {
	    width: 350px;
	    padding: 5px 25px;
	    margin-top: 20px;
	    margin-left: 70px;
	    margin-bottom: 15px;
	    border: none;
	    border-radius: 10px;
	    background: #f5f5f5;
	    color: #333;
	    text-align: left;
	    line-height: 180%;
	}
	
	.btn_submit {
	    width: 350px;
	    height: 55px;
	    border: 1px solid #ff4b4b;
	    border-radius: 20px;
	    background: #ff4b4b;
	    color: #fff;
	    font-size: 18px;
	    font-weight: 600;
	    cursor: pointer;
	}
	</style>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
	<div class="join_wrap">
	<div>
    	<img src="${contextPath}/resources/images/logo.png" style="width:150px;">
    </div>
    <form action="${contextPath}/member/addMember.do" method="post">	
	<div id="detail_table">
		<table>
			<tbody>
				<tr>
					<td>
						<input type="text" name="_member_id"  id="_member_id" placeholder="아이디" size="20" class="dot_line icon_id"/>
						<input type="hidden" name="member_id"  id="member_id" />						
					</td>
				</tr>
				<tr>
					<td><input name="member_pw" type="password" placeholder="비밀번호" size="20" class="dot_line icon_pass"/></td>
				</tr>
				<tr>
					<td><input name="member_pw" type="password" placeholder="비밀번호확인" size="20" class="dot_line icon_pass2"/></td>
				</tr>
				<tr>
					<td><input name="member_name" type="text" placeholder="이름" size="20" class="dot_line icon_name"/></td>
				</tr>
				<tr>
					<td><input name="member_name" type="text" placeholder="이메일" size="20" class="dot_line icon_email"/></td>
				</tr>
				<tr>
					<td><input size="10px"  type="text" name="hp2"class="dot_line icon_phone"></td> 
				</tr>
				<tr>
					<td>
						<input type="text" id="zipcode" name="zipcode" size="10" class="post" disabled> <a href="javascript:execDaumPostcode()" class="post1">우편번호찾기</a>
						<input type="text" id="roadAddress"  name="roadAddress" placeholder="세부주소1" size="50" class="dot_line">
					  	<input type="text" id="jibunAddress" name="jibunAddress" placeholder="세부주소2" size="50" class="dot_line">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</table>
	<section class="section_wrap" style="margin-top:30px;">
	<div>이용약관 동의</div>
	<div class="checkbox_group" style="margin-top:0;">
		<div class="check_all">
			<input type="checkbox" id="check_all" class="checkbox">
			<label for="check_all">전체 동의</label>
		</div>
		<div class="checkbox_line">
			<input type="checkbox" id="check_1" class="checkbox">
			<label for="check_1">만 14세 이상입니다<span class="check_req">(필수)</span></label>
		</div>
		<div class="detail_seperate">
		<div>
			<input type="checkbox" id="check_2" class="checkbox">
			<label for="check_2">이용약관 동의<span class="check_req">(필수)</span></label>
		</div>
		<div class="detail_seperate" style="border:none;">
		<div>
			<input type="checkbox" id="check_3" class="checkbox">
			<label for="check_3">개인정보 수집·이용 동의<span class="check_req">(필수)</span></label>
		</div>
		</div>
		</div>
		<div>
			<div class="input_title" disabled="" id="recaptcha-container"><div class="grecaptcha-badge" data-style="bottomright" style="width: 256px; height: 60px; display: block; transition: right 0.3s ease 0s; position: fixed; bottom: 14px; right: -186px; box-shadow: gray 0px 0px 5px; border-radius: 2px; overflow: hidden;"><div class="grecaptcha-logo"><iframe title="reCAPTCHA" src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6LcMZR0UAAAAALgPMcgHwga7gY5p8QMg1Hj-bmUv&amp;co=aHR0cHM6Ly90aW1ldGlja2V0LmNvLmtyOjQ0Mw..&amp;hl=ko&amp;v=3kTz7WGoZLQTivI-amNftGZO&amp;size=invisible&amp;cb=sqgb2miiatpc" width="256" height="60" role="presentation" name="a-9xajmtra3vir" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox"></iframe></div><div class="grecaptcha-error"></div><textarea id="g-recaptcha-response" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea></div><iframe style="display: none;"></iframe></div>
		</div>
	</div>
			<input type="button" id="submitComplete" class="btn_submit" value="가입완료" alt="가입완료">
	</section>	
    </form>
	</div>
</body>
</html>
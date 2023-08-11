<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function fn_login(isLogOn, getUserInfo, loginForm) {
		if (isLogOn != '' & isLogOn != 'false') {
			location.href = getUserInfo;
		} else {
			alert("로그인 후 가능합니다.")
			location.href = loginForm;
		}
	}
	function fn_login1(isLogOn, getUserGrade, loginForm) {
		if (isLogOn != '' & isLogOn != 'false') {
			location.href = getUserGrade;
		} else {
			alert("로그인 후 가능합니다.")
			location.href = loginForm;
		}
	}
</script>
<style>
.side1 {
	text-align: center;
	font-family: 'Cafe24Supermagic-Bold-v1.0';
}

.side2 {
	text-decoration: none;
	font-size: 20px;
	color: #0066cc;
}

@font-face {
	font-family: 'Cafe24Supermagic-Bold-v1.0';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/Cafe24Supermagic-Bold-v1.0.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}
</style>
</head>

<body>
	<div class="mypage_wrap">
		<div class="mypage_left">
			<div class="mypage_left_title">마이페이지</div>
			<ul>
				<li>
			</ul>
		</div>
	</div>
</body>
</html>
<input type="hidden" name="UserId" id="UserId" value="${UserId}" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

				<c:set var="contextPath" value="${pageContext.request.contextPath}" />

				<% request.setCharacterEncoding("utf-8"); %>
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
								src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/Cafe24Supermagic-Bold-v1.0.woff2') format('woff2');
								font-weight: 700;
								font-style: normal;
							}
						</style>
					</head>

					<body>
						<div class="side1">
							<br><br>
							<c:choose>
								<c:when test="${side_menu=='admin_mode' }">
									<a href="${contextPath}/admin/listMembers.do" class="side2">학생정보 및 성적등록</a><br><br>
									<a href="${contextPath}/admin/listGrade.do" class="side2">학생 성적 리스트</a><br><br>
								</c:when>
							</c:choose>
							<a href="javascript:fn_login('${isLogOn }', '${contextPath }/admin/getUserInfo.do','${contextPath }/member/loginForm.do')"
								class="side2">나의 정보</a><br><br>
							<a href="javascript:fn_login1('${isLogOn }', '${contextPath }/admin/getUserGrade.do','${contextPath }/member/loginForm.do')"
								class="side2">성적
								확인</a><br><br>
						</div>
					</body>

					</html>
					<input type="hidden" name="UserId" id="UserId" value="${UserId}" />
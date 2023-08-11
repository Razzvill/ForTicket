<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<c:set var="contextPath" value="${pageContext.request.contextPath}" />

			<% request.setCharacterEncoding("utf-8"); %>
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>회원 가입창</title>
					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
						rel="stylesheet"
						integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
						crossorigin="anonymous">
					<script src="http://code.jquery.com/jquery-latest.min.js"></script>
					<script type="text/javascript">
						function readURL(input) {
							if (input.files && input.files[0]) {
								var reader = new FileReader();
								reader.onload = function (e) {
									$('#preview').attr('src', e.target.result);
								}
								reader.readAsDataURL(input.files[0]);
							}
						}
					</script>
					<style>
						.d1 {
							font-family: 'Cafe24Supermagic-Bold-v1.0';
						}

						.h2 {
							text-align: center
						}

						.member2 {
							font-family: 'Cafe24Supermagic-Bold-v1.0';
							padding: 10px;
							font-size: 20px;
							text-align: right;
							width: 150px;
							height: 40px;
						}

						.member4 {
							font-family: 'Cafe24Supermagic-Bold-v1.0';
							padding: 10px;
							font-size: 20px;
							border-radius: 5px;
							text-align: left;
							width: 350px;
						}

						.member3 {
							font-family: 'Cafe24Supermagic-Bold-v1.0';
							border: 1px solid #99e6ff;
							width: 200px;
							height: 30px;
							border-radius: 5px;
						}

						.member5 {
							font-family: 'Cafe24Supermagic-Bold-v1.0';
							width: 100px;
							height: 30px;
							background-color: #99e6ff;
							color: #0066cc;
							border: none;
							border-radius: 5px;
						}

						.member6 {
							font-family: 'Cafe24Supermagic-Bold-v1.0';
							width: 220px;
							height: 30px;
							background-color: #99e6ff;
							color: #0066cc;
							border: none;
							border-radius: 5px;
						}

						.member7 {
							height: 80px;
							text-align: center;
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
					<div class="d1">
						<form name="form" method="post" action="${contextPath}/member/addMember.do"
							enctype="multipart/form-data">
							<br>
							<h2 class="h2">회원 가입</h2><br>
							<table align="center">
								<tr class="member2">
									<td class="member2">아이디</td>
									<td class="member4"><input class="member3" type="text" name="id"></td>
								</tr>
								<tr class="member2">
									<td class="member2">비밀번호</td>
									<td class="member4"><input class="member3" type="password" name="pwd"></td>
								</tr>
								<tr class="member2">
									<td class="member2">이름</td>
									<td class="member4"><input class="member3" type="text" name="name"></td>
								</tr>
								<tr class="member2">
									<td class="member2">이메일</td>
									<td class="member4"><input class="member3" type="text" name="email"></td>
								</tr>
								<tr class="member2">
									<td class="member2">사진 등록 </td>
									<td class="member4"><input class="member6" type="file" name="imageFileName"
											onchange="readURL(this);" />
										<img id="preview" src="#" width=200 height=200 />
									</td>
								</tr>
								<tr class="member2">
									<td class="member7" colspan="2">
										<input class="member5" type="submit"
											value="가입하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input class="member5" type="reset" value="다시입력">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</body>

				</html>
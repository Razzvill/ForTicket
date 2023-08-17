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
<title>검색 결과</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<style>
    .search_phrse {
       font-size: 25px;
	   font-weight: 900;
	   text-align: center;
	   padding-top: 50px;
    }
	.wrap_1100 {
		margin: auto;
		width: 1100px;
		position: relative;
	}

	.main_title {
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-top: 50px;
		}

	.main_title_more {
		position: absolute;
		right: 0;
		font-size: 15px;
		text-decoration: none;
	}
	
	a, a.underline {
	   color: #000;
	   text-decoration: none;
	}
	
	.list{
		position: relative;
	    width: 255px;
	    margin-right: 26px;
	    margin-bottom: 60px;
	    letter-spacing: -1px;
	    text-align: left;
	    transition: transform 0.3s ease-in-out;
	}
	
	.list .thumb img{
		width: 255px;
	    height: 357px;
	    border-radius: 10px;
	    border: 1px solid #eee;
	}
	
	.list:hover {
		transform: translateY(-5px);
	}
	
	.text{
		margin-top: 10px;
	}
	
	.price {
	    display: flex;
	    justify-content: space-between;
	    margin-top: 15px;
	    font-size: 18px;
	    color: #000;
	    font-weight: 600;
	    text-align: left;
	}
</style>
</head>

<body>
	<div class="search_phrse" id="search_phrse">
    <p>                                                                                                                                 
        <strong class="fc_serch">‘망원동’</strong>에 대한 검색 결과입니다.
        <span class="search_speller"><a class="fc_serch" href="javascript:melon.link.goTotalSearch('ㅁㅁㅁ','total','searchFrm','','','N','RESULT')"></a></span>  
    </p>
</div>

	<section>
		<!-- 연극 -->
		<div class="wrap_1100">
			<div class="main_title">
			연극
			</div>
		<br>
		<div class="wrap_1100">	
			<table style="width: 100%; border: 0; cellpadding: 0; cellspacing: 0;">
			<tbody>
			<tr>
				<td valign="top" align="left">
					<a href="#">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/resources/images/drama/drama2.jpg" alt="연극2">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 연극 &gt; 드라마</p>
								<p style="font-size: 20px;">망원동 브라더스</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.4 <span>(61)</span></span>
									<span style="padding-right:30px;">27,500원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
				</tr>
				</tbody>
				</table>
				</div>
				</div>
				</section>
</body>

</html>
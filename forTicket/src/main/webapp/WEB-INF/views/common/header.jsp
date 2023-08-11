<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>헤더</title>
	<style type="text/css">
	#top_gnb{
		margin: 0;
    	margin-top: 10px;
    	list-style: none;
    	padding: 0;
	}

	.gnb_wrap{
		position: relative;
   		width: 1100px;
    	margin: auto;
	}
	
	.gnb_nav {
		list-style: none;
    	vertical-align: top;
	}
	
	ul, li, dl, dt, dd {
    	list-style: none;
    	margin: 0;
    	padding: 0;
    	float: left;
	}
	
	input:focus {
		outline: none;
	}
	
	.search_box {
		font-size:15px;
		height:38px; 
		line-height:38px; 
		padding:0 20px; 
		vertical-align:top; 
		border:1px solid #e0e0e0; 
		width:300px; 
		border-radius:20px; 
		color:#999; 
		background: #f9f9f9;
	}
	
	.gnb_nav > li {
		font-weight: 800;
    	position: relative;
   		color: #333;
    	height: 50px;
    	line-height: 50px;
    	border: 0px solid #fff;
    	padding-right:7px;
	}
	
	.button {
        color: black;
        text-align: center;
        text-decoration: none;
        font-size: 20px;
        display: inline-block;
        cursor: pointer;
	}
	
	.red-text-underline {
		color: red;
        text-decoration: underline red 2px;
    }
    
    .top{
    	font-size: 12px;
    	text-decoration: none;
    }
	</style>
	<script>
        var previousButton = null;

        function changeStyle(link) {
            if (previousButton !== null) {
                // 이전 버튼의 스타일을 원래 스타일로 되돌리기
                previousButton.classList.remove('red-text-underline');
            }

            // 빨간색으로 글자색 및 밑줄 변경
            link.classList.add('red-text-underline');

            // 현재 버튼을 이전 버튼으로 설정
            previousButton = link;
        }
	</script>
	
</head>
<body>
<div style="width:100%; background: #fff;">
	<!-- header 상단 -->
	<c:choose>
	<c:when test="${isLogOn == true && member != null }">
	<div class="gnb_wrap" style="height:30px;">
		<div style="position:absolute; right:0;">
		<ul id="top_gnb">
			<li><a class="top" href="#">{member.id}님<br></a></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a class="top" href="#">마이페이지<br></a></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a class="top" href="${contextPath }/member/logout.do">로그아웃<br></a></li>
		</ul>
		</div>
	</div>
	</c:when>
	<c:when test="${isLogOn == true && member.id == 'business' }">
	<div class="gnb_wrap" style="height:30px;">
		<div style="position:absolute; right:0;">
		<ul id="top_gnb">
			<li><a class="top" href="#">사업자님<br></a></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a class="top" href="#">마이페이지<br></a></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a class="top" href="${contextPath }/member/logout.do">로그아웃<br></a></li>
		</ul>
		</div>
	</div>
	</c:when>
	<c:when test="${isLogOn == true && member.id == 'admin' }">
	<div class="gnb_wrap" style="height:30px;">
		<div style="position:absolute; right:0;">
		<ul id="top_gnb">
			<li><a class="top" href="#">관리자님<br></a></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a class="top" href="${contextPath }/member/logout.do">로그아웃<br></a></li>
		</ul>
		</div>
	</div>
	</c:when>
	<c:otherwise>
	<div class="gnb_wrap" style="height:30px;">
    	<div style="position:absolute; right:0;">
		<ul id="top_gnb">
			<li><a href="${contextPath}/member/loginForm.do" class="top">로그인</a></li>
  			<li>&nbsp;|&nbsp;</li>
  			<li><a href="#" class="top">회원가입</a></li>
		</ul>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
	<!-- header 중단 -->
	<div class="gnb_wrap" style="height:55px; padding-top:0px;">

		<a href="${contextPath}/main.do">
	      <img src="${contextPath}/resources/images/logo.png" style="width:100px; height:55px; margin-top:0px; float: left;">

	    </a>
	    <div style="position:absolute; top:2px; left:380px;">
			<form name="frm" method="get" action="">
				<div style="vertical-align:top; position:relative;">
	    			<input type="text" name="search_word" id="search_word" value="" class="search_box">
						<div style="position:absolute; top:2px; left:300px;">

	      					<input name="image" type="image" src="${contextPath}/resources/images/search_btn.png" alt="검색하기" style="padding: 8px;">

	    				</div>
	  			</div>
			</form>
	    </div>
	</div>
	<!-- header 하단 -->
	<c:choose>
	<c:when test="${header_menu }='admin_mode'}">
		<div class="gnb_wrap" style="height:55px; padding-top:5px;">
	    <ul class="gnb_nav">
	      <li class="" style="padding-right:84px;"><a href="#" class="button" onclick="changeStyle(this)">연극</a></li>
	      <li class="" style="padding-right:84px;"><a href="#" class="button" onclick="changeStyle(this)">뮤지컬</a></li>
	      <li class="" style="padding-right:84px;"><a href="#" class="button" onclick="changeStyle(this)">공연</a></li>
	      <li class="" style="padding-right:84px;"><a href="#" class="button" onclick="changeStyle(this)">공연장</a></li>
	      <li class="" style="padding-right:84px;"><a href="#" class="button" onclick="changeStyle(this)">예매관리</a></li>
	      <li class="" style="padding-right:84px;"><a href="#" class="button" onclick="changeStyle(this)">이벤트</a></li>
	      <li class="" style="padding-right:84px;"><a href="#" class="button" onclick="changeStyle(this)">커뮤니티</a></li>
	      <li><a href="#" class="button" onclick="changeStyle(this)">고객센터</a></li>
	    </ul>
	</div>
	</c:when>
	<c:when test="${header_menu }='business_mode'}">
		<div class="gnb_wrap" style="height:55px; padding-top:5px;">
	    <ul class="gnb_nav">
	      <li class="" style="padding-right:122px;"><a href="#" class="button" onclick="changeStyle(this)">상품관리</a></li>
	      <li class="" style="padding-right:122px;"><a href="#" class="button" onclick="changeStyle(this)">공연장관리</a></li>
	      <li class="" style="padding-right:122px;"><a href="#" class="button" onclick="changeStyle(this)">회원관리</a></li>
	      <li class="" style="padding-right:122px;"><a href="#" class="button" onclick="changeStyle(this)">이벤트</a></li>
	      <li class="" style="padding-right:122px;"><a href="#" class="button" onclick="changeStyle(this)">커뮤니티</a></li>
	      <li><a href="#" class="button" onclick="changeStyle(this)">고객센터</a></li>
	    </ul>
	</div>
	</c:when>
	<c:otherwise>
		<div class="gnb_wrap" style="height:55px; padding-top:5px;">
		    <ul class="gnb_nav">
		      <li class="" style="padding-right:105px;"><a href="#" class="button" onclick="changeStyle(this)">연극</a></li>
		      <li class="" style="padding-right:105px;"><a href="#" class="button" onclick="changeStyle(this)">뮤지컬</a></li>
		      <li class="" style="padding-right:105px;"><a href="#" class="button" onclick="changeStyle(this)">공연</a></li>

		      <li class="" style="padding-right:105px;"><a href="${contextPath}/theater/listTheater.do" class="button" onclick="changeStyle(this)">공연장</a></li>

		      <li class="" style="padding-right:105px;"><a href="#" class="button" onclick="changeStyle(this)">이벤트</a></li>
		      <li class="" style="padding-right:105px;"><a href="#" class="button" onclick="changeStyle(this)">커뮤니티</a></li>
		      <li><a href="#" class="button" onclick="changeStyle(this)">고객센터</a></li>
		    </ul>
		</div>
	</c:otherwise>
	</c:choose>
</div>
</body>
</html>
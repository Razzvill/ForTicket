<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 커뮤티니</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
 
<script>
$(document).ready(function(){

    $('.box').each(function(){
        var content = $(this).children('.content');
        var content_txt = content.text();
        var content_txt_short = content_txt.substring(0,100)+"...";
        var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');

        
        $(this).append(btn_more);
        
        if(content_txt.length >= 100){
            content.html(content_txt_short)
            
        }else{
            btn_more.hide()
        }
        
        btn_more.click(toggle_content);
        // 아래 bind가 안 되는 이유는??
        // btn_more.bind('click',toggle_content);

        function toggle_content(){
            if($(this).hasClass('short')){
                // 접기 상태
                $(this).html('더보기');
                content.html(content_txt_short)
                $(this).removeClass('short');
            }else{
                // 더보기 상태
                $(this).html('접기');
                content.html(content_txt);
                $(this).addClass('short');

            }
        }
    });
});

</script>    

<style>
	.wrap_1100 {
		margin: auto;
		width: 1100px;
		position: relative;
	}
	
	.main_title{
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-top: 50px;
	}
	
	.main_title_more {
		position: absolute;
		right: 750px;
		font-size: 15px;
		text-decoration: none;
	}
		
	.review_title {
    	display: flex;
    	justify-content: space-between;
    	padding: 10px 0 7px 0;
	}

	.review_title_left {
    	display: flex;
    	align-items: center;
	}

	.review_title_left_stars {
	    width: 95px;
	    height: 16px;
	}

	.review_title_left_star {
	    background-image: url(${contextPath}/resources/images/stars.png);
	    background-repeat: no-repeat;
	    background-size: 95px;
	    width: 100%;
	    height: 16px;
	}

	.review_title_left_star_filled {
	    position: absolute;
	    background-image: url(${contextPath}/resources/images/member/stars.png);
	    background-repeat: no-repeat;
	    background-size: 95px;
	    height: 16px;
	}
	
	.review_title_left_name {
   		align-items: flex-end;
	}

	.review_title_left_name, .review_title_right {
	    color: #777;
	    font-size: 14px;
	}
	
	.review_text {
    	position: relative;
	}
	
	.review_text_area {
    display: -webkit-box;
    width: 99%;
    position: relative;
    max-height: 38px;
    overflow: hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    color: #333;
    text-align: justify;
    font-size: 15px;
    line-height: 25px;
    padding-top: 7px;
    padding-bottom: 10px;
	}
	
	   .box{margin:30px;}
        .cont{
            width:400px;
            padding:10px;
            border:1px solid #ddd;
            font: 400 1rem/1.5rem 'NotoSansKR';
        }
</style>
</head>
<body>
<div class="wrap_1100">
	<div class="main_title">
    	<div style="text-align:left;">커뮤니티 관리</div>
    	<div class="main_title_more"><a href="${contextPath}/community/adminCommunity.do" align="left"> 리뷰조회</a> | 리뷰삭제</div>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 50px; margin-bottom:10px;"></div>
        <div style="border-color: #FF6251; width:auto;"></div>
    </div>
   	<div class="review_title">
		<div class="review_title_left">
    		<div class="review_title_left_stars">
        		<div class="review_title_left_star">
          			<div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        		</div>
        	</div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				장*림
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-08-17
		</div>
	</div>
</div>

<div class="box">
    <div class="cont">
    편하긴 엄청 편합니다. 단지 발볼이 조금 넓으신 분들은 신으실때 불편할수도...? 신다보면 괜찮을거같아요 편하긴 엄청 편합니다. 단지 발볼이 조금 넓으신 분들은 신으실때 불편할수도...? 신다보면 괜찮을거같아요 다보면 괜찮을거 다보면 괜찮을거
    </div>
</div>
<div class="box">
    <div class="cont">
            시 맘에드는 상품입니다. 검정은 진리...가볍고 편하네요
    </div>
</div>
<div class="box">
    <div class="cont">
        저는 트레포일 타이즈 네이비 색상에 파이어버드 트랙 탑 네 <br/>
        이비 색상을 같이 코디해 보았습니다 타이즈에는 오버핏 티셔츠나 <br/>
        맨투맨 저지를 입는 게 꾸민 듯 안 꾸민 듯 이쁘다고 생각을 하는데요 봄<br/><br/>
        <br/>
        여름 가을 상의만 바꿔주면 어디든 어울리는 정말 기본 타이즈라서 추<br/>
        천에 추천을 드립니다
    </div>
</div>

</body>

</html>
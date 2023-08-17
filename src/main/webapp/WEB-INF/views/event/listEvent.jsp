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
	<title>진행중인 이벤트</title>
	<style>
	a {
	    font-size: 0;
	    text-decoration: none;
	    outline: none;
	    color: inherit;
	}
	.event-main-list ul {
	    margin-left: -45px;
	}
	.event-main-list li > a {
	    display: block;
	    position: relative;
	    width: 100%;
	    height: 405px;
	    margin-bottom: 38px;
	    overflow: hidden;
	}
	.event-main-list li > a img {
	    display: block;
	    width: 100%;
	    height: 258px;
	    transition: all ease-out 0.3s;
	}
	.event-main-list li > a .eve-mlist-tit {
	    position: absolute;
	    left: 0;
	    top: 75px;
	    font-size: 16px;
	    color: #333;
	    line-height: 23px;
	    height: 46px;
	    overflow: hidden;
	}
	.event-main-list li > a .eve-mlist-txt {
	    position: absolute;
	    left: 0;
	    top: 135px;
	    font-size: 13px;
	    color: #999;
	}
	.event-main-list li > a .eve-mlist-mark span#disc {
	    display: inline-block;
	    min-width: 67px;
	    height: 28px;
	    line-height: 28px;
	    text-align: center;
	    padding: 0 8px;
	    font-size: 15px;
	    font-weight: 700;
	    color: #ec7d2c;
	    border: 1px solid #ec7d2c;
	    border-radius: 15px;
	}
	.event-main-list li > a .eve-mlist-mark span#inv {
	    display: inline-block;
	    min-width: 67px;
	    height: 28px;
	    line-height: 28px;
	    text-align: center;
	    padding: 0 8px;
	    font-size: 15px;
	    font-weight: 700;
	    color: #3E90FF;
	    border: 1px solid #3E90FF;
	    border-radius: 15px;
	}
	.mypage4{
		border:3px solid #d2d2d2;
		border-radius: 15px;
		padding:10px 15px;
		font-size:15px;
		line-height:280%;
		border-color: #FF6251;
		padding-bottom: 50px;
	}
	.event-division {
		text-align: center;
		margin-bottom: 60px;
	}
	.event-division a {
		display: inline-block;
	    font-size: 16px;
	    font-weight: 700;
	    margin: 0 45px;
	    color: #888;
	    position: relative;
	}
	.event-division a#on {
	    color: #FF6251;
	}
	.event-division a:after {
	    content: "";
	    display: block;
	    width: 1px;
	    height: 15px;
	    background: #ddd;
	    position: absolute;
	    top: 15px;
	    right: -45px;
	}
	.event-division a:last-child {
	    margin-right: 0;
	}
	</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//진행중.종료된 이벤트 클릭 시 폰트 컬러 적용 이벤트
$(function(){
	$(".event-division a").on('click',function(e){
		e.preventDefault();
		$(".event-division a").removeClass("on");
		$(this).addClass("on");
	});
});

//탭 전환 이벤트
const $nav = document.querySelector('#tab-button-nav')
const $sections = document.querySelectorAll('.tab-section');

$nav.addEventListener('click', (e) => {
  if (!e.target.classList.contains('tab-button')) {
    return;
  }
  
  const focusedTabId = e.target.dataset.tabSection;

  $sections.forEach(($section) => {
    if ($section.id === focusedTabId) {
      $section.removeAttribute('hidden');
    } else {
      $section.setAttribute('hidden', true);
    }
  });
});
</script>

</head>

<body>
<div class="mypage4">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:center;">이벤트</h2>
    </div>
	<nav class="event-division">
		<a id="on" class="tab" data-tab-section="event-ing">진행중인 이벤트</a>
		<a id="" class="tab" data-tab-section="event-end">종료된 이벤트</a>
	</nav>
	<div class="clear"></div>
	<div class="event-main-list">
		<section id="tab-section-1" class="event-ing">
			<ul>
				<c:forEach var="event" items="eventList">
					<c:if test="${event.event_status == 'ing'}">
						<li>
							<a href="${contextPath}/event/detailEvent.do?event_no=${event.event_no}">
								<img src="${contextPath}/event/download.do?event_no=${event.event_no}&event_image=${event.event_image}" alt="${event.event_name}">
								<div class="eve-mlist-box">
									<c:choose>
										<c:when test="${event.event_type == 'disc'}">
											<p class="eve-mlist-mark"><span id="disc">할인</span></p>
										</c:when>
										<c:otherwise>
											<p class="eve-mlist-mark"><span id="inv">초대권 증정</span></p>
										</c:otherwise>
									</c:choose>
									<p class="eve-mlist-tit">${event.event_name}</p>
									<p class="eve-mlist-txt">${event.event_startDate} ~ ${event.event_endDate} | ${event.event_finalDate} 발표</p>
								</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</section>
		<section id="tab-section-2" class="event-end">
			<ul>
				<c:forEach var="event" items="eventList">
					<c:if test="${event.event_status == 'end'}">
						<li>
							<a href="${contextPath}/event/detailEvent.do?event_no=${event.event_no}">
								<img src="${contextPath}/event/download.do?event_no=${event.event_no}&event_image=${event.event_image}" alt="${event.event_name}">
								<div class="eve-mlist-box">
									<c:choose>
										<c:when test="${event.event_type == 'disc'}">
											<p class="eve-mlist-mark"><span id="disc">할인</span></p>
										</c:when>
										<c:otherwise>
											<p class="eve-mlist-mark"><span id="inv">초대권 증정</span></p>
										</c:otherwise>
									</c:choose>
									<p class="eve-mlist-tit">${event.event_name}</p>
									<p class="eve-mlist-txt">${event.event_startDate} ~ ${event.event_endDate} | ${event.event_finalDate} 발표</p>
								</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</section>
	</div>
</div>
</body>
</html>
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
	<title>1:1</title>
	<style>
	.center{
		border:3px solid #bcbcbc;
		border-radius: 20px;
		padding:30px;
		font-size:15px;
		line-height:280%;
		border-color: #bcbcbc;
		padding-bottom: 50px;
	}
	
	.board{
		width: 100%;
    	border: 1px solid #bcbcbc;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #bcbcbc;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	.boardtr{
		 border-bottom: 2px solid #bcbcbc;
	}
	
	.boardtd{
		font-size: 15px;
		font-weight: 600;
	}
	
	.boardtd1{
		font-size: 15px;
		font-weight: 600;
		width:550px;
	}
	
	.cls1{
		text-decoration: none;
	    color: black;
	    margin-left: 750px;
	    font-size: 15px;
	    font-weight: 600;
	}
	
	.text-wrapper {
    	position: relative;
	}
	
	.text {
		/* 요소의 내용이 영역을 벗어날 경우 그 부분은 숨겨지게 처리 */ 
		overflow: hidden;
		/* 요소의 표시 방법을 -webkit-box로 표시 */
		display: none;
		/* webkit-box로 표시된 자식 요소들의 배치 방법 결정 (여기서는 수직) */ 
		-webkit-box-orient: vertical;
		/* 요소 내 텍스트를 지정한 라인수까지만 표시 */
		-webkit-line-clamp: 0;
		/* 텍스트 양쪽정렬 */ 
	   	width: 99%;
		position: relative;
		font-size: 15px;
	}
	
	.text1 {
		/* 요소의 내용이 영역을 벗어날 경우 그 부분은 숨겨지게 처리 */ 
		overflow: hidden;
		/* 요소의 표시 방법을 -webkit-box로 표시 */
		display: none;
		/* webkit-box로 표시된 자식 요소들의 배치 방법 결정 (여기서는 수직) */ 
		-webkit-box-orient: vertical;
		/* 요소 내 텍스트를 지정한 라인수까지만 표시 */
		-webkit-line-clamp: 0;
		/* 텍스트 양쪽정렬 */ 
	   	width: 99%;
		position: relative;
		font-size: 15px;
	}
	
	.more-text{
		/* 글씨 크기,색상 지정 */ 
		font-size: 15px;
		/* 마우스 포인트가 올라갔을 때 커서 모양을 포인터로 변경 */
		cursor: pointer;
		font-weight: bold;
	}
	
	</style>
</head>
<body>
<div class="center">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left; margin-bottom:10px;">1:1문의</h2>
        <div style="width: auto; border: 1px solid; border-color: #bcbcbc; margin-top: 10px; margin-bottom:10px;"></div>
    </div>
	<div>
    	<table class="board">
		<tr class="boardtr">
			<td class="boardtd">번호</td>
			<td class="boardtd">답변상태</td>
			<td class="boardtd1">제목</td>
			<td class="boardtd">등록일</td>
		</tr>
		<c:choose>
		    <c:when test="${not empty que_List}">
	            <c:if test="${que_List.mem_id eq member.mem_id}">
					<tr align="center">
	                    <td>${que_List.q_No }</td>
	                	<td>${que_List.q_Status }</td>
	                    <td class="td1"><div class="text-wrapper">
	                    	<span class="more-text"> ${que_List.q_Title }</span>
	                    	<span class="text">Q. ${que_List.q_content }</span>
	                    	<span class="text1">A. ${que_List.a_reply }</span>
	                    </div></td>
	                    <td><fmt:formatDate value="${que_List.q_creDate }" /></td>
	                </tr>
	            </c:if>
		    </c:when>
		    <c:otherwise>
		        <tr>
		            <td colspan="4">
		                <p><b><span style="font-size:9pt;">등록된 글이 없습니다.${que_List.mem_id}, ${member.mem_id}</span></b></p>
		            </td>
		        </tr>
		    </c:otherwise>
		</c:choose>
		</table>
	</div>
	<c:if test="${isLogOn == true && type !='admin'}">
		<a class="cls1" href="${contextPath}/center/q_write.do">글쓰기</a>
	</c:if>
</div>
<script>
	//코드에 필요한 요소들 변수에 할당 (전체 ui를 감싸는 div, 내용 텍스트, 더보기/줄이기 텍스트)
	const textWrapper = document.querySelector('.text-wrapper');
	const text = document.querySelector('.text');
	const text1 = document.querySelector('.text1');
	const moreText = document.querySelector('.more-text');
	
	// 더보기 텍스트 클릭시 이벤트
	moreText.addEventListener('click', () => {
	text.style.display = 'inline-block'; // 텍스트의 속성을 -webkit-box에서 일반 inline-block 으로 변경
	text1.style.display = 'inline-block'; // 텍스트의 속성을 -webkit-box에서 일반 inline-block 으로 변경
    });
</script>
</body>
</html>
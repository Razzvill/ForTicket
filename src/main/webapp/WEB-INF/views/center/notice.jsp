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
	<title>공지사항</title>
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
	
	.boardtr1{
		border-bottom: 1px dotted #bcbcbc;
		font-size: 15px;
		text-align: center;
	}
	
	.boardtd1{
		border-radius: 15px 0px 0px 0px;
        background-color: #bcbcbc;
	}
	
	.boardtd2{
		background-color: #bcbcbc;
	}
	
	.boardtd3{
		border-radius: 0px 15px 0px 0px;
        background-color: #bcbcbc;
	}
	
	tr td{
		 border-bottom: 1px dotted #bcbcbc;
	}
	
	.cls1{
		text-decoration: none;
	    color: black;
	    margin-left: 750px;
	    font-size: 15px;
	    font-weight: 600;
	}
	
	</style>
</head>
<body>
<div class="center">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left; margin-bottom:10px;">공지사항</h2>
        <div style="width: auto; border: 1px solid; border-color: #bcbcbc; margin-top: 10px; margin-bottom:10px;"></div>
    </div>
    <div>
    	<table class="board">
		<tr class="boardtr1">
			<td class="boardtd1">글번호</td>
			<td class="boardtd2">제목</td>
			<td class="boardtd3">작성일</td>
		</tr>
		<c:choose>
		    <c:when test="${not empty notice_list}">
		        <c:forEach var="notice" items="${notice_list}">
		            <c:if test="${notice.center_Type eq 'notice'}">
		                <tr align="center">
		                    <td>${notice.type_No }</td>
		                    <td>
		                        <span></span>
		                        <a href="${contextPath}/center/view.do?center_No=${notice.center_No }">${notice.center_Title } </a>
		                    </td>
		                    <td><fmt:formatDate value="${notice.center_creDate }" /></td>
		                </tr>
		            </c:if>
		        </c:forEach>
		    </c:when>
		    <c:otherwise>
		        <tr>
		            <td colspan="3">
		                <p><b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b></p>
		            </td>
		        </tr>
		    </c:otherwise>
		</c:choose>
		<tr>
			<td colspan=8 class="fixed">
				<c:forEach   var="page" begin="1" end="10" step="1" >
					<c:if test="${section >1 && page==1 }">
						<a href="${contextPath}/center/notice.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
					</c:if>
						<a href="${contextPath}/center/notice.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
					<c:if test="${page ==10 }">
						<a href="${contextPath}/center/notice.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
					</c:if> 
				</c:forEach> 
			</td>
		</tr>
		</table>
    	</div>
	<c:if test="${isLogOn == true && type=='admin'}">
		<a class="cls1" href="${contextPath}/center/write.do">글쓰기</a>
	</c:if>
</div>
</body>
</html>
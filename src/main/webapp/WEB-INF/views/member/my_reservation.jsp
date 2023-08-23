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
	<title>예매내역 페이지</title>
	<script>
		function search_member(search_period){	
			temp=calcPeriod(search_period);
			var date=temp.split(",");
			beginDate=date[0];
			endDate=date[1];
			//alert("beginDate:"+beginDate+",endDate:"+endDate);
			//return ;
			
			var formObj=document.createElement("form");
		    
			var formObj=document.createElement("form");
			var i_beginDate = document.createElement("input"); 
			var i_endDate = document.createElement("input");
		    
			i_beginDate.name="beginDate";
			i_beginDate.value=beginDate;
			i_endDate.name="endDate";
			i_endDate.value=endDate;
			
		    formObj.appendChild(i_beginDate);
		    formObj.appendChild(i_endDate);
		    document.body.appendChild(formObj); 
		    formObj.method="get";
		    formObj.action="/bookshop01/admin/member/adminMemberMain.do";
		    formObj.submit();
		}
		
		
		function  calcPeriod(search_period){
			var dt = new Date();
			var beginYear,endYear;
			var beginMonth,endMonth;
			var beginDay,endDay;
			var beginDate,endDate;
			
			endYear = dt.getFullYear();
			endMonth = dt.getMonth()+1;
			endDay = dt.getDate();
			if(search_period=='today'){
				beginYear=endYear;
				beginMonth=endMonth;
				beginDay=endDay;
			}else if(search_period=='one_week'){
				beginYear=dt.getFullYear();
				if(endDay-7<1){
					beginMonth=dt.getMonth();	
				}else{
					beginMonth=dt.getMonth()+1;
				}
				
				dt.setDate(endDay-7);
				beginDay=dt.getDate();
				
			}else if(search_period=='two_week'){
				beginYear = dt.getFullYear();
				if(endDay-14<1){
					beginMonth=dt.getMonth();	
				}else{
					beginMonth=dt.getMonth()+1;
				}
				dt.setDate(endDay-14);
				beginDay=dt.getDate();
			}else if(search_period=='one_month'){
				beginYear = dt.getFullYear();
				dt.setMonth(endMonth-1);
				beginMonth = dt.getMonth();
				beginDay = dt.getDate();
			}else if(search_period=='two_month'){
				beginYear = dt.getFullYear();
				dt.setMonth(endMonth-2);
				beginMonth = dt.getMonth();
				beginDay = dt.getDate();
			}else if(search_period=='three_month'){
				beginYear = dt.getFullYear();
				dt.setMonth(endMonth-3);
				beginMonth = dt.getMonth();
				beginDay = dt.getDate();
			}else if(search_period=='four_month'){
				beginYear = dt.getFullYear();
				dt.setMonth(endMonth-4);
				beginMonth = dt.getMonth();
				beginDay = dt.getDate();
			}
			
			if(beginMonth <10){
				beginMonth='0'+beginMonth;
				if(beginDay<10){
					beginDay='0'+beginDay;
				}
			}
			if(endMonth <10){
				endMonth='0'+endMonth;
				if(endDay<10){
					endDay='0'+endDay;
				}
			}
			endDate=endYear+'-'+endMonth +'-'+endDay;
			beginDate=beginYear+'-'+beginMonth +'-'+beginDay;
			//alert(beginDate+","+endDate);
			return beginDate+","+endDate;
		}
		
		
		
		function fn_member_detail(order_id){
			//alert(order_id);
			var frm_delivery_list=document.frm_delivery_list;
			
		
			var formObj=document.createElement("form");
			var i_order_id = document.createElement("input");
			
			i_order_id.name="order_id";
			i_order_id.value=order_id;
			
		    formObj.appendChild(i_order_id);
		    document.body.appendChild(formObj); 
		    formObj.method="post";
		    formObj.action="/bookshop01/admin/member/memberDetail.do";
		    formObj.submit();
			
		}
		
		
		function fn_enable_detail_search(r_search){
			var frm_delivery_list=document.frm_delivery_list;
			t_beginYear=frm_delivery_list.beginYear;
			t_beginMonth=frm_delivery_list.beginMonth;
			t_beginDay=frm_delivery_list.beginDay;
			t_endYear=frm_delivery_list.endYear;
			t_endMonth=frm_delivery_list.endMonth;
			t_endDay=frm_delivery_list.endDay;
			s_search_type=frm_delivery_list.s_search_type;
			t_search_word=frm_delivery_list.t_search_word;
			btn_search=frm_delivery_list.btn_search;
			
			if(r_search.value=='detail_search'){
				//alert(r_search.value);
				t_beginYear.disabled=false;
				t_beginMonth.disabled=false;
				t_beginDay.disabled=false;
				t_endYear.disabled=false;
				t_endMonth.disabled=false;
				t_endDay.disabled=false;
				
				s_search_type.disabled=false;
				t_search_word.disabled=false;
				btn_search.disabled=false;
			}else{
				t_beginYear.disabled=true;
				t_beginMonth.disabled=true;
				t_beginDay.disabled=true;
				t_endYear.disabled=true;
				t_endMonth.disabled=true;
				t_endDay.disabled=true;
				
				s_search_type.disabled=true;
				t_search_word.disabled=true;
				btn_search.disabled=true;
			}
				
		}
		
		//상세조회 버튼 클릭 시 수행
		function fn_detail_search(){
			var frm_delivery_list=document.frm_delivery_list;
			
			beginYear=frm_delivery_list.beginYear.value;
			beginMonth=frm_delivery_list.beginMonth.value;
			beginDay=frm_delivery_list.beginDay.value;
			endYear=frm_delivery_list.endYear.value;
			endMonth=frm_delivery_list.endMonth.value;
			endDay=frm_delivery_list.endDay.value;
			search_type=frm_delivery_list.s_search_type.value;
			search_word=frm_delivery_list.t_search_word.value;
		
			var formObj=document.createElement("form");
			var i_command = document.createElement("input");
			var i_beginDate = document.createElement("input"); 
			var i_endDate = document.createElement("input");
			var i_search_type = document.createElement("input");
			var i_search_word = document.createElement("input");
		    
			
		    i_command.name="command";
		    i_beginDate.name="beginDate";
		    i_endDate.name="endDate";
		    i_search_type.name="search_type";
		    i_search_word.name="search_word";
		    
		    i_command.value="list_detail_order_goods";
			i_beginDate.value=beginYear+"-"+beginMonth+"-"+beginDay;
		    i_endDate.value=endYear+"-"+endMonth+"-"+endDay;
		    i_search_type.value=search_type;
		    i_search_word.value=search_word;
			
		    formObj.appendChild(i_command);
		    formObj.appendChild(i_beginDate);
		    formObj.appendChild(i_endDate);
		    formObj.appendChild(i_search_type);
		    formObj.appendChild(i_search_word);
		    document.body.appendChild(formObj); 
		    formObj.method="post";
		    formObj.action="/bookshop01/admin/member/memberDetail.do";
		    formObj.submit();
			
		}
	</script>
	<style>
	.search{
		width: 100%;
		border: 1px solid #FF6251;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	tr,td{
		border-bottom: 2px solid #FF6251;
		padding-top: 10px;
		padding-bottom:10px;
		font-size: 15px;
	}
	
	.inputSize{
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.inputSize1{
		width:80px;
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.clear {
		clear: both;
		height: 50px;
	}
	
	.result{
		width: 100%;
		border: 1px solid #FF6251;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	.reply{
		text-decoration: none;
		color: #FF6251;
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
	
	.alink{
		text-decoration: none;
	}
	
	.optionsize{
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;        
	}
	</style>
</head>

<body>
<form method="post">
<div class="mypage4">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left;">예매 내역</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
        	<div style="border-color: #FF6251; width:auto;"></div>
    </div>
	<table class="search">
		<tr>
		<td>공연명</td>
		<td><input class="inputSize1" type="text"></td>
		<td width="100px">공연일자</td>
		<td width="200px">
			<select name="beginYear" class="optionsize" >
					<c:forEach   var="i" begin="0" end="5">
						<c:choose>
					    	<c:when test="${beginYear==beginYear-i }">
					        	<option value="${beginYear-i }" selected>${beginYear-i  }</option>
					        </c:when>
					        <c:otherwise>
					        	<option value="${beginYear-i }">${beginYear-i }</option>
					        </c:otherwise>
					     </c:choose>
					</c:forEach>
			</select>년 
			<select name="beginMonth" class="optionsize">
					<c:forEach   var="i" begin="1" end="12">
						<c:choose>
					    	<c:when test="${beginMonth==i }">
					        	<option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					        	<c:choose>
					            	<c:when test="${i <10 }">
					              		<option value="0${i }">0${i }</option>
					            	</c:when>
					            	<c:otherwise>
					            		<option value="${i }">${i }</option>
					            	</c:otherwise>
					          	</c:choose>
					        </c:otherwise>
						</c:choose>
					 </c:forEach>					
			</select>월
			<select name="beginDay" class="optionsize">
					<c:forEach   var="i" begin="1" end="31">
						<c:choose>
					    	<c:when test="${beginDay==i }">
					        	<option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					        	<c:choose>
					            	<c:when test="${i <10 }">
					              		<option value="0${i }">0${i }</option>
					            	</c:when>
					            <c:otherwise>
					            	<option value="${i }">${i }</option>
					            </c:otherwise>
					        	</c:choose>
					    	</c:otherwise>
						</c:choose>
					</c:forEach>	
			</select>일
		</td>
		<td colspan="3">
			<a href="javascript:search_goods_list('today')">
			   <img   src="${contextPath}/resources/images/button/btn_search_one_day.jpg">
			</a>
			<a href="javascript:search_goods_list('one_week')">
			   <img   src="${contextPath}/resources/images/button/btn_search_1_week.jpg">
			</a>
			<a href="javascript:search_goods_list('two_week')">
			   <img   src="${contextPath}/resources/images/button/btn_search_2_week.jpg">
			</a>
			<a href="javascript:search_goods_list('one_month')">
			   <img   src="${contextPath}/resources/images/button/btn_search_1_month.jpg">
			</a>
			<a href="javascript:search_goods_list('two_month')">
			   <img   src="${contextPath}/resources/images/button/btn_search_2_month.jpg">
			</a>
			<a href="javascript:search_goods_list('three_month')">
			   <img   src="${contextPath}/resources/images/button/btn_search_3_month.jpg">
			</a>
			<a href="javascript:search_goods_list('four_month')">
			   <img   src="${contextPath}/resources/images/button/btn_search_4_month.jpg">
			</a>
			&nbsp;까지 조회
		</td>
		</tr>
		
		<tr>
		<td>예매번호</td>
		<td><input class="inputSize1" type="text"></td>
		<td>조회기간</td>
					<td colspan=3 align=left>
				<select name="beginYear" class="optionsize" >
					<c:forEach   var="i" begin="0" end="5">
						<c:choose>
					    	<c:when test="${beginYear==beginYear-i }">
					        	<option value="${beginYear-i }" selected>${beginYear-i  }</option>
					        </c:when>
					        <c:otherwise>
					        	<option value="${beginYear-i }">${beginYear-i }</option>
					        </c:otherwise>
					     </c:choose>
					</c:forEach>
				</select>년 
				<select name="beginMonth" class="optionsize">
					<c:forEach   var="i" begin="1" end="12">
						<c:choose>
					    	<c:when test="${beginMonth==i }">
					        	<option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					        	<c:choose>
					            	<c:when test="${i <10 }">
					              		<option value="0${i }">0${i }</option>
					            	</c:when>
					            	<c:otherwise>
					            		<option value="${i }">${i }</option>
					            	</c:otherwise>
					          	</c:choose>
					        </c:otherwise>
						</c:choose>
					 </c:forEach>					
				</select>월
				<select name="beginDay" class="optionsize">
					<c:forEach   var="i" begin="1" end="31">
						<c:choose>
					    	<c:when test="${beginDay==i }">
					        	<option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					        	<c:choose>
					            	<c:when test="${i <10 }">
					              		<option value="0${i }">0${i }</option>
					            	</c:when>
					            <c:otherwise>
					            	<option value="${i }">${i }</option>
					            </c:otherwise>
					        	</c:choose>
					    	</c:otherwise>
						</c:choose>
					</c:forEach>	
				</select>일  &nbsp; ~ &nbsp;
				<select name="endYear" class="optionsize">
					<c:forEach   var="i" begin="0" end="5">
						<c:choose>
					    	<c:when test="${endYear==endYear-i }">
					        	<option value="${2016-i }" selected>${2016-i  }</option>
					        </c:when>
					        <c:otherwise>
					        	<option value="${2016-i }">${2016-i }</option>
					        </c:otherwise>
					    </c:choose>
					 </c:forEach>
				</select>년 
				<select name="endMonth" class="optionsize">
					<c:forEach   var="i" begin="1" end="12">
						<c:choose>
					    	<c:when test="${endMonth==i }">
					        	<option value="${i }"  selected>${i }</option>
					        </c:when>
					    <c:otherwise>
					    <c:choose>
					      	<c:when test="${i <10 }">
					        	<option value="0${i }">0${i }</option>
					        </c:when>
					    	<c:otherwise>
					        	<option value="${i }">${i }</option>
					        </c:otherwise>
					     </c:choose>
					     </c:otherwise>
					   	 </c:choose>
					</c:forEach>					
				</select>월
				<select name="endDay" class="optionsize">
					<c:forEach   var="i" begin="1" end="31">
				    	<c:choose>
				        	<c:when test="${endDay==i }">
				          		<option value="${i }"  selected>${i }</option>
				        	</c:when>
				        	<c:otherwise>
				          	<c:choose>
				            	<c:when test="${i<10}">
				            		<option value="0${i}">0${i }</option>
				            	</c:when>
				            	<c:otherwise>
				            		<option value="${i}">${i }</option>
				            	</c:otherwise>
				          	</c:choose>
				        	</c:otherwise>
				      	</c:choose>
				    </c:forEach>	
				</select>
			</td>
		<td>
			<input type="button" value="검색">
			<input type="button" value="초기화">
		</td>
	</table>
</form>

<div class="clear"></div>

<table class="result">
	<tr>
		<td>예매번호</td>
		<td>공연명</td>
		<td>공연일자</td>
		<td>공연시간</td>
		<td>공연장소</td>
		<td>인원</td>
		<td>좌석번호</td>
		<td>예매상태</td>
	</tr>
	<tr>
		<td>095-8176-601</td>
		<td>운빨로맨스</td>
		<td>2023.08.04</td>
		<td>19:30</td>
		<td>대전 xx구 xx로 xx길</td>
		<td>1</td>
		<td>C-1</td>
		<td>예매완료/<a href="#" class="reply">리뷰쓰기</a></td>
	</tr>
</table>
</div>
</body>
</html>
	<%-- 
	<c:choose>
	<c:when test="${empty ticketing }">
		<tr>
		<td colspan="8">
			<strong>조회된 예매내역이 없습니다.</strong>
		</td>		
	</c:when>
	<c:otherwise>
		<c:forEach var="item" items="${ticketing}">
			<tr>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			<td>${ }</td>
			</tr>
		</c:forEach>
	</c:otherwise>
	</c:choose>
	--%>
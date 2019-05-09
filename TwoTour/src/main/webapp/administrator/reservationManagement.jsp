<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#reservationManagement_allClick').click(function(){
		if($(this).prop('checked')){
			$('.reservationManagement_click').prop('checked',true);
		}
		else{
			$('.reservationManagement_click').prop('checked',false);
		}
	});
});
</script>
<style>
	#reservationManagement_table td{padding:5px; text-align:center;}
	#reservationManagement_table th{padding:2px;}
</style>
</head>
<body>
<form name="reservationManagement" id="reservationManagement" method="post" action="/TwoTour/administrator/reservationManagementSubmit.do">
<div style="position:absolute; top:10px; right:10px;">
	<input type="submit" value="삭제하기" style="padding:5px;">
</div>
<table id="reservationManagement_table" frame="border" rules="all" style="margin:20px; width:100%;position:absolute; top:50px;">
	<colgroup>	
	<!-- 90% -->
		<col style="width:2%;">	
		<col style="width:7%;">	
		<col style="width:7%;">	
		<col style="width:7%;">	
		<col style="width:10%;">	
		<col style="width:15%;">			
		<col style="width:7%;">	
		<col style="width:6%;">	
		<col style="width:10%;">	
		<col style="width:10%;">	
		<col style="width:10%;">	
	</colgroup>
	<thead>
		<tr>
			<th><input type="checkbox" id="reservationManagement_allClick"></th>
			<th>이름</th>
			<th>예약번호</th>
			<th>이메일</th>
			<th>상품코드</th>
			<th>상품명</th>	
			<th>상품타입</th>
			<th>총인원</th>
			<th>가격</th>
			<th>예약한날짜</th>
		</tr>
	</thead>
	
	<tbody>
	<c:if test="${list!=null }">
		<c:forEach var="reservationInformDTO" items="${list }">
			<tr>
				<td>
					<input type="checkbox" class="reservationManagement_click" name="checkbox" value="${reservationInformDTO.reservation_number }">
				</td>
				<td>${reservationInformDTO.reservation_name }</td>
				<td>${reservationInformDTO.reservation_number }</td>
				<td>${reservationInformDTO.reservation_email}@${reservationInformDTO.reservation_email1}</td>
				<td>
					<c:if test="${reservationInformDTO.hotel_code!=null}">
						${reservationInformDTO.hotel_code }
					</c:if>
					<c:if test="${reservationInformDTO.package_code!=null}">
						${reservationInformDTO.package_code }
					</c:if>
					<c:if test="${reservationInformDTO.airplane_code!=null}">
						${reservationInformDTO.airplane_code }
					</c:if>
					<c:if test="${reservationInformDTO.rentcar_code!=null}">
						${reservationInformDTO.rentcar_code }
					</c:if>
				</td>
				<td style="font-size:6pt">
					<c:if test="${reservationInformDTO.hotel_code!=null}">
						${reservationInformDTO.hotel_name }
					</c:if>
					<c:if test="${reservationInformDTO.package_code!=null}">
						${reservationInformDTO.package_name }
					</c:if>
					<c:if test="${reservationInformDTO.airplane_code!=null}">
						${reservationInformDTO.airplane_name }
					</c:if>
					<c:if test="${reservationInformDTO.rentcar_code!=null}">
						${reservationInformDTO.package_name }
					</c:if>
				</td>
				<td>
					<c:if test="${reservationInformDTO.hotel_code!=null}">
						호텔
					</c:if>
					<c:if test="${reservationInformDTO.package_code!=null}">
						패키지
					</c:if>
					<c:if test="${reservationInformDTO.airplane_code!=null}">
						항공
					</c:if>
					<c:if test="${reservationInformDTO.rentcar_code!=null}">
						렌트카
					</c:if>
				</td>
				<td>${reservationInformDTO.total_member}</td>
				<td><fmt:formatNumber value="${reservationInformDTO.total_price}" type="number"/>원</td>
				<td>${reservationInformDTO.logtime }</td>
			</tr>
		</c:forEach>
	</c:if> 
	</tbody>
</table>

</form>
</body>
</html>
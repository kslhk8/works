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
	
	
	$('#right_menu').css("display","block");
	
	$('#body').css('height', "1550px");
	
	$('#administratorPage_wrap01').css('height', "1550px");
	
	$('#administratorPage_contents').css('height', "1550px");

	   
	/* $('#body').css("height",window.innerWidth-1350+'px');
	$('#administratorPage_wrap01').css("height",window.innerWidth-1350+'px');
	$('#administratorPage_contents').css("height",window.innerWidth-1350+'px'); */
});

$(window).bind("beforeunload",function(){
	$('#right_menu').css("display","none");
	$('#body').css("height","1350px");
});

</script>



<style>
	#wholePaymentManagement_table td{padding:5px; text-align:center;}
	#wholePaymentManagement_table th{padding:2px;}
	#paymentManagement_table td{padding:5px; text-align:center;}
	#paymentManagement_table th{padding:2px;}
	#cancelPaymentManagement_table td{padding:5px; text-align:center;}
	#cancelPaymentManagement_table th{padding:2px;}
</style>
</head>
<body>
<div style="position:absolute; top:10px; width:100%; ">
<h2 style=" font-size:11pt; font-weieght:bold; color:orange; margin:0 20px;">전체</h2>
<table id="wholePaymentManagement_table" frame="border" rules="all" style="margin:10px; width:100%; max-height:500px; overflow-y:scroll; font-size:8pt;">
	<colgroup>	
		<col style="width:7%;">	
		<col style="width:7%;">	
		<col style="width:10%;">	
		<col style="width:10%;">	
		<col style="width:20%;">	
		<col style="width:7%;">	
		<col style="width:7%;">	
		<col style="width:16%;">	
		<col style="width:16%;">	
	</colgroup>
	<thead>
		<tr>
			<th>이름</th>
			<th>예약번호</th>
			<th>이메일</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>상품타입</th>
			<th>총 인원</th>
			<th>가격</th>
		</tr>
	</thead>
	
	<tbody>
	<c:if test="${wholeList!=null }">
		<c:forEach var="payInformDTO" items="${wholeList }">
			<tr>
				<td>${payInformDTO.pay_name }</td>
				<td>${payInformDTO.pay_number }</td>
				<td>${payInformDTO.pay_email }@${payInformDTO.pay_email1 }</td>
				<td>
					
					<c:if test="${payInformDTO.package_code!=null}">
						${payInformDTO.package_code }
					</c:if>
					<c:if test="${payInformDTO.airplane_code!=null}">
						${payInformDTO.airplane_code }
					</c:if>
					<c:if test="${payInformDTO.rentcar_code!=null}">
						${payInformDTO.rentcar_code }
					</c:if>
				</td>
				<td style="font-size:6pt;">
					<c:if test="${payInformDTO.hotel_code!=null}">
						${payInformDTO.hotel_name }
					</c:if>
					<c:if test="${payInformDTO.package_code!=null}">
						${payInformDTO.package_name }
					</c:if>
					<c:if test="${payInformDTO.airplane_code!=null}">
						${payInformDTO.airplane_name }
					</c:if>
					<c:if test="${payInformDTO.rentcar_code!=null}">
						${payInformDTO.package_name }
					</c:if>
				</td>
				<td>
					<c:if test="${payInformDTO.hotel_code!=null}">
						 호텔 
					</c:if>
					<c:if test="${payInformDTO.package_code!=null}">
						패키지
					</c:if>
					<c:if test="${payInformDTO.airplane_code!=null}">
						항공
					</c:if>
					<c:if test="${payInformDTO.rentcar_code!=null}">
						렌트카
					</c:if>
				</td>
				<td>${payInformDTO.total_member}</td>
				<td><fmt:formatNumber value="${payInformDTO.total_price}" type="number"/>원</td>
			</tr>
			<c:set var="wholePayment_sum" value="${wholePayment_sum + payInformDTO.total_price }"/>
		</c:forEach>
	</c:if> 
	</tbody>
</table>
<h3 style="position:relative; margin:10px 30px; display:inline-block; font-weight:bold;font-size:10pt;">전체가격</h3>
<span style="display:inline-block; font-size:11pt;"><fmt:formatNumber value="${wholePayment_sum}" type="number"/>원</span>
</div>


<div style="clear:left; position:absolute; top:450px; width:100%;">
<h2 style=" font-size:11pt; font-weieght:bold; color:orange; margin:0 20px;">결제취소</h2>
<table id="cancelPaymentManagement_table" frame="border" rules="all" style="margin:10px; width:98%; max-height:500px; overflow-y:scroll;">
	<colgroup>	
		<col style="width:7%;">	
		<col style="width:7%;">	
		<col style="width:10%;">	
		<col style="width:10%;">	
		<col style="width:20%;">	
		<col style="width:7%;">	
		<col style="width:7%;">	
		<col style="width:16%;">	
		<col style="width:16%;">		
	</colgroup>
	<thead>
		<tr>
			<th>이름</th>
			<th>예약번호</th>
			<th>이메일</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>상품타입</th>
			<th>총 인원</th>
			<th>가격</th>
		</tr>
	</thead>
	
	<tbody>
	<c:if test="${cancelPaymentList!=null }">
		<c:forEach var="payInformDTO" items="${cancelPaymentList }">
			<tr>
				<td>${payInformDTO.pay_name }</td>
				<td>${payInformDTO.pay_number }</td>
				<td>${payInformDTO.pay_email }@${payInformDTO.pay_email1 }</td>
				<td>
					<c:if test="${payInformDTO.hotel_code!=null}">
						${payInformDTO.hotel_code }
					</c:if>
					<c:if test="${payInformDTO.package_code!=null}">
						${payInformDTO.package_code }
					</c:if>
					<c:if test="${payInformDTO.airplane_code!=null}">
						${payInformDTO.airplane_code }
					</c:if>
				</td>
				<td style="font-size:6pt;">
					<c:if test="${payInformDTO.hotel_name!=null}">
						${payInformDTO.hotel_name }
					</c:if>
					<c:if test="${payInformDTO.package_name!=null}">
						${payInformDTO.package_name }
					</c:if>
					<c:if test="${payInformDTO.airplane_name!=null}">
						${payInformDTO.airplane_name }
					</c:if>
				</td>
				<td>
					<c:if test="${payInformDTO.hotel_code!=null}">
						호텔
					</c:if>
					<c:if test="${payInformDTO.package_code!=null}">
						패키지
					</c:if>
					<c:if test="${payInformDTO.airplane_code!=null}">
						항공
					</c:if>
				</td>
				<td>${payInformDTO.total_member}</td>
				<td><fmt:formatNumber value="${payInformDTO.total_price}" type="number"/>원</td>
			</tr>
			<c:set var="cancelPayment_sum" value="${cancelPayment_sum + payInformDTO.total_price }"/>
		</c:forEach>
	</c:if> 
	</tbody>
</table>
<h3 style="position:relative; margin:10px 30px; display:inline-block; font-weight:bold;font-size:10pt;">결제취소가격</h3>
<span style="display:inline-block; font-size:11pt;">
	<fmt:formatNumber value="${cancelPayment_sum}" type="number"/>원</span>
</div>


<div style="clear:left; position:absolute; top:1000px; width:100%;">
<h2 style=" font-size:11pt; font-weieght:bold; color:orange; margin:0 20px;">결제</h2>
	<table id="paymentManagement_table" frame="border" rules="all" style="margin:10px; width:98%; max-height:500px; overflow-y:scroll;">
	<colgroup>	
		<col style="width:7%;">	
		<col style="width:7%;">	
		<col style="width:10%;">	
		<col style="width:10%;">	
		<col style="width:20%;">	
		<col style="width:7%;">	
		<col style="width:7%;">	
		<col style="width:16%;">	
		<col style="width:16%;">	
	</colgroup>
	<thead>
		<tr>
			<th>이름</th>
			<th>예약번호</th>
			<th>이메일</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>상품타입</th>
			<th>총 인원</th>
			<th>가격</th>
		</tr>
	</thead>
	
	<tbody>
	<c:if test="${paymentList!=null }">
		<c:forEach var="payInformDTO" items="${paymentList }">
			<tr>
				<td>${payInformDTO.pay_name }</td>
				<td>${payInformDTO.pay_number }</td>
				<td>${payInformDTO.pay_email }@${payInformDTO.pay_email1 }</td>
				<td>
					<c:if test="${payInformDTO.hotel_code!=null}">
						${payInformDTO.hotel_code }
					</c:if>
					<c:if test="${payInformDTO.package_code!=null}">
						${payInformDTO.package_code }
					</c:if>
					<c:if test="${payInformDTO.airplane_code!=null}">
						${payInformDTO.airplane_code }
					</c:if>
				</td>
				<td style="font-size:6pt;">
					<c:if test="${payInformDTO.hotel_name!=null}">
						${payInformDTO.hotel_name }
					</c:if>
					<c:if test="${payInformDTO.package_name!=null}">
						${payInformDTO.package_name }
					</c:if>
					<c:if test="${payInformDTO.airplane_name!=null}">
						${payInformDTO.airplane_name }
					</c:if>
				</td>
				<td>
					<c:if test=" ${payInformDTO.hotel_code!=null}">
						호텔
					</c:if>
					<c:if test="${payInformDTO.package_code!=null}">
						패키지
					</c:if>
					<c:if test="${payInformDTO.airplane_code!=null}">
						항공
					</c:if>
				</td>
				<td>${payInformDTO.total_member}</td>
				<td><fmt:formatNumber value="${payInformDTO.total_price}" type="number"/>원</td>
			</tr>
			<c:set var="payment_sum" value="${payment_sum + payInformDTO.total_price }"/>
		</c:forEach>
	</c:if> 
	</tbody>
</table>
</div>
<div style="border:1px solid pink; padding:10px; width:300px; position:absolute; bottom:50px; margin:0 100px;" >
	<h2 style="font-weight:bolder; font-size:12pt; color:rgb(228,91,133); display:inline-block;">매출가격</h2>
	<span style="display:inline-block; font-size:13pt; font-weight:bold; color:rgb(187,0,94); margin-left:30px;">
		<fmt:formatNumber value="${payment_sum}" type="number"/>
	</span>
	<span style="font-size:11pt;">원</span>
</div>
</body>
</html>
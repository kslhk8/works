<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#insertPackageDetail_table td{padding:5px;}
</style>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
 	$('#right_menu').css("display","block");
	$('#body').css("height","800px");
	$('#administratorPage_wrap01').css("height","800px");
	$('#administratorPage_contents').css("height","800px"); 
	

	$('#package_code').keyup(function(){
		if($('#package_code').val().length!=0){
			$('#package_code_valid_check').text("");
		}
	});
	$('#package_name').keyup(function(){
		if($('#package_name').val().length!=0){
			$('#package_name_valid_check').text("");
		}
	});
	$('#grade').keyup(function(){
		if($('#grade').val().length!=0){
			$('#grade_valid_check').text("");
		}
	});
	$('#day#nights').keyup(function(){
		if($('#day').val().length!=0 && $('#nights').val().length!=0){
			$('#day_valid_check').text("");
		}
	});
	$('#depart_code').keyup(function(){
		if($('#depart_code').val().length!=0){
			$('#depart_code_valid_check').text("");
		}
	});
	$('#arrive_code').keyup(function(){
		if($('#arrive_code').val().length!=0){
			$('#arrive_code_valid_check').text("");
		}
	});
	$('#depart_date').keyup(function(){
		if($('#depart_date').val().length!=0){
			$('#depart_date_valid_check').text("");
		}
	});
	$('#arrive_date').keyup(function(){
		if($('#arrive_date').val().length!=0){
			$('#arrive_date_valid_check').text("");
		}
	});
	$('#hotel_name').keyup(function(){
		if($('#hotel_name').val().length!=0){
			$('#hotel_name_valid_check').text("");
		}
	});
	$('#adult_price').keyup(function(){
		if($('#adult_price').val().length!=0){
			$('#adult_price_valid_check').text("");
		}
	});
	$('#teen_price').keyup(function(){
		if($('#teen_price').val().length!=0){
			$('#teen_price_valid_check').text("");
		}
	});
	$('#baby_price').keyup(function(){
		if($('#baby_price').val().length!=0){
			$('#baby_price_valid_check').text("");
		}
	});
	$('#total_member').keyup(function(){
		if($('#total_member').val().length!=0){
			$('#total_member_valid_check').text("");
		}
	});	
	$('#airplane_name').keyup(function(){
		if($('#airplane_name').val().length!=0){
			$('#airplane_name_valid_check').text("");
		}
	});
	$('#depart_apTime').keyup(function(){
		if($('#depart_apTime').val().length!=0){
			$('#depart_apTime_valid_check').text("");
		}
	});
	$('#arrive_apTime').keyup(function(){
		if($('#arrive_apTime').val().length!=0){
			$('#arrive_apTime_valid_check').text("");
		}
	});
	$('#fuel_fee').keyup(function(){
		if($('#fuel_fee').val().length!=0){
			$('#fuel_fee_valid_check').text("");
		}
	});

	$('#singleroom_fee').keyup(function(){
		if($('#singleroom_fee').val().length!=0){
			$('#singleroom_fee_valid_check').text("");
		}
	});	
	
	$('#insertPackageDetail_submitButton').click(function(){
	 	if($('#package_code').val().length==0){
			$('#package_code_valid_check').text("패키지코드를 입력해주세요!");
		}
		else if($('#package_name').val().length==0){
			$('#package_name_valid_check').text("패키지이름을 입력해주세요!");
		}
		else if($('#grade').val().length==0){
			$('#grade_valid_check').text("등급을 입력해주세요!");
		}
		else if($('#day').val().length==0 || $('#nights').val().length==0){
			$('#day_valid_check').text("기간을 입력해주세요!");
		}
		else if($('#depart_code').val().length==0){
			$('#depart_code_valid_check').text("출발코드를 입력해주세요!");
		}
		else if($('#arrive_code').val().length==0){
			$('#arrive_code_valid_check').text("도착코드를 입력해주세요!");
		}
		else if($('#depart_date').val().length==0){
			$('#depart_date_valid_check').text("출발일을 입력해주세요!");
		}
		else if($('#arrive_date').val().length==0){
			$('#arrive_date_valid_check').text("도착일을 입력해주세요!");
		}
		else if($('#hotel_name').val().length==0){
			$('#hotel_name_valid_check').text("호텔을 입력해주세요!");
		}
		else if($('#adult_price').val().length==0){
			$('#adult_price_valid_check').text("성인가격을 입력해주세요!");
		}
		else if($('#teen_price').val().length==0){
			$('#teen_price_valid_check').text("유아가격을 입력해주세요!");
		}
		else if($('#baby_price').val().length==0){
			$('#baby_price_valid_check').text("아동가격을 입력해주세요!");
		}
		else if($('#total_member').val().length==0){
			$('#total_member_valid_check').text("총인원수를 입력해주세요!");
		}
		else if($('#airplane_name').val().length==0){
			$('#airplane_name_valid_check').text("항공사이름을 입력해주세요!");
		}
		else if($('#depart_apTime').val().length==0){
			$('#depart_apTime_valid_check').text("출발시간을 입력해주세요!");
		}
		else if($('#arrive_apTime').val().length==0){
			$('#arrive_apTime_valid_check').text("도착시간을 입력해주세요!");
		}
		else if($('#fuel_fee').val().length==0){
			$('#fuel_fee_valid_check').text("유류할증료를 입력해주세요!");
		}
		else if($('#singleroom_fee').val().length==0){
			$('#singleroom_fee_valid_check').text("1인호텔가격을 입력해주세요!");
		}
		else{
			$('#insertPackageDetail').submit();
		}  
	
	});
	
	
	
	
	
	
});
	
$(window).bind("beforeunload",function(){
	$('#right_menu').css("display","none");
	$('#body').css("height","1350px");
});	
</script>
</head>
<body>
<form id="insertPackageDetail" name="insertPackageDetail" method="post" action="/TwoTour/administrator/insertPackageDetailSubmit.do">
	<h1 style="color:orange; padding:5px 20px;">패키지상세등록</h1>
	<table id="insertPackageDetail_table" frame="border" rules="all" style="width:80%; margin:20px;">
		<colgroup>
			<col width="20%"/>
			<col width="80%"/>
		</colgroup>
		<tr>
			<th>패키지</th>
			<td>
				<c:if test="${list!=null }">
				<select name="pseq" id="pseq">
					<c:forEach var="content_packageTrip" items="${list }">
						<option value="${content_packageTrip.seq }">${content_packageTrip.package_name }</option>
					</c:forEach>
				</select>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>패키지코드</th>
			<td>
				<input type="text" id="package_code" name="package_code" style="width:150px;">
				<div id="package_code_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>패키지이름</th>
			<td>
				<input type="text" id="package_name" name="package_name" style="width:200px;">
				<div id="package_name_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>
				<input type="text" id="grade" name="grade" style="width:100px;">
				<div id="grade_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>기간</th>
			<td>
				<input type="text" id="day" name="day" style="display:inline-block;  margin-right:10px; margin-right:3px; width:50px;">박 <input type="text" id="nights" name="nights" style="display:inline-block;  margin-left:10px; margin-right:3px; width:50px;">일 
				<div id="day_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>출발코드</th>
			<td>
				<input type="text" id="depart_code" name="depart_code"  style="width:200px;">
				<div id="depart_code_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>도착코드</th>
			<td>
				<input type="text" id="arrive_code" name="arrive_code"  style="width:200px;">
				<div id="arrive_code_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>출발일</th>
			<td>
				<input type="text" id="depart_date" name="depart_date" style="width:120px; margin-right:3px;">
				<div id="depart_date_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>도착일</th>
			<td>
				<input type="text" id="arrive_date" name="arrive_date" style="width:120px; margin-right:3px;">
				<div id="arrive_date_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>호텔이름</th>
			<td>
				<input type="text" id="hotel_name" name="hotel_name" style="width:220px; margin-right:3px;">
				<div id="hotel_name_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>성인가격</th>
			<td>
				<input type="text" id="adult_price" name="adult_price" style="width:160px; margin-right:3px;">원
				<div id="adult_price_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>유아가격</th>
			<td>
				<input type="text" id="teen_price" name="teen_price" style="width:160px; margin-right:3px;">원
				<div id="teen_price_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>아동가격</th>
			<td>
				<input type="text" id="baby_price" name="baby_price" style="width:160px; margin-right:3px;">원
				<div id="baby_price_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>총인원</th>
			<td>
				<input type="text" id="total_member" name="total_member" style="width:60px; margin-right:3px;">
				<div id="total_member_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>항공사</th>
			<td>
				<input type="text" id="airplane_name" name="airplane_name" style="width:150px; margin-right:3px;">
				<div id="airplane_name_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>출발시간</th>
			<td>
				<input type="text" id="depart_apTime" name="depart_apTime" style="width:220px; margin-right:3px;">
				<div id="depart_apTime_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>도착시간</th>
			<td>
				<input type="text" id="arrive_apTime" name="arrive_apTime" style="width:220px; margin-right:3px;">
				<div id="arrive_apTime_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>유류할증료</th>
			<td>
				<input type="text" id="fuel_fee" name="fuel_fee" style="width:150px; margin-right:3px;">
				<div id="fuel_fee_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>1인호텔가격</th>
			<td>
				<input type="text" id="singleroom_fee" name="singleroom_fee" style="width:150px; margin-right:3px;">
				<div id="singleroom_fee_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		</table>
		<div style="width:80%; margin:10px 20px; text-align:center;">
			<input id="insertPackageDetail_submitButton" type="button" value="등록" style="padding:0 5px; margin:0 5px; height:25px;">
			<input type="reset" value="다시작성" style="padding:0 5px; margin:0 5px; height:25px;">
		</div>
</form>	
</body>
</html>
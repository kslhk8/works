<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#insertHotel_table td{padding:5px;}
</style>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#right_menu').css("display","block");
	$('#body').css("height","750px");
	$('#administratorPage_wrap01').css("height","750px");
	$('#administratorPage_contents').css("height","750px");

	
	$('#hotel_name').keyup(function(){
		if($('#hotel_name').val().length!=0){
			$('#hotel_name_valid_check').text("");
		}
	});
	$('#city').keyup(function(){
		if($('#city').val().length!=0){
			$('#city_valid_check').text("");
		}
	});
	$('#call').keyup(function(){
		if($('#call').val().length!=0){
			$('#call_valid_check').text("");
		}
	});
	$('#homepage').keyup(function(){
		if($('#homepage').val().length!=0){
			$('#homepage_valid_check').text("");
		}
	});
	$('#location').keyup(function(){
		if($('#location').val().length!=0){
			$('#location_valid_check').text("");
		}
	});
	$('#checkIn').keyup(function(){
		if($('#checkIn').val().length!=0){
			$('#checkIn_valid_check').text("");
		}
	});
	$('#checkOut').keyup(function(){
		if($('#checkOut').val().length!=0){
			$('#checkOut_valid_check').text("");
		}
	});
	$('#content').keyup(function(){
		if($('#content').val().length!=0){
			$('#content_valid_check').text("");
		}
	});
	$('#floor').keyup(function(){
		if($('#floor').val().length!=0){
			$('#floor_valid_check').text("");
		}
	});	
	$('#totalMem').keyup(function(){
		if($('#totalMem').val().length!=0){
			$('#totalMem_valid_check').text("");
		}
	});

	
	
	
	$('#insertHotel_submitButton').click(function(){

		if($('#hotel_name').val().length==0){
			$('#hotel_name_valid_check').text("호텔이름을 입력해주세요!");
		}
		else if($('#city').val().length==0){
			$('#city_valid_check').text("항공코드를 입력해주세요!");
		}
		else if($('#call').val().length==0){
			$('#call_valid_check').text("출발도시를 입력해주세요!");
		}
		else if($('#homepage').val().length==0){
			$('#homepage_valid_check').text("출발일을 입력해주세요!");
		}
		else if($('#location').val().length==0){
			$('#location_valid_check').text("출발시간을 입력해주세요!");
		}
		else if($('#checkIn').val().length==0){
			$('#checkIn_valid_check').text("출발요일을 입력해주세요!");
		}
		else if($('#checkOut').val().length==0){
			$('#checkOut_valid_check').text("내용을 입력해주세요!");
		}
		else if($('#content').val().length==0){
			$('#content_valid_check').text("출발도시를 입력해주세요!");
		}
		else if($('#floor').val().length==0){
			$('#floor_valid_check').text("도착도시를 입력해주세요!");
		}	
		else if($('#totalMem').val().length==0){
			$('#totalMem_valid_check').text("출발월을 입력해주세요!");
		}
		else{
			$('#insertHotel').submit();
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
<form id="insertHotel" name="insertHotel" method="post" enctype="multipart/form-data" action="/TwoTour/administrator/insertHotelSubmit.do">
	<h1 style="color:orange; padding:5px 20px;">호텔등록</h1>
	<table id="insertHotel_table" frame="border" rules="all" style="width:80%; margin:20px; ">
		<colgroup>
			<col width="20%"/>
			<col width="80%"/>
		</colgroup>
		<tr>
			<th>호텔이름</th>
			<td>
				<input type="text" id="hotel_name" name="hotel_name" style="width:300px; display:inline-block;">
				<div id="hotel_name_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>도시</th>
			<td>
				<input type="text" id="city" name="city" style="width:250px;">
				<div id="city_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" id="call" name="call" style="width:200px;">
				<div id="call_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td>
				<input type="text" id="homepage" name="homepage" style="width:150px;">
				<div id="homepage_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>위치</th>
			<td>
				<input type="text" id="location" name="location" style="display:inline-block;  margin-right:10px; margin-right:3px; width:500px;">
				<div id="location_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>체크인</th>
			<td>
				<input type="text" id="checkIn" name="checkIn" style="width:80px;">
				<div id="checkIn_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>체크아웃</th>
			<td>
				<input type="text" id="checkOut" name="checkOut" style="width:200px;">
				<div id="checkOut_valid_check"></div>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="15" cols="80"  id="content" name="content"></textarea>
				<div id="content_valid_check"></div>
			</td>
		</tr>
		<tr>
			<th>층</th>
			<td>
				<input type="text" id="floor" name="floor" style="width:150px;">
				<div id="floor_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>총멤버</th>
			<td>
				<input type="text" id="totalMem" name="totalMem" style="width:80px; margin-right:3px;">
				<div id="totalMem_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="image" style="width:480px;">
			</td>
		</tr>
	</table>
	<div style="width:80%; margin:10px 20px; text-align:center;">
		<input id="insertHotel_submitButton" type="button" value="등록" style="padding:0 5px; margin:0 5px; height:25px;">
		<input type="reset" value="다시작성" style="padding:0 5px; margin:0 5px; height:25px;">
	</div>
</form>	
</body>
</html>
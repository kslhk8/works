<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#insertPackage_table td{padding:5px;}
</style>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#right_menu').css("display","block");
	$('#body').css("height","750px");
	$('#administratorPage_wrap01').css("height","750px");
	$('#administratorPage_contents').css("height","750px");
	
	$('#seq').keyup(function(){
		if($('#seq').val().length!=0){
			$('#seq_valid_check').text("");
		}
	});
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
	$('#day').keyup(function(){
		if($('#day').val().length!=0){
			$('#day_valid_check').text("");
		}
	});
	$('#week').keyup(function(){
		if($('#week').val().length!=0){
			$('#week_valid_check').text("");
		}
	});
	$('#content').keyup(function(){
		if($('#content').val().length!=0){
			$('#content_valid_check').text("");
		}
	});
	$('#depart_city').keyup(function(){
		if($('#depart_city').val().length!=0){
			$('#depart_city_valid_check').text("");
		}
	});
	$('#arrive_city').keyup(function(){
		if($('#arrive_city').val().length!=0){
			$('#arrive_city_valid_check').text("");
		}
	});
	$('#depart_date').keyup(function(){
		if($('#depart_date').val().length!=0){
			$('#depart_date_valid_check').text("");
		}
	});
	$('#adult_price').keyup(function(){
		if($('#adult_price').val().length!=0){
			$('#adult_price_valid_check').text("");
		}
	});
	
	
	
	$('#insertPackage_submitButton').click(function(){

		if($('#seq').val().length==0){
			$('#seq_valid_check').text("번호를 입력해주세요!");
		}
		else if($('#package_code').val().length==0){
			$('#package_code_valid_check').text("패키지코드를 입력해주세요!");
		}
		else if($('#package_name').val().length==0){
			$('#package_name_valid_check').text("패키지이름을 입력해주세요!");
		}
		else if($('#grade').val().length==0){
			$('#grade_valid_check').text("등급을 입력해주세요!");
		}
		else if($('#day').val().length==0){
			$('#day_valid_check').text("기간을 입력해주세요!");
		}
		else if($('#week').val().length==0){
			$('#week_valid_check').text("출발요일을 입력해주세요!");
		}
		else if($('#content').val().length==0){
			$('#content_valid_check').text("내용을 입력해주세요!");
		}
		else if($('#depart_city').val().length==0){
			$('#depart_city_valid_check').text("출발도시를 입력해주세요!");
		}
		else if($('#arrive_city').val().length==0){
			$('#arrive_city_valid_check').text("도착도시를 입력해주세요!");
		}
		else if($('#depart_date').val().length==0){
			$('#depart_date_valid_check').text("출발월을 입력해주세요!");
		}
		else if($('#adult_price').val().length==0){
			$('#adult_price_valid_check').text("가격을 입력해주세요!");
		}
		else{
			$('#insertPackage').submit();
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
<form id="insertPackage" name="insertPackage" method="post" enctype="multipart/form-data" action="/TwoTour/administrator/insertPackageSubmit.do">
	<h1 style="color:orange; padding:5px 20px;">패키지등록</h1>
	<table id="insertPackage_table" frame="border" rules="all" style="width:80%; margin:20px; ">
		<colgroup>
			<col width="20%"/>
			<col width="80%"/>
		</colgroup>
		<tr>
			<th>번호</th>
			<td>
				<input type="text" id="seq" name="seq" style="width:50px; display:inline-block;">
				<div id="seq_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
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
				<input type="text" id="day" name="day" style="display:inline-block;  margin-right:10px; margin-right:3px; width:50px;">일
				<div id="day_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>출발요일</th>
			<td>
				<input type="text" id="week" name="week" style="width:80px;">
				<div id="week_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
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
			<th>출발도시</th>
			<td>
				<input type="text" id="depart_city" name="depart_city">
				<div id="depart_city_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>도착도시</th>
			<td>
				<input type="text" id="arrive_city" name="arrive_city">
				<div id="arrive_city_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>출발월</th>
			<td>
				<input type="text" id="depart_date" name="depart_date" style="width:50px; margin-right:3px;">월
				<div id="depart_date_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>
				<input type="text" id="adult_price" name="adult_price" style="width:50px; margin-right:3px;">원
				<div id="adult_price_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="image" style="width:480px;">
			</td>
		</tr>
		<tr>
			<td colspan="2" >
				<input type="file" name="image" style="width:480px;">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="image" style="width:480px;">
			</td>
		</tr>
		</table>
		<div style="width:80%; margin:10px 20px; text-align:center;">
			<input id="insertPackage_submitButton" type="button" value="등록" style="padding:0 5px; margin:0 5px; height:25px;">
			<input type="reset" value="다시작성" style="padding:0 5px; margin:0 5px; height:25px;">
		</div>
</form>	
</body>
</html>
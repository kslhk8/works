<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#insertAirplane_table td{padding:5px;}
</style>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#right_menu').css("display","block");
	$('#body').css("height","750px");
	$('#administratorPage_wrap01').css("height","750px");
	$('#administratorPage_contents').css("height","750px");
	
	$('#airplane_name').keyup(function(){
		if($('#airplane_name').val().length!=0){
			$('#airplane_name_valid_check').text("");
		}
	});
	$('#airplane_code').keyup(function(){
		if($('#airplane_code').val().length!=0){
			$('#airplane_code_valid_check').text("");
		}
	});
	$('#depart_city').keyup(function(){
		if($('#depart_city').val().length!=0){
			$('#depart_city_valid_check').text("");
		}
	});
	$('#depart_date').keyup(function(){
		if($('#depart_date').val().length!=0){
			$('#depart_date_valid_check').text("");
		}
	});
	$('#depart_time').keyup(function(){
		if($('#depart_time').val().length!=0){
			$('#depart_time_valid_check').text("");
		}
	});
	$('#depart_day').keyup(function(){
		if($('#depart_day').val().length!=0){
			$('#depart_day_valid_check').text("");
		}
	});
	$('#arrive_city').keyup(function(){
		if($('#arrive_city').val().length!=0){
			$('#arrive_city_valid_check').text("");
		}
	});
	$('#arrive_date').keyup(function(){
		if($('#arrive_date').val().length!=0){
			$('#arrive_date_valid_check').text("");
		}
	});
	$('#arrive_time').keyup(function(){
		if($('#arrive_time').val().length!=0){
			$('#arrive_time_valid_check').text("");
		}
	});
	
	
	$('#arrive_day').keyup(function(){
		if($('#arrive_day').val().length!=0){
			$('#arrive_day_valid_check').text("");
		}
	});
	$('#totalTime').keyup(function(){
		if($('#totalTime').val().length!=0){
			$('#totalTime_valid_check').text("");
		}
	});
	
	
	
	$('#insertAirplane_submitButton').click(function(){

		if($('#airplane_name').val().length==0){
			$('#airplane_name_valid_check').text("항공이름을 입력해주세요!");
		}
		else if($('#airplane_code').val().length==0){
			$('#airplane_code_valid_check').text("항공코드를 입력해주세요!");
		}
		else if($('#depart_city').val().length==0){
			$('#depart_city_valid_check').text("출발도시를 입력해주세요!");
		}
		else if($('#depart_date').val().length==0){
			$('#depart_date_valid_check').text("출발일을 입력해주세요!");
		}
		else if($('#depart_time').val().length==0){
			$('#depart_time_valid_check').text("출발시간을 입력해주세요!");
		}
		else if($('#depart_day').val().length==0){
			$('#depart_day_valid_check').text("출발요일을 입력해주세요!");
		}
		else if($('#arrive_city').val().length==0){
			$('#arrive_city_valid_check').text("도착도시를 입력해주세요!");
		}
		else if($('#arrive_date').val().length==0){
			$('#arrive_date_valid_check').text("도착일을 입력해주세요!");
		}
		else if($('#arrive_time').val().length==0){
			$('#arrive_time_valid_check').text("도착시간을 입력해주세요!");
		}	
		else if($('#arrive_day').val().length==0){
			$('#arrive_day_valid_check').text("도착요일을 입력해주세요!");
		}
		else if($('#totalTime').val().length==0){
			$('#totalTime_valid_check').text("총비행시간을 입력해주세요!");
		}
		else{
			$('#insertAirplane').submit();
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
<form id="insertAirplane" name="insertAirplane" method="post" enctype="multipart/form-data" action="/TwoTour/administrator/insertAirplaneSubmit.do">
	<h1 style="color:orange; padding:5px 20px;">항공등록</h1>
	<table id="insertAirplane_table" frame="border" rules="all" style="width:80%; margin:20px; ">
		<colgroup>
			<col width="20%"/>
			<col width="80%"/>
		</colgroup>
		<tr>
			<th>항공이름</th>
			<td>
				<input type="text" id="airplane_name" name="airplane_name" style="width:120px; display:inline-block;">
				<div id="airplane_name_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>항공코드</th>
			<td>
				<input type="text" id="airplane_code" name="airplane_code" style="width:150px;">
				<div id="airplane_code_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>출발도시</th>
			<td>
				<input type="text" id="depart_city" name="depart_city" style="width:200px;">
				<div id="depart_city_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>출발일</th>
			<td>
				<input type="text" id="depart_date" name="depart_date" style="width:100px;">
				<div id="depart_date_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>출발시간</th>
			<td>
				<input type="text" id="depart_time" name="depart_time" style="display:inline-block;  margin-right:10px; margin-right:3px; width:150px;">
				<div id="depart_time_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>출발요일</th>
			<td>
				<input type="text" id="depart_day" name="depart_day" style="width:80px;">
				<div id="depart_day_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>도착도시</th>
			<td>
				<input type="text" id="arrive_city" name="arrive_city" style="width:200px;">
				<div id="arrive_city_valid_check"></div>
			</td>
		</tr>
		<tr>
			<th>도착일</th>
			<td>
				<input type="text" id="arrive_date" name="arrive_date"  style="width:100px;">
				<div id="arrive_date_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>도착시간</th>
			<td>
				<input type="text" id="arrive_time" name="arrive_time" style="width:150px;">
				<div id="arrive_time_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>도착요일</th>
			<td>
				<input type="text" id="arrive_day" name="arrive_day" style="width:80px; margin-right:3px;">
				<div id="arrive_day_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<th>비행총시간</th>
			<td>
				<input type="text" id="totalTime" name="totalTime" style="width:150px; margin-right:3px;">
				<div id="totalTime_valid_check" style="display:inline-block; font-weight:bolder; color:red; float:right; margin-right:50px;"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="image" style="width:480px;">
			</td>
		</tr>
	</table>
	<div style="width:80%; margin:10px 20px; text-align:center;">
		<input id="insertAirplane_submitButton" type="button" value="등록" style="padding:0 5px; margin:0 5px; height:25px;">
		<input type="reset" value="다시작성" style="padding:0 5px; margin:0 5px; height:25px;">
	</div>
</form>	
</body>
</html>
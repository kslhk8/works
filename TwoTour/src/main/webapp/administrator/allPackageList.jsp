<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#allPackageList_table td{ text-align: center; }
</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){	
	var data;
	
	$('#right_menu').css("display","block");
	
	$('#body').css("height","4800px");
	$('#administratorPage_wrap01').css("height","4800px");
	$('#administratorPage_contents').css("height","4800px");
	
	$('#allPackageList_button, #pastPackageList_button, #not_pastPackageList_button').click(function(){
		
		
		if (this.id == 'allPackageList_button') {
	    	data="all";
	   	}
	  	else if (this.id == 'pastPackageList_button') {
	     	data="past";    	
	   	}
	  	else if (this.id == 'not_pastPackageList_button') {
	     	data="not_past"; 	
	   	}
		
		$("input[name=data]").val(data);
		
		$('#goController_button').submit();
	});
	
	/* $.ajax({
		url: "/TwoTour/administrator/allPackageList.do",
		data: "data="+data,
		success:function(success){
			alert('success');
			alert(success.data);
			if(data.data=="all"){
				$('#body').css("height","4800px");
				$('#administratorPage_wrap01').css("height","4800px");
				$('#administratorPage_contents').css("height","4800px");
			}
			if(data.data=="past"){
				alert('past');
				$('#body').css("height","2000px");
				$('#administratorPage_wrap01').css("height","2000px");
				$('#administratorPage_contents').css("height","2000px");
			}
		}
	}); */

});
	
$(window).bind("beforeunload",function(){
	$('#right_menu').css("display","none");
	$('#body').css("height","1350px");
});	
</script>
</head>
<body>

<!-- <div style="position:absolute; display:inline-block; left:30px;">
	<input type="button" value="나라순">
	<input type="button" value="도시순">
	<input type="button" value="패키지명순">
</div> -->
<div id="button_div" style="position:absolute; display:inline-block; right:0;">
<form id="goController_button" method="get" action="/TwoTour/administrator/allPackageList.do">
	<input type="hidden" name="data">
	<input id="allPackageList_button" type="button" value="전체 패키지" style="padding:3px; margin:0 3px;">
	<input id="pastPackageList_button" type="button" value="날짜 지난 패키지" style="padding:3px; margin:5px;">
	<input id="not_pastPackageList_button" type="button" value="날짜가 지나지 않은 패키지" style="padding:3px; margin:5px;">
</form>
</div>
<table id="allPackageList_table" frame="border" rules="all" style="margin:20px; width:100%;position:absolute; top:50px;">
	<colgroup>	
		<col style="width:15%;">	
		<col style="width:55%;">	
		<col style="width:10%;">	
		<col style="width:10%;">	
		<col style="width:10%;">		
	</colgroup>
	<thead>
		<tr>
			<th>상픔코드</th>
			<th>상품명</th>
			<th>출발일</th>
			<th>도착일</th>
			<th>가격</th>
		</tr>
	</thead>
	
	<tbody>
	<c:if test="${list!=null }">
		<c:forEach var="tripDTO" items="${list }">
			<tr>
				<td>${tripDTO.package_code }</td>
				<td>${tripDTO.package_name }</td>
				<td>${tripDTO.depart_date }</td>
				<td>${tripDTO.arrive_date }</td>
				<td>${tripDTO.adult_price }원</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
	
</table>
</body>
</html>
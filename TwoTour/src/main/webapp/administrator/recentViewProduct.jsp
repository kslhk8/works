<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#recentViewProudct_allClick').click(function(){
		if($(this).prop('checked')){
			$('.recentViewProduct_click').prop('checked',true);
		}
		else{
			$('.recentViewProduct_click').prop('checked',false);
		}
	});
});
</script>
<style>
	#recentViewProduct_table td{padding:5px; text-align:center;}
	#recentViewProduct_table th{padding:2px;}
</style>
</head>
<body>
<form name="recentViewProduct" id="recentViewProduct" method="post" action="/TwoTour/administrator/recentViewProductSubmit.do">
<table id="recentViewProduct_table" frame="border" rules="all" style="margin:20px; width:100%;position:absolute; top:50px;">
	<colgroup>	
	<!-- 50% -->
		<col style="width:5%;">	
		<col style="width:45%;">	
		<col style="width:30%;">	
		<col style="width:10%;">
		<col style="width:10%;">	
	</colgroup>
	<thead>
		<tr>
			<th><input type="checkbox" id="recentViewProudct_allClick"></th>
			<th>패키이름</th>
			<th>호텔이름</th>
			<th>가격</th>
			<th>상품을본날짜</th>
		</tr>
	</thead>
	
	<tbody>
 	<c:if test="${list!=null }">
		<c:forEach var="recentViewProductDTO" items="${list }">
			<tr>		
				<td>
					<input type="checkbox" class="recentViewProduct_click" name="checkbox" value="${recentViewProductDTO.seq }">
				</td>
				<td>${recentViewProductDTO.package_name }</td>
				<td>${recentViewProductDTO.hotel_name}</td>
				<td>${recentViewProductDTO.adult_price }원</td>
				<td>${recentViewProductDTO.insertDate }</td>
			</tr>
		</c:forEach>
	</c:if> 
	</tbody>
</table>
<div style="position:absolute; top:10px; right:10px;">
	<input type="submit" value="삭제하기" style="padding:5px;">
</div>
</form>
</body>
</html>
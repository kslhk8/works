<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="trip.bean.TripDTO" %>
<%@ page import="trip.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<% ArrayList<TripDTO> parentDTO_list = (ArrayList<TripDTO>)session.getAttribute("parentDTO_list"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" type="text/css" href="../css/main/index.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../js/jquery/jquery.cookie.js"></script>
<script>
$(document).ready(function(){
	
	var index_right_divOffset = $('#index_right_div').offset();
	
	$(window).scroll(function(){
		if($(document).scrollTop()>index_right_divOffset.top){
			$('#index_right_div').addClass('index_right_div_fixed');
			$('#index_right_div').css("top",$(document).scrollTop());
			$('#index_right_div').removeClass('index_right_div');
			
			if($(document).scrollTop()>200){
				$('#index_right_div').css("top",200);
			}
		}
		else{
			$('#index_right_div').removeClass('index_right_div_fixed');
			$('#index_right_div').addClass('index_right_div');
			$('#index_right_div').css("top",160);
		}
	});
	
	
	$('#index_right_div_close').click(function(){
		$('#index_right_div').hide();
	});
	
});
</script>
</head>
<body>

	<table style="position:absolute; left:50%; transform:translateX(-50%); width:1080px;">
	<!-- style="background-color:yellow;"   -->
		<tr>
			<td style="height:110px;">
				<jsp:include page="/template/top.jsp"></jsp:include>
			</td>
		</tr>
		<!-- style="background-color:green;" -->
		<tr >
			<td style="height:40px;">
				<jsp:include page="${menu }"></jsp:include>
			</td>
		</tr>
		<tr>
			<td id="body" valign=top style="height:1350px;">		
				<jsp:include page="${display }"></jsp:include>
			</td>
		</tr>
		<tr style="background-color:skyblue;">
			<td>
				<jsp:include page="/template/bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
	
		<div id="index_right_div" class="index_right_div">
		<div id="index_right_div_close" style="position:absolute; left:-19px;">
			<img src="../image/index_close.png" style="position:absolute; top:-1.5px; border-left:1px solid rgb(238,238,238);">
		</div>
		<div style="position:absolute;  border-bottom:1px solid rgb(238,238,238); padding:10px; text-align:center; width:100px; background-color:rgb(245,245,245);">
			<span>MY TWO</span><br><br>
			여행의 즐거움!<br>
			투투어<br><br>
			<span style="color:rgb(228,91,133);">
				회원가입 하시고<br>
				포인트 적립<br>
				받으세요
			</span>
		</div>
		<div style="padding:10px; position:absolute;  width:100px; top:150px; text-align:center;">
			<a>로그인</a><br>
			<a>회원가입</a><br>
			<a>예약확인/결제</a><br>
		</div>
		<div style="padding:10px; position:absolute; width:100px; height:200px; top:220px; border:1px solid rgb(238,238,238); text-align:center;">
			<b style="font-weight:bold;">최근 본 상품<span style="color:rgb(228,91,133);">(<span><c:if test="${ parentDTO_list==null || parentDTO_list.size()==0 }">0</c:if><c:if test="${ parentDTO_list!=null || parentDTO_list.size()>0 }">${parentDTO_list.size()}</c:if></span>)</span></b>
			<div style="position:relative; width:100px;">
				<c:if test="${ parentDTO_list==null || parentDTO_list.size()==0}">
					<span style="display:inline-block; margin:70px 0; text-align:center; vertical-align:middle;">
						최근 본 상품이<br>
						없습니다.
					</span>
				</c:if>

				<c:if test="${parentDTO_list!=null || parentDTO_list.size()>0 }">
					<span style="display:inline-block; margin:30px 0; text-align:center; vertical-align:middle;">
						<c:forEach var="parentDTO" items="${parentDTO_list }">
							<img src="../image/package/${parentDTO.imageName }" style="height:50px;">
							<span style="display:inline-block; margin:10px 0; color:rgb(228,91,133);">${parentDTO.adult_price}원~</span>
						</c:forEach>
					</span>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
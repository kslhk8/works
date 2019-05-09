<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' type="text/css" href='/TwoTour/css/productFree/preAirInform.css'>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){//페이지 오픈
		   $('#body').css("height","200px");
		   
				$('#preAirInform_buyingBt').on('click', function(){
					if('${memId}'==''){
					
						alert("로그인 하셔야 결제가 가능합니다.");
					}
					else{	
					
					$('#hidden_preAirInform_form').submit();
					}
				});
			
});

		$(window).bind('beforeunload', function(){//페이지 클로즈 시
		   $('#body').css("height","1350px");
		});
</script>
<br>
<h1>항공 결제 정보</h1>
<br>
<table id='preAirInformT'>
<tr>
	<th>airplane_name</th>
	<th>airplane_code</th>
	<th>depart_city</th>
	<th>depart_date</th>
	<th>arrive_city</th>
	<th>arrive_date</th>
	<th>totalTime</th>
	<th>adult_cost</th>
	<th>child_cost</th>
	<th>baby_cost</th>
</tr>
<tr>
	<td>
		<div class='temp_wrap'>
			<div class='preAirInform_forTd1'>
				<img class='productFree_air_logo' src='/TwoTour/image/productFree/${airplaneDTO.imagename}'>
			</div>
			<div class='preAirInform_forTd2'>
				<span>${ airplaneDTO.airplane_name}</span>
			</div>
		</div>
	</td>
	<td>
		${airplaneDTO.airplane_code}
	</td>
	<td>
		${airplaneDTO.depart_city}
	</td>
	<td>
		${airplaneDTO.depart_date}
		&nbsp;
		${airplaneDTO.depart_day}
		<br>
		${airplaneDTO.depart_time}
	</td>
	<td>
		${airplaneDTO.arrive_city}
	</td>
	<td>
		${airplaneDTO.arrive_date}
		&nbsp;
		${airplaneDTO.arrive_day}
		<br>
		${airplaneDTO.arrive_time}
	</td>
	<td>
		${airplaneDTO.totalTime}
	</td>
	<td>
		${airplaneDTO.adult_cost}
	</td>
	<td>
		${airplaneDTO.child_cost}
	</td>
	<td>
		${airplaneDTO.baby_cost}
	</td>
</tr>
<c:if test='${airplaneDTO_RT != null }'>
<tr>
	<td>
		<div class='temp_wrap'>
			<div class='preAirInform_forTd1'>
				<img class='productFree_air_logo' src='/TwoTour/image/productFree/${airplaneDTO_RT.imagename}'>
			</div>
			<div class='preAirInform_forTd2'>
				<span>${ airplaneDTO_RT.airplane_name}</span>
			</div>
		</div>
	</td>
	<td>
		${airplaneDTO_RT.airplane_code}
	</td>
	<td>
		${airplaneDTO_RT.depart_city}
	</td>
	<td>
		${airplaneDTO_RT.depart_date}
		&nbsp;
		${airplaneDTO_RT.depart_day}
		<br>
		${airplaneDTO_RT.depart_time}
	</td>
	<td>
		${airplaneDTO_RT.arrive_city}
	</td>
	<td>
		${airplaneDTO_RT.arrive_date}
		&nbsp;
		${airplaneDTO_RT.arrive_day}
		<br>
		${airplaneDTO_RT.arrive_time}
	</td>
	<td>
		${airplaneDTO_RT.totalTime}
	</td>
	<td>
		${airplaneDTO_RT.adult_cost}
	</td>
	<td>
		${airplaneDTO_RT.child_cost}
	</td>
	<td>
		${airplaneDTO_RT.baby_cost}
	</td>
</tr>
</c:if>
</table>
<form name='hidden_preAirInform_form' id='hidden_preAirInform_form' method='POST' action='/TwoTour/productFree/buyItNow.do' >
<div id='hidden_preAirInform' style='display: none;'>

<input type='hidden' name='airplane_code' value='${airplaneDTO.airplane_code }'>
<input type='hidden' name='depart_city' value='${airplaneDTO.depart_city }'>
<input type='hidden' name='depart_date' value='${airplaneDTO.depart_date }'>
<input type='hidden' name='depart_time' value='${airplaneDTO.depart_time }'>
<input type='hidden' name='arrive_city' value='${airplaneDTO.arrive_city}'>
<c:if test='${airplaneDTO_RT != null }'>
<input type='hidden' name='airplane_code1' value='${airplaneDTO_RT.airplane_code }'>
<input type='hidden' name='depart_city1' value='${airplaneDTO_RT.depart_city }'>
<input type='hidden' name='depart_date1' value='${airplaneDTO_RT.depart_date }'>
<input type='hidden' name='depart_time1' value='${airplaneDTO_RT.depart_time }'>
<input type='hidden' name='arrive_city1' value='${airplaneDTO_RT.arrive_city}'>
</c:if>
</div>
<div id='preAirInform_bt_div'>

		<button type="button" id='preAirInform_backBt' onclick='javascript:history.go(-1);'>뒤로가기</button> 
		<button type="button" id='preAirInform_buyingBt'>결제하기</button>

</div>
</form>
<script src='/TwoTour/js/productFree/preAirInform.js'></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/packageTrip/member_reservation.css" />
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#right_menu').css("display","block");
	$('#body').css("height","2000px");
	$('#normal_clause').css("background-color","white");


	 
     
	//패키지정보
	var available_member = 0;
   	$.ajax({
   		   type:"POST",
           url:"/TwoTour/packageTrip/getTripInformByCode.do",
           data:{'package_code' : '${reservationInformDTO.package_code}'},
           dataType:"json",
           success: function(data){
        	 //예약된 인원 수
        	 available_member = data.tripDTO.total_member - data.tripDTO.reservation_member;
        	$('#member_info_div #span1').append('<font color="blue">'+data.tripDTO.total_member + '</font color>명');
        	$('#member_info_div #span2').append('<font color="blue">'+available_member+'</font color>명');
        	 //가격 정보 
            $('#member_table').append('<input type="hidden" name="adult_price" value="'+data.tripDTO.adult_price+'">');
           	$('#member_table').append('<input type="hidden" name="teen_price" value="'+data.tripDTO.teen_price+'">');
           	$('#member_table').append('<input type="hidden" name="baby_price" value="'+data.tripDTO.baby_price+'">');   
           	//패키지 seq
           	$('#member_table').append('<input type="hidden" name="son_seq" value="'+data.tripDTO.seq+'">'); 
           	
           	data.tripDTO.adult_price= (data.tripDTO.adult_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		 	data.tripDTO.teen_price= (data.tripDTO.teen_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			data.tripDTO.baby_price= (data.tripDTO.baby_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			data.tripDTO.fuel_fee = (data.tripDTO.fuel_fee).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
           	
           	$('#total_days_td').append(data.tripDTO.nights+'박'+data.tripDTO.day+'일');
           	$('#fuel_fee_td').append(data.tripDTO.fuel_fee+'원');
           	$('#price_td').append(
           		'성인:' + data.tripDTO.adult_price + '원<br>'+
           		'아동	:' + data.tripDTO.teen_price + '원<br>'+
           		'유아:' + data.tripDTO.baby_price + '원'
           	);
           	$('#airplane_td').append('<img src="/TwoTour/image/"' + data.tripDTO.imagename + '"/>'
           							+	data.tripDTO.airplane_name);
           	$('#depart_td').append(data.tripDTO.depart_apTime+'('+data.tripDTO.depart_code+')');
           	$('#arrive_td').append(data.tripDTO.arrive_apTime+'('+data.tripDTO.arrive_code+')');
           	
           	
           }
   	});
	
   
  	
	
       $('#name_td').append("${reservationInformDTO.reservation_name}");
        $('#email_td').append("${reservationInformDTO.reservation_email}" + '@' + "${reservationInformDTO.reservation_email1}");
        
  	
  	var adult_num = adult_num2 = 0;
  	var teen_num = teen_num2 = 0;
  	var baby_num = baby_num2 = 0;
   
  	//여행자 정보
   	$.ajax({
   		type:"POST",
        url:"/TwoTour/packageTrip/getTravelerInform.do",
        data:{'num' : '${reservationInformDTO.reservation_number}'},
        dataType:"json",
        success: function(data){
        	$('#member_table').append('<input type="hidden" name="reserved_total_member" value="'+data.list.length+'">');
        	
        	$.each(data.list, function(index, items){
        		if(items.ages=='성인') {adult_num++; adult_num2++;}
        		if(items.ages=='아동') {teen_num++; teen_num2++;}
        		if(items.ages=='유아') {baby_num++; baby_num2++;}
  				
        		$('#member_table').append(
  					'<tr id="default_tr" class="member_table_tr">' + 
						'<td id="ages_td" rowspan="2">'+items.ages+
						'<input type="hidden" name="ages" value="'+items.ages+'">'+
						'<input type="hidden" name="passport_origin" value="'+items.passport_num+'"></td>' +
						'<td><input type="text" name="name" class="name eidtable" style="width:56px" value="'+items.name+'" readonly></td>' +
						'<td><input type="text" name="first_name" class="first_name eidtable" style="width:56px" value="'+items.first_name+'" readonly>' +
							'<input type="text" name="last_name" class="last_name eidtable" style="width:65px" value="'+items.last_name+'" readonly>'+'</td>' +
						'<td><input type="text" name="year" class="year eidtable" style="width:36px" value="'+items.year+'" readonly>년'+
							'<input type="text" name="month" class="month eidtable" style="width:24px" value="'+items.month+'" readonly>월'+
							'<input type="text" name="day" class="day eidtable" style="width:24px" value="'+items.day+'" readonly>일</td>'+
							 	'<td><select id="select_gender'+index+'" class="eidtable selectEditable" name="gender" disabled>'+
										'<option value="1">남' +
										'<option value="0">여' +
									'</select></td>' +
						'<td><input type="text" class="eidtable" name="email" style="width:70px" value="'+items.email+'" readonly>@' +
									'<select id="select_email'+index+'" name="email1" class="eidtable selectEditable" disabled>' +
										'<option value="naver.com">naver.com' +
										'<option value="hanmail.net">hanmail.net' +
										'<option value="daum.net">daum.net' +
									'</select></td>' +
						'<td>' +
							'<select id="select_phone'+index+'" name="phone" class="eidtable selectEditable" style="width:60px; margin-right:2px; margin-top:1px;" disabled>' +
								'<option value="010">010' +
								'<option value="011">011' +
								'<option value="016">016' +
							'</select><input type="text" name="phone1" class="eidtable" style="width:80px" value="'+items.phone1+'" readonly>' +
						'</td>' +
					'</tr>' +	
  				
					'<tr id="default_tr2" class="member_passport_tr">' +
						'<td colspan="7">' +
							'<ul>' +
								'<li>여권번호<input type="text"  class="eidtable" name="passport_num" style="width:80px;height:15px" value="'+items.passport_num+'" readonly></li>' +
								'<li>여권만료일<input  class="eidtable" type="text" name="passport_year" style="width:36px;height:15px" value="'+items.passport_year+'" readonly>년' +
								'<input type="text" class="eidtable" name="passport_month" style="width:30px;height:15px" value="'+items.passport_month+'" readonly>월' +
								'<input type="text" class="eidtable" name="passport_day" style="width:30px;height:15px" value="'+items.passport_day+'" readonly>일' +
							'</ul>' +
						'</td>' +	 
					'</tr>'
  				
  				 )//append
  				 $('#select_gender'+index).val(items.gender).prop('selected', true);
  				 $('#select_email'+index).val(items.email1).prop('selected', true);
  				 $('#select_phone'+index).val(items.phone).prop('selected', true);
  				
        	});
        	
        	
        	//인원 수
        	$('#howManyAdult').append(adult_num);
        	$('#howManyTeen').append(teen_num);
        	$('#howManyBaby').append(baby_num);  
        	
        }
        
   	});
   	
    var appendRow = 
		'<tr id="new_tr" class="member_table_tr">' +
		'<td rowspan="2" class="decide_ages">성인</td>' +
		'<td><input type="text" name="name2" class="name" style="width:56px"></td>' +
		'<td><input type="text" name="first_name2" class="first_name" style="width:56px"> <input type="text" name="last_name2" class="last_name" style="width:65px"></td>' +
		'<td><input type="text" name="year2" class="year" style="width:36px">년<input type="text" name="month2" class="month" style="width:24px">월<input type="text" name="day2" class="day" style="width:24px">일</td>' +
		'<td><select name="gender2">' +
			'<option value="1">남' +
			'<option value="0">여' +
		'</select></td>' +
		'<td><input type="text" name="email2" style="width:70px">@' +
		'<select name="email12">' +
			'<option value="naver.com">naver.com' +
			'<option value="hanmail.net">hanmail.net' +
			'<option value="daum.net">daum.net' +
		'</select></td>' +
		'<td>' +
		'<select name="phone2" style="width:60px; margin-right:2px; margin-top:1px;">' +
			'<option value="010">010' +
			'<option value="011">011' +
			'<option value="016">016' +
		'</select><input type="text" name="phone12" style="width:80px">' +
		'</td>' +
		'</tr>' +
		'<tr id="new_tr2" class="member_passport_tr">' +
		'<td colspan="7">' +
			'<ul>' +
				'<li>여권번호<input type="text" name="passport_num2" style="width:80px;height:15px"></li>' +
				'<li>여권만료일<input type="text" name="passport_year2" style="width:36px;height:15px">년<input type="text" name="passport_month2" style="width:30px;height:15px">월<input type="text" name="passport_day2" style="width:30px;height:15px">일' +
			'</ul>' +
		'</td>' +	
		'</tr>';	
    
        	
	//수정하기버튼 클릭
   	$('#pay_select > p > #do_edit').on('click', function(){
   		if($(this).text()=='수정완료'){
   			if(moreMember>0){
   				$('#member_table').append('<input type="hidden" name="size" value="'+moreMember+'">');  				
   				$('#modify_traveler_form').attr('action', '/TwoTour/packageTrip/modifyTravelerInsert.do');
   			}else{
   				$('#modify_traveler_form').attr('action', '/TwoTour/packageTrip/modifyTraveler.do');
   			}
   			$('#modify_traveler_form').submit();
   		}
   		
   		
   		$('.eidtable').attr('disabled', false);
   		$('.eidtable').attr('readonly', false);
   		$('input').css('border', '1px solid skyblue');
   		$('select').css('border', '1px solid skyblue');
   		$('.name:first').focus();
   		
   		$(this).text('수정완료');
   		
   		
   	});
	//취소버튼 클릭
   	$('#pay_select > p > #cancel_edit').on('click', function(){
   		$('.eidtable').attr('readonly', true);
   		$('.selectEditable').attr('disabled', true);
   		$('input').css('border', '');
   		$('select').css('border', '');
   		$('#new_tr').remove();
   		$('#new_tr2').remove();
   		$('#pay_select > p > #do_edit').text('수정하기');
   		
   	});
	
   	var current_adult = $('#howManyAdult').html();
	
   	
   	//인원 추가 삭제
   	var moreMember = 0;
   	
   	//성인 -
	$('#adult_minus').on('click', function(){
		adult_num--;
		if(adult_num < adult_num2) adult_num = adult_num2;
		else{
			$('#howManyAdult').html(adult_num);
			$('.member_table_tr:last').remove();
			$('.member_passport_tr:last').remove();
			moreMember--;
			$('#member_table')
		}
	});
	
 	//성인 +
	$('#adult_plus').on('click', function(){
		adult_num++;
		
		if(adult_num+teen_num+baby_num > available_member){
			alert("예약 가능한 인원을 초과하였습니다.");
			return;
		}
		$('#howManyAdult').html(adult_num);
		$('#member_table').append(appendRow);
		$('#member_table').append('<input type="hidden" name="ages2" value="성인">');
		moreMember++;
		
	});
	//아동 -
	$('#teen_minus').on('click', function(){
		teen_num--;
		if(teen_num < teen_num2) teen_num = teen_num2;
		else{
			$('#howManyTeen').html(teen_num);
			$('.member_table_tr:last').remove();
			$('.member_passport_tr:last').remove();
			moreMember--;
		}
	});
	//아동 +
	$('#teen_plus').on('click', function(){
		teen_num++;
		if(adult_num+teen_num+baby_num > available_member){
			alert("예약 가능한 인원을 초과하였습니다.");
			return;
		}
		if(teen_num > 20) teen_num = 20;
		$('#howManyTeen').html(teen_num);
		$('#member_table').append(appendRow);
		$('.decide_ages').html('아동');
		$('#member_table').append('<input type="hidden" name="ages2" value="아동">');
		moreMember++;
		
	});
	//유아 -
	$('#baby_minus').on('click', function(){
		baby_num--;
		if(baby_num < baby_num2) baby_num = baby_num2;
		else{
			$('#howManyBaby').html(baby_num);
			$('.member_table_tr:last').remove();
			$('.member_passport_tr:last').remove();
			moreMember--;
		}
	});
	//유아 +
	$('#baby_plus').on('click', function(){
		baby_num++;
		if(adult_num+teen_num+baby_num > available_member){
			alert("예약 가능한 인원을 초과하였습니다.");
			return;
		}
		if(baby_num > 20) baby_num = 20;
		$('#howManyBaby').html(baby_num);
		$('#member_table').append(appendRow);
		$('.decide_ages').html('유아');
		$('#member_table').append('<input type="hidden" name="ages2" value="유아">');
		moreMember++;
	});
	
	//결제하기 클릭
	$('#modify_pay').click(function(){
		$('#do_pay_check').css("visibility","visible");
		$('#reservation_background_div').css("opacity","0.2");
		
	});
	//결제하기 - yes
	$('#modify_pay_complete').on('click', function(){
		$('#modify_traveler_form').attr('action', '/TwoTour/packageTrip/modifyPayComplete.do');
		$('#modify_traveler_form').submit();
	});
	//결제하기 - no
	$('#modify_pay_cancel').on('click', function(){
		$('#do_pay_check').css("visibility","hidden");
		$('#reservation_background_div').css("opacity","1");
	});
	//예약취소 클릭
	$('#cancel_reservation').on('click', function(){
		$('#cancel_reservation_check').css("visibility","visible");
		$('#reservation_background_div').css("opacity","0.2");
	});
 	//예약취소 - no
	$('#confirm_cancel_no').on('click', function(){
		$('#cancel_reservation_check').css("visibility","hidden");
		$('#reservation_background_div').css("opacity","1");
	});
	//예약취소 - yes
	$('#confirm_cancel_yes').on('click', function(){
		$('#modify_traveler_form').attr('action', '/TwoTour/packageTrip/cancelReservation.do');
		$('#modify_traveler_form').submit();
	});
	
	$('#normal_clause').click(function(){
		$('#clause_content').css("visibility","visible");
		$('#clause_content1').css("visibility","hidden");
		$('#clause_content2').css("visibility","hidden");
		
		$('#normal_clause').css("background-color","white");
		$('#individual_clause').css("background-color","rgb(235,235,235)");
		$('#inherence_clause').css("background-color","rgb(235,235,235)");
	});
	
	$('#individual_clause').click(function(){
		$('#clause_content').css("visibility","hidden");
		$('#clause_content1').css("visibility","visible");
		$('#clause_content2').css("visibility","hidden");
		
		$('#individual_clause').css("background-color","white");
		$('#normal_clause').css("background-color","rgb(235,235,235)");
		$('#inherence_clause').css("background-color","rgb(235,235,235)");
	});
	
	$('#inherence_clause').click(function(){
		$('#clause_content').css("visibility","hidden");
		$('#clause_content1').css("visibility","hidden");
		$('#clause_content2').css("visibility","visible");
		
		$('#inherence_clause').css("background-color","white");
		$('#normal_clause').css("background-color","rgb(235,235,235)");
		$('#individual_clause').css("background-color","rgb(235,235,235)");
	});
	
	
});





</script>
<style>
#adult_minus, #adult_plus, #teen_minus, #teen_plus, #baby_plus, #baby_minus{cursor:pointer;display:hide;}
#adult_minus{margin-left:40px;margin-top:15px;}
#howManyAdult, #howManyTeen, #howManyBaby{color:rgb(241, 84, 155);}
#modify_pay{
	position:absolute; width:95px; right:7px; padding-top:8px;
	font:12px Tahoma, Arial; height:24px; background-color:#EC008C; border:1px solid grey; 
	color:white; text-align:center; cursor:pointer;left:800px;
}
#modify_pay_complete{
	position:absolute; width:75px; height:24px;  padding-top:8px; top:60px; left:65px;
	font:12px Tahoma, Arial; background-color:white; border:1px solid grey; text-align:center; color:black; cursor:pointer;
}
#modify_pay_cancel{
	position:absolute; width:75px; height:24px;  padding-top:8px; top:60px; left:155px;
	font:12px Tahoma, Arial; background-color:white; border:1px solid grey; text-align:center; color:black; cursor:pointer;
}
#cancel_reservation{
	position:absolute; width:95px; right:7px; padding-top:8px;
	font:12px Tahoma, Arial; height:24px; background-color:white; border:1px solid grey; 
	text-align:center; cursor:pointer;left:700px;
}
#cancel_reservation_check{
	visibility:hidden;  position:absolute; width:300px; height:100px; border:1px solid red; 
	top:680px; left:300px; text-align:center; padding-top:15px; color:black; border:1px solid #EC008C; 	
}
#confirm_cancel_yes{
	position:absolute; width:75px; height:24px;  padding-top:8px; top:60px; left:65px;
	font:12px Tahoma, Arial; background-color:white; border:1px solid grey; text-align:center; 
	color:black; cursor:pointer;
}
#confirm_cancel_no{
	position:absolute; width:75px; height:24px;  padding-top:8px; top:60px; left:155px;
	font:12px Tahoma, Arial; background-color:white; border:1px solid grey; text-align:center; 
	color:black; cursor:pointer;
}


</style>
</head>
<body>



<form id="modify_traveler_form"  method="POST">
<input type="hidden" id="baby_number" name="reservation_number" value="${reservationInformDTO.reservation_number}" />
<input type="hidden" name="no_member" value="no_member">
<div id="reservation_background_div">

	<div id="reservation_top_name">
		<div id="top_name1"><strong>예약 및 결제 </strong></div>
		<div id="top_name2"><strong>상품검색</strong>
			<strong>▶</strong>
			<strong >예약</strong>
			<strong>▶</strong>
			<strong style="color:rgb(241, 84, 155)">예약확인</strong>
			<strong>▶</strong><strong>결제</strong>
		</div>
	
	</div>

	<div id="reservation_content_info">
		<div id="reservation_item_name">
			<img src="../image/reserv_01.png">
		</div>
		<div id="reservation_item_name_content">
			<table width="900" cellpadding="0" cellspacing="0" border="0">
				<tbody>
					<tr>
						<td id="package_name_td" class="reservation_tot_td">&nbsp;&nbsp;
							<strong>${reservationInformDTO.package_name }</strong><br>&nbsp;&nbsp;<span>(상품코드:${reservationInformDTO.package_code })</span>
						</td>
						<td id="total_days_td" class="reservation_td"></td>
						<td id="fuel_fee_td"   class="reservation_td">유류할증료<br></td>
						<td id="price_td"	   class="reservation_td"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="reservation_airplane_info">
			<ul>
				<li id="airplane_td" style="padding-right:20px;"></li>
				<li id="depart_td"   style="padding-right:20px;">출발 &nbsp; 2018/</li>
				<li id="arrive_td"   style="border:none;">출발   &nbsp;2018/</li>
			</ul>
		</div>
		<div id="reservation_clause_info">
		<img src="../image/reserv_02.png">
		</div>
		<div id="reservation_clause_content">
			<ul>
				<li id="normal_clause">국외여행 표준약관</li> 
				<li id="individual_clause">개인정보 수집 및 이용안내</li>
				<li id="inherence_clause">고유식별정보 수집 이용안내</li>
			</ul>
		</div>
		<div id="clause_content">
			<pre><textarea rows="10" cols="158" name="clause_content">제1조 (목적)
이 약관은 (주)하나투어(이하 당사라한다.)와 여행자가 체결한 국외여행계약의 세부 이행 및 준수사항을 정함을 목적으로 합니다.

제2조 (당사와 여행자 의무)
① 당사는 여행자에게 안전하고 만족스러운 여행서비스를 제공하기 위하여 여행알선 및 안내,운송,숙박 등 여행계획의 수립 및 실행과정에서 맡은 바 임무를 충실히 수행하여야 합니다.
② 여행자는 안전하고 즐거운 여행을 위하여 여행자간 화합도모 및 여행사의 여행질서 유지에 적극 협조하여야 합니다.

제3조(용어의 정의)
여행의 종류 및 정의, 해외여행수속대행업의 정의는 다음과 같습니다.
1. 기획여행 : 당사가 미리 여행목적지 및 관광일정, 여행자에게 제공될 운송 및 숙식서비스 내용(이하 '여행서비스'라 함), 여행요금을 정하여 광고 또는 기타 방법으로 여행자를 모집하여 실시하는 여행.
2. 희망여행 : 여행자(개인 또는 단체)가 희망하는 여행조건에 따라 당사가 운송,숙식,관광 등 여행에 관한 전반적인 계획을 수립하여 실시하는 여행.
3. 해외여행 수속대행(이하 수속대형계약이라 함) : 당사가 여행자로부터 소정의 수속대행요금을 받기로 약정하고, 여행자의 위탁에 따라 다음에 열거하는 업무(이하 수속 대행업무라함)를 대행하는 것.
  1) 사증, 재입국 허가 및 각종 증명서 취득에 관한 수속
  2) 출입국 수속서류 작성 및 기타 관련업무 

제4조(계약의 구성)
① 여행계약은 여행계약서(붙임)와 여행약관,여행일정표(또는 여행 설명서)를 계약내용으로 합니다.
② 여행일정표(또는 여행설명서)에는 여행일자별 여행지와 관광내용,교통수단,쇼핑횟수,숙박장소,식사 등 여행실시일정 및 여행사 제공 서비스 내용과 여행자 유의사항이 포함되어야 합니다.

제5조(특약)
당사와 여행자는 관계법규에 위반되지 않는 범위내에서 서면으로 특약을 맺을 수 있습니다. 이 경우 표준약관과 다름을 당사는 여행자에게 설명해야 합니다.

제6조(안전정보 제공 및 계약서 등 교부)
당사는 여행자와 여행계약을 체결할 때 여행약관과 외교부 해외안전여행 홈페이지(www.0404.go.kr)에 게재된 여행지 안전정보를 제공하여야 하며, 여행계약을 체결한 경우 계약서와 여행일정표(또는 여행설명서)를 각 1부씩 여행자에게 교부하여야 합니다.

제7조(계약서 및 약관 등 교부 간주)
당사와 여행자는 다음 각 호의 경우 여행계약서와 여행약관 및 여행일정표(또는 여행설명서)가 교부된 것으로 간주합니다. 
1. 여행자가 인터넷 등 전자정보망으로 제공된 여행계약서, 약관 및 여행일정표(또는 여행설명서)의 내용에 동의하고 여행계약의 체결을 신청한데 대해 당사가 전자정보망 내지 기계적 장치 등을 이용하여 여행자에게 승낙의 의사를 통지한 경우
2. 당사가 팩시밀리 등 기계적 장치를 이용하여 제공한 여행계약서, 약관 및 여행일정표(또는 여행설명서)의 내용에 대하여 여행자가 동의하고 여행계약의 체결을 신청하는 서면을 송부한데 대해 당사자가 전자정보망 내지 기계적 장치 등을 이용하여 여행자에게 승낙의 의사를 통지한 경우 

제8조(당사의 책임)
당사는 여행 출발 시부터 도착 시까지 당사 본인 또는 그 고용인, 현지여행업자 또는 그 고용인 등(이하 '사용인'이라 함)이 제2조 제1항에서 규정한 당사 임무와 관련하여 여행자에게 고의 또는 과실로 손해를 가한 경우 책임을 집니다.

제9조(최저행사인원 미 충족시 계약해제)
① 당사는 최저행사인원이 충족되지 아니하여 여행계약을 해제하는 경우 여행출발 7일전까지 여행자에게 통지하여야 합니다.
② 당사가 여행참가자 수 미달로 전항의 기일내 통지를 하지 아니하고 계약을 해제하는 경우 이미 지급받은 계약금 환급 외에 다음 각 목의 1의 금액을 여행자에게 배상하여야 합니다.
  가. 여행출발 1일전까지 통지시 : 여행요금의 30% 
  나. 여행출발 당일 통지시 : 여행요금의 50%
  (※여행요금이란 일정표상 명시된 총 상품가격을 의미한다.)

제10조(계약체결 거절)
당사는 여행자에게 다음 각 호의 1에 해당하는 사유가 있을 경우에는 여행자와의 계약체결을 거절할 수 있습니다. 
  1. 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 지장이 있다고 인정될 때 
  2. 질병 기타 사유로 여행이 어렵다고 인정될 때
  3. 명시한 최대행사인원이 초과되었을 때
  4. 일정표에 최저행사인원이 미달되었을 때

제11조(여행요금)
① 여행계약서의 여행요금에는 다음 각 호가 포함됩니다. 단, 다음의 1~9호는 여행자 본인이 직접 여행지에서 지불하여야 할 금액이나 당사가 여행자 편의를 위하여 수탁받아 이를 대신 지불합니다.
  1. 항공기, 선박, 철도 등 이용운송기관의 운임(보통운임기준)
  2. 공항, 역, 부두와 호텔사이 등 송영버스요금
  3. 숙박요금 및 식사요금
  4. 안내자경비
  5. 여행 중 필요한 각종세금
  6. 국내외 공항, 항만세
  7. 관광진흥개발기금
  8. 일정표내 관광지 입장료
  9. 기타 개별계약에 따른 비용
  10. 여행 알선 수수료 
② 여행자는 계약체결시 계약금(여행요금 중 계약금으로 별도 고지된 금액)을 당사에게 지급하여야 하며, 계약금은 여행요금 또는 손해배상액의 전부 또는 일부로 취급합니다.
③ 여행자는 제1항의 여행요금 중 계약금을 제외한 잔금을 여행출발 7일전까지 당사에게 지급하여야 합니다.
④ 여행자는 제1항의 여행요금을 당사자가 약정한 바에 따라 카드, 계좌이체 또는 무통장입금 등의 방법으로 지급하여야 합니다.
⑤ 희망여행요금에 여행자 보험료가 포함되는 경우 당사는 보험회사명, 보상내용 등을 여행자에게 설명하여야 합니다.

제12조(여행요금의 변경)
① 국외여행을 실시함에 있어서 이용운송,숙박기관에 지급하여야 할 요금이 계약체결시보다 5% 이상 증감하거나 여행 요금에 적용된 외화환율이 계약체결시보다 2% 이상 증감한 경우 당사 또는 여행자는 그 증감된 금액 범위 내에서 여행요금의 증감을 상대방에게 청구할 수 있습니다.
② 당사는 제1항의 규정에 따라 여행요금을 증액하였을 때에는 여행개시 15일전에 여행자에게 통지하여야 합니다.

제13조(여행조건의 변경요건 및 요금 등의 정산)
① 위 제1조 내지 제12조의 여행조건은 다음 각 호의 1의 경우에 한하여 변경될 수 있습니다.
1. 여행자의 안전과 보호를 위하여 여행자의 요청 또는 현지사정에 의하여 부득이하다고 쌍방이 합의한 경우
2. 천재지변, 전란, 정부의 명령, 운송,숙박기관 등의 파업,휴업 등으로 여행의 목적을 달성할 수 없는 경우
② 제1항의 여행조건 변경 및 제12조의 여행요금 변경으로 인하여 제11조제1항의 여행요금에 증감이 생기는 경우에는 여행출발 전 변경 분은 여행출발 이전에, 여행 중 변경 분은 여행종료 후 10일 이내에 각각 정산(환급)하여야 합니다. 
③ 제1항의 규정에 의하지 아니하고 여행조건이 변경되거나 제15조 또는 제16조의 규정에 의한 계약의 해제,해지로 인하여 손해배상액이 발생한 경우에는 여행출발 전 발생 분은 여행출발이전에, 여행 중 발생 분은 여행종료 후 10일 이내에 각각 정산(환급)하여야 합니다. 
④ 여행자는 여행출발 후 자기의 사정으로 숙박, 식사, 관광 등 여행요금에 포함된 서비스를 제공받지 못한 경우 당사에게 그에 상응하는 요금의 환급을 청구할 수 없습니다. 단, 여행이 중도에 종료된 경우에는 제14조에 준하여 처리합니다. 

제14조(손해배상)
① 당사는 현지여행업자 등의 고의 또는 과실로 여행자에게 손해를 가한 경우 당사는 여행자에게 손해를 배상하여야 합니다.
② 당사의 귀책사유로 여행자의 국외여행에 필요한 여권, 사증, 재입국 허가 또는 각종 증명서 등을 취득하지 못하여 여행자의 여행일정에 차질이 생긴 경우 당사는 여행자로부터 절차대행을 위하여 받은 금액 전부 및 그 금액의 100% 상당액을 여행자에게 배상하여야 합니다.
③ 당사는 항공기, 기차, 선박 등 교통기관의 연발착 또는 교통체증 등으로 인하여 여행자가 입은 손해를 배상하여야 합니다. 단, 당사가 고의 또는 과실이 없음을 입증한 때에는 그러하지 아니합니다.
④ 당사는 자기나 그 사용인이 여행자의 수하물 수령, 인도, 보관 등에 관하여 주의를 해태(懈怠)하지 아니하였음을 증명하지 아니하면 여행자의 수하물 멸실, 훼손 또는 연착으로 인한 손해를 배상할 책임을 면하지 못합니다.

제15조(여행출발 전 계약해제)
① 당사 또는 여행자는 여행출발전 이 여행계약을 해제할 수 있습니다. 이 경우 발생하는 손해액은 '소비자분쟁해결기준'(공정거래위원회 고시)에 따라 배상합니다. 
  1. 여행자의 여행계약 해제 요청이 있는 경우(여행자의 취소요청시) 
    - 여행 개시 30일전까지(~30) 통보시 : 계약금 환급
    - 여행 개시 20일전까지(29~20) 통보시 : 여행요금의 10% 배상
    - 여행 개시 10일전까지(19~10) 통보시 : 여행요금의 15% 배상
    - 여행 개시 8일 전까지(9~8) 통보시 : 여행요금의 20% 배상
    - 여행 개시 1일 전까지(7~1) 통보시 : 여행요금의 30% 배상
    - 여행 당일 통보시 : 여행요금의 50% 배상
  2. 당사의 귀책사유로 취소 통보하는 경우
    - 여행 개시 30일전까지(~30) 통보시 : 계약금 환급
    - 여행 개시 20일전까지(29~20) 통보시 : 여행요금의 10% 배상
    - 여행 개시 10일전까지(19~10) 통보시 : 여행요금의 15% 배상
    - 여행 개시 8일 전까지(9~8) 통보시 : 여행요금의 20% 배상
    - 여행 개시 1일 전까지(7~1) 통보시 : 여행요금의 30% 배상
    - 여행 당일 통보시 : 여행요금의 50% 배상
  단, 최저행사인원이 충족되지 않아 불가피하게 기획여행을 실시할 수 없는 경우에는 제9조(최저행사인원 미충족시 계약해제)의 조항에 의거하여 당사가 여행자에게 배상한다.
  (※여행요금이란 일정표상 명시된 총 상품가격을 의미한다.)
② 당사 또는 여행자는 여행출발 전에 다음 각 호의 1에 해당하는 사유가 있는 경우 상대방에게 제1항의 손해배상액을 지급하지 아니하고 이 여행계약을 해제할 수 있습니다.
  1. 당사가 해제할 수 있는 경우
    가. 제13조제1항제1호 및 제2호사유의 경우
    나. 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 현저한 지장이 있다고 인정될 때
    다. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우
    라. 여행자가 계약서에 기재된 기일까지 여행요금을 납입하지 아니한 경우
  2. 여행자가 해제할 수 있는 경우
    가. 제13조제1항제1호 및 제2호의 사유가 있는 경우
    나. 여행자의 3촌 이내 친족이 사망한 경우 단, 여행자는 아래와 같은 입증서류를 당사에 제출하여야 한다.
      1) 친족을 확인할 수 있는 서류(가족관계증명서 등)
      2) 진단서 또는 사체검안서(사망진단서)
      3) 그밖에 필요한 자료
    다. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우 단, 여행자는 아래와 같은 입증서류를 당사에 제출하여야 한다.
      1) 진단서
      2) 그밖에 필요한 자료
    라. 배우자 또는 직계존비속이 신체이상으로 3일 이상 병원(의원)에 입원하여 여행 출발 전까지 퇴원이 곤란한 경우 그 배우자 또는 보호자 1인 단, 여행자는 아래와 같은 입증서류를 당사에 제출하여야 한다.
      1) 친족을 확인할 수 있는 서류(가족관계증명서 등)
      2) 진단서
      3) 그밖에 필요한 자료
    마. 당사의 귀책사유로 계약서 또는 여행일정표(여행설명서)에 기재된 여행일정대로의 여행실시가 불가능해진 경우
    바. 제12조 제1항의 규정에 의한 여행요금의 증액으로 인하여 여행 계속이 어렵다고 인정될 경우

제16조(여행출발 후 계약해지)
① 당사 또는 여행자는 여행출발 후 부득이한 사유가 있는 경우 이 여행계약을 해지할 수 있습니다. 단, 이로 인하여 상대방이 입은 손해를 배상하여야 합니다.
② 제1항의 규정에 의하여 계약이 해지된 경우 당사는 여행자가 귀국하는데 필요한 사항을 협조하여야 하며, 이에 필요한 비용으로써 당사의 귀책사유에 의하지 아니한 것은 여행자가 부담합니다.

제17조(여행의 시작과 종료)
여행의 시작은 탑승수속(선박인 경우 승선수속)을 마친 시점으로 하며, 여행의 종료는 여행자가 입국장 보세구역을 벗어나는 시점으로 합니다. 단, 계약내용상 국내이동이 있을 경우에는 최초 출발지에서 이용하는 운송수단의 출발시각과 도착시각으로 합니다.

제18조(설명의무)
당사는 계약서에 정하여져 있는 중요한 내용 및 그 변경사항을 여행자가 이해할 수 있도록 설명하여야 합니다.

제19조(보험가입 등)
당사는 이 여행과 관련하여 여행자에게 손해가 발생한 경우 여행자에게 보험금을 지급하기 위한 보험 또는 공제에 가입하거나 영업보증금을 예치하여야 합니다.

제20조(기타사항)
①	이 계약에 명시되지 아니한 사항 또는 이 계약의 해석에 관하여 다툼이 있는 경우에는 당사 또는 여행자가 합의하여 결정하되, 합의가 이루어지지 아니한 경우에는 관계법령 및 일반관례에 따릅니다. 
②	특수지역에의 여행으로서 정당한 사유가 있는 경우에는 당사의 여행약관의 내용과 달리 정할 수 있습니다.
③	이 약관은 기획여행 상품을 기준으로 적용합니다. 

부칙
1. (개정일) 이 약관은 2003년 3월 6일부터 시행한다.
2. (개정일) 이 약관은 2004년 12월 25일부터 시행한다.
3. (개정일) 이 약관은 2005년 4월 5일부터 시행한다.
4. (개정일) 이 약관은 2007년 9월 5일부터 시행한다.
5. (개정일) 이 약관은 2009년 10월 30일부터 시행한다.
6. (개정일) 이 약관은 2011년 10월 10일부터 시행한다.
7. (개정일) 이 약관은 2012년 3월 1일부터 시행한다.
8. (개정일) 이 약관은 2012년 9월 4일 부터 시행한다.
9. (개정일) 이 약관은 2014년 3월 21일 부터 시행한다.
10. (개정일) 이 약관은 2014년 9월 16일 부터 시행한다.
11. (개정일) 이 약관은 2015년 2월 23일 부터 시행한다.</textarea></pre>
		<div id="clause_content_accept">
			<input type="radio" id="clause_accept1" value="accept" name="content_accept" checked>동의합니다. &nbsp&nbsp
			<input type="radio" value="no_accept" name="content_accept">동의하지 않습니다.
		</div>
	</div>
	<div id="clause_content1">
			<pre><textarea rows="10" cols="158" name="clause_content1">1. 개인정보 수집 및 이용목적

여행상품 예약, 여행자보험 가입, 항공권/호텔 등의 예약 및 출입국 정보확인, 예약내역의 확인 및 상담, 컨텐츠 제공, 여행서비스 이용 시 회원의 우대, 마일리지 적립 /조회 / 사용 및 이에 관한 안내, 회원카드 발급, 구매 및 요금결제, 물품배송 또는 청구서 등 발송, 분쟁조정을 위한 기록보존, 불만처리, 민원처리, 고지사항 전달 등

<h3>2. 개인정보 수집 항목 및 보유 및 이용기간
  가. 회사는 적법한 절차와 법적 기준에 의거하여 고객의 개인정보를 수집하고 있으며, 고객의 서비스이용에 필요한 최소한의 정보만을 수집하고 있습니다. 정보통신망법과 개인정보보호법에 의거하여 수집, 이용을 제한하고 있습니다.
  나. 회사는 고객의 인권을 침해할 우려가 있는 민감한 개인정보항목(인종, 종교, 사상, 정치적 성향, 건강상태, 성생활정보 등)은 수집하지 않습니다.</h3>
  3. 동의 거부권 및 거부 시 불이익 사항
개인정보 주체자는 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있습니다. 동의를 거부할 경우 여행상품 예약 서비스 이용이 불가함을 알려드립니다.
 			 </textarea></pre>
  			<div id="clause_content_accept1">
				<input type="radio" id="clause_accept2" value="accept" name="content_accept1" checked>동의합니다. &nbsp&nbsp
				<input type="radio" value="no_accept" name="content_accept1">동의하지 않습니다.
			</div>
  		</div>
  		<div id="clause_content2">
			<pre><textarea rows="10" cols="158" name="clause_content2">당사는 개인정보보호법을 준수하며 서비스 수행의 목적에 한하여 최소한의 고유식별정보를 수집,이용하며 기준은 아래와 같습니다.

1. 고유식별 정보 수집/이용 목적 : 해외여행 상품예약시 출국가능 여부파악 및 여행자 본인식별

2. 수집하는 고유식별 정보의 항목 : 여권번호 (여권만료일)

3. 고유식별정보의 보유 및 이용기간 : 여행상품 서비스 수행목적의 완료시점까지

*동의거부권

개인정보주체자는 고유식별정보(여권번호 등) 에 대한 수집동의를 거부할 권리가 있습니다.

동의를 거부할 경우 출국자 확인이 불가하여 예약서비스 수행이 불가함을 알려드립니다.
			</textarea></pre>
  			<div id="clause_content_accept2">
					<input type="radio" id="clause_accept3" value="accept" name="content_accept2" checked>동의합니다. &nbsp;&nbsp;
					<input type="radio" value="no_accept" name="content_accept2">동의하지 않습니다.
			</div>
		
		</div>
		
		<div id="reservation_member_info">
			<img src="../image/reserv_03.png">
			<div id="reservation_member_notice">
				<strong>▣ 예약자 정보</strong> <span style="color:rgb(241, 84, 155)">*</span>표시된 항목은 필수 입력사항입니다.
			</div>
		</div>
		
		<div id="member_info_div">
			<table width="900" cellpadding="0" cellspacing="0" border="0">
				<tbody>
					<tr>
						<td class="member_info_td">한글성명<span style="color:rgb(241, 84, 155)">＊</span></td>
						<td id="name_td" class="member_content_td"></td>
						<td class="member_info_td">법정생년월일<span style="color:rgb(241, 84, 155)">＊</span></td>
						<td id="birth_td" class="member_content_td"></td>
					</tr>
					<tr>
						<td class="member_info_td">이메일<span style="color:rgb(241, 84, 155)">＊</span></td>
						<td id="email_td" class="member_content_td"></td>
						<td class="member_info_td">연락처</td>
						<td class="member_content_td">없음</td>
					</tr>
					<tr>
						<td class="member_info1_td">주소</td>
						<td class="member_content1_td"></td>
						<td class="member_info1_td">하나투어클럽</td>
						<td class="member_content1_td"></td>
					</tr>
				</tbody>
			</table>
			<br>
			<strong style="font:13px Tahoma, Arial; color:black; font-weight:bold;">▣ 여행자 정보</strong>
			<span id="span1" style="font:10px;font-weight:normal;">&nbsp;&nbsp;&nbsp;&nbsp;총 인원:     </span>
			<span id="span2" style="font:10px;font-weight:normal;">&nbsp;&nbsp;&nbsp;&nbsp;예약가능 인원: </span>
			<label id="cancel_reservation">예약취소</label><label id="modify_pay">결제하기</label>
		</div>
		<div id="trip_member_info">
			<span style="background-color:grey; color:white; height:64px; width:120px; text-align:center;">
				<img src="../image/ico_peradd.png" style="height:40px;"><br>인원선택</span>
			
			<span style="left:130px; height:64px; border-right:1px dotted grey;width:223px;">
				<div>
				<img id="adult_minus" src="../image/btn_minus.png"> 성인
				<strong id="howManyAdult"></strong>명
				<img id="adult_plus" src="../image/btn_plus.png">
				<p style="margin-left:45px;">(만 12세 이상)</p>
				</div>
			</span>
			
			<span style="left:400px; height:64px; border-right:1px dotted grey;width:223px;">
				<div style="margin-top:15px;margin-left:35px;">
				<img id="teen_minus" src="../image/btn_minus.png"> 아동
				<strong id="howManyTeen"></strong>명
				<img id="teen_plus" src="../image/btn_plus.png">
				<p style="margin-left:10px;">(만 6세 이상)</p>
				</div>
			</span>	
			
			<span style="left:650px; height:64px;">
			<div style="margin-top:15px;margin-left:45px;">
				<img id="baby_minus" src="../image/btn_minus.png"> 유아
				<strong id="howManyBaby"></strong>명
				<img id="baby_plus" src="../image/btn_plus.png">
				<p style="margin-left:10px;">(만 6세 미만)</p>
			</div>
			</span>
			
		</div>
			
	
  		
		<div id="trip_member_table">
		
			<table id="member_table" width="907" cellpadding="0" cellspacing="0" border="0">
				<colgroup>
					<col style="width:53px;">
					<col style="width:70px;">
					<col style="width:145px;">
					<col style="width:152px;">
					<col style="width:70px;">
					<col style="width:198px;">
					<col style="width:193px;">
				</colgroup>
				<thead>
					<tr class="member_table_tr">
						<th>구분</th>
						<th>한글설명<strong style="color:rgb(241,84,155)">*</strong></th>
						<th>영문성명(성/이름)<strong style="color:rgb(241,84,155)">*</strong></th>
						<th>법정생년월일<strong style="color:rgb(241,84,155)">*</strong></th>
						<th>성별<strong style="color:rgb(241,84,155)">*</strong></th>
						<th>이메일</th>
						<th>연락처</th>
					</tr>
				</thead>
			</table>
		</div>
  
		<div id="check_value"></div>
		<div id="pay_select">
			<img src="../image/ico_alert.png">
			<p>●  수정하려면 <strong>수정하기</strong>를 선택하세요<br> 
			   ●  인원 삭제의 경우 예약한 인원을 전체 취소하고 다시 예약 진행해주시기 바랍니다.</p>
			<p id="button_area" style="width:205px;"><label id="do_edit">수정하기</label>
			<label id="cancel_edit">취소</label></p>
			
		</div>
		
	
		

		
</div><!-- content -->
</div> 

<!-- body -->
<div id="do_pay_check">
		신중히 선택하십시오.<br>
	지금 결제 버튼을 누르시면 수정 불가합니다.<br>
	
	<label id="modify_pay_complete">결제하기</label>
	<label id="modify_pay_cancel">취소하기</label>
</div>


<div id="cancel_reservation_check">
		<br>예약을 취소하시겠습니까?
	<label id="confirm_cancel_yes">예</label>
	<label id="confirm_cancel_no">아니오</label>
</div>

</form>	
</body>
</html>



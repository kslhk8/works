<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/packageTrip/productView.css" />
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	
	$('#productView_clause_detail').hide();
	
	
	$('#productView_clause_wrap').hide();
	$('#productView_safetyInform_wrap').hide();
	
	$('#productView_tripInform_li').css('background-color','rgb(232,85,129)');
	
	
	$('#right_menu').css("display","block");
	$('#body').css("height","4000px");
	
	$('#productView_body_subject > ul > li').hover(li_open,li_close);
	
	
	
/* 	
	<li id="productView_tripInform_li"> 
	<li >
	<li id="productView_clause_li">
	<li id="productView_safetyInform_li"> */
	
	$('#productView_clause_li').click(function(){
		$('#productView_clause_wrap').show();
		$('#productView_safetyInform_wrap').hide();
		
		$(this).prop('checked',true);
		
		
		$(this).css('background-color','rgb(232,85,129)');
		$('#productView_tripInform_li').css('background-color','rgb(74,80,93)');
		$('#productView_clause_li').css('background-color','rgb(74,80,93)');
		
		$('#productView_tripInform_li').prop('checked',false);
		$('#productView_safetyInform_li').prop('checked',false)
		$('#body').css('height','3000px');
		$('#product_view_background').css('height','3000px');
		$('#container_wrap').css('height','2520px');
	});
	
	$('#productView_safetyInform_li').click(function(){
		$('#productView_safetyInform_wrap').show();
		$('#productView_clause_wrap').hide();
		
		$(this).prop('checked',true);
		
		$(this).css('background-color','rgb(232,85,129)');
		$('#productView_tripInform_li').css('background-color','rgb(74,80,93)');
		$('#productView_clause_li').css('background-color','rgb(74,80,93)');
		
		$('#productView_tripInform_li').prop('checked',false);
		$('#productView_clause_li').prop('checked',false)
		
		$('#body').css('height','2450px');
		$('#product_view_background').css('height','2450px');
		$('#container_wrap').css('height','1970px');
	});
	
	
	
	var pay_boxOffset = $('#pay_box').offset();
	var productView_body_wrapOffset = $('#productView_body_wrap').offset();
	
	//오른쪽 가격 고정시키는거
	$(window).scroll(function(){
		//default
		if($(document).scrollTop()>pay_boxOffset.top){
			$('#pay_box').addClass('pay_box_fixed');
			$('#pay_box').css("top",$(document).scrollTop());
			$('#pay_box').removeClass('pay_box');
			
			if($(document).scrollTop()>3587){
				$('#pay_box').css("top",3587);
			}
		}
		else{
			$('#pay_box').removeClass('pay_box_fixed');
			$('#pay_box').addClass('pay_box');
			$('#pay_box').css("top",0);
		}
		
		if($(document).scrollTop()>productView_body_wrapOffset.top){
			$('#productView_body_subject').addClass('productView_body_subject_fixed');
			$('#productView_body_subject').css("top",$(document).scrollTop());
			$('#productView_body_subject').removeClass('productView_body_subject');
			
			if($(document).scrollTop()>3587){
				$('#productView_body_subject').css("top",3587);
			}
		}
		else{
			$('#productView_body_subject').removeClass('productView_body_subject_fixed');
			$('#productView_body_subject').addClass('productView_body_subject');
			$('#productView_body_subject').css("top",0);
	
		}

	 
		//해외안전정보
		if($('#productView_safetyInform_li').prop('checked')){
			if($(document).scrollTop()>pay_boxOffset.top){			
				$('#pay_box').addClass('pay_box_fixed');
				$('#pay_box').css("top",$(document).scrollTop());
				$('#pay_box').removeClass('pay_box');
				if($(document).scrollTop()>2050){
					$('#pay_box').css("top",2050);
				}
			}
			else{
				$('#pay_box').removeClass('pay_box_fixed');
				$('#pay_box').addClass('pay_box');
				$('#pay_box').css("top",0);

			}
			
			if($(document).scrollTop()>productView_body_wrapOffset.top){
				$('#productView_body_subject').addClass('productView_body_subject_fixed');
				$('#productView_body_subject').css("top",$(document).scrollTop());
				$('#productView_body_subject').removeClass('productView_body_subject');
	
				if($(document).scrollTop()>2050){
					$('#productView_body_subject').css("top",2050);
				}
			}
			else{
				$('#productView_body_subject').removeClass('productView_body_subject_fixed');
				$('#productView_body_subject').addClass('productView_body_subject');
				$('#productView_body_subject').css("top",0);

			}		
		}
		
		if($('#productView_clause_li').prop('checked')){
			if($(document).scrollTop()>pay_boxOffset.top){			
				$('#pay_box').addClass('pay_box_fixed');
				$('#pay_box').css("top",$(document).scrollTop());
				$('#pay_box').removeClass('pay_box');
				if($(document).scrollTop()>2050){
					$('#pay_box').css("top",2050);
				}
			}
			else{
				$('#pay_box').removeClass('pay_box_fixed');
				$('#pay_box').addClass('pay_box');
				$('#pay_box').css("top",0);

			}
			
			if($(document).scrollTop()>productView_body_wrapOffset.top){
				$('#productView_body_subject').addClass('productView_body_subject_fixed');
				$('#productView_body_subject').css("top",$(document).scrollTop());
				$('#productView_body_subject').removeClass('productView_body_subject');
	
				if($(document).scrollTop()>2050){
					$('#productView_body_subject').css("top",2050);
				}
			}
			else{
				$('#productView_body_subject').removeClass('productView_body_subject_fixed');
				$('#productView_body_subject').addClass('productView_body_subject');
				$('#productView_body_subject').css("top",0);

			}		
		}
		
		
		
		
		
		
		
		
	});
	
	
	//약관상세보기
	$('#productView_clause_detail_button').click(function(){
		$('#productView_clause_detail').show();
		$('#productView_clause_detail').css('z-index','100');
		$('#productView_body_content').css('opacity','0.2');
	});
	
	$('#productView_clause_detail_close').click(function(){
		$('#productView_clause_detail').hide();
		$('#productView_clause_detail').css('z-index','0');
		$('#productView_body_content').css('opacity','1');
	});
	
	
	
	
	
	
	

	//돈계산
	$('.productView_pay_box_choose').change(function() {
	   	var adult_price = $('#productView_adult_price').text();
	   	var teen_price = $('#productView_teen_price').text();
	   	var baby_price = $('#productView_baby_price').text();
	   	
	   	var numberofAdult = $('#productView_adult option:selected').val();
	   	var numberofTeen = $('#productView_teen option:selected').val();
	   	var numberofBaby = $('#productView_baby option:selected').val();
	   	
	   	$('#productView_total_price').text(adult_price*numberofAdult+teen_price*numberofTeen+baby_price*numberofBaby);
	});
	
	$('#start_question').hover(mouseenter, mouseleave);
	
});

function mouseenter(){
	$('.show_start_info').css("visibility","visible");
}

function mouseleave(){
	$('.show_start_info').css("visibility","hidden");
}



function li_open(){
	$(this).css('background-color','rgb(232,85,129)');
	
	if($(this).text()!='여행일정'){
		$('#productView_tripInform_li').css('background-color','rgb(74,80,93)');
	}
	
}

function li_close(){
	if(!$(this).prop('checked')){
	 	$(this).css('background-color','rgb(74,80,93)');
	}
}




$(window).bind("beforeunload",function(){
	$('#right_menu').css("display","none");
	$('#body').css("height","1350px");
});
</script>
<style>
	#productView_body_subject > ul > li{background-color:rgb(74,80,93); color:white; cursor:pointer; }
</style>
</head>
<body>
<div id="product_view_background">
	<%-- <div class="show_airplane_info">
		<div id="pop_title">
			<div id="title_name">항공 여정보기</div>
		</div>
		<div id="title_image"><a href="#"><img src="../image/close.gif"></a></div>
		<div id="pop_contents">
			<div id="contents1">
				<div class="tit"><img src="../image/departure.gif">
					<ul>
						<li>직항</li>
						<li>총 비행 시간:${airplaneDTO.totalTime }</li>
						<li>총 소요 시간:${airplaneDTO.totalTime }</li>
					</ul>
				</div>
				<div class="con"></div>
			</div>
			<div id="contents2">
				<div class="tit"></div>
				<div class="con"></div>
			</div>
		</div>	
	</div> --%>
	<div id="top_wrap">
		<div id="pdt_code_wrap">
			<div id="pdt_code">상품코드</div>
			<div id="pdt_code_num">${parentDTO.getPackage_code()}</div>
		</div>
		<div id="pdt_name_wrap">
			<div id="pdt_name">${sonDTO.getPackage_name()}</div>
		</div>	
		<div id="pdt_image_wrap">
			<div class="pdt_image">
				<img src="../image/${parentDTO.getImageName()}">
			</div>
			<div class="pdt_image">
				<img src="../image/${parentDTO.getImageName1()}">
			</div>
			<div class="pdt_image">
				<img src="../image/${parentDTO.getImageName2()}">
			</div>
		</div>
	</div>	
	<div id="container_wrap">
		<div id="inform_box">
			<div class="show_start_info">
				<ul>
					<li>최소 출발인원은 성인기준입니다.<br>
					당사는 최저행사인원이 충족되지 아니하여 여행계약을 해제하는 경우 여행개시 7일전까지 여행자에게 통지하여야 합니다.<br>
					당사가 여행참가자 수 미달로 전항의 기일내 통지를 하지 아니하고 계약을 해제하는 경우 이미 지급받은 계약금 환급 외에 다음 각 항목의 1의 금액을 여행자에게 배상하여야 합니다.<br>
					가. 여행개시 <b>7일전</b>(~7)까지 통지시 : <b>계약금 환급</b><br>
					나. 여행개시 <b>1일전</b>(6~1)까지 통지시 : 여행요금의 <b>30% 배상</b><br>
					다. 여행개시 <b>당일</b> 통지시 : 여행요금의 <b>50% 배상</b></li>
				</ul>
			</div>
			<div id="inform_airplane_wrap">
				<table class="airplane_table" width="780" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr class="airplane_tr">
							<th rowspan="2">일정</th>
							<td colspan="3" id="td_date_airline">
								<strong id="date_airline">${sonDTO.getNights()}박 ${sonDTO.getDay()}일 </strong>
								<img src="../image/${sonDTO.getImageName()}">
								<span>${sonDTO.getAirplane_name()}</span>
							</td>
						</tr>
						<tr>
							<td class="td_date_air_time" colspan="2">
								<ul>
									<li><span class="nation01">한국출발</span> <span class="apTime">  2018년  ${sonDTO.getDepart_apTime()}</span>
										<span class="air_code">  ${sonDTO.getDepart_code() }</span></li>
									<br>
									<li><span class="nation01">한국도착</span><span class="apTime">  2018년  ${sonDTO.getArrive_apTime()}</span>
									<span class="air_code">  ${sonDTO.getArrive_code()}</span></li>
								</ul>
							</td>
							<td class="td_airInform">
								<a id="show_airInform" href="javascript:">
									<img src="../image/air_inform.PNG">
									<br><br>
									<label>항공 여정보기</label>
								</a>
							</td>
						</tr>					
						<tr>
							<th id="th_city">방문도시</th>
							<td colspan="3" class="td_date_city">
								<span>${parentDTO.getDepart_city()}/${parentDTO.getArrive_city()}(${sonDTO.getNights()}박)/${parentDTO.getDepart_city()}</span>
							</td>
						</tr>
						<tr>
							<th id="th_reservation">예약현황</th>
							<td colspan="3" class="td_date_reservation">
								<span>예약:${sonDTO.getReservation_member()}명/좌석:${sonDTO.getTotal_member()}석 (최소출발: 성인${minimum_guest}명) <a id="start_question"><img src="../image/question.png"></a></span> 
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		
		<div id="pay_box" class="pay_box">
			<div id="pay_box_menu">
				<select>
					<option>프로모션&특전</option>
					<option>1일차</option>
					<option>2일차</option>
					<option>호텔정보</option>
					<option>여행전 체크사항</option>
					<option>해외안전정보</option>
				</select>
			</div>
			<div id="pay_box_table_wrap" style="position:absolute; top:50px; height:100px; width:270px; overflow-y:scroll; table-layout:fixed;">
				<table>
					<tr>
						<td style="width:100px; padding:10px; color:black;">성인<br>(만12세 이상)</td>
						<td style="width:170px; color:black;"><b id="productView_adult_price" style="font-size:17pt; padding:5px 0; display:inline-block;">${sonDTO.adult_price }</b>원
						<br>(유류할증료 <span class="productView_fuel_fee">${sonDTO.fuel_fee }</span>원 포함)</td>
					</tr>
					<tr>
						<td style="padding:10px; color:black;">아동<br>(만12세 미만)</td>
						<td style="color:black;"><b id="productView_teen_price" style="font-size:17pt; padding:5px 0; display:inline-block;">${sonDTO.teen_price }</b>원<br>(유류할증료 <span class="productView_fuel_fee">${sonDTO.fuel_fee }</span>원 포함)</td>
					</tr>
					<tr>
						<td style="padding:10px; color:black;">유아<br>(만2세 미만)</td>
						<td style="color:black;"><b id="productView_baby_price" style="font-size:17pt; padding:5px 0; display:inline-block;">${sonDTO.baby_price }</b>원</td>
					</tr>
				</table>
			</div>
			<div id="pay_box_numberofMember_wrap" style="position:absolute; left:1px; top:150px; background-color:rgb(242,242,242); width:249px; height:50px; padding:10px 10px;">
				<div style="display:inline-block; width:80px;">
					<h5 style="padding-left:15px; padding-bottom:5px;">성인</h5>
					<select class="productView_pay_box_choose" id="productView_adult" style="width:70px; height:30px;">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
				</div>
				<div style="display:inline-block; width:80px;">
					<h5 style="padding-left:15px; padding-bottom:5px;">아동</h5>
					<select class="productView_pay_box_choose" id="productView_teen" style="width:70px; height:30px;">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
				</div>
				<div style="display:inline-block; width:80px;">
					<h5 style="padding-left:15px; padding-bottom:5px;">유아</h5>
					<select class="productView_pay_box_choose" id="productView_baby" style="width:70px; height:30px;">
						<option value="0" selected>0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
				</div>
			</div>
			<div style="position:absolute; top:220px; width:100%; height:200px;">
				<h1 style="padding:10px; font-size:11pt;">총 예정 금액</h1>
				<div style="text-align:right; padding:10px; width:250px; border-bottom:1px dashed grey;">
					<h1 id="productView_total_price"style="color:rgb(232,85,129); font-size:25pt; display:inline-block; padding:10px 0;">${sonDTO.adult_price }</h1><span style="color:rgb(232,85,129); font-size:11pt; margin-right:10px;">원</span>
					<br>유류할증료&제세공과금 포함<br>
					※유류할증료 및 제세공과금은 유가와 환율에<br> 따라 변동될 수 있습니다.<br>
					<br>※ 1인 객실 사용시 추가요금 발생
				</div>	
			</div>
			<div style="position:absolute; top:420px; width:260px;">
				<input type="button" value="예약하기>" style="display:block; width:200px; height:40px; margin:15px 30px; font-size:15pt; font-weight:bolder; background-color:rgb(232,85,129); color:white; border:none; cursor:pointer;">
				<input type="button" value="장바구니" style="display:block; width:200px; height:40px; margin:15px 30px; font-size:15pt; font-weight:bolder; color:rgb(232,85,129); border:1.5px solid rgb(232,85,129); background-color:white; cursor:pointer;">
			</div>
		</div>
		
		<div style="position:relative; top:280px; border:1px solid grey; height:605px; width:780px;">
			<div style="position:absolute; background-color:rgb(242,242,242); height:45px; width:100%;">
				<img src="../image/exclamation_mark.png" style="display:inline-block; margin-left:30px; position:absolute; top:10px; "><h1 style="font-size:13pt; padding:15px 60px; display:inline-block; font-weight:bold;">예약시 유의사항</h1>
			</div>
			<div style="position:absolute; top:45px; padding:10px;">
				※ 본 상품은 항공 및 호텔이 실시간 변동되므로 담당자에게 확정여부를 반드시 재확인 부탁드립니다.<br>
				예약 직후 OK상태라도 확정이 불가할 수 있으니 예약 후 담당자를 통해 꼭 출발 가능여부를 확인부탁드립니다. <br><br>
				
				▶ 여권이 훼손되거나 여권유효기간이 6개월 미만시에는 비행기 탑승 및 말레이시아 입국이 불가능합니다.<br>
				▶ 외국국적 고객의 경우 담당자에게 반드시 비자관련 문의바랍니다.(비자발급이 필요한 주요국적: 중국,인도)<br>
				▶ 예약 시 여권상의 정확한 영문 이름으로 예약하셔야 합니다.<br>
				▶ 성인 1명과 한 방을 사용하는 아동 1명은 성인 요금과 동일한 요금이 적용됩니다.<br>
				▶ 최종 계약 시 반드시 해당 여행사에서 해외 여행 계약서를 작성하시기 바랍니다. <br>
				▶ 상기 일정은 현지사정(교통,기상변화)에 따라 달라질 수 있으며, 부득이한 경우 다음 일정을 위하여 축소 변경될 수 있습니다.<br><br>
				
				[호텔 관련 안내사항]<br>
				▶ 호텔은 부득이한 경우 동급의 다른 호텔로 변동 가능성이 있습니다.<br>
				▶ 호텔 체크인시에 현금 또는 카드로 호텔에 예치금을 낼 수 있으며 체크아웃시에 예치금을 돌려드립니다.<br>
				▶ 객실의 더블베드/트윈베드, 커넥팅룸, 엑스트라 베드 요청은 체크인 당일 호텔사정에 따라 결정되므로 사전확정이 불가합니다.<br><br>
				
				[항공 관련 안내사항]<br>
				▶ 항공기 좌석은 해당 항공사의 탑승 수속 창구에서 이루어지므로 사전 배정이 불가능합니다. 늦게 오실 경우 일행과의 좌석이 분리될 수 있습니다.<br>
				▶ 위탁수화물 : 1인 1개 15KG (골프 클럽 등의 기타 수화물은 추가비용 발생)<br>
				▶ 기내식/LCD/음악/담요 등은 제공되지 않습니다. 생수만 무료로 제공되며, 음료 및 맥주 등은 유료로 기내에서 구매 가능합니다.<br>
				▶ 유료 기내식은 출발일 5일 전까지 항공사의 서비스 센터를 통해 구매 가능합니다.<br>
				▶ 32주 이상의 임산부는 의사소견서가 필요합니다. 항공사별 홈페이지 또는 고객센터로 상세 필요서류를 확인하셔야 합니다.<br>
				▶ 단태 임신 37주 이상, 다태 임신 33주 이상의 경우 항공기 탑승이 제한됩니다.<br>
				<img src="../image/행사관련고객안내사항.png" style="margin-top:5px;">
			</div>
		</div>
	
		
		<div id="productView_body_wrap" style="position:relative; top:300px; width:780px;">
			<div id="productView_body_subject" class="productView_body_subject" style="height:60px;">
				<ul>
					<li id="productView_tripInform_li" style="display:inline-block; width:193px; list-style:none; text-align:center; padding:20px 0;"><h3 style="font-size:12pt; font-weight:bold;">여행일정</h3></li>
					<li style="display:inline-block; width:193px; list-style:none; text-align:center; padding:20px 0;"><h3 style="font-size:12pt; font-weight:bold;">호텔정보</h3></li>
					<li id="productView_clause_li" style="display:inline-block; width:193px; list-style:none; text-align:center; padding:20px 0;"><h3 style="font-size:12pt; font-weight:bold;">약관 및 참고사항</h3></li>
					<li id="productView_safetyInform_li" style="display:inline-block; width:193px; list-style:none; text-align:center; padding:20px 0;"><h3 style="font-size:12pt; font-weight:bold;">해외 안전정보</h3></li>
				</ul>
			</div>
			<div id="productView_body_content" style="position:absolute; top:80px; width:780px;">
	
				
				<!-- 약관 및 참고사항 -->
				<div id="productView_clause_wrap" style="position:relative; height:600px;">
					<!-- 약관 -->
					<div id="productView_clause" style="position:absolute; color:black; padding:20px; border:1px solid grey;">
						<h2 style="font-size:13pt;">약관</h2><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">상품약관</h2>
						<input type="button" id="productView_clause_detail_button" value="약관 상세보기 >" style="position:absolute; padding:3px 7px; margin-left:5px; border:0.5px solid grey; background-color:white; top:70px;">
						<br>
						<b style="display:inline-block; font-size:9pt; margin-top:8px;">본 상품의 예약과 취소는 <span>국외여행 표준약관</span>이 적용됨을 알려드립니다.</b>
						<br><br>
						
						<img src="../image/pink_circle.png" style="clear:both; display:inline-block;"><b style="display:inline-block; font-size:9pt; margin-top:8px;">계약금 규정</b>
						<br>
						<span>본 상품은 출발일이 임박한 상품이오니 결제관련은 예약 후 판매대리점의 안내를 받으시기 바랍니다</span><br>
						위 계약금은 호텔, 항공, 현지 사정 등에 의하여 변경될 수 있으며, 상황에 따라 고객님의 결제시한은 당겨질 수 있습니다.<br>
						단, 아래 명시되어 있는 취소료 규정 적용기간에 예약하신 고객님께서는 계약금보다 취소 수수료가 높을 시 취소 수수료 금액을 계약금으로 납부하셔야 합니다.
						<br><br>
						
						<img src="../image/pink_circle.png" style="clear:both; display:display-block;"><b style="display:inline-block; font-size:9pt; margin-top:8px;">취소료 규정</b>
						<br>
						여행 취소시 국외여행표준약관 제 15조 소비자분쟁해결규정에 따라 아래의 비율로 취소료가 부과됩니다. (단, 당사의 귀책사유로 여행출발 취소 경우에도 동일한 규정이 적용됩니다.)<br><br>
						- 여행개시 <span>30일전</span>(~30)까지 통보시(2017년11월01일 이전): 계약금환급<br>
						- 여행개시 <span>20일전</span>(29~20)까지 통보시(2017년11월02일~2017년11월11일): 총상품가격의 10% 배상<br>
						- 여행개시 <span>10일전</span>(19~10)까지 통보시(2017년11월12일~2017년11월21일): 총상품가격의 15% 배상<br>
						- 여행개시 <span>8일전</span>(9~8)까지 통보시(2017년11월22일~2017년11월23일): 총상품가격의 20% 배상<br>
						- 여행개시 <span>1일전</span>(7~1)까지 통보시(2017년11월24일~2017년11월30일): 총상품가격의 30% 배상
						- 여행 <span>당일</span> 통보시: 총상품가격의 50% 배상
						<br><br><br>
						
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">최저출발인원 미 충족 시 계약해제</h2>
						<br>
						- 당사는 최저행사인원이 충족되지 아니하여 여행계약을 해제하는 경우 여행개시 7일전까지 여행자에게 통지하여야 합니다.<br>
						- 당사가 여행참가자 수 미달로 전항의 기일내 통지를 하지 아니하고 계약을 해제하는 경우 이미 지급받은 계약금 환급 외에 다음 각 항목의 1의 금액을 여행자에게 배상하여야 합니다.
						<div style="position:relative; top:20px; background-color:rgb(248,248,248); border:1px solid grey; padding:10px; margin-bottom:50px;">
							가. 여행개시 7일전(~7)까지 통지시 : 계약금 환급<br>
							나. 여행개시 1일전(6~1)까지 통지시 : 여행요금의 30% 배상<br>
							다. 여행개시 당일 통지시 : 여행요금의 50% 배상
						</div>
					</div>
					
					
					<!-- 유의사항 -->
					<div id="productView_Note" style="position:absolute; top:650px; color:black; padding:20px; border:1px solid grey;">
						<h2 style="font-size:13pt;">유의사항</h2><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">여권/비자</h2>
						<br>
						<span>${clauseDTO.passport_visa }</span>
						<br><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">외국/이중국적 주의사항</h2>
						<br>
						외국/이중국적자의 해외여행은 도착지국가(경유국가 포함)의 출입국정책이 상이하므로, 반드시 여행자본인이 해당국의 대사관에 확인하셔야 합니다.
						<br><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">항공사 관련 서비스</h2>
						<br>
						항공사 마일리지적립 가능/불가능 여부는 해당 항공의 룰에 따라 달라지므로 예약하신 상품의 항공사로 확인하여 주시기 바랍니다.
						<br><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">공항이용</h2>
						<br>
						- 항공기 이용시 용기당 100ml 초과 액체류 (화장품, 치약류, 젤 등) 물품 기내 반입 제한됩니다. (단, 탁송수하물은 제한 없음)<br>
						- 수하물 탁송 시 각 항공사 규정에 따라 보상불가한 경우가 있으므로, 귀중품은 반드시 휴대하셔야 합니다.<br>
						- 항공기 좌석 배정은 항공사의 고유권한으로 공항에서 선착순 배정됨에 따라 일행과 좌석이 분리될 수도 있으며, 대리수속은 불가합니다.
						<br><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">동/축산물 검역안내</h2>
						<br>
						- 대부분의 축산물(소세지, 육포 등) 및 생과실·열매채소 등은 휴대반입할 수 없으며, 휴대반입이 가능한 축산물과 식물류도 신고 및 검역을 받아야하며, 불법 반입시 500만원 이하의 과태료가 부과됩니다.<br>
						- 해외 축산농장, 가축시장을 방문한 여행객과 가축전염병 발생 국가를 방문한 축산관계자는 농림축산검역본부에 신고하여 소독을 받아야 합니다.
						<div style="position:relative; top:20px; background-color:rgb(248,248,248); border:1px solid grey; padding:10px;">
							문의 : 농림축산검역본부 인천공항지역본부(동축산물 032-740-2660, 식물 032-740-2077)
						</div>
						<br><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">안전사고</h2>
						<br>
						여행일정 중 발생할 수 있는 모든 안전사고에 유의하시기 바라며, 가이드의 안내사항 및 안전수칙 준수하기 바라며,여행자 본인의 과실로 인한 안전사고는 본인이 책임을 지게 됩니다.
					</div>
					
					<!-- 비상연락방법 -->
					<div id="productView_emergencyContact" style="position:absolute; top:1270px; color:black; width:740px; padding:20px;border:1px solid grey;">
						<h2 style="font-size:13pt;">비상연락방법</h2><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">첫 만남시 긴급 상황 발생한 경우</h2>
						<br>
						하나투어 공항지점 ☎ 032-743-7500
						<br><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">현지 긴급연락처</h2>
						<br>
						<span>${clauseDTO.emergency_contact }</span>
						<br><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">여행불편 상담</h2>
						<br>
						하나투어 콜센터 ☎ 1577-1233(9번)
					</div>
				</div>
				
				<!-- 해외안전정보 -->
				<div id="productView_safetyInform_wrap" style="position:relative; height:600px;">
					
					<!-- 여행금지국현황 -->
					<div id="productView_travel_prohibitted_country" style="position:absolute; color:black; padding:20px; border:1px solid grey;">
						<h2 style="font-size:13pt;">여행 금지국 현황</h2><br><br>	
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">여행 금지국</h2>
						<br>
						- 이라크(2007년 8월 7일 ~ 2018년 1월 31일까지)<br>
						- 소말리아-아프가니스탄(2007년 8월 7일 ~ 2018년 1월 31일까지)<br>
						- 예멘(2011년 6월 28일 ~ 2018년 1월 31일까지)<br>
						- 시리아(2011년 8월 20일 ~ 2018년 1월 31일까지)<br>
						- 리비아(2014년 8월 4일 ~ 2018년 1월 31일까지)<br>
						- 필리핀 일부지역: 잠보앙가, 술루 군도, 바실란, 타위타위 군도(2015년 12월 1일 ~ 2018년 1월 31일까지)
						<br><br><br>
						<img src="../image/pink_greater.png" style="display:inline-block;"><h2 style="font-size:11pt; padding:0 5px; display:inline-block;">여행 금지국 방문시</h2>
						<br>
						<img src="../image/pink_circle.png" style="clear:both; display:inline-block;"><b style="display:inline-block; font-size:9pt; margin-top:8px;">여권법 제 26조</b>
						<br>
						방문 및 체류가 금지된 국가나 지역으로 고시된 사정을 알면서도 같은 조 제1항 단서에 따른 허가(제14조 제3항에 따라 준용되는 경우를 포함한다)를 받지 아니하고 해당국각나 지역에서 여권 등을 사용하거나 해당국가나 지역을 방문하거나 체류한 사람은 1년 이하의 징역 또는 1000만원 이하의 벌금에 처한다.
					</div>
				
					<!-- 현지연락처 -->
					<div id="productView_contact" style="position:absolute; color:black; padding:20px; top:350px; width:740px; border:1px solid grey;">
						<h2 style="font-size:13pt;">현지연락처</h2><br><br>	
						외교부<a href="www.0404.go.kr">(www.0404.go.kr)</a>에 공지된 여행상품에 포함된 국가의 현지연락처 입니다.
						<br><br>
						<div style="border:1px solid grey;  background-color:rgb(248,248,248); padding:15px; ">
							<b>[긴급연락처]</b><br>
								<pre>${safetyInformDTO.local_contact }</pre>
							<br><br>
							<b>[의료기관연락처]</b><br>
							<pre>${safetyInformDTO.local_contact_hospital }</pre>
						</div>
						<br><br><br>
						<b>대사관 연락처</b><br>
						ㅇ 주소:&emsp;${safetyInformDTO.embassy_address}<br><br>
						ㅇ 홈페이지:&emsp;${safetyInformDTO.embassy_address}<br><br>
						ㅇ 대표 이메일:&emsp;${safetyInformDTO.embassy_email}<br><br>
						ㅇ 대표 전화:&emsp;${safetyInformDTO.embassy_contact}<br><br>
						ㅇ 긴급연락처:&emsp;${safetyInformDTO.embassy_emergency_contact}<br><br>
						ㅇ 팩스:&emsp;${safetyInformDTO.embassy_fax}<br><br>
						ㅇ 근무시간:&emsp;${safetyInformDTO.embassy_open_hours}<br><br>				
					</div>			
				</div>
				
				
				
				
				
			</div><!-- productView_body_content -->
		
		
		
		
		
		
		
		
		
		
		</div><!-- productView_body_wrap -->
	</div><!-- container_wrap -->




</div>


<div id="productView_clause_detail" style="width:750px; height:500px; position:absolute; left:50px; top:1750px; background-color:white; border:1px solid grey;">
	<div style=" padding:20px 40px; height:20px; background-color:rgb(74,80,93); color:white;">
		<h1 style="display:inline-block;">국외여행 표준약관</h1>
		<img id="productView_clause_detail_close" src="../image/detail_close.png"  style="display:inline-block; float:right; cursor:pointer;">
	</div>
	<div style="padding:40px; height:350px; overflow-y:scroll;">
		<b>제1조 (목적)</b><br>
		이 약관은 (주)하나투어(이하 당사라한다.)와 여행자가 체결한 국외여행계약의 세부 이행 및 준수사항을 정함을 목적으로 합니다.
		<br><br>
		<b>제2조 (당사와 여행자 의무)</b><br>
		① 당사는 여행자에게 안전하고 만족스러운 여행서비스를 제공하기 위하여 여행알선 및 안내,운송,숙박 등 여행계획의 수립 및 실행과정에서 맡은 바 임무를 충실히 수행하여야 합니다.<br>
		② 여행자는 안전하고 즐거운 여행을 위하여 여행자간 화합도모 및 여행사의 여행질서 유지에 적극 협조하여야 합니다.<br>
		<br><br>
		<b>제3조(용어의 정의)</b><br>
		여행의 종류 및 정의, 해외여행수속대행업의 정의는 다음과 같습니다.<br>
		1. 기획여행 : 당사가 미리 여행목적지 및 관광일정, 여행자에게 제공될 운송 및 숙식서비스 내용(이하 '여행서비스'라 함), 여행요금을 정하여 광고 또는 기타 방법으로 여행자를 모집하여 실시하는 여행.<br>
		2. 희망여행 : 여행자(개인 또는 단체)가 희망하는 여행조건에 따라 당사가 운송,숙식,관광 등 여행에 관한 전반적인 계획을 수립하여 실시하는 여행.<br>
		3. 해외여행 수속대행(이하 수속대형계약이라 함) : 당사가 여행자로부터 소정의 수속대행요금을 받기로 약정하고, 여행자의 위탁에 따라 다음에 열거하는 업무(이하 수속 대행업무라함)를 대행하는 것.<br>
		&emsp;1) 사증, 재입국 허가 및 각종 증명서 취득에 관한 수속<br>
		&emsp;2) 출입국 수속서류 작성 및 기타 관련업무 <br>
		<br><br>
		<b>제4조(계약의 구성)</b><br>
		① 여행계약은 여행계약서(붙임)와 여행약관,여행일정표(또는 여행 설명서)를 계약내용으로 합니다.<br>
		② 여행일정표(또는 여행설명서)에는 여행일자별 여행지와 관광내용,교통수단,쇼핑횟수,숙박장소,식사 등 여행실시일정 및 여행사 제공 서비스 내용과 여행자 유의사항이 포함되어야 합니다.<br>
		<br><br>
		<b>제5조(특약)</b><br>
		당사와 여행자는 관계법규에 위반되지 않는 범위내에서 서면으로 특약을 맺을 수 있습니다. 이 경우 표준약관과 다름을 당사는 여행자에게 설명해야 합니다.<br>
		<br><br>
		<b>제6조(안전정보 제공 및 계약서 등 교부)</b><br>
		당사는 여행자와 여행계약을 체결할 때 여행약관과 외교부 해외안전여행 홈페이지(www.0404.go.kr)에 게재된 여행지 안전정보를 제공하여야 하며, 여행계약을 체결한 경우 계약서와 여행일정표(또는 여행설명서)를 각 1부씩 여행자에게 교부하여야 합니다.
		<br><br>
		<b>제7조(계약서 및 약관 등 교부 간주)</b><br>
		당사와 여행자는 다음 각 호의 경우 여행계약서와 여행약관 및 여행일정표(또는 여행설명서)가 교부된 것으로 간주합니다. <br>
		1. 여행자가 인터넷 등 전자정보망으로 제공된 여행계약서, 약관 및 여행일정표(또는 여행설명서)의 내용에 동의하고 여행계약의 체결을 신청한데 대해 당사가 전자정보망 내지 기계적 장치 등을 이용하여 여행자에게 승낙의 의사를 통지한 경우<br>
		2. 당사가 팩시밀리 등 기계적 장치를 이용하여 제공한 여행계약서, 약관 및 여행일정표(또는 여행설명서)의 내용에 대하여 여행자가 동의하고 여행계약의 체결을 신청하는 서면을 송부한데 대해 당사자가 전자정보망 내지 기계적 장치 등을 이용하여 여행자에게 승낙의 의사를 통지한 경우 
		<br><br>
		<b>제8조(당사의 책임)</b><br>
		당사는 여행 출발 시부터 도착 시까지 당사 본인 또는 그 고용인, 현지여행업자 또는 그 고용인 등(이하 '사용인'이라 함)이 제2조 제1항에서 규정한 당사 임무와 관련하여 여행자에게 고의 또는 과실로 손해를 가한 경우 책임을 집니다.
		<br><br>
		<b>제9조(최저행사인원 미 충족시 계약해제)</b><br>
		① 당사는 최저행사인원이 충족되지 아니하여 여행계약을 해제하는 경우 여행출발 7일전까지 여행자에게 통지하여야 합니다.
		② 당사가 여행참가자 수 미달로 전항의 기일내 통지를 하지 아니하고 계약을 해제하는 경우 이미 지급받은 계약금 환급 외에 다음 각 목의 1의 금액을 여행자에게 배상하여야 합니다.
		&emsp;가. 여행출발 1일전까지 통지시 : 여행요금의 30% 
		&emsp;나. 여행출발 당일 통지시 : 여행요금의 50%
		&emsp;&nbsp;(※여행요금이란 일정표상 명시된 총 상품가격을 의미한다.)
		<br><br>
		<b>제10조(계약체결 거절)</b><br>
		당사는 여행자에게 다음 각 호의 1에 해당하는 사유가 있을 경우에는 여행자와의 계약체결을 거절할 수 있습니다. <br>
		&emsp;1. 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 지장이 있다고 인정될 때 <br>
		&emsp;2. 질병 기타 사유로 여행이 어렵다고 인정될 때<br>
		&emsp;3. 명시한 최대행사인원이 초과되었을 때<br>
		&emsp;4. 일정표에 최저행사인원이 미달되었을 때
		<br><br>
		<b>제11조(여행요금)</b><br>
		① 여행계약서의 여행요금에는 다음 각 호가 포함됩니다. 단, 다음의 1~9호는 여행자 본인이 직접 여행지에서 지불하여야 할 금액이나 당사가 여행자 편의를 위하여 수탁받아 이를 대신 지불합니다.<br>
		&emsp;1. 항공기, 선박, 철도 등 이용운송기관의 운임(보통운임기준)<br>
		&emsp;2. 공항, 역, 부두와 호텔사이 등 송영버스요금<br>
		&emsp;3. 숙박요금 및 식사요금<br>
		&emsp;4. 안내자경비<br>
		&emsp;5. 여행 중 필요한 각종세금<br>
		&emsp;6. 국내외 공항, 항만세<br>
		&emsp;7. 관광진흥개발기금<br>
		&emsp;8. 일정표내 관광지 입장료<br>
		&emsp;9. 기타 개별계약에 따른 비용<br>
		&emsp;10. 여행 알선 수수료 <br>
		② 여행자는 계약체결시 계약금(여행요금 중 계약금으로 별도 고지된 금액)을 당사에게 지급하여야 하며, 계약금은 여행요금 또는 손해배상액의 전부 또는 일부로 취급합니다.<br>
		③ 여행자는 제1항의 여행요금 중 계약금을 제외한 잔금을 여행출발 7일전까지 당사에게 지급하여야 합니다.<br>
		④ 여행자는 제1항의 여행요금을 당사자가 약정한 바에 따라 카드, 계좌이체 또는 무통장입금 등의 방법으로 지급하여야 합니다.<br>
		⑤ 희망여행요금에 여행자 보험료가 포함되는 경우 당사는 보험회사명, 보상내용 등을 여행자에게 설명하여야 합니다.<br>
		<br><br>
		<b>제12조(여행요금의 변경)</b><br>
		① 국외여행을 실시함에 있어서 이용운송,숙박기관에 지급하여야 할 요금이 계약체결시보다 5% 이상 증감하거나 여행 요금에 적용된 외화환율이 계약체결시보다 2% 이상 증감한 경우 당사 또는 여행자는 그 증감된 금액 범위 내에서 여행요금의 증감을 상대방에게 청구할 수 있습니다.<br>
		② 당사는 제1항의 규정에 따라 여행요금을 증액하였을 때에는 여행개시 15일전에 여행자에게 통지하여야 합니다.
		<br><br>
		<b>제13조(여행조건의 변경요건 및 요금 등의 정산)</b><br>
		① 위 제1조 내지 제12조의 여행조건은 다음 각 호의 1의 경우에 한하여 변경될 수 있습니다.<br>
		1. 여행자의 안전과 보호를 위하여 여행자의 요청 또는 현지사정에 의하여 부득이하다고 쌍방이 합의한 경우<br>
		2. 천재지변, 전란, 정부의 명령, 운송,숙박기관 등의 파업,휴업 등으로 여행의 목적을 달성할 수 없는 경우<br>
		② 제1항의 여행조건 변경 및 제12조의 여행요금 변경으로 인하여 제11조제1항의 여행요금에 증감이 생기는 경우에는 여행출발 전 변경 분은 여행출발 이전에, 여행 중 변경 분은 여행종료 후 10일 이내에 각각 정산(환급)하여야 합니다. <br>
		③ 제1항의 규정에 의하지 아니하고 여행조건이 변경되거나 제15조 또는 제16조의 규정에 의한 계약의 해제,해지로 인하여 손해배상액이 발생한 경우에는 여행출발 전 발생 분은 여행출발이전에, 여행 중 발생 분은 여행종료 후 10일 이내에 각각 정산(환급)하여야 합니다. <br>
		④ 여행자는 여행출발 후 자기의 사정으로 숙박, 식사, 관광 등 여행요금에 포함된 서비스를 제공받지 못한 경우 당사에게 그에 상응하는 요금의 환급을 청구할 수 없습니다. 단, 여행이 중도에 종료된 경우에는 제14조에 준하여 처리합니다. <br>
		<br><br>
		<b>제14조(손해배상)</b><br>
		① 당사는 현지여행업자 등의 고의 또는 과실로 여행자에게 손해를 가한 경우 당사는 여행자에게 손해를 배상하여야 합니다.
		② 당사의 귀책사유로 여행자의 국외여행에 필요한 여권, 사증, 재입국 허가 또는 각종 증명서 등을 취득하지 못하여 여행자의 여행일정에 차질이 생긴 경우 당사는 여행자로부터 절차대행을 위하여 받은 금액 전부 및 그 금액의 100% 상당액을 여행자에게 배상하여야 합니다.<br>
		③ 당사는 항공기, 기차, 선박 등 교통기관의 연발착 또는 교통체증 등으로 인하여 여행자가 입은 손해를 배상하여야 합니다. 단, 당사가 고의 또는 과실이 없음을 입증한 때에는 그러하지 아니합니다.<br>
		④ 당사는 자기나 그 사용인이 여행자의 수하물 수령, 인도, 보관 등에 관하여 주의를 해태(懈怠)하지 아니하였음을 증명하지 아니하면 여행자의 수하물 멸실, 훼손 또는 연착으로 인한 손해를 배상할 책임을 면하지 못합니다.
		<br><br>
		<b>제15조(여행출발 전 계약해제)</b><br>
		① 당사 또는 여행자는 여행출발전 이 여행계약을 해제할 수 있습니다. 이 경우 발생하는 손해액은 '소비자분쟁해결기준'(공정거래위원회 고시)에 따라 배상합니다. <br>
		&emsp;1. 여행자의 여행계약 해제 요청이 있는 경우(여행자의 취소요청시) <br>
		&emsp;&emsp;- 여행 개시 30일전까지(~30) 통보시 : 계약금 환급<br>
		&emsp;&emsp; - 여행 개시 20일전까지(29~20) 통보시 : 여행요금의 10% 배상<br>
		&emsp;&emsp;- 여행 개시 10일전까지(19~10) 통보시 : 여행요금의 15% 배상<br>
		&emsp;&emsp;- 여행 개시 8일 전까지(9~8) 통보시 : 여행요금의 20% 배상<br>
		&emsp;&emsp;- 여행 개시 1일 전까지(7~1) 통보시 : 여행요금의 30% 배상<br>
		&emsp;&emsp;- 여행 당일 통보시 : 여행요금의 50% 배상<br>
		&emsp;2. 당사의 귀책사유로 취소 통보하는 경우<br>
		&emsp;&emsp; - 여행 개시 30일전까지(~30) 통보시 : 계약금 환급<br>
		&emsp;&emsp;- 여행 개시 20일전까지(29~20) 통보시 : 여행요금의 10% 배상<br>
		&emsp;&emsp;- 여행 개시 10일전까지(19~10) 통보시 : 여행요금의 15% 배상<br>
		&emsp;&emsp;- 여행 개시 8일 전까지(9~8) 통보시 : 여행요금의 20% 배상<br>
		&emsp;&emsp;- 여행 개시 1일 전까지(7~1) 통보시 : 여행요금의 30% 배상<br>
		&emsp;&emsp;- 여행 당일 통보시 : 여행요금의 50% 배상<br>
		&emsp;단, 최저행사인원이 충족되지 않아 불가피하게 기획여행을 실시할 수 없는 경우에는 제9조(최저행사인원 미충족시 계약해제)의 조항에 의거하여 당사가 여행자에게 배상한다.<br>
		&emsp;&nbsp;(※여행요금이란 일정표상 명시된 총 상품가격을 의미한다.)<br>
		② 당사 또는 여행자는 여행출발 전에 다음 각 호의 1에 해당하는 사유가 있는 경우 상대방에게 제1항의 손해배상액을 지급하지 아니하고 이 여행계약을 해제할 수 있습니다.<br>
		&emsp;1. 당사가 해제할 수 있는 경우<br>
		&emsp;&nbsp;가. 제13조제1항제1호 및 제2호사유의 경우<br>
		&emsp;&nbsp;나. 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 현저한 지장이 있다고 인정될 때<br>
		&emsp;&nbsp;다. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우<br>
		&emsp;&nbsp; 라. 여행자가 계약서에 기재된 기일까지 여행요금을 납입하지 아니한 경우<br>
		&emsp;2. 여행자가 해제할 수 있는 경우<br>
		&emsp;&nbsp; 가. 제13조제1항제1호 및 제2호의 사유가 있는 경우<br>
		&emsp;&nbsp;나. 여행자의 3촌 이내 친족이 사망한 경우 단, 여행자는 아래와 같은 입증서류를 당사에 제출하여야 한다.<br>
		&emsp;&emsp;1) 친족을 확인할 수 있는 서류(가족관계증명서 등)<br>
		&emsp;&emsp;2) 진단서 또는 사체검안서(사망진단서)<br>
		&emsp;&emsp;3) 그밖에 필요한 자료<br>
		&emsp;&nbsp;다. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우 단, 여행자는 아래와 같은 입증서류를 당사에 제출하여야 한다.<br>
		&emsp;&emsp;1) 진단서<br>
		&emsp;&emsp;2) 그밖에 필요한 자료<br>
		&emsp;&nbsp;라. 배우자 또는 직계존비속이 신체이상으로 3일 이상 병원(의원)에 입원하여 여행 출발 전까지 퇴원이 곤란한 경우 그 배우자 또는 보호자 1인 단, 여행자는 아래와 같은 입증서류를 당사에 제출하여야 한다.<br>
		&emsp;&emsp;1) 친족을 확인할 수 있는 서류(가족관계증명서 등)<br>
		&emsp;&emsp;2) 진단서<br>
		&emsp;&emsp;3) 그밖에 필요한 자료<br>
		&emsp;&nbsp;마. 당사의 귀책사유로 계약서 또는 여행일정표(여행설명서)에 기재된 여행일정대로의 여행실시가 불가능해진 경우<br>
		&emsp;&nbsp;바. 제12조 제1항의 규정에 의한 여행요금의 증액으로 인하여 여행 계속이 어렵다고 인정될 경우
		<br><br>
		<b>제16조(여행출발 후 계약해지)</b><br>
		① 당사 또는 여행자는 여행출발 후 부득이한 사유가 있는 경우 이 여행계약을 해지할 수 있습니다. 단, 이로 인하여 상대방이 입은 손해를 배상하여야 합니다.<br>
		② 제1항의 규정에 의하여 계약이 해지된 경우 당사는 여행자가 귀국하는데 필요한 사항을 협조하여야 하며, 이에 필요한 비용으로써 당사의 귀책사유에 의하지 아니한 것은 여행자가 부담합니다.
		<br><br>
		<b>제17조(여행의 시작과 종료)</b><br>
		여행의 시작은 탑승수속(선박인 경우 승선수속)을 마친 시점으로 하며, 여행의 종료는 여행자가 입국장 보세구역을 벗어나는 시점으로 합니다. 단, 계약내용상 국내이동이 있을 경우에는 최초 출발지에서 이용하는 운송수단의 출발시각과 도착시각으로 합니다.
		<br><br>
		<b>제18조(설명의무)</b><br>
		당사는 계약서에 정하여져 있는 중요한 내용 및 그 변경사항을 여행자가 이해할 수 있도록 설명하여야 합니다.
		<br><br>
		<b>제19조(보험가입 등)</b><br>
		당사는 이 여행과 관련하여 여행자에게 손해가 발생한 경우 여행자에게 보험금을 지급하기 위한 보험 또는 공제에 가입하거나 영업보증금을 예치하여야 합니다.
		<br><br>
		<b>제20조(기타사항)</b><br>
		①	이 계약에 명시되지 아니한 사항 또는 이 계약의 해석에 관하여 다툼이 있는 경우에는 당사 또는 여행자가 합의하여 결정하되, 합의가 이루어지지 아니한 경우에는 관계법령 및 일반관례에 따릅니다. <br>
		②	특수지역에의 여행으로서 정당한 사유가 있는 경우에는 당사의 여행약관의 내용과 달리 정할 수 있습니다.<br>
		③	이 약관은 기획여행 상품을 기준으로 적용합니다. 
		<br><br>
		<b>부칙</b><br>
		1. (개정일) 이 약관은 2003년 3월 6일부터 시행한다.<br>
		2. (개정일) 이 약관은 2004년 12월 25일부터 시행한다.<br>
		3. (개정일) 이 약관은 2005년 4월 5일부터 시행한다.<br>
		4. (개정일) 이 약관은 2007년 9월 5일부터 시행한다.<br>
		5. (개정일) 이 약관은 2009년 10월 30일부터 시행한다.<br>
		6. (개정일) 이 약관은 2011년 10월 10일부터 시행한다.<br>
		7. (개정일) 이 약관은 2012년 3월 1일부터 시행한다.<br>
		8. (개정일) 이 약관은 2012년 9월 4일 부터 시행한다.<br>
		9. (개정일) 이 약관은 2014년 3월 21일 부터 시행한다.<br>
		10. (개정일) 이 약관은 2014년 9월 16일 부터 시행한다.<br>
		11. (개정일) 이 약관은 2015년 2월 23일 부터 시행한다.<br>
	</div>
</div>



</body>
</html>
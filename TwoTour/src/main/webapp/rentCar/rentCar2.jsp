<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="rentCar.dao.RentCarDAO"%>
<%@page import="rentCar.bean.RentCarDTO"%>    
<%@page import= "java.util.List" %> 
<link rel="stylesheet" type="text/css" href="../css/rentCar/rentCar2.css" />
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../js/rentCar/rentCar2.js"></script>
<script type="text/javascript">
function rentCarPaging(pg){
	location.href="/TwoTour/rentCar/rentCar2.do?pg="+pg+"&rentlocation=${rentlocation}&returnlocation=${returnlocation}&rentTime=${rentTime}&returnTime=${returnTime}&rentMinute=${rentMinute}&rentHour=${rentHour}&returnMinute=${returnMinute}&returnHour=${returnHour}";
	
}

function reservation(seq){
		$('#get_seq').val(seq);
	if('${memId}'==''){
		$('#loginForm_inform_wrap').css("visibility","visible");
		 $('#rentCar2').css('opacity','0.2');
		 $('#loginForm_inform_wrap').css('opacity','1');
	}
	else{
		location.href="/TwoTour/rentCar/rentCar3.do?no_member=member&seq="+seq+"&rentlocation=${rentlocation}&returnlocation=${returnlocation}&rentTime=${rentTime}&returnTime=${returnTime}&rentMinute=${rentMinute}&rentHour=${rentHour}&returnMinute=${returnMinute}&returnHour=${returnHour}";
	}
}

function initMap() {;
	if('${rentlocation}'=='인천국제공항(ICN), 서울, 대한민국'){var uluru = {lat: 37.448783, lng: 126.451230};}
	else if('${rentlocation}'=='제주국제공항(CJU), 제주, 대한민국'){var uluru = {lat: 33.507062, lng:126.493073 };}
	else if('${rentlocation}'=='김포국제공항(GMP), 서울, 대한민국'){var uluru = {lat: 37.559021, lng: 126.802935 };}
	else if('${rentlocation}'=='호놀룰루국제공항(HNL), 호놀룰루, 미국'){var uluru = {lat: 21.324773, lng:-157.924902 };}
	else if('${rentlocation}'=='카훌루이공항(OGG), 마우이, 미국'){var uluru = {lat: 20.896802, lng:-156.433024 };}
	else if('${rentlocation}'=='코나공항(KOA), 키홀,하와이, 미국'){var uluru = {lat: 19.736916, lng:-156.042549 };}
	else if('${rentlocation}'=='로스앤젤레스국제공항(LAX), 로스앤젤레스, 미국'){var uluru = {lat: 33.941954, lng:-118.408669 };}
	else if('${rentlocation}'=='샌프란시스코국제공항(SFO), 샌프란시스코, 미국'){var uluru = {lat: 37.621466, lng:-122.379245 };}
	else if('${rentlocation}'=='존에프케네디국제공항(JFK), 뉴욕, 미국'){var uluru = {lat: 40.641580, lng: -73.778311};}
	else if('${rentlocation}'=='샤를드골국제공항(CDG), 파리, 프랑스'){var uluru = {lat: 49.009951, lng:2.547570 };}
	else if('${rentlocation}'=='자그레브공항(ZAG), 자그레브, 크로아티아'){var uluru = {lat: 45.740773, lng:16.067372 };}
	else if('${rentlocation}'=='뮌헨'){var uluru = {lat: 48.353946, lng:11.774575 };}
	else if('${rentlocation}'=='프랑크푸르트'){var uluru = {lat: 50.050577, lng:8.570974 };}
	else if('${rentlocation}'=='바르셀로나공항(BCN), 바르셀로나, 스페인'){var uluru = {lat:41.303006, lng:2.079322 };}
	else if('${rentlocation}'=='나리타국제공항(NRT), 도쿄, 일본'){var uluru = {lat:35.772431, lng:140.392399 };}
	else if('${rentlocation}'=='후쿠오카공항(FUK), 후쿠오카, 일본'){var uluru = {lat:33.590413, lng:130.446795 };}
	else if('${rentlocation}'=='오사카'){var uluru = {lat:34.789932,  lng:135.438690 };}
	else if('${rentlocation}'=='나하공항(OKA), 오키나와, 일본'){var uluru = {lat:26.206605, lng:127.650340 };}
	else if('${rentlocation}'=='시드니'){var uluru = {lat:-33.943741,  lng:151.182637 };}
	else if('${rentlocation}'=='오클랜드'){var uluru = {lat:-37.005285,  lng:174.782683 };}
	else if('${rentlocation}'=='괌'){var uluru = {lat: 13.486819, lng:144.800810 };}
	else if('${rentlocation}'=='사이판국제공항(SPN), 사이판, 사이판'){var uluru = {lat:15.120232,  lng:145.727440 };}
	else if('${rentlocation}'=='아리아이공항(ROR), 코로르, 팔라우'){var uluru = {lat:7.367633, lng:134.539288 };}
	else if('${rentlocation}'=='칸쿤'){var uluru = {lat:21.042053,  lng:-86.874723 };}
	else if('${rentlocation}'=='창이 공항 (SIN), 싱가포르'){var uluru = {lat: 1.359882, lng:103.989681 };}
	else if('${rentlocation}'=='코타키나발루'){var uluru = {lat:5.925573, lng:116.051103 };}
	else if('${rentlocation}'=='홍콩'){var uluru = {lat:22.308325,  lng:113.917998 };}
    var map = new google.maps.Map(document.getElementById('googlemap'), {
      zoom: 16,
      center: uluru
    });
    var marker = new google.maps.Marker({
      position: uluru,
      map: map
    });
  }
$(document).ready(function(){
	$('#body').css('height','2000px');
	
	$('#rentHour2').val('${rentHour}');
	$('#rentMinute2').val('${rentMinute}');
	$('#returnHour2').val('${returnHour}');
	$('#returnMinute2').val('${returnMinute}');
	$('#ui-datepicker-div').hide();
	$('#ui-datepicker-div2').hide();
	
	
	
	
	$('#sel_calendar').click(function(){
		$('#ui-datepicker-div').show();
		$('.ui-datepicker-group-middle .ui-state-default').click(function(){
			var date = $(this).text();
			$('#txtPickUpTime').val('2017-12-'+date);
			$('#ui-datepicker-div').hide();
			
		});
		$('.ui-datepicker-group-last .ui-state-default').click(function(){
			var date = $(this).text();
			$('#txtPickUpTime').val('2018-01-'+date);
			$('#ui-datepicker-div').hide();
		});
		
	});
	$('#sel_calendar2').click(function(){
		$('#ui-datepicker-div2').show();
		$('.ui-datepicker-group-middle .ui-state-default2').click(function(){
			var date = $(this).text();
			$('#txtReturnTime').val('2017-12-'+date);
			$('#ui-datepicker-div2').hide();
			
		});
		$('.ui-datepicker-group-last .ui-state-default2').click(function(){
			var date = $(this).text();
			$('#txtReturnTime').val('2018-01-'+date);
			$('#ui-datepicker-div2').hide();
		});
	});
	$('.chk_chekbox').change(function(){	
		
		if($('#sum_optionlocationtypeal1').is(":checked")){var eurocar='ok'}else{var eurocar='no'}
		if($('#sum_optionlocationtypeal2').is(":checked")){var herlz='ok'}else{var herlz='no'}
		if($('#sum_optionlocationtypeal6').is(":checked")){var small='ok'}else{var small='no'}
		if($('#sum_optionlocationtypeal8').is(":checked")){var medium='ok'}else{var medium='no'}
		if($('#sum_optionlocationtypeal12').is(":checked")){var auto='ok'}else{var auto='no'}
		if($('#sum_optionlocationtypeal13').is(":checked")){var manual='ok'}else{var manual='no'}
		if($('#sum_optionlocationtypea1500').is(":checked")){var five='ok'}else{var five='no'}
		if($('#sum_optionlocationtypea1501').is(":checked")){var four='ok'}else{var four='no'}
		
		
		$.ajax({			
			type : "POST",
			url : "/TwoTour/rentCar/rentCarRadioChecked.do",
			data : "pg=${pg}&rentlocation=${rentlocation}&eurocar="+eurocar+"&herlz="+herlz+"&small="+small+"&medium="+medium+"&auto="+auto+"&manual="+manual+"&five="+five+"&four="+four,
			dataType : "json",
			success : function(data){
				
				$('.list_info').remove();
				$.each(data.list, function(index, items){
				 
					$("<li/>",{class :"list_info"}).append($("<p/>",{class:"rent_thumb"}).append($("<span/>",{class:"rent_ci"}).append($("<span/>",
							{class:"ir",text:"ZE"}))).append($("<img/>",{src:"../image/rentCar/"+items.imageName,style:"vertical-align: top;border:0;width:218px;height:144px;",class:"car_thumb"}))
							).append($("<div/>",{class:"rent_desc"}).append($("<div/>",{class:"chk_choice"}).append($("<input/>",{
								type:"checkbox", id:"rent_check0", class:"chk_chekbox", value:"0"})).append($("<label/>",{for:"rent_check0",id:"lbl_rent_check0",class:"rent_check",text:items.car_name}))
								.append($("<span/>",{class:"car_label",text:items.car_type+"/ 공항(전체)"}))).append($("<table/>",{
									width:"100%", cellpadding:"0", cellspacing:"0", class:"desc_list", summary:"탑승인원,에어컨유무,변속기타입,연료타입"})
									.append($("<tbody/>").append($("<tr/>",{class:"bg"}).append($("<th/>",{text:"탑승인원"})).append($("<td/>",{text:items.occupancy+"명"})).append($("<th/>",{text:"변속기 타입:"}))
											.append($("<td/>",{text:items.transmission_type}))).append($("<tr/>").append($("<th/>",{text:"에어컨유무:"})).append($("<td/>",
													{text:"있음"})).append($("<th/>",{text:"연료타입:"})).append($("<td/>",{text:"미정"}))))).append($("<div/>",{class:"opt_alert"}).append($("<div/>",{class:"imply im_01"}).append($("<p/>",
															{class:"txt",text:"주행무제한"}))).append($("<div/>",{class:"imply im_02"}).append($("<p/>",{class:"txt",text:"보험포함"}))).append($("<div/>",{class:"imply im_03"}).append($("<p/>"
																	,{class:"txt",text:"세금포함"}))))).append($("<div/>",{class:"rent_price"}).append($("<strong/>",{class:"tit_price",text:"차량 대여 요금"})).append($("<strong/>",{class:"rent_total",text:"KRW"+items.price}))
																			.append($("<p/>",{class:"tax",html:"￦"+items.price+"<br>당일환율 기준 <br> 총 대여일 기준 (세금포함)"})).append($("<button/>",{class:"btn_reservation",id:"btnReservation",onclick:"javascript:reservation("+items.seq+"); return false;"}).append($("<span/>",{text:"예약하기"})))
																			).appendTo($('.result_list'));
																			
							
					
	
				});	
			}
		});	
	});
	$('#sum_optionlocationtypeal00').click(function(){
		$('#sum_optionlocationtypeal').prop('checked',true);
		$('#sum_optionlocationtypeal5').prop('checked',true);
		$('#sum_optionlocationtypeal11').prop('checked',true);
		$('#sum_optionlocationtypeal14').prop('checked',true);
	});	
	
	$('#sum_optionlocationtypeal5001').click(function(){
		$('.list_info').remove();
	});
	
	$('#close_login').click(function(){
		$('#loginForm_inform_wrap').css("visibility","hidden");
		 $('#rentCar2').css('opacity','1');
		 $('#loginForm_inform_wrap').css('opacity','0.2');
	});
	
	//로그인관련
	$('#login_id').keyup(function(){
		if($(this).val().length==0){
			$('#login_idDiv').text("아이디 입력");
		}
		else
			$('#login_idDiv').text("");
		});
	
	
	$('#login_pwd').keyup(function(){
		if($(this).val().length==0){
			$('#login_pwdDiv').text("비밀번호 입력");
		}
		else
			$('#login_pwdDiv').text("");
		});
	//로그인
	$('#accpet_login').click(function(){
		$.ajax({
			type:"POST",
			url:"/TwoTour/member/login.do",
			data: "id="+$('#login_id').val()+"&pwd="+$('#login_pwd').val(),
			dataType:"text",
			success: function(result){
				if(result=="exist"){
					location.href="/TwoTour/rentCar/rentCar3.do?no_member=member&seq="+$('#get_seq').val()+"&rentlocation=${rentlocation}&returnlocation=${returnlocation}&rentTime=${rentTime}&returnTime=${returnTime}&rentMinute=${rentMinute}&rentHour=${rentHour}&returnMinute=${returnMinute}&returnHour=${returnHour}";
				}
				else if(result=="not_exist"){
					alert("아이디또는 비밀번호가 틀렸습니다.");
					$('#login_id').focus();
				}
				else if(result=="empty"){
					if($('#login_id').val().length==0){
						$('#login_idDiv').text("아이디를 입력하세요.");
					}
					if($('#login_pwd').val().length==0){
						$('#login_pwdDiv').text("비밀번호를 입력하세요.");
					}
				
				
				}
			}
		});
	});
	$('#go_writeForm').click(function(){
		location.href="/TwoTour/member/writeForm.do";
	});
	$('#search_id').click(function(){
		location.href="/TwoTour/member/findInform.do"
	});
	$('#search_pwd').click(function(){
		location.href="/TwoTour/member/findInform.do"
	})
});
$(window).bind('beforeunload',function(){
	$('#body').css('height','2000px');
});
</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9FgH0243gXnLYR1t6TqXKvpoYPri6_ak&callback=initMap">
    </script>
    <style>
    #currentPaging{
	color : red;
	text-decoration : underline;
	cursor:pointer;
}
#paging{
	color : black;
	text-decoration : none;
	cursor:pointer;
}
#privious{
	color : black;
	text-decoration : none;
	cursor:pointer;
}
#next{
	color : black;
	text-decoration : none;
	cursor:pointer;
}
    
    
    </style>
<div id="rentCar2" style="height:1900px; background-color:rgb(248,248,248);" onload="initialize()">
	<input type="hidden" name="seq" id="get_seq" value="">
	<div id="rentCar2_Div" style="height:100%; margin-top:40px; margin-bottom:40px;">
		<div id="rentCar2_Div1">
		<form id="checkSearch" name="checkSearch" method="get" action="/TwoTour/rentCar/rentCar2.do">
			<div class="search_option">
				<div style="height:100%;">
					<div id="search_div1">
						<ul style="height:166px;">
							<li style="width:100%;" class="f_left">
								<p class="title_name">대여장소 / 일시</p>
								<div class="sel_input" style="width: 200px; padding: 3px 5px 2px 5px;">
									<input type="text" data-locid="#PickUpLocation" data-locname="#PickUpLocationNM" name="rentlocation" id="txtPickUpLocation" value="${rentlocation}">
								</div>
							</li>
							<li style="width:100%;" class="f_left">
								<div class="sel_input" style="width: 200px; padding: 3px 5px 2px 5px;">
									<input type="text" data-locid="#PickUpTime" data-locname="#PickUpTimeNM"  name="rentTime" id="txtPickUpTime" value="${rentTime}">
									<button type="button" title="달력검색" id="sel_calendar" class="sel_calendar_PickUp"></button>
								</div>
							</li>
							<li style="width:46%;" class="f_left">
								<div class="selbox1">			
									<select id="rentHour2" name="rentHour">
										<option value="00시">00시</option>
										<option value="01시">01시</option>
										<option value="02시">02시</option>
										<option value="03시">03시</option>
										<option value="04시">04시</option>
										<option value="05시">05시</option>
										<option value="06시">06시</option>
										<option value="07시">07시</option>
										<option value="08시">08시</option>
										<option value="09시">09시</option>
										<option value="10시">10시</option>
										<option value="11시">11시</option>
										<option value="12시">12시</option>
										<option value="13시">13시</option>
										<option value="14시">14시</option>
										<option value="15시">15시</option>
										<option value="16시">16시</option>
										<option value="17시">17시</option>
										<option value="18시">18시</option>
										<option value="19시">19시</option>
										<option value="20시">20시</option>
										<option value="21시">21시</option>
										<option value="22시">22시</option>
										<option value="23시">23시</option>
									</select>										
								</div>
							</li>
							<li style="width:46%; margin-left:12px;" class="f_left">
								<div class="selbox2">			
									<select id="rentMinute2" name="rentMinute">
										<option value="00분">00분</option>
										<option value="15분">15분</option>
										<option value="30분">30분</option>
									</select>										
								</div>
							
							</li>
						</ul>
						<ul style="height:166px;">
							<li style="width:100%;" class="f_left">
								<p class="title_name">반납장소 / 일시</p>
								<div class="sel_input" style="width: 200px; padding: 3px 5px 2px 5px;">
									<input type="text" data-locid="#ReturnLocation" data-locname="#ReturnLocationNM" name="returnlocation" id="txtReturnLocation" value="${returnlocation}">
								</div>
							</li>
							<li style="width:100%;" class="f_left">
								<div class="sel_input" style="width: 200px; padding: 3px 5px 2px 5px;">
									<input type="text" data-locid="#ReturnTime" data-locname="#ReturnTimeNM" name="returnTime" id="txtReturnTime" value="${returnTime}">
									<button type="button" title="달력검색" id="sel_calendar2"class="sel_calendar_Return"></button>
								</div>
							</li>
							<li style="width:46%;" class="f_left">
								<div class="selbox3">			
									<select id="returnHour2" name="returnHour">
										<option value="00시">00시</option>
										<option value="01시">01시</option>
										<option value="02시">02시</option>
										<option value="03시">03시</option>
										<option value="04시">04시</option>
										<option value="05시">05시</option>
										<option value="06시">06시</option>
										<option value="07시">07시</option>
										<option value="08시">08시</option>
										<option value="09시">09시</option>
										<option value="10시">10시</option>
										<option value="11시">11시</option>
										<option value="12시">12시</option>
										<option value="13시">13시</option>
										<option value="14시">14시</option>
										<option value="15시">15시</option>
										<option value="16시">16시</option>
										<option value="17시">17시</option>
										<option value="18시">18시</option>
										<option value="19시">19시</option>
										<option value="20시">20시</option>
										<option value="21시">21시</option>
										<option value="22시">22시</option>
										<option value="23시">23시</option>
									</select>										
								</div>
							</li>
							<li style="width:46%;margin-left:12px;" class="f_left">
								<div class="selbox4">			
									<select id="returnMinute2" name="returnMinute">
										<option value="00분">00분</option>
										<option value="15분">15분</option>
										<option value="30분">30분</option>
									</select>										
								</div>		
							</li>		
						</ul>
					</div>
					<div class="sel_option">
						<p class="title_name">선택옵션</p>
						<ul id="rentOption">
							<li style="width:50%;" class="f_left">
								<input type="checkbox" id="sel_option1" name="sel_option" class="chk_chekbox" data-label="#lbl_sel_option1" checked="true">									
								<label for="sel_option1" id="lbl_sel_option1" class="rent_check">네비게이션</label>
							</li>
							<li style="width:50%;" class="f_left">
								<input type="checkbox" id="sel_option2" name="sel_option" class="chk_chekbox" data-label="#lbl_sel_option2" checked="true">									
								<label for="sel_option2" id="lbl_sel_option2" class="rent_check">유아용 카시트</label>
							</li>
							<li style="width:50%;" class="f_left">
								<input type="checkbox" id="sel_option3" name="sel_option" class="chk_chekbox" data-label="#lbl_sel_option3" checked="true">									
								<label for="sel_option3" id="lbl_sel_option3" class="rent_check">아동용 카시트</label>
							</li>
							<li style="width:50%;" class="f_left">
								<input type="checkbox" id="sel_option4" name="sel_option" class="chk_chekbox" data-label="#lbl_sel_option4" checked="true">									
								<label for="sel_option4" id="lbl_sel_option4" class="rent_check">부스터 카시트</label>
							</li>
						</ul>
					</div>
					<input type="hidden" name="pg" value="1">
					<div class="search_btn_area" style="height:35px; margin-top:15px;">
						<button class="btn_search" id="btnSearch">검색하기</button>
					</div>
				</div>
			</div>
			</form>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype">
					 	<span class="h3_title">인근 주요시설</span>
					 	<span class="icon"><span class="ir">인근 주요시설 열기/닫기</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype">
					<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypeal00" data-sumcode="locationtype" name="sum_optionlocationtype" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal00" id="lblsum_optionlocationtypeall" class="rent_check on">전체 (${totalA})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal5000" data-sumcode="locationtype" name="sum_optionlocationtype" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal5000" id="lblsum_optionlocationtypeall" class="rent_check on">공항(전체) (${totalA})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal5001" data-sumcode="locationtype" name="sum_optionlocationtype" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal5001" id="lblsum_optionlocationtypeall" class="rent_check on">공항(셔틀버스미운행) (0)
						</label> 
					</li>
				</ul>
			</div>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype2">
					 	<span class="h3_title2">대여지점</span>
					 	<span class="icon"><span class="ir">인근 주요시설 열기/닫기</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype2">
				<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypeal" data-sumcode="locationtype" name="sum_optionlocationtype2" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal" id="lblsum_optionlocationtypeall1" class="rent_check on">전체 (${totalA})
						</label> 
					</li>																
					<li>
						<input type="radio" id="sum_optionlocationtypeal1" data-sumcode="locationtype" name="sum_optionlocationtype2" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal1" id="lblsum_optionlocationtypeall1" class="rent_check on">유로카(${eurocarTotal})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal2" data-sumcode="locationtype" name="sum_optionlocationtype2" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal2" id="lblsum_optionlocationtypeall1" class="rent_check on">허츠(${herlzTotal})
						</label> 
					</li>					
				</ul>
			</div>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype3">
					 	<span class="h3_title3">차량종류</span>
					 	<span class="icon"><span class="ir">인근 주요시설 열기/닫기</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype3">
					<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypeal5" data-sumcode="locationtype" name="sum_optionlocationtype3" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal5" id="lblsum_optionlocationtypeall" class="rent_check on">전체 (${totalA})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal6" data-sumcode="locationtype" name="sum_optionlocationtype3" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal6" id="lblsum_optionlocationtypeall" class="rent_check on">소형차 (${smallTotal})
						</label>
						 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal8" data-sumcode="locationtype" name="sum_optionlocationtype3" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal8" id="lblsum_optionlocationtypeall" class="rent_check on">중형차 (${mediumTotal})
						</label> 
					</li>
					
				</ul>
			</div>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype4">
					 	<span class="h3_title4">변속기타입</span>
					 	<span class="icon"><span class="ir">인근 주요시설 열기/닫기</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype4">
					<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypeal11" data-sumcode="locationtype" name="sum_optionlocationtype4" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal11" id="lblsum_optionlocationtypeall" class="rent_check on">전체 (${totalA})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal12" data-sumcode="locationtype" name="sum_optionlocationtype4" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal12" id="lblsum_optionlocationtypeall" class="rent_check on">자동 (${autoTotal})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal13" data-sumcode="locationtype" name="sum_optionlocationtype4" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal13" id="lblsum_optionlocationtypeall" class="rent_check on">수동 (${manualTotal})
						</label> 
					</li>
					
				</ul>
			</div>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype5">
					 	<span class="h3_title5">탑승인원</span>
					 	<span class="icon"><span class="ir">인근 주요시설 열기/닫기</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype5">
					<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypeal14" data-sumcode="locationtype" name="sum_optionlocationtype5" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal14" id="lblsum_optionlocationtypeall" class="rent_check on">전체 (${totalA})
 						</label> 
					</li>					
					<li>
						<input type="radio" id="sum_optionlocationtypea1500" data-sumcode="locationtype" name="sum_optionlocationtype5" class="chk_chekbox" value="all">
						<label for="sum_optionlocationtypea1500" id="lblsum_optionlocationtypeall" class="rent_check on">5 명 (${fiveTotal})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypea1501" data-sumcode="locationtype" name="sum_optionlocationtype5" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypea1501" id="lblsum_optionlocationtypeall" class="rent_check on">4 명 (${fourTotal})
						</label> 
					</li>
					
				</ul>
			</div>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype6">
					 	<span class="h3_title6">주행거리제한</span>
					 	<span class="icon"><span class="ir">인근 주요시설 열기/닫기</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype6">
					<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypea18" data-sumcode="locationtype" name="sum_optionlocationtype6" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypea18" id="lblsum_optionlocationtypeall" class="rent_check on">전체 (${totalA})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypea19" data-sumcode="locationtype" name="sum_optionlocationtype6" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypea19" id="lblsum_optionlocationtypeall" class="rent_check on">주행거리 무제한 (${totalA})
						</label> 
					</li>
					
				</ul>
			</div>
		</div>
		<div id="rentCar2_Div2">
			<div id="googlemap">
				
			
			</div>
			<div class="choice_rent">
				<p class="impers_res_car">
					<strong class="total">${totalA}대</strong>
					의 차량이 
					<strong class="res_imp">예약가능</strong> 
					합니다. 
					<b class="txt">본 차량들은 현지에서 직접 결제하시는 
					<strong>후불제</strong> 
					차량입니다.</b>
				</p>
				<div class="sort_group" id="rentsortgroup">
					<div class="compare_car">
						<b class="txt_tit">최대 3개 차종까지 선택 비교 가능</b>
						<button type="button" class="btn_sel" id="btnVehcleCompare">선택차량비교</button>
					</div>
					<div class="type_car">
						<b class="txt_tit">차량 사이즈에 따른 차량 종류 안내</b>
						<button type="button" class="btn_sortinfo" id="btnVehicleType">차량종류안내</button>
					</div>
					<div class="sort_car search_li">
						<b class="txt_tit">차량정렬</b>
						<select>
								<option value="">최저가순</option>
								<option value="">최고가순</option>				
						</select>
					</div>
				</div>
				
			</div>
			<div id="rentcarList">
					<ul class="result_list">					
					<c:if test="${requestScope.list!=null }">	
						<c:forEach var="rentCarDTO" items="${list}" >
						<li class="list_info">
							<p class="rent_thumb">      
								<span class="rent_ci">
									 
									<span class="ir">ZE</span>            
								</span>               
								<img src="../image/rentCar/${rentCarDTO.imageName}" width="218px" height="144" alt="차량이미지" class="car_thumb" style="vertical-align: top; border:0;" onerror="rentCommon.imgError(this, 'rentcar', false);">
							</p>
							<div class="rent_desc">
								<div class="chk_choice">
									<input type="checkbox" data-label="#lbl_rent_check0" id="rent_check0" class="chk_chekbox" value="0" onclick="javascript:setOptionStat(this, 'rent_check');">
									<label for="rent_check0" id="lbl_rent_check0" class="rent_check">${rentCarDTO.car_name}</label>
									<span class="car_label">소형차(Economy) / 공항(전체)</span>
								</div>
								<table width="100%" cellpadding="0" cellspacing="0" class="desc_list" summary="탑승인원,에어컨유무,변속기타입,연료타입">            
									<tbody>
									    <tr class="bg">
										    <th>탑승인원:</th>
										    <td>${rentCarDTO.occupancy}명</td>             
										    <th>변속기 타입:</th>                     
										    <td>${rentCarDTO.transmission_type}</td>                   
									    </tr>                    
									    <tr>                     
										    <th>에어컨유무:</th>                   
										    <td>있음</td>                    
										    <th>연료타입:</th>                      
										    <td>미정</td>  
										</tr>                             
								    </tbody>             
								</table>
								<div class="opt_alert">
									<div class="imply im_01">                 
									   <p class="txt">주행무제한</p>       
									</div>
									<div class="imply im_02">
									   <p class="txt">보험포함</p> 
									</div>
									<div class="imply im_03">
									   <p class="txt">세금포함</p> 												
									</div>
								</div>	
							</div>
							<div class="rent_price">        
									<strong class="tit_price">차량 대여 요금</strong>           
									<strong class="rent_total">KRW&nbsp;${rentCarDTO.price}</strong>      
								    <p class="tax">              
								    	<b>￦${rentCarDTO.price}</b>당일환율 기준<br>총 대여일 기준 (세금포함)								 
								    </p>              
								    <button type="button" class="btn_reservation" id="btnReservation" onclick="javascript:reservation(${rentCarDTO.seq}); return false;">     
								    	<span>예약하기</span>					
								    </button>         
								   
								</div>
						</li>
						</c:forEach>
					</c:if>					
					</ul>			
				</div>
				<div class="page-number">
					<div class="pagination" id="pagination">
						${rentCarPaging.pagingHTML}
					</div>
				</div>
		</div>
	
		
	
	
	
	</div>
	<div class="layer_event" id="popVehicleType" style="top: 260.5px; left: 274.5px; display: block;">
<p class="h_title">차량종류</p>
<div class="compare_table sort_list">
<table cellpadding="0" cellspacing="0" width="100%" summary="렌터카브랜드,차량,종류,탑승인원,수하물개수,에어컨유무,변속기타입,연료타입,주행거리,차량대여요금안내">
<caption>렌터카 비교차량 안내</caption>
<colgroup>
<col width="12%">
<col width="22%">
<col width="22%">
<col width="22%">
<col width="22%">
</colgroup>
<tbody>
<tr>
<td class="bg">
                크기에<br>따른<br>분류
              </td>
<td><b class="type">소형차 (Economy)</b><span class="car_type economy"></span><p class="desc_txt">
                  저렴하고 연료비가<br>적게 드는 차량, 슈퍼미니 차량
                </p>
</td>
<td><b class="type">중소형차 (Compact)</b><span class="car_type compact"></span><p class="desc_txt">
                  저렴하고 연료비가<br>적게 드는 차량
                </p>
</td>
<td><b class="type">중형차 (Midsize)</b><span class="car_type midsize"></span><p class="desc_txt">
                  최대 5인 탑승 가능<br>가장 인기 있는 형태는<br>세단과 스테이션 왜건임.
                </p>
</td>
<td><b class="type">고급/대형차 (Executive)</b><span class="car_type executive"></span><p class="desc_txt">
                  보통 실내공간이 넓고<br>강력한 엔진 출력을 내며<br>고급스럽게 제작된 차량
                </p>
</td>
</tr>
<tr>
<td class="bg" rowspan="2">
                외형에<br>따른<br>분류
              </td>
<td><b class="type">컨버터블 (Convertible)</b><span class="car_type convertible"></span><p class="desc_txt">
                  국내에는 흔지 않으나,<br>천장의 개폐가 가능한 것이<br>특징인 차량
                </p>
</td>
<td><b class="type">스포츠유틸리티 (SUV)</b><span class="car_type suv"></span><p class="desc_txt">
                  주행능력이 뛰어나<br>각종 스포츠활동에 적합한<br>스포츠형 다목적차량
                </p>
</td>
<td><b class="type">세단 (Sedan)</b><span class="car_type sadan"></span><p class="desc_txt">
                  문이 4개인 가징 일반적인<br>자동차로 가장 많이<br>접할 수 있는 차량
                </p>
</td>
<td><b class="type">왜건 (Wagon)</b><span class="car_type wagon"></span><p class="desc_txt">
                  천장이 트렁크까지<br>수평구조로 뒤쪽에<br>문이 달린 승용차
                </p>
</td>
</tr>
<tr>
<td><b class="type">쿠페 (Coupe)</b><span class="car_type coupe"></span><p class="desc_txt">
                  승차인원에 상관없이<br>문이 2개인 세단형 승용차로<br>지붕이 낮은 것이 특징
                </p>
</td>
<td><b class="type">해치백 (Hatch-back)</b><span class="car_type hatchback"></span><p class="desc_txt">
                  트렁크와 뒷 유리가 함께<br>열리는 차량으로 왜건에 비해<br>트렁크 길이가 짧음
                </p>
</td>
<td><b class="type">밴 (VAN)</b><span class="car_type van"></span><p class="desc_txt">
                  화물을 실을 수 있는<br>화물칸이 달려있어 뒷 열의<br>적재공간이 넓은 차량
                </p>
</td>
<td><b class="type">픽업트럭 (Pick-up Truck)</b><span class="car_type pickup"></span><p class="desc_txt">
                  지붕이 없는 적재함이<br>있는 차량으로 소형 트럭<br>형식의 차량
                </p>
</td>
</tr>
</tbody>
</table>
</div><button type="button" class="btn_close" title="레이어 닫기" data-popup="#popVehicleType" id="btnVehicleTypeClose"><span class="ir">닫기</span></button></div>

<div class="layer_event" style="top: 100px; left: 233.5px; display: block;" id="popVehicle">
<p class="h_title">렌터카 선택 차량비교</p>
<div class="compare_table">
<table cellpadding="0" cellspacing="0" width="100%" summary="렌터카브랜드,차량,종류,탑승인원,수하물개수,에어컨유무,변속기타입,연료타입,주행거리,차량대여요금안내">
<caption>렌터카 비교차량 안내</caption>
<colgroup>
<col width="13%">
<col width="29%">
<col width="29%">
<col width="29%">
</colgroup>
<thead>
<tr id="cBrandCode">
<th>렌터카 브랜드</th>
<th>허츠(ZE)</th><th>허츠(ZE)</th></tr>
</thead>
<tbody>
<tr id="cPictureURL">
<td class="bg">차량</td>
<td><p class="rent_thumb"><span class="rent_ci"><img src="http://image1.hanatour.com/_images/rentercar/rentcar_ci_ZE.gif" width="59px" height="23px" alt="Hertz"><span class="ir">ZE</span></span><img src="https://hanatourrentacarapi.blob.core.windows.net/images/ZEKREDAR999.jpg" width="200px" height="126" alt="차량이미지" onerror="rentCommon.imgError(this, 'rentcar', false);"></p></td><td><p class="rent_thumb"><span class="rent_ci"><img src="http://image1.hanatour.com/_images/rentercar/rentcar_ci_ZE.gif" width="59px" height="23px" alt="Hertz"><span class="ir">ZE</span></span><img src="https://hanatourrentacarapi.blob.core.windows.net/images/ZEKRCDAR999.jpg" width="200px" height="126" alt="차량이미지" onerror="rentCommon.imgError(this, 'rentcar', false);"></p></td></tr>
<tr id="cVehicleType">
<td class="bg">차량종류</td>
<td>소형차(Economy)</td><td>소형차(Compact)</td></tr>
<tr id="cPassengerQuantity">
<td class="bg">탑승인원</td>
<td>4명</td><td>5명</td></tr>
<tr id="cBaggageQuantity">
<tr id="cDriveType">
<td class="bg">변속기타입</td>
<td>자동</td><td>자동</td></tr>
<tr id="cFuelType">
<td class="bg">연료타입</td>
<td>미정</td><td>미정</td></tr>
<tr id="cRateDistance">
<td class="bg">주행거리</td>
<td>무제한</td><td>무제한</td></tr>
<tr id="cReservation">
<td class="bg">차량 대여 요금</td>
<td><strong class="rent_price"><span>KRW</span>&nbsp;53,999.55</strong><p class="tax"><b>￦53,999</b> / 당일 환율기준 <br>총 대여일 기준 (세금포함)<br>보험포함</p><button class="btn_reservation"><span>예약하기</span></button></td><td><strong class="rent_price"><span>KRW</span>&nbsp;62,999.64</strong><p class="tax"><b>￦62,999</b> / 당일 환율기준 <br>총 대여일 기준 (세금포함)<br>보험포함</p><button class="btn_reservation"><span>예약하기</span></button></td></tr>
</tbody>
</table>
</div><button type="button" class="btn_close" data-popup="#popVehicle" title="레이어 닫기" id="btnPopupVehicleClose"><span class="ir">닫기</span></button></div>
</div>
<div class="layer_event" style="top: 100px; left: 551.5px; display: none;" id="popVehicle">
<p class="h_title">렌터카 선택 차량비교</p>
<div class="compare_table">
<table cellpadding="0" cellspacing="0" width="100%" summary="렌터카브랜드,차량,종류,탑승인원,수하물개수,에어컨유무,변속기타입,연료타입,주행거리,차량대여요금안내">
<caption>렌터카 비교차량 안내</caption>
<colgroup>
<col width="13%">
<col width="29%">
<col width="29%">
<col width="29%">
</colgroup>
<thead>
<tr id="cBrandCode">
<th>렌터카 브랜드</th>
<th>허츠(ZE)</th><th>허츠(ZE)</th></tr>
</thead>
<tbody>
<tr id="cPictureURL">
<td class="bg">차량</td>
<td><p class="rent_thumb"><span class="rent_ci"><img src="http://image1.hanatour.com/_images/rentercar/rentcar_ci_ZE.gif" width="59px" height="23px" alt="Hertz"><span class="ir">ZE</span></span><img src="https://hanatourrentacarapi.blob.core.windows.net/images/ZEKREDAR999.jpg" width="200px" height="126" alt="차량이미지" onerror="rentCommon.imgError(this, 'rentcar', false);"></p></td><td><p class="rent_thumb"><span class="rent_ci"><img src="http://image1.hanatour.com/_images/rentercar/rentcar_ci_ZE.gif" width="59px" height="23px" alt="Hertz"><span class="ir">ZE</span></span><img src="https://hanatourrentacarapi.blob.core.windows.net/images/ZEKRCDAR999.jpg" width="200px" height="126" alt="차량이미지" onerror="rentCommon.imgError(this, 'rentcar', false);"></p></td></tr>
<tr id="cVehicleType">
<td class="bg">차량종류</td>
<td>소형차(Economy)</td><td>소형차(Compact)</td></tr>
<tr id="cPassengerQuantity">
<td class="bg">탑승인원</td>
<td>4명</td><td>5명</td></tr>
<tr id="cBaggageQuantity">
<td class="bg">수하물개수</td>
<td>2개</td><td>2개</td></tr>
<tr id="cDriveType">
<td class="bg">변속기타입</td>
<td>자동</td><td>자동</td></tr>
<tr id="cFuelType">
<td class="bg">연료타입</td>
<td>미정</td><td>미정</td></tr>
<tr id="cRateDistance">
<td class="bg">주행거리</td>
<td>무제한</td><td>무제한</td></tr>
<tr id="cReservation">
<td class="bg">차량 대여 요금</td>
<td><strong class="rent_price"><span>KRW</span>&nbsp;53,999.55</strong><p class="tax"><b>￦53,999</b> / 당일 환율기준 <br>총 대여일 기준 (세금포함)<br>보험포함</p><button class="btn_reservation"><span>예약하기</span></button></td><td><strong class="rent_price"><span>KRW</span>&nbsp;62,999.64</strong><p class="tax"><b>￦62,999</b> / 당일 환율기준 <br>총 대여일 기준 (세금포함)<br>보험포함</p><button class="btn_reservation"><span>예약하기</span></button></td></tr>
</tbody>
</table>
</div><button type="button" class="btn_close" data-popup="#popVehicle" title="레이어 닫기" id="btnPopupVehicleClose"><span class="ir">닫기</span></button></div>
<div id="ui-datepicker-div" class="ut-datepicker ui-widget ui-widget-content ui-helper-clearfix
	ui-corner-all ui-datepicker-multi-3 ui-datepicker-multi" style="position: absolute; top: 100px;
    width: 51em; left: 170px; z-index: 101; display: block; width:auto; height:auto; ">
    	<div class="ui-datepicker-group ui-datepicker-group-middle"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix"><div class="ui-datepicker-title"><span class="ui-datepicker-year">2017</span>년&nbsp;<span class="ui-datepicker-month">12월</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일"><font color="red">일</font></span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토"><font color="blue">토</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">1</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">8</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">15</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">22</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">24</a></td><td class=" date-holiday0" title="크리스마스" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">26</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">29</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>
 		<div class="ui-datepicker-group ui-datepicker-group-last"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-right"><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click"><span class="ui-icon ui-icon-circle-triangle-e"></span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2018</span>년&nbsp;<span class="ui-datepicker-month">1월</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일"><font color="red">일</font></span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토"><font color="blue">토</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" date-holiday0" title="신정" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">1</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">2</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">5</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">6</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">8</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">9</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">12</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">13</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">15</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">16</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">19</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">20</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">22</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">23</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">26</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">27</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">29</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">30</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>  
    </div>
    <div id="ui-datepicker-div2" class="ut-datepicker ui-widget ui-widget-content ui-helper-clearfix
	ui-corner-all ui-datepicker-multi-3 ui-datepicker-multi" style="position: absolute; top: 300px;
    width: 51em; left: 170px; z-index: 101; display: block; width:auto; height:auto; ">
    	<div class="ui-datepicker-group ui-datepicker-group-middle"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix"><div class="ui-datepicker-title"><span class="ui-datepicker-year">2017</span>년&nbsp;<span class="ui-datepicker-month">12월</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일"><font color="red">일</font></span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토"><font color="blue">토</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">1</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">8</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">15</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">22</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">24</a></td><td class=" date-holiday0" title="크리스마스" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">26</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">29</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>
 		<div class="ui-datepicker-group ui-datepicker-group-last"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-right"><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click"><span class="ui-icon ui-icon-circle-triangle-e"></span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2018</span>년&nbsp;<span class="ui-datepicker-month">1월</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일"><font color="red">일</font></span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토"><font color="blue">토</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" date-holiday0" title="신정" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">1</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">2</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">5</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">6</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">8</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">9</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">12</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">13</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">15</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">16</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">19</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">20</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">22</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">23</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">26</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">27</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">29</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">30</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>  
    </div>

    <div id="loginForm_inform_wrap">
   			<div id="loginForm_inform_box">
   				<div id="loginForm_inform_box1"><label id="member">로그인</label><label id="close_login"><img src="../image/close.gif"></label></div>
   				
   			</div>
   			<div id="loginForm_inform_member">
   			<div id="border_line"></div>
   				<div id="login_text_wrap">
   					<div id="login_text">아이디로 로그인</div>
   				</div>
   				<div id="loginForm_id_content">
   						<input type="text" id="login_id" name="id" placeholder="하나투어 아이디">
   						<div id="login_idDiv"></div>
   				</div>
   				<div id="loginForm_pwd_content">
   						<input type="password" id="login_pwd" name="pwd" placeholder="비밀번호">
   						<div id="login_pwdDiv"></div>
   					</div>
   				<div id="loginForm_accept_login">
   					<div id="accpet_login">
   						<label id="login">로그인</label>
   					</div>
   				</div>
   				<div id="loginForm_function_table">
   					<div id="function_table">
   						<ul>
							<li id="search_id"><h4>아이디 찾기</h4></li>
							<li id="search_pwd"><h4>비밀번호 찾기</h4></li>
							<li id="go_writeForm"><h4>회원가입</h4></li>
						</ul>
   					</div>
   				</div>
   			</div>
   		</div>



    
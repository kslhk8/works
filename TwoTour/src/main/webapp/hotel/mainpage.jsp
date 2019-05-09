<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/TwoTour/css/hotel/mainpage.css">

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

$(document).ready(function(){
	 
	$('#body').css('height', '2000px');
	

  /*  $('#search_result_wrap01').append('<h1 style="font-size:50px;">hello</h1>');  */
	
	//전체메뉴
	 $('#whole_menu').click(function(){
		  if($('#whole_menu_div').css('visibility')=='hidden'){
			  $('#whole_menu_div').hide();
			  $('#hotel_wrap').css('z-index','0');
			  $('#hotel_wrap').css('opacity','1');
		  }
		  else if($('#whole_menu_div').css('visibility')=='visible'){
			  $('#whole_menu_div').show();
			  $('#hotel_wrap').css('z-index','-1');
			  $('#hotel_wrap').css('opacity','0.2');
		  }
	  }); 
	
	//왼쪽메뉴
	$('.hotel_search_menu_li').on('click',function(){
		$(this).toggleClass("open_menu");
	});
	
	$('.hotel_search_menu_li2').on('click',function(){
		$(this).toggleClass("open_menu2");
	});
	
	//검색하기 버튼
	$('.search_button').mouseenter(function(){
		$(this).css('background-color', '#ff5e8f' );
	}).mouseleave(function(){
		$(this).css('background-color', '#e85581' );
	});
	
	//옵션 선택
	$('#option_list div.option_class').on('click', function(){
		var id = $(this).attr('id');
		
		if(id=='price'){
			$('#rank, #score').removeClass('open');
		}else if(id=='rank'){
			$('#price, #score').removeClass('open');
		}else if(id=='score'){
			$('#price, #rank').removeClass('open');
		}
		
		$(this).toggleClass('open');
	});
	
	$('ul.option_ul li').mouseenter(function(){
		$(this).css({'background-color':'#eeeeee'});

	}).mouseleave(function(){
		$(this).css({'background-color':'#fff'});
	});
	
	
	
	
	
	//객실조회 버튼 - ajax 통신 후
	$(document).on('mouseenter focusin', ".search_room", function(){
		$(this).css('background-color', '#ff5e8f' );
	});
	$(document).on('mouseleave focusout', ".search_room", function(){
		$(this).css('background-color', '#e85581' );
	}); 

	
	
	// 페이지 이동
	var pagingCount = 1;
	$(document).on('click focusin', "#hotelpaging_next", function(){
		pagingCount++;
		params.data.pg=pagingCount;
		$('#hotel_ul li').remove();
		$.ajax(params); 
		
	});
	
	$(document).on('click focusin', "#hotelpaging_pre", function(){
		pagingCount--;
		if(pagingCount < 1) pagingCount=1;
		params.data.pg=pagingCount;
		$('#hotel_ul li').remove();
		$.ajax(params); 
		
	});
	
	
	

	var hotel_notice = 
	'<li id="hotel_notice_id">' +
	 '<div class="hotel_notice"><div>' + 
	 	'<strong><img src="/TwoTour/image/notice_icon.gif">호텔예약시 주의사항</strong></div>' +
		'<ul>' +
			'<li>상기 요금은 현지에서의 세금과 봉사료가 포함된 숙박기간의 숙박요금 합계입니다.</li>' +
			'<li>호텔마다 취소수수료 규정이 다를 수 있습니다. 예약전 반드시 체크해서 불이익이 없도록 하십시오.</li>' +
			'<li>원화금액은 당일 환율이 적용된 금액으로 결제 시 결제당일 환율이 적용되어 금액차이가 발생할 수 있습니다.</li>' +
			'<li>예약대기 호텔은 업무 시간 기준이며, 업무 시간은 월~금요일 09:00~18:00(공휴일 제외)입니다.</li>' +
			'<li>호텔 요금이 변동 될 수 있으므로, 반드시 예약하기를 클릭 후 정확한 요금을 확인하시기 바랍니다.</li>' +
			'<li class="hit">예약완료 후 예약상태가 "확정"인지 확인하세요. 예약 시 "바로확정"으로 보여도 예약 중 실시간' +
			'객실소진에 따라 "예약대기"가 될 수 있으며, 이 경우 추후 확정 가능 여부 안내 해드립니다. 불가할 경우에는 결제 취소됩니다.</li>' +
		'</ul>' +
	 '</div> ' +
	'</li>';
	
	 var city='';
	 
 	 if('${param.city}'==null){}
 	 else{
		 city = '${param.city}';
	 } 
		 
	
	
	 $('#title1_type1_box').val(city);
	 
	 var params = {
		type:"GET",
		url:"/TwoTour/hotel/hotels.do",
		data: { 'city':city, 'pg' : 1 },
		dataType:"json",
		success: function(data){
			
			
			if(data.list==''){
				$('#hotel_ul').append('<li class="nodata">검색결과가 없습니다.</li>');
				$('#result_cnt').html(0);
			}
		
			$.each(data.list,function(index,items){
					var hotel_li = 'hotel_li' + index;
					var hotel_pic = 'hotel_pic' + index;
					var hotel_info = 'hotel_info' + index;
					var korean_name = 'korean_name' + index;
					var eng_name = 'eng_name' + index;
					var location = 'location' + index;
					var price_info = 'price_info' + index;
					
					//호텔 갯수만큼 li 만들기
					$('#hotel_ul').append(
						'<li class="hotel_list_class">' +
							'<div id="'+ hotel_li + '" class="hotel_li">' +
								'<div id="'+ hotel_pic + '" class="hotel_pic">' +
									'<img src="/TwoTour/image/hotel/'+items.imageName+'" width="240px" height="173px" />' +
									'<span class="tag_twotour">TwoTour</span>' +
								'</div>' +
								'<div id="'+ hotel_info +'" class="hotel_info">' +
									'<h4 id="'+ korean_name + '" class="korean_name">' + items.hotel_name + 
									'<img src="/TwoTour/image/ico_grade_star_' + items.rank + '.png" />' +
						 			'</h4>' +
						 			'<h4 id="'+ eng_name + '" class="eng_name">'+ items.hotel_eng_name +'</h4>'+ 
						 			'<h4 id="'+ location + '" class="location">' +
						 				'<img src="/TwoTour/image/map.png"/>' +
						 				'<a>위치: '+ items.location +'</a>' +
						 			'</h4>' +
						 	
						 		'<div class="hotel_accommodations">' +
						 			'<ul class="hotel_accommodations_ul">' +
						 				'<li class="icon_wifi"></li>' +                           
						 				'<li class="icon_pool"></li>' +
						 				'<li class="icon_kidsclub"></li>' +
						 				'<li class="icon_spa"></li>' +
						 				'<li class="icon_shuttlebus"></li>' +
						 				'<li class="icon_biz"></li>' +
						 				'<li class="icon_park"></li>' +
						 			'</ul>'+
						 		'</div>' +
								 	'<h4 class="hotel_city">' +
								 		items.city +
								 	'</h4>'+
						 		'</div>' +
						 		
						 		'<div class="price_info">' +
									'<p class="price_info_p">1박 요금 최저가</p>' +
									'<p class="price_info_p2">'+ items.price +'원</p>' +
									'<p class="tax_include">(세금,봉사료 포함)</p>' +
									'<input type="button" id="search_room'+index+'" class="search_room" value="객실조회 >" />' +                     
								'</div>' +
						 		
							'</div>' +
							
						'</li>' 
					
					);
					$('#'+'search_room'+index).on('click', function(){
						$('#hotel_search_form').append('<input type="hidden" name="hotel_name" value="'+items.hotel_name+'">');
						$('#hotel_search_form').attr("action", "/TwoTour/hotel/searchRoom.do");
						$('#hotel_search_form').submit();
					});
				
			});
			//주의사항 마지막에 뿌림
			$('#hotel_ul').append(hotel_notice);
			
			$('#result_cnt').html(data.totalA);
			
		},//success
		
		error: function(data){
					alert('페이지 에러. 잠시 후 접속 바람');
		}
		
		
	};

		

	$.ajax(params);
	


	//옵션 - 추천순, 가격순, 등급순, 평점순
	$('ul.option_ul li').on('click',function(){
		option = $(this).attr('id');
		
		if(option=='score_asc' || option=='score_desc'){
			alert('준비중입니다.');
			return;
		}

		pagingCount = 1;
		$('#hotel_ul li').remove();		//뿌린 데이터 삭제
		params.data.pg = '1';
		params.data.option = option;		//ajax 보낼 데이터에      클릭한 옵션 추가	
		$.ajax(params);						//새로운 ajax 전송
	});
	
	
	//옵션 - 가격
	var checkPrice = 0;
	var checkRank = 0;
	
	
 	$('ul#hotel_price li label').on('click', function(){
		price = $(this).attr('for');	
		var checked = false;
		
		if($("#"+price).is(":checked")){ //내가 체크되어있는 지 여부
			checked = true;		
		}

		if(checked){ //체크 해제
			checkPrice--;
		
			if(price == 'price1')
				delete params.data.price1;
			else if(price == 'price2')
				delete params.data.price2;
			else if(price == 'price3')
				delete params.data.price3;
			else if(price == 'price4')
				delete params.data.price4;
			else if(price == 'price5')
				delete params.data.price5;
			
		}else{	//체크
			checkPrice++;
		
			if(price == 'price1')
				params.data.price1 = price;
			else if(price == 'price2')
				params.data.price2 = price;
			else if(price == 'price3')
				params.data.price3 = price;
			else if(price == 'price4')
				params.data.price4 = price;
			else if(price == 'price5')
				params.data.price5 = price;
		
		}

		
		$('.hotel_list_class').remove();
		$('#hotel_notice_id').remove();
		$('#paging_li').remove();
		$('.nodata').remove();
		
		pagingCount = 1;
		params.data.pg = 1;
		params.data.checkPrice = checkPrice;
		$.ajax(params);
		
	}); 
 
	
	
	$('ul#hotel_rank li label').on('click', function(){
		star = $(this).attr('for');
		var checked = false;
	
		if($("#"+star).is(":checked")){ //내가 체크되어있는 지 여부
			checked = true;		
		}
				
		if(checked){ //체크 해제
			checkRank--;
		
			if(star == 'star1')
				delete params.data.star1;
			else if(star == 'star2')
				delete params.data.star2;
			else if(star == 'star3')
				delete params.data.star3;
			else if(star == 'star4')
				delete params.data.star4;
			else if(star == 'star5')
				delete params.data.star5;
		
		
		}else{	//체크
			checkRank++;
		
		
			if(star == 'star1')
				params.data.star1 = star;
			else if(star == 'star2')
				params.data.star2 = star;
			else if(star == 'star3')
				params.data.star3 = star;
			else if(star == 'star4')
				params.data.star4 = star;
			else if(star == 'star5')
				params.data.star5 = star;
		
		}
	
		
		$('#hotel_ul li').remove();
		pagingCount = 1;
		params.data.pg = 1;
		params.data.checkRank = checkRank;
		$.ajax(params);
 

	});
	
	$('#do_search').on('click', function(){
		if($('#title2_search_box').val()==''){}
		else{
			$('#title1_type1_box').val('');
			params.data.city = $('#title2_search_box').val();
			$('#hotel_ul li').remove();
			params.data.pg = 1;
			$.ajax(params);
		}
		pagingCount = 1;
		
	});
	
	
});

$(window).bind("beforeunload",function(){
	$('#body').css('height', '1350px');

});

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔/자유</title>

<style>

</style>

</head>
<body>

<div id="hotel_wrap">
	
	<form id="hotel_search_form" >
		<div id="hotel_search_box">
			<h4 class="title">검색 조건</h4>	
				<p class="type1">목적지</p>
					<input type="text" id="title1_type1_box" class="type_box"  style="width:160px;font-size:16px;font-weight:600;"/>
	
				<p class="type2">체크인/아웃</p>
					<p id="type2_box1" class="type_box"  style="width:100px;line-height:30px;font-family:Times New Roman;">${param.checkInDate }</p>
					<p id="type2_box2" class="type_box"  style="width:100px;line-height:30px;font-family:Times New Roman;float:left;">${param.checkOutDate }</p>
					<select id="type2_selectbox" class="type_box"  style="width:50px; height:30px; padding-left:0;">
						<option>1박</option>
						<option>2박</option>
					</select>
					
				<p class="type2">객실/인원</p>
					<select id="type3_box"  class="type_box" name="room_value"  style="width:160px">
						<option>객실 1 - 성인 1</option>
						<option>객실 1 - 성인 2(더블요청)</option>
						<option>객실 1 - 성인 3</option>
						<option>객실 두 개 이상 혹은 아동 포함</option>
					</select>
					
				<input type="button" class="search_button" value="검색하기" />
		</div>
	</form>
	
	<!-- 결과내 재검색 -->
	<form id="hotel_search_sub_form">
		<div id="hotel_search_sub_box">
		  <p class="title">목적지 재검색</p>	
			  <input type="text" id="title2_search_box" class="type_box" style="margin-top:14px;" />
		</div>
		<div id="do_search" style="position:absolute;z-index:10;
			  left:155px;cursor:pointer;top:410px;width:20px;height:20px;"></div>
	</form>
		
	
	<div id="hotel_search_menu_div">
		<ul class="hotel_search_menu">
			
			<!-- 1 -->
			<li class="hotel_search_menu_li">가격
				<ul id="hotel_price" class="hotel_search_sub_ul"> 
					<li id="">
						<input name="" class="" id="price1" onclick="" type="checkbox" value="10만원 이하" />
						<label for="price1" id="price1">10만원 이하<span>(10)</span></label>
					</li>
					<li id="">
						<input name="" class="" id="price2" onclick="" type="checkbox" value="10만원 이하" />
						<label for="price2" id="price2">10만원 ~ 15만원<span>(10)</span></label>
					</li>
					<li id="">
						<input name="" class="" id="price3" onclick="" type="checkbox" value="10만원 ~ 20만원" />
						<label for="price3" id="price3">15만원 ~ 20만원</label>
					</li>
					<li id="">
						<input name="" class="" id="price4" onclick="" type="checkbox" value="25만원 ~ 30만원" />
						<label for="price4" id="price4">20만원 ~ 25만원</label>
					</li>
					<li id="">
						<input name="" class="" id="price5" onclick="" type="checkbox" value="25만원 이상" />
						<label for="price5" id="price5">25만원 이상</label>
					</li>
				</ul>
			</li>
			
			<!-- 2 -->
			<li class="hotel_search_menu_li">등급
				<ul id="hotel_rank" class="hotel_search_sub_ul"> 
					<li>
						<input name="" class="" id="star5" onclick="" type="checkbox" value="five_star" />
						<label for="star5">
							<img alt="five_star" src="/TwoTour/image/ico_grade_star_5.png" /> 
							<span>(10)</span>
						</label>
					</li>
					<li>
						<input name="" class="" id="star4" onclick="" type="checkbox" value="four_star" />
						<label for="star4">
							<img alt="four_star" src="/TwoTour/image/ico_grade_star_4.png" />
							<span>(10)</span>
						</label>
					</li>
					<li>
						<input name="" class="" id="star3" onclick="" type="checkbox" value="three_star" />
						<label for="star3">
							<img alt="three_star" src="/TwoTour/image/ico_grade_star_3.png" />
							<span>(10)</span>
						</label>
					</li>
					<li>
						<input name="" class="" id="star2" onclick="" type="checkbox" value="two_star" />
						<label for="star2">
							<img alt="two_star" src="/TwoTour/image/ico_grade_star_2.png" />
							<span>(10)</span>
						</label>
					</li>
					<li>
						<input name="" class="" id="star1" onclick="" type="checkbox" value="one_star" />
						<label for="star1">
							<img alt="one_star" src="/TwoTour/image/ico_grade_star_1.png" />
							<span>(10)</span>
						</label>
					</li>
					
				</ul>
			</li>
			
			<!-- 3 -->
			<li class="hotel_search_menu_li2">부대시설
				<ul class="hotel_search_sub_ul2 more" style="height:165px;"> 
					<li>
						<input name="wi-fi" class="" id="wi-fi" onclick="" type="checkbox" value="Wi-Fi(공공장소)" />
						<label for="wi-fi">Wi-Fi(공공장소)&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="restaurant" class="" id="restaurant" onclick="" type="checkbox" value="레스토랑" />
						<label for="restaurant">레스토랑&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="massage_shop" class="" id="massage_shop" onclick="" type="checkbox" value="마사지샵" />
						<label for="massage_shop">마사지샵&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="inner_pool" class="" id="inner_pool" onclick="" type="checkbox" value="실내수영장" />
						<label for="inner_pool">실내수영장&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="outdoor_pool" class="" id="outdoor_pool" onclick="" type="checkbox" value="실외수영장" />
						<label for="outdoor_pool">실외수영장&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="spa" class="" id="spa" onclick="" type="checkbox" value="스파" />
						<label for="spa">스파&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="hall" class="" id="hall" onclick="" type="checkbox" value="연회장" />
						<label for="hall">연회장&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="kidsclub" class="" id="kidsclub" onclick="" type="checkbox" value="키즈클럽" />
						<label for="kidsclub">키즈클럽&nbsp;&nbsp;<span>(10)</span></label>
					</li>
				</ul>
			</li>
			
			<!-- 4 -->
			<li class="hotel_search_menu_li2">객실시설
			
				<ul class="hotel_search_sub_ul2 more" style="height:165px;"> 
					<li>
						<input name="wi-fi2" class="" id="wi-fi2" onclick="" type="checkbox" value="Wi-Fi2" />
						<label for="wi-fi2">Wi-Fi&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="minibar" class="" id="minibar" onclick="" type="checkbox" value="미니바" />
						<label for="minibar">미니바&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="balcony" class="" id="balcony" onclick="" type="checkbox" value="발코니/테라스" />
						<label for="balcony">발코니/테라스&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="kitchen" class="" id="kitchen" onclick="" type="checkbox" value="부엌" />
						<label for="kitchen">부엌&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="safe" class="" id="safe" onclick="" type="checkbox" value="안전금고" />
						<label for="safe">안전금고&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="Jacuzzi" class="Jacuzzi" id="Jacuzzi" onclick="" type="checkbox" value="자쿠지" />
						<label for="Jacuzzi">자쿠지&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="coffemaker" class="" id="coffemaker" onclick="" type="checkbox" value="커피메이커" />
						<label for="coffemaker">커피메이커&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="tv" class="" id="tv" onclick="" type="checkbox" value="텔레비젼" />
						<label for="tv">텔레비젼&nbsp;&nbsp;<span>(10)</span></label>
					</li>
				</ul>
			</li>
			
			<!-- 5 -->
			<li class="hotel_search_menu_li2">부가서비스
			
				<ul class="hotel_search_sub_ul2 more" style="height:170px;"> 
					<li>
						<input name="nanny"  id="nanny" onclick="" type="checkbox" value="보모서비스" />
						<label for="nanny">보모서비스&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="porterage" id="porterage" onclick="" type="checkbox" value="포터리지서비스" />
						<label for="porterage">포터리지서비스&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="roomservie" id="roomservie" onclick="" type="checkbox" value="룸서비스" />
						<label for="roomservie">룸서비스&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="shuttlebus" id="shuttlebus" onclick="" type="checkbox" value="셔틀버스" />
						<label for="shuttlebus">셔틀버스&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="concierge"  id="concierge" onclick="" type="checkbox" value="컨시어지" />
						<label for="concierge">컨시어지&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="rentcardesk" id="rentcardesk" onclick="" type="checkbox" value="렌터카 데스크" />
						<label for="rentcardesk">렌터카 데스크&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="laundry" id="laundry" onclick="" type="checkbox" value="세탁서비스" />
						<label for="laundry">세탁서비스&nbsp;&nbsp;<span>(10)</span></label>
					</li>
					<li>
						<input name="animal" id="animal" onclick="" type="checkbox" value="애완동물동반" />
						<label for="animal">애완동물동반&nbsp;&nbsp;<span>(10)</span></label>
					</li>
				</ul>
			</li>
			
		
		
		
		</ul>
	</div>
	
<!-- 오른쪽 전체 div -->
<div id="hotel_right_wrap">
	
	<!-- 검색결과 -->
	<div id="search_result_wrap01">
		<strong id="hotel_search_result">검색결과</strong> 
		<p>(총<span id="result_cnt"></span>건)</p>
	</div>

	
	<!-- 순서 -->
	<div id="option_list">
		<div id="score" class="option_class" style="border-radius:0 2px 2px 0"><span>평점순</span>
			<ul class="option_ul">
			  <li id="score_asc">평점낮은순</li>
			  <li id="score_desc">평점높은순</li>
			</ul>
		</div>
		<div id="rank" class="option_class" style="border-right:1px;"><span>등급순</span>
			<ul class="option_ul">
			  <li id="rank_asc">등급낮은순</li>
			  <li id="rank_desc">등급높은순</li>
			</ul>
		</div>
		<div id="price" class="option_class" style="border-right:1px;"><span>가격순</span>
			<ul class="option_ul">
			  <li id="price_asc">가격낮은순</li>
			  <li id="price_desc">가격높은순</li>
			</ul>
		</div>
		<div id="recommend" class="default" style="border-right:1px;"><span>추천순</span></div>
	</div>
	
	
	
	
	<!-- 호텔 -->
	<div id="hotels">
		<ul id="hotel_ul" style="position:relative;">

			
		</ul>
	
		
	</div>
	
	

</div>
	
<div class="hotelpaging" id="hotelpaging_next" style="position:absolute;left:1100px;top:400px;">
	<p style="color:white;" >></p></div>
<div class="hotelpaging" id="hotelpaging_pre" style="position:absolute;left:-100px;top:400px;">
	<p style="color:white;"><</p></div>
</div>


</body>
</html>


















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/packageTrip/productList.css" />
<link rel="stylesheet" type="text/css" href="../css/packageTrip/global.css"/>
<link rel="stylesheet" href="/TwoTour/css/hotel/mainpage.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

$(document).ready(function(){ 
	$('#body').css('height', '1300px');
	
	var date_productList = new Date();
	
	calendar_productList(date_productList.getFullYear(), date_productList.getMonth());
		

	//전체메뉴
	 $('#whole_menu').click(function(){
		  if($('#whole_menu_div').css('visibility')=='hidden'){
			  $('#whole_menu_div').hide();
			  $('#search_room_wrap').css('z-index','0');
			  $('#search_room_wrap').css('opacity','1');
		  }
		  else if($('#whole_menu_div').css('visibility')=='visible'){
			  $('#whole_menu_div').show();
			  $('#search_room_wrap').css('z-index','-1');
			  $('#search_room_wrap').css('opacity','0.1');
		  }
	  }); 
	
	
	//결제하기 버튼효과
	$('#pay_hotel').mouseenter(function(){
		$(this).css('background-color', '#ff5e8f' );
	}).mouseleave(function(){
		$(this).css('background-color', '#e85581' );
	});
	//장바구니 버튼효과
	$('#basket_hotel').mouseenter(function(){
		$(this).css({'background-color':'#ff5e8f', 'color':'white'} );
	}).mouseleave(function(){
		$(this).css({'background-color' : 'white', 'color': '#ff5e8f'} );
	});
	
	var search = "http://localhost:8080/TwoTour/hotel/searchRoom.do?hotel_name="+encodeURI('${hotelDTO.hotel_name}');
	var hotel_url= "/TwoTour/packageTrip/basket.do?id=${memId}&product_name=${hotelDTO.hotel_name}&depart_date=${room_value }&adult_price=${hotelDTO.price}&teen_price=${hotelDTO.price}&baby_price=${hotelDTO.price}&search="+search

	//장바구니
	$('#basket_hotel').on('click', function(){
		if('${memId}'==''){
			alert("로그인 하세요");
			
		}
		else{
			alert("장바구니에 담았습니다.");
			location.href=hotel_url;
		}
		
	});
	
	//calendar 
	$('.table_calendar > tbody > tr > td').on('click','a',function(){
			var date = $(event.target).text();
			if(date.length==1){
				date = '0'+date;
				alert(date);
			}
	});	
	
	
	//결제하기 클릭
	$('#pay_hotel').click(function(){
		if('${memId}'==''){
			alert("로그인 하세요");
		}
		else{
			$('#do_pay_check').css("visibility","visible");
			$('#search_room_wrap').css("opacity","0.2");
		}
	});
	//결제하기 - yes
	$('#modify_pay_complete').on('click', function(){
		$('#form_room').append('<input type="hidden" name="id" value="${memId}">');
		$('#form_room').append('<input type="hidden" name="hotel_name" value="${hotelDTO.hotel_name }">');
		$('#form_room').append('<input type="hidden" name="hotel_url" value="'+search+'">');
		$('#form_room').append('<input type="hidden" name="total_price" value="${hotelDTO.price }">');
		$('#form_room').append('<input type="hidden" name="checkin" value="${hotelDTO.checkIn }">');
		$('#form_room').append('<input type="hidden" name="checkout" value="${hotelDTO.checkOut }">');
		$('#form_room').attr('action', '/TwoTour/packageTrip/hotelPayComplete.do');
		$('#form_room').submit();
	});
	//결제하기 - no
	$('#modify_pay_cancel').on('click', function(){
		$('#do_pay_check').css("visibility","hidden");
		$('#search_room_wrap').css("opacity","1");
	});

	
	$("select[name=room_value2]").change(function(){
		if($("select[name=room_value2]").val()=='객실 1 - 성인 2(더블요청)'){
			$('#addPrice').html('<h2 style="font-size:18px"> + 10,000원 </h2>');
		}else if($("select[name=room_value2]").val()=='객실 1 - 성인 3'){
			$('#addPrice').html('<h2 style="font-size:18px"> + 20,000원 </h2>');
		}else{
			$('#addPrice').html('');
		}
	});	
	
});

</script>

<script>

	function before_month(){
	
		var this_month = window.document.getElementById("this_month").innerHTML;
		//alert(this_month);
		var ar = this_month.split(".");
		
		var year= ar[0];
		var month = ar[1];
		
	
		if(month==1){
			month=12;
			year= parseInt(year)-1;
		}else{
			month=parseInt(month)-1;
		}

		calendar_productList(year,parseInt(month)-1); 
		
		$('#this_month').text(year+'.'+month);
	}

	function after_month(){
		
		var this_month = window.document.getElementById("this_month").innerHTML;
		//alert(this_month);
		var ar = this_month.split(".");
		
		var year= ar[0];
		var month = ar[1];
		
		if(month==12){
			month=1;
			year=parseInt(year)+1;
		}else{
			month=parseInt(month)+1;
		}
	    calendar_productList(year,parseInt(month)-1);
		
		$('#this_month').text(year+'.'+month);
	}


	function calendar_productList(year,month){
		//alert($('.table_calendar > thead > tr > td').length);
		$('.table_calendar > thead > tr > th').remove();
		$('.table_calendar > tbody > tr > td').remove();

		var date = new Date();
		date.setFullYear(year,month,1);
		var endDay = new Date(year,month+1,0).getDate();
		
		for(var i=1; i<=endDay; i++){
			var day = date.getDay();

			if(day==0){
				$("<th/>",{
					text: "일",
					id: "sun",
					class: "sun"
				}).appendTo($('.table_calendar > thead > tr'));
			}
			else if(day==1){
				$("<th/>",{
					text: "월"
				}).appendTo($('.table_calendar > thead > tr'));
			}
			else if(day==2){
				$("<th/>",{
					text: "화"
				}).appendTo($('.table_calendar > thead > tr'));
			}
			else if(day==3){
				$("<th/>",{
					text: "수"
				}).appendTo($('.table_calendar > thead > tr'));
			}
			else if(day==4){
				$("<th/>",{
					text: "목"
				}).appendTo($('.table_calendar > thead > tr'));
			}
			else if(day==5){
				$("<th/>",{
					text: "금"
				}).appendTo($('.table_calendar > thead > tr'));
			}
			else if(day==6){
				$("<th/>",{
					text: "토",
					id: "sat",
					class: "sat"
				}).appendTo($('.table_calendar > thead > tr'));
			}

			date.setDate(date.getDate()+1);
		} 
			
		for(var i=1; i<=endDay; i++){
			$("<td/>",{}).append($("<a/>",{
				id: i,
				text: i,
			})).appendTo($('.table_calendar > tbody > tr'));
		}
		
	}
	



</script>	
<style>
a{cursor:pointer;}
#do_pay_check{
	visibility:hidden; position:absolute; width:300px; height:100px; border:1px solid red; top:570px; left:300px; text-align:center; padding-top:15px; color:black; border:1px solid #EC008C; 
}
#modify_pay_complete{
	position:absolute; width:75px; height:24px;  padding-top:8px; top:60px; left:65px;
	font:12px Tahoma, Arial; background-color:white; border:1px solid grey; text-align:center; color:black; cursor:pointer;
}
#modify_pay_cancel{
	position:absolute; width:75px; height:24px;  padding-top:8px; top:60px; left:155px;
	font:12px Tahoma, Arial; background-color:white; border:1px solid grey; text-align:center; color:black; cursor:pointer;
}
</style>

</head>
<body>
<div id="search_room_wrap">

<h4 class="city">${hotelDTO.city } / 2018-01-13 / 2018-01-14 / ${room_value }</h4>

<div id="searchRoomWrap">

	<div id="hotel_heading">
		<div>
		<h1>${hotelDTO.hotel_name }</h1>
		 <img src="/TwoTour/image/ico_grade_star_${hotelDTO.rank }.png" 
		 	  width="70" style="margin-top:35px;"/>
		</div>
		<h3>${hotelDTO.hotel_eng_name }</h3>
		<h4>위치 : ${hotelDTO.location }</h4>
		<div id="hotel_icons"><img src="/TwoTour/image/hotel_icons.PNG"></div>
	</div>

	<div id="hotel_img">
		<img src="/TwoTour/image/hotel/${hotelDTO.imageName }" width="600px" height="400px"/> 
	</div>

	<div id="hotel_room_info">
		<div id="charge_label">&nbsp;&nbsp;1박 요금 최저가</div>
	</div>
	<div class="price_info" id="price_info">
		<p class="price_info_p2">${hotelDTO.price }원</p>
		<p class="tax_include">(세금,봉사료 포함)</p>
	</div>
</div>

	<div class="hotel_accommodations" id="hotel_acc"> 
			<ul class="hotel_accommodations_ul">
				<li class="icon_wifi"></li>                         
				<li class="icon_pool"></li>
				<li class="icon_kidsclub"></li>						 			
				<li class="icon_spa"></li>
				<li class="icon_shuttlebus"></li>
				<li class="icon_biz"></li>
				<li class="icon_park"></li>
			</ul>
			<div>
 			<p><b>call</b>: ${hotelDTO.call }</p>
 			<p><b>homepage</b>: ${hotelDTO.homepage }</p>
			</div>
	</div>
	
<form id="form_room">		
	<div class="attraction pop_tool">  
		<p class="type2" style="margin-top:10px;margin-bottom:10px;font-size:15px;font-weight:600">객실 / 인원</p>
		<select class="type_box" name="room_value2" style="width:160px;float:left;">
			<option selected>객실 1 - 성인 1</option>
			<option>객실 1 - 성인 2(더블요청)</option>
			<option>객실 1 - 성인 3</option>
		</select>
		<div  id="addPrice" style="position:absolute;left:180px;width:100px;height:30px;"></div>
	</div>	
</form>	

	<div id="getArea">
	<input type="button" id="basket_hotel" class="search_room" value="장바구니" />
	<input type="button" id="pay_hotel" class="search_room" value="결제하기" />
	</div>
	
<div id="choose_date">
	<div class="startday_list" style="width:900px">
		<div class="month_select" id="APP118">
			<button type="button" class="before" title="이전달" onclick="javascript:before_month();">
				<!-- <span class="ir">2017.11</span> -->
			</button>
			<strong id="this_month" class="this_month">2018.1</strong>
			<button type="button" class="after" title="다음달" onclick="javascript:after_month();">
				<!-- <span class="ir">2018.01</span> -->
			</button>
			<div class="info_reservation type02">
				<ul>
					<li class="start_imt"><span></span>출발가능</li>
					<li class="res_imt"><span></span>예약가능</li>
				</ul>
				<div class="qs_layer">
					<a href="javascript:;" class="ico qs_02" title=""></a>
					<div class="laypop_txt">
						<span class="blut"></span>
						<ul>
							<li class="start_imt">
								<em>ㆍ</em><span>출발가능<em>-</em></span>
								<p>최소 출발 인원 이상 예약된 상품으로<br>예약과 동시에 출발 확정인 상품입니다.</p>
							</li>
							<li class="res_imt">
								<em>ㆍ</em><span>예약가능<em>-</em></span>
								<p> 예약은 가능하나 최소 출발 인원이 부족하여<br>출발 미정인 상품입니다.</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	
		<table class="table_calendar" width="100%" cellpadding="0" cellspacing="0" summary="출발월달력">
			<caption>출발일 날짜 선택하기</caption>
			<thead>
				<tr></tr>
			</thead>
			<tbody>
				<tr></tr>
			</tbody>
		</table>

	</div>
</div>
	
<div id="hotel_info_detail">

	<div class="box">
		<strong class="subject">호텔 소개</strong>
		<p> ${hotelDTO.content }<br>
			<br><br>[호텔 공지사항 안내]<br>
			- 내용 : 법정 점거에 의한 전관 정전/판매 일시정지<br>
			- 일자 : 2018년 4월 23일(월) 1:30AM ~ 5:00AM 예정<br>
			- 일자 : 2018년 11월 5일(월)  1:30AM ~ 5:00AM 예정 <br>
			* 해당 일자에 객실 내 전기 사용은 불가능합니다(전원, 냉장고, 온수 등)<br>
			* 해당 일자에 관내 엘리베이터 또한 사용 불가능하며 비상계단을 통해서만 이동 가능합니다.<br>
		</p>
	</div>
	
	<div class="box2">
		<strong class="subject">호텔 기본 정보</strong>
		<p style="font-size:16px;">
			- <b>도시</b> : ${hotelDTO.city }<br>
			------------------------------------------------------------------<br>
			- <b>연락처</b> : ${hotelDTO.call }<br>
			------------------------------------------------------------------<br>
			- <b>층 수 / 객실 수 </b> : ${hotelDTO.floor} 층 / ${hotelDTO.totalMem } 객실<br>
			------------------------------------------------------------------<br>
			- <b>체크 인 / 체크 아웃 </b> : ${hotelDTO.checkIn} / ${hotelDTO.checkOut}<br>
			------------------------------------------------------------------<br>
			- <b>위치 </b> : ${hotelDTO.location} <br>
			------------------------------------------------------------------<br>
			<br><br>
		
			객실 1 - 성인 2(더블요청) 의 경우 현재 금액의 +10,000원 추가됩니다.<br>
			객실 1 - 성인 3 의 경우 현재 금액의 +20,000원 추가됩니다.<br>
		</p>
	</div>

</div>


</div>
<div id="do_pay_check">
		신중히 선택하십시오.<br>
	지금 결제 버튼을 누르시면 수정 불가합니다.<br>
	
	<label id="modify_pay_complete">결제하기</label>
	<label id="modify_pay_cancel">취소하기</label>
</div>


</body>
</html>






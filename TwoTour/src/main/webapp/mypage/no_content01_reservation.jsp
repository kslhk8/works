<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="../css/mypage/mypage.css"/>

<style>
.infoMessage {width:660px;height:70px;position:absolute;left:20px;top:25px;margin-top:15px;padding:15px 0 20px 15px;
			  border:1px solid #CCC;background:#FBFBFB;}
.infoMessage h4 {font-size:12px;color:#E42885;}
.infoMessage ul li {padding-left:10px;margin-top:7px;font-size:11px;color:#777;}	

.SearchArea {height: 30px;padding: 7px 5px 0 3px; margin-top:10px;border: 1px solid #ccc;background-color: #f1f1f1;
			 position: absolute;top: 170px; left: 30px;}

select::-ms-expand {display:none;}  
select.type_select1 {height: 1.7em;width: 60px;margin-top: 1px;vertical-align: middle;border: solid 1px #808080;
	border-radius: 5px;
}

#booking01 {position:relative; margin-top:20px; margin-left:30px;}

#agent01 {position:relative; margin-top:20px; margin-left:30px;}

.comTab{height:7px;} 

ul.comTab li{display:inline-block;}

.tableLap{width:660px;top:30px;overflow:hidden;position:relative;margin-top:20px;}
#reservation_table td{text-align:center;}
#reservation_table td > a{cursor:pointer;}
table.tbDetailType5 .borderDDD{border: 1px solid #DDD;}
table.tbDetailType5 thead th{padding: 5px 0 5px 0;font-weight: normal;color: #333;letter-spacing:-1px;background: #FBFBFB;}
table.tbDetailType5 {color: #3d3d3d;font-weight:200;margin: 15px 0 0 0;border-color: #DDD;border-top: 1px solid #CCC;
					border-bottom: 1px solid #CCC;}

.estimate_write{position:relative;left:30px;margin-top:50px;width: 680px;height: 75px;
				background: url('http://image1.hanatour.com/2010/images/mypage/bg_write_box.gif') no-repeat 0 0;
}
.estimate_write ul { position:absolute;left: 110px;top: 12px;
}
.estimate_write ul > li{ margin-top:5px; }
.estimate_write .btn_write {display: inline-block;position: absolute;left: 580px;top: 20px;width: 84px;height: 30px;
    background: url('http://image1.hanatour.com/2010/images/mypage/btn_write.gif') no-repeat 0 0;vertical-align: top;
}

a:link {color:#808080;text-decoration: none;}
h1 {font-size:50px;}

p{positoin:relative;margin-top:30px;color:#5b5b5b;font-weight:bold;font-size:14px;}


</style>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){//페이지 오픈
	$('#body').css('height', '1600px');
	
	$('#reservation_table').on('click','.cancelButton',function(){
		alert("hi");
		$('#payCancelForm').submit();
	});
	
	//취소 버튼 클릭 시 효과
	$('#checkCanceling').on('click', function(){
		$('#reservation_table > tr').remove();
		$('#checkBooking').attr('src', 'http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown.gif');
		$(this).attr('src', 'http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown_on.gif');
	    $.ajax(reservationCancle);
		$.ajax(payCancel);	
	});
	
	//예약 버튼 클릭 시 효과
	$('#checkBooking').on('click', function(){
		$('#reservation_table > tr').remove();
		$('#checkCanceling').attr('src', 'http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown.gif');
		$(this).attr('src', 'http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown_on.gif');
		$.ajax(reservationParams);
		$.ajax(payInformParams);
	
	});
	
	//예약확인 목록 불러오기
	var reservationParams = {
	 	type:"POST",
        url:"/TwoTour/mypage/noReservationList.do",
        data:{'reservation_number':'${reservationInformDTO.reservation_number}'},
        dataType:"json",
        error: function(){
        	
        },
        success: function(data){
     	   if(data.reservationInformDTO==''||data.reservationInformDTO==undefined){
     		  
     	   }
     	   else{
     		 
        		$('#reservation_table > tbody').remove();
        		

        			var packCode = data.reservationInformDTO.package_code;
        			data.reservationInformDTO.total_price = (data.reservationInformDTO.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
        			$('#reservation_table').append(
        				'<tr>' +
        					'<td><a id="'+data.reservationInformDTO.reservation_number+'">'+data.reservationInformDTO.reservation_number+'</a></td>' +
        					'<td>'+data.reservationInformDTO.logtime + '</td>' +
        					'<td><a id="'+data.reservationInformDTO.package_code+'">'+data.reservationInformDTO.package_name+'</a></td>' +
        					'<td>'+data.reservationInformDTO.total_price+'원</td>' +
        					'<td>'+data.reservationInformDTO.total_member+'</td>' + 
        					'<td>'+data.reservationInformDTO.depart_time+'<br>'+
        					data.reservationInformDTO.arrive_time+'</td>'+
        					'<td style="color:blue">'+data.reservationInformDTO.status+'</td>' +
        					'<td></td>'+
       	        		'</tr>' 
        				
        			);
        			//상품명 클릭 시 여행자 정보 페이지로 감
        			$('#'+data.reservationInformDTO.package_code).on('click',function(){
        				$('#reservationForm').append(
        					'<input type="hidden" name="num" value="'+data.reservationInformDTO.reservation_number+'"/>' +
        					'<input type="hidden" name="package_code" value="'+data.reservationInformDTO.package_code+'"/>' +
        					'<input type="hidden" name="package_name" value="'+data.reservationInformDTO.package_name+'"/>' 
        				); 
        			$('#reservationForm').submit();
        				
        			});
     	   		
        	}
       }
	}//reservationParams
	
	//예약취소 목록 불러오기
	var reservationCancle = {
		 	type:"POST",
	        url:"/TwoTour/mypage/noReservationCancle.do",
	        data:{'reservation_number' : '${reservationInformDTO.reservation_number}'},
	        dataType:"json",
	        error: function(){
	        	
	        },
	        success: function(data){
	      	   if(data.reservationInformDTO==''||data.reservationInformDTO==undefined){

	      	   }else{
	        		$('#reservation_table > tbody').remove();
	 
	        			data.reservationInformDTO.total_price = (data.reservationInformDTO.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
	        			$('#reservation_table').append(
	        				'<tr>' +
	        					'<td><a id="'+data.reservationInformDTO.reservation_number+'">'+data.reservationInformDTO.reservation_number+'</a></td>' +
	        					'<td>'+data.reservationInformDTO.logtime + '</td>' +
	        					'<td><a>'+data.reservationInformDTO.package_name+'</a></td>' +
	        					'<td>'+data.reservationInformDTO.total_price+'원</td>' +
	        					'<td>'+data.reservationInformDTO.total_member+'</td>' + 
	        					'<td>'+data.reservationInformDTO.depart_time+'<br>'+
	        					data.reservationInformDTO.arrive_time+'</td>'+
	        					'<td style="color:blue">'+data.reservationInformDTO.status+'</td>' +
	        					'<td></td>'+
	       	        		'</tr>' 
	        			);
	        			$('#'+data.reservationInformDTO.reservation_number).on('click',function(){
	        				$('#reservationForm').append(
	        					'<input type="hidden" name="num"' +
	        					'value="'+data.reservationInformDTO.reservation_number+'"/>' +
	        					'<input type="hidden" name="status"' +
	        					'value="'+data.reservationInformDTO.status+'"/>'
	        				); 
	        				$('#reservationForm').submit();
	        				
	        			});
	        			
	     	   		
	        	}
	       }
		}//reservationCancle
		
		alert("pay_number:"+'${payInformDTO.pay_number}');
	//결제확인 목록 불러오기
	var payInformParams = {
	 	   type:"POST",
	       url:"/TwoTour/mypage/noPayInform.do",
	       data:{'pay_number' : '${payInformDTO.pay_number}'},
	       dataType:"json",
	       error:function(){
	    	   
	       },
	       success: function(data){
	    	   if(data.payInformDTO==''||data.payInformDTO==undefined){}
	    	   else{
	       		$('#reservation_table > tbody').remove();
	       		data.payInformDTO.total_price = (data.payInformDTO.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
	       			$('#reservation_table').append(
	       				'<tr>' +
	       					'<td><a id="'+data.payInformDTO.pay_number+'">'+data.payInformDTO.pay_number+'</a></td>' +
	       					'<td>'+data.payInformDTO.logtime + '</td>' +
	       					'<td><a>'+data.payInformDTO.package_name+'</a></td>' +
	       					'<td>'+data.payInformDTO.total_price+'원</td>' +
	       					'<td>'+data.payInformDTO.total_member+'</td>' + 
	       					'<td>'+data.payInformDTO.depart_time+'<br>'+
	       					data.payInformDTO.arrive_time+'</td>' +
	       					'<td style="color:red">'+data.payInformDTO.status+'</td>' +
	       					'<td style="text-align:center"><input type="button" value="결제취소" class="cancelButton"/></td>'+

	       				'</tr>' 
	       			
	       			);
	       			$('#'+data.payInformDTO.pay_number).on('click',function(){
        				$('#reservationForm').append(
        					'<input type="hidden" name="num"' +
        					'value="'+data.payInformDTO.pay_number+'"/>' +
        					'<input type="hidden" name="status"' +
        					'value="'+data.payInformDTO.status+'"/>'
        				); 
        				$('#reservationForm').submit();
        				
        			});
	    	   
	       	}
	     }
	}//payInformParams
	
	//결제취소 목록 불러오기
	var payCancel = {
		 	   type:"POST",
		       url:"/TwoTour/mypage/noPayCancel.do",
		       data:{'pay_number' : '${payInformDTO.pay_number}'},
		       dataType:"json",
		       error:function(){
		    	   }
		       ,
		       success: function(data){
		    	   if(data.payInformDTO==''||data.payInformDTO==undefined){}
		    	   else{
		    		$('#reservation_table > tbody').remove();
		       		
		    		data.payInformDTO.total_price = (data.payInformDTO.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
		       			$('#reservation_table').append(
		       				'<tr>' +
		       					'<td><a id="'+data.payInformDTO.pay_number+'">'+data.payInformDTO.pay_number+'</a></td>' +
		       					'<td>'+data.payInformDTO.logtime + '</td>' +
		       					'<td><a>'+data.payInformDTO.package_name+'</a></td>' +
		       					'<td>'+data.payInformDTO.total_price+'원</td>' +
		       					'<td>'+data.payInformDTO.total_member+'</td>' + 
		       					'<td>'+data.payInformDTO.depart_time+'<br>'+
		       					data.payInformDTO.arrive_time+'</td>' +
		       					'<td style="color:red">'+data.payInformDTO.status+'</td>' +
		       					'<td></td>'+
		       				'</tr>' 
		       			
		       			); 
		       			$('#'+data.payInformDTO.pay_number).on('click',function(){
	        				$('#reservationForm').append(
	        					'<input type="hidden" name="num"' +
	        					'value="'+data.payInformDTO.pay_number+'"/>' +
	        					'<input type="hidden" name="status"' +
	        					'value="'+data.payInformDTO.status+'"/>'
	        				); 
	        				$('#reservationForm').submit();
	        				
	        			});
		    	  
		       	}
		     }
		}//payCancel
			
	
	
	
    $.ajax(reservationParams);
	$.ajax(payInformParams);
	 
	
});
$(window).bind('beforeunload', function(){//페이지 클로즈 시
	$('#body').css('height', '1350px');
});
</script>
</head>
<body>
<form id="payCancelForm" action="/TwoTour/packageTrip/noPayDelete.do">
<input type="hidden" name="package_code" value="${payInformDTO.package_code }">
<input type="hidden" name="pay_number" value="${payInformDTO.pay_number }">
<input type="hidden" name="total_price" value="${payInformDTO.total_price }">
</form>
<div id="wrap" style="position:absolute;padding:10px 10px">
<!-- 예약확인 -->
<h4 style="margin-left:10px;">
	<img alt="예약확인" src="http://image1.hanatour.com/2010/images/mypage/h_single_confirmation.gif">
</h4>
<div class="infoMessage">
	<h4>안내</h4>
	<ul>
		<li>1. <b>예약코드를 클릭</b>하시면 예약상세 페이지 확인이 가능하며, 개별상품별 <b>결제가 가능</b>합니다.</li>
		<li>2. 예약 수정 및 취소하고싶은 경우 예약코드혹은 상품명 클릭 후 상세 페이지에서 가능합니다.</li>
		<li>3. 여권상의 유효기간은 반드시 6개월 이상 남아 있어야 합니다. 필요시 유효기간 연장이나 재발급 등의 확인을 부탁드립니다.</li>
	</ul>
</div>



<!-- 웹사이트 예약 -->
<div style="position:absolute;top:140px;left:40px;"><p>웹사이트예약 및 결제</p></div>

<div id="booking01" style="margin-top:180px;">
	<ul class="comTab">
		<li>
			<img id="checkBooking" name="Bookingimg" id="Bookingimg" style="cursor: pointer;" alt="예약내역" 
				 src="http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown_on.gif" />
		</li>
		<li>
			<img id="checkCanceling" name="Cancelimg" id="Cancelimg" style="cursor: pointer;" alt="취소내역" 
				 src="http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown.gif" />
		</li>
	</ul>
	<div class="tableLap">
		<form id="reservationForm" action="/TwoTour/packageTrip/no_reservationInformView.do" method="POST">
			<table id="reservation_table" width="100%" class="tbDetailType5" rules="all" frame="void" cellspacing="0">
				<colgroup>
					<col width="13%">
					<col width="13%">
					<col width="*">
					<col width="13%">
					<col width="5%">
					<col width="10%">
					<col width="11%">
					<col width="9%">
					<col width="10%">
					
				</colgroup>
				<thead>
					<tr>
						<th class="borderDDD">예약/결제코드</th>
						<th class="borderDDD">예약/결제날짜</th>
						<th class="borderDDD">상품명</th>
						<th class="borderDDD">총 결제금액</th>
						<th class="borderDDD">인원</th>
						<th class="borderDDD">출발일/<br>귀국일</th>
						<th class="borderDDD">예약상태</th>
						<th class="borderDDD">비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="tbody" height="50" align="center" colspan="7">예약내역이 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div> <!-- booking01 -->
<div class="estimate_write">
		<ul>
			<li>
          		용범닷컴 예약의 경우 <span>상품을 직접 예약한 고객</span>에게만 예약내역이 노출됩니다.<br>
        	</li>
        	<li>
        		<strong>상품평 작성을 원하는 동반 고객</strong>은 우측에 있는 '상품평 작성'버튼을 클릭해 주세요.
        	</li>
			<li>
      		    작성하신 글은 <a href=""> 마이페이지 &gt; 참여내역 &gt; 여행후기 </a>에서 확인 및 수정이 가능합니다.
   			</li>
		</ul><a href="javascript:goWrite();" class="btn_write"><span class="ir"></span></a>
</div> 	


<!-- 대리점 예약 -->
<div style="position:relative; margin-top:40px;margin-left:30px;"><p>대리점 및 콜센터 예약</p></div>

<div id="agent01">
	<ul class="comTab" style="margin-top:0;">
		<li><img src="http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown_on.gif" id="Bookingimg2" name="Bookingimg2" onClick="javascript:goBookingList('A');" alt="예약내역" style="cursor:pointer;"></li>
		<li><img src="http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown.gif" id="Cancelimg2" name="Cancelimg2" onClick="javascript:goBookingList('C');" alt="취소내역" style="cursor:pointer;"></li>
	</ul>
	<div class="tableLap">
		<table class="tbDetailType5" width="100%" cellspacing="0" cellpadding="0" frame="void" rules="all">
			<colgroup>
			<col width="15%">
			<col width="*">
			<col width="5%">
			<col width="10%">
			<col width="11%">
			<col width="9%">
			<col width="9%">
			</colgroup>
			
			<thead>
				<tr>
					<th class="borderDDD">
				                  예약날짜 /<br> 예약코드
				                </th>
					<th class="borderDDD">상품명</th>
					<th class="borderDDD">인원</th>
					<th class="borderDDD">
					                  출발일/<br>귀국일
					                </th>
					<th class="borderDDD">여행도우미</th>
					<th class="borderDDD">예약상태</th>
					<th class="borderDDD">상품평</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td align="center" colspan="7" height="50">예약내역이 없습니다.</td>
			</tr>
			</tbody>
		</table>
	</div>
</div><!-- agent01 -->

<!-- 렌터카 예약 -->
<div style="position:relative; margin-top:60px;margin-left:30px;padding:10px 10px;" ><p>렌터카 예약</p></div>
<div id="rentcar01">
	<ul class="comTab" style="margin-left:30px;">
		<li><img name="Bookingimg2" id="Bookingimg2" style="cursor: pointer;" onclick="javascript:goBookingList('A');" alt="예약내역" src="http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown_on.gif"></li>
		<li><img name="Cancelimg2" id="Cancelimg2" style="cursor: pointer;" onclick="javascript:goBookingList('C');" alt="취소내역" src="http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown.gif"></li>
	</ul>
	
	<div class="tableLap" style="left:30px;">
		<table width="100%" class="tbDetailType5" rules="all" frame="void" cellspacing="0" cellpadding="0">
			<colgroup>
			<col width="15%">
			<col width="*">
			<col width="15%">
			<col width="15%">
			<col width="15%">
			</colgroup>
<thead>
<tr>
<th class="borderDDD">
                  예약날짜 /<br>예약번호(업체)
                </th>
<th class="borderDDD">상품명</th>
<th class="borderDDD">예약구분</th>
<th class="borderDDD">
                  대여일/<br>반납일
                </th>
<th class="borderDDD">예약상태</th>
</tr>
</thead>
<tbody>
<tr>
<td height="50" align="center" colspan="5">예약내역이 없습니다.</td>
</tr>
</tbody>
</table>
</div>
</div>

</div>
</body>
</html>











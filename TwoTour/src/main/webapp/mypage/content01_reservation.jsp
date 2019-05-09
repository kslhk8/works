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
table.tbDetailType5 td{text-align:center;}
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
	
	var booking_breakdown = 'http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown.gif';
	var booking_breakdown_on = 'http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown_on.gif';
	var cancel_breakdown = 'http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown.gif';
	var cancel_breakdown_on = 'http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown_on.gif';
	
	
	//패키지 -- 취소 버튼 클릭 시
	$('.checkCanceling').on('click', function(){
		$('#reservation_table > tr').remove();
		$('.checkBooking').attr('src', booking_breakdown );
		$(this).attr('src', cancel_breakdown_on);
	    $.ajax(reservationCancle);
		$.ajax(payCancel);	
	});
	
	//패키지 -- 예약 버튼 클릭 시 
	$('.checkBooking').on('click', function(){
		$('#reservation_table > tr').remove();
		$('.checkCanceling').attr('src', cancel_breakdown );
		$(this).attr('src', booking_breakdown_on);
		$.ajax(reservationParams);
		$.ajax(payInformParams);
	
	});
	//항공 -- 취소 버튼 클릭 시
	$('#airplane_checkCanceling').on('click', function(){
		$('#airplane_table > tr').remove();
		$('#airplane_checkBooking').attr('src', booking_breakdown );
		$(this).attr('src', cancel_breakdown_on);
	    $.ajax(airPayCancel);
		
	});
	
	//항공 -- 예약 버튼 클릭 시 
	$('#airplane_checkBooking').on('click', function(){
		$('#airplane_table > tr').remove();
		$('#airplane_checkCanceling').attr('src', cancel_breakdown );
		$(this).attr('src', booking_breakdown_on);
		$.ajax(airPayInformParams);
	
	
	});
	
	//호텔 -- 취소 버튼 클릭 시
	   $('#hotel_checkCanceling').on('click', function(){
	      $('#hotel_reservation_table > tr').remove();
	      $('#hotel_checkBooking').attr('src', booking_breakdown );
	      $(this).attr('src', cancel_breakdown_on);
	      $.ajax(hotelPaymentCancelList);   
	   });
	
	   //호텔 -- 예약 버튼 클릭 시 
	   $('#hotel_checkBooking').on('click', function(){
	      $('#hotel_reservation_table > tr').remove();
	      $('#hotel_checkCanceling').attr('src', cancel_breakdown );
	      $(this).attr('src', booking_breakdown_on);
	      $.ajax(hotelPaymentList);
	   
	   });
	
	//렌터카 -- 취소 버튼 클릭 시
	$('#rentcar_checkCanceling').on('click', function(){
		$('#rentCar_table > tr').remove();
		$('#rentcar_checkBooking').attr('src', booking_breakdown );
		$(this).attr('src', cancel_breakdown_on);
	    $.ajax(rentPayCancel);
		//$.ajax(payCancel);	
	});
	
	//렌터카 -- 예약 버튼 클릭 시 
	$('#rentcar_checkBooking').on('click', function(){
		$('#rentCar_table > tr').remove();
		$('#rentcar_checkCanceling').attr('src', cancel_breakdown );
		$(this).attr('src', booking_breakdown_on);
		$.ajax(rentPayInformParams);
		//$.ajax(payInformParams);
	
	});
	
	
	
	
	
	
	
	
	
	
	
	//예약확인 목록 불러오기
	var reservationParams = {
	 	type:"POST",
        url:"/TwoTour/mypage/reservationList.do",
        data:{'id' : '${memId}'},
        dataType:"json",
        success: function(data){
     	   if(data.reservationInformList==''){}
     	   else{
        		$('#reservation_table > tbody').remove();
        		$.each(data.reservationInformList, function(index, items){
        			
        			var pure_price = items.total_price;
        			items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
        			$('#reservation_table').append(
        				'<tr>' +
        					'<td>'+items.reservation_number+'</td>' +
        					'<td>'+items.logtime + '</td>' +
        					'<td><a id="'+(items.package_code+items.hotel_code+items.airplane_code+index)+'">'+items.package_name+
        					items.hotel_name+items.airplane_name+'</a></td>' +
        					'<td>'+items.total_price+'원</td>' +
        					'<td>'+items.total_member+'</td>' + 
        					'<td>'+items.depart_time+'<br>'+
        						   items.arrive_time+'</td>'+
        					'<td style="color:blue">'+items.status+'</td>' +
       	        		'</tr>' 
        				
        			);
        			//상품명 클릭 시 여행자 정보 페이지로 감
        			$('#'+items.package_code+items.hotel_code+items.airplane_code+index).on('click',function(){
        				$('#reservationForm').append(
        					'<input type="hidden" name="num" value="'+items.reservation_number+'"/>' +
        					'<input type="hidden" name="package_code" value="'+items.package_code+'"/>' +
        					'<input type="hidden" name="package_name" value="'+items.package_name+'"/>' +
        					'<input type="hidden" name="total_price" value="'+pure_price+'"/>'+
        					'<input type="hidden" name="totalPrice" value="'+items.total_price+'"/>'
        				); 
        				$('#reservationForm').submit();
        				
        			});
     	   		});
        	}
       }
	}//reservationParams
	
	//예약취소 목록 불러오기
	var reservationCancle = {
		 	type:"POST",
	        url:"/TwoTour/mypage/reservationCancleList.do",
	        data:{'id' : '${memId}'},
	        dataType:"json",
	        success: function(data){
	     	   if(data.reservationCancelList==''){
		    		
		        }
	     	   
	     	   else{
	        		$('#reservation_table > tbody').remove();
	        		$.each(data.reservationCancelList, function(index, items){
	        			items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
	        			$('#reservation_table').append(
	        				'<tr>' +
	        					'<td>'+items.reservation_number+'</td>' +
	        					'<td>'+items.logtime + '</td>' +
	        					'<td><a id="'+(items.package_code+items.hotel_code+items.airplane_code+index)+'">'+items.package_name+
	        					items.hotel_name+items.airplane_name+'</a></td>' +
	        					'<td>'+items.total_price+'원</td>' +
	        					'<td>'+items.total_member+'</td>' + 
	        					'<td>'+items.depart_time+'<br>'+
	        						   items.arrive_time+'</td>'+
	        					'<td style="color:blue">'+items.status+'</td>' +
	       	        		'</tr>' 
	        			);
	        			//상품명 클릭 시 여행자 정보 페이지로 감
	        			$('#'+items.package_code+items.hotel_code+items.airplane_code+index).on('click',function(){
	        				
	        				$('#reservationForm').append(
	        					'<input type="hidden" name="num" value="'+items.reservation_number+'"/>' +
	        					'<input type="hidden" name="package_code" value="'+items.package_code+'"/>' +
	        					'<input type="hidden" name="package_name" value="'+items.package_name+'"/>' +
	        					'<input type="hidden" name="totalPrice" value="'+items.total_price+'"/>'+
	        					'<input type="hidden" name="check_status" value="예약취소"/>'
	        				); 
	        				$('#reservationForm').submit();
	        				
	        			});
	        			
	     	   		});
	        	}
	       }
		}//reservationCancle
	
	//결제완료 목록 불러오기
	var payInformParams = {
	 	   type:"POST",
	       url:"/TwoTour/mypage/payInformList.do",
	       data:{'id' : '${memId}'},
	       dataType:"json",
	       success: function(data){
	    	   if(data.payInformList==''){}
	    	   else{
	       		$('#reservation_table > tbody').remove();
	       		$.each(data.payInformList, function(index, items){
	       			var pure_price = items.total_price;
	       			items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
	       			$('#reservation_table').append(
	       				'<tr>' +
	       					'<td>'+items.pay_number+'</td>' +
	       					'<td>'+items.logtime + '</td>' +
	       					'<td><a id="'+(items.package_code+items.hotel_code+items.airplane_code+index)+'">'+items.package_name+
        					items.hotel_name+items.airplane_name+'</a></td>' +
	       					'<td>'+items.total_price+'원</td>' +
	       					'<td>'+items.total_member+'</td>' + 
	       					'<td>'+items.depart_time+'<br>'+
	       						   items.arrive_time+'</td>' +
	       					'<td style="color:red">'+items.status+'</td>' +
	       				'</tr>' 
	       			
	       			);
	       			
        			//상품명 클릭 시 여행자 정보 페이지로 감
        			$('#'+items.package_code+items.hotel_code+items.airplane_code+index).on('click',function(){
        				$('#reservationForm').attr('action', '/TwoTour/packageTrip/paymentInformView.do')
        				$('#reservationForm').append(
        					'<input type="hidden" name="num" value="'+items.pay_number+'"/>' +
        					'<input type="hidden" name="package_code" value="'+items.package_code+'"/>' +
        					'<input type="hidden" name="package_name" value="'+items.package_name+'"/>' + 
        					'<input type="hidden" name="totalPrice" value="'+items.total_price+'"/>'+
        					'<input type="hidden" name="total_price" value="'+pure_price+'"/>'+
        					'<input type="hidden" name="check_status" value="결제완료"/>'
        					
        				); 
        				$('#reservationForm').submit();
        				
        			});
	    	   	});
	       	}
	     }
	}//payInformParams
	
	//결제취소 목록 불러오기
	
	var payCancel = {
		 	   type:"POST",
		       url:"/TwoTour/mypage/payCancelList.do",
		       data:{'id' : '${memId}'},
		       dataType:"json",
		       success: function(data){
		    	   if(data.payCancelList==''){
		    		
		    	   }
		    	   else{
		    		$('#reservation_table > tbody').remove();
		       		$.each(data.payCancelList, function(index, items){
		       			items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
		       			$('#reservation_table').append(
		       					'<tr>' +
		       					'<td>'+items.pay_number+'</td>' +
		       					'<td>'+items.logtime + '</td>' +
		       					'<td><a id="'+(items.package_code+items.hotel_code+items.airplane_code+index)+'">'+items.package_name+
	        					items.hotel_name+items.airplane_name+'</a></td>' +
		       					'<td>'+items.total_price+'원</td>' +
		       					'<td>'+items.total_member+'</td>' + 
		       					'<td>'+items.depart_time+'<br>'+
		       						   items.arrive_time+'</td>' +
		       					'<td style="color:red">'+items.status+'</td>' +
		       				'</tr>' 
		       			
		       			); 
		       			//상품명 클릭 시 여행자 정보 페이지로 감
	        			$('#'+items.package_code+items.hotel_code+items.airplane_code+index).on('click',function(){
	        				$('#reservationForm').attr('action', '/TwoTour/packageTrip/paymentInformView.do')
	        				$('#reservationForm').append(
	        					'<input type="hidden" name="num" value="'+items.pay_number+'"/>' +
	        					'<input type="hidden" name="package_code" value="'+items.package_code+'"/>' +
	        					'<input type="hidden" name="package_name" value="'+items.package_name+'"/>' + 
	        					'<input type="hidden" name="totalPrice" value="'+items.total_price+'"/>'+
	        					'<input type="hidden" name="check_status" value="결제취소"/>'
	        					
	        				); 
	        				$('#reservationForm').submit();
	        				
	        			});
		    	   	});
		       	}
		     }
		}//payCancel
		
		var rentPayInformParams = {
			 	   type:"POST",
			       url:"/TwoTour/mypage/rentPayInformList.do",
			       data:{'id' : '${memId}'},
			       dataType:"json",
			       success: function(data){
			    	   if(data.rentPayInformList==''){
				       		$('#rentCar_table > tbody').remove();
			    		   $('#rentCar_table').append(
			    			'<tr>' +
							'<td height="50" align="center" colspan="6">결제내역이 없습니다.</td>'+
							'</tr>');

			    		   
			    	   }
			    	   else{
			       		$('#rentCar_table > tbody').remove();
			       		$.each(data.rentPayInformList, function(index, items){
			       			var pure_price = items.total_price;
			       			items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
			       			$('#rentCar_table').append(
			       				'<tr>' +
			       					'<td style="text-align:center">'+items.pay_number+'</td>' +
			       					'<td style="text-align:center">'+items.logtime + '</td>' +
			       					'<td style="text-align:center">'+items.package_name+'</td>' +
			       					'<td style="text-align:center">'+items.total_price+'원</td>' +
			       					'<td style="color:red; text-align:center">'+items.status+'</td>' +
			       					'<td style="text-align:center"><input type="button" class="cancelButton" value="결제취소" class="cancelButton"/></td>'+
			       				'</tr>' 
			       			
			       			);
			       			
		        			//상품명 클릭 시 여행자 정보 페이지로 감
		        			$('.cancelButton').on('click',function(){
		        				$('#rentcar_reservation_form').attr('action', '/TwoTour/packageTrip/rentPayCancel.do')
		        				$('#rentcar_reservation_form').append(
		        					'<input type="hidden" name="num" value="'+items.pay_number+'"/>'+
		        					'<input type="hidden" name="total_price" value="'+items.total_price+'"/>'+
		        					'<input type="hidden" name="rent_code" value="'+items.rentcar_code+'"/>'
		        				); 
		        				$('#rentcar_reservation_form').submit();
		        				
		        			});
			    	   	});
			       	}
			     }
			}//rentPayInformParams
			
			var rentPayCancel = {
				 	   type:"POST",
				       url:"/TwoTour/mypage/rentPayCancelList.do",
				       data:{'id' : '${memId}'},
				       dataType:"json",
				       success: function(data){
				    	   if(data.rentPayCancelList==''){
				    		   $('#rentCar_table > tbody').remove();
				    		   $('#rentCar_table').append(
				    			'<tr>' +
								'<td height="50" align="center" colspan="6">결제내역이 없습니다.</td>'+
								'</tr>');
				    		   
				    	   }
				    	   else{
				       		$('#rentCar_table > tbody').remove();
				       		$.each(data.rentPayCancelList, function(index, items){
				       			var pure_price = items.total_price;
				       			items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
				       			$('#rentCar_table').append(
				       				'<tr>' +
				       					'<td style="text-align:center">'+items.pay_number+'</td>' +
				       					'<td style="text-align:center">'+items.logtime + '</td>' +
				       					'<td style="text-align:center">'+items.package_name+'</td>' +
				       					'<td style="text-align:center">'+items.total_price+'원</td>' +
				       					'<td style="color:red;text-align:center">'+items.status+'</td>' +
				   						'<td></td>'+
				       				'</tr>' 
				       			
				       			);
					
				    	   	});
				       	}
				     }
				}//rentPayCancel
				
				var airPayInformParams = {
					 	   type:"POST",
					       url:"/TwoTour/mypage/airPayInformList.do",
					       data:{'id' : '${memId}'},
					       dataType:"json",
					       success: function(data){
					    	   if(data.airPayInformList==''){
						       		$('#airplane_table > tbody').remove();
					    		   $('#airplane_table').append(
					    			'<tr>' +
									'<td height="50" align="center" colspan="8">결제내역이 없습니다.</td>'+
									'</tr>');

					    		   
					    	   }
					    	   else{
					       		$('#airplane_table > tbody').remove();
					       		$.each(data.airPayInformList, function(index, items){
					       			var pure_price = items.total_price;
					       			items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
					       			$('#airplane_table').append(
					       				'<tr>' +
					       					'<td style="text-align:center">'+items.pay_number+'</td>' +
					       					'<td style="text-align:center">'+items.logtime + '</td>' +
					       					'<td style="text-align:center">'+items.airplane_name+'</td>' +
					       					'<td style="text-align:center">'+items.total_price+'원</td>' +
					       					'<td style="text-align:center">'+items.total_member+'</td>' +
					       					'<td style="text-align:center">'+items.depart_time+'<br>'+items.arrive_time+'</td>' +
					       					'<td style="color:red; text-align:center">'+items.status+'</td>' +
					       					'<td style="text-align:center"><input type="button" class="airCancelButton" value="결제취소"/></td>'+
					       				'</tr>' 
					       			
					       			);
					       			
				        			//상품명 클릭 시 여행자 정보 페이지로 감
				        			$('.airCancelButton').on('click',function(){
				        				$('#airplane_reservation_form').attr('action', '/TwoTour/packageTrip/airPayCancel.do')
				        				$('#airplane_reservation_form').append(
				        					'<input type="hidden" name="num" value="'+items.pay_number+'"/>'+
				        					'<input type="hidden" name="total_price" value="'+items.total_price+'"/>'
				        				); 
				        				$('#airplane_reservation_form').submit();
				        				
				        			});
					    	   	});
					       	}
					     }
					}//airPayInformParams
		
					var airPayCancel = {
						 	   type:"POST",
						       url:"/TwoTour/mypage/airPayCancelList.do",
						       data:{'id' : '${memId}'},
						       dataType:"json",
						       success: function(data){
						    	   if(data.airPayCancelList==''){
						    		   $('#airplane_table > tbody').remove();
						    		   $('#airplane_table').append(
						    			'<tr>' +
										'<td height="50" align="center" colspan="8">결제내역이 없습니다.</td>'+
										'</tr>');
						    		   
						    	   }
						    	   else{
						       		$('#airplane_table > tbody').remove();
						       		$.each(data.airPayCancelList, function(index, items){
						       			var pure_price = items.total_price;
						       			items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
						       			$('#airplane_table').append(
						       				'<tr>' +
						       				'<td style="text-align:center">'+items.pay_number+'</td>' +
					       					'<td style="text-align:center">'+items.logtime + '</td>' +
					       					'<td style="text-align:center">'+items.airplane_name+'</td>' +
					       					'<td style="text-align:center">'+items.total_price+'원</td>' +
					       					'<td style="text-align:center">'+items.total_member+'</td>' +
					       					'<td style="text-align:center">'+items.depart_time+'<br>'+items.arrive_time+'</td>' +
					       					'<td style="color:red; text-align:center">'+items.status+'</td>' +
					       					'<td ></td>'+
						       				'</tr>' 
						       			
						       			);
							
						    	   	});
						       	}
						     }
						}//airPayCancel
						
						//호텔 결제확인 불러오기
						   
						   var hotelPaymentList ={
						             type:"POST",
						             url:"/TwoTour/packageTrip/hotelPaymentList.do",
						             data:{'id' : '${memId}'},
						             dataType:"json",
						             success: function(data){
						            	 if(data.list==''){
								    		   $('#hotel_reservation_table > tbody').remove();
								    		   $('#hotel_reservation_table').append(
								    			'<tr>' +
												'<td height="50" align="center" colspan="8">결제내역이 없습니다.</td>'+
												'</tr>');
								    		   
								    	   }
						            	 else{
						                $('#hotel_reservation_table > tbody').remove();
						                   $.each(data.list, function(index, items){
						                      items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
						                      $('#hotel_reservation_table').append(
						                            '<tr>' +
						                            '<td>'+items.pay_number+'</td>' +
						                            '<td>'+items.logtime + '</td>' +
						                            '<td><a style="cursor:pointer" id="'+index+'">'+items.hotel_name+'</a></td>' +
						                            '<td>'+items.location+'</td>' + 
						                            '<td>'+items.depart_time+'<br>'+
						                                  items.arrive_time+'</td>' +
						                            '<td>'+items.total_price+'원</td>' +
						                            '<td style="color:red">'+items.status+'</td>' +
						                            '<td><input type="button" value="결제취소" id="'+items.pay_number+index+'"></td>' +
						                         '</tr>' 
						                      
						                      ); 
						                      //상품명 클릭 시 여행자 정보 페이지로 감
						                    $('#'+index).on('click',function(){
						                        location.href=items.hotel_code;
						                    });
						                      //결제취소 버튼 클릭
						                      $('#'+items.pay_number+index).on('click',function(){
						    
						                         $('#hotel_reservation_form').append(
						                            '<input type="hidden" name="pay_number" value="'+items.pay_number+'">'  +
						                            '<input type="hidden" name="total_price" value="'+items.total_price+'">'   
						                         );
						                         $('#hotel_reservation_form').attr('action', '/TwoTour/packageTrip/cancelHotelPayment.do');
						                         $('#hotel_reservation_form').submit();
						                      });
						                   });
						                
						         		  }
						             }
						      };//payCancel
						      

						      
						      //호텔 결제취소 불러오기
						      
						      var hotelPaymentCancelList ={
						                type:"POST",
						                url:"/TwoTour/packageTrip/hotelPaymentCancelList.do",
						                data:{'id' : '${memId}'},
						                dataType:"json",
						                success: function(data){
						                	if(data.list==''){
									    		   $('#hotel_reservation_table > tbody').remove();
									    		   $('#hotel_reservation_table').append(
									    			'<tr>' +
													'<td height="50" align="center" colspan="8">결제내역이 없습니다.</td>'+
													'</tr>');
									    		   
									    	   }
						                	else{
						                   $('#hotel_reservation_table > tbody').remove();
						                      $.each(data.list, function(index, items){
						                         items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
						                         $('#hotel_reservation_table').append(
						                               '<tr>' +
						                               '<td>'+items.pay_number+'</td>' +
						                               '<td>'+items.logtime + '</td>' +
						                               '<td><a style="cursor:pointer" id="'+index+'">'+items.hotel_name+'</a></td>' +
						                               '<td>'+items.location+'</td>' + 
						                               '<td>'+items.depart_time+'<br>'+
						                                     items.arrive_time+'</td>' +
						                               '<td>'+items.total_price+'원</td>' +
						                               '<td style="color:red">'+items.status+'</td>' +
						                               '<td></td>' +
						                            '</tr>' 
						                         
						                         ); 
						                         //상품명 클릭 시 여행자 정보 페이지로 감
						                       $('#'+index).on('click',function(){
						                           location.href=items.hotel_code;
						                       });
						                         
						                      });
						                	}    
						              }
						         };//payCancel




						  
		
		
			
	$.ajax(hotelPaymentList);
	$.ajax(airPayInformParams);
	$.ajax(rentPayInformParams);
    $.ajax(reservationParams);
	$.ajax(payInformParams);

////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
});
$(window).bind('beforeunload', function(){//페이지 클로즈 시
	$('#body').css('height', '1350px');
});
</script>
</head>
<body>
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
			<img class="checkBooking" name="Bookingimg"  style="cursor: pointer;" alt="예약내역" 
				 src="http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown_on.gif" />
		</li>
		<li>
			<img class="checkCanceling" name="Cancelimg"  style="cursor: pointer;" alt="취소내역" 
				 src="http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown.gif" />
		</li>
	</ul>
	<div class="tableLap">
		<form id="reservationForm" action="/TwoTour/packageTrip/reservationInformView.do" method="POST">
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



<!-- 항공 예약 -->

<div style="position:relative; margin-top:40px;margin-left:30px;margin-bottom:10px;" ><p>항공 예약</p></div>
<div id="airplane01">
	<ul class="comTab" style="margin-left:30px;">
		<li><img name="Bookingimg2" id="airplane_checkBooking" style="cursor: pointer;" src="http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown_on.gif"></li>
		<li><img name="Cancelimg2" id="airplane_checkCanceling" style="cursor: pointer;"  src="http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown.gif"></li>
	</ul>
	
	<div class="tableLap" style="left:30px;">
		<form id="airplane_reservation_form" action="/TwoTour/packageTrip/" method="POST">
		<table id="airplane_table" width="100%" class="tbDetailType5" rules="all" frame="void" cellspacing="0" cellpadding="0">
			<colgroup>
				<col width="13%">
					<col width="13%">
					<col width="15%">
					<col width="13%">
					<col width="5%">
					<col width="20%">
					<col width="11%">
					<col width="9%">
					<col width="9%">
			</colgroup>
			<thead>
				<tr>
				<th class="borderDDD">예약/결제코드</th>
						<th class="borderDDD">예약/결제날짜</th>
						<th class="borderDDD">항공사명</th>
						<th class="borderDDD">총 결제금액</th>
						<th class="borderDDD">인원</th>
						<th class="borderDDD">출발일/<br>귀국일</th>
						<th class="borderDDD">예약상태</th>
						<th class="borderDDD">비고</th>
			</thead>
			<tbody>
				<tr>
					<td height="50" align="center" colspan="8">예약내역이 없습니다.</td>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
</div>



<!-- 호텔 예약 -->
<div style="position:relative; margin-top:40px;margin-left:30px;padding:10px 10px;"><p>호텔 예약</p></div>

<div id="hotel01" style="position:relative;margin-left:30px;">
	<ul class="comTab" style="margin-top:0;">
		<li><img id="hotel_checkBooking" src="http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown_on.gif" id="Bookingimg2" name="Bookingimg2" onClick="javascript:goBookingList('A');" alt="예약내역" style="cursor:pointer;"></li>
		<li><img id="hotel_checkCanceling" src="http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown.gif" id="Cancelimg2" name="Cancelimg2" onClick="javascript:goBookingList('C');" alt="취소내역" style="cursor:pointer;"></li>
	</ul>
	<div class="tableLap">
		<form id="hotel_reservation_form" action="/TwoTour/packageTrip/" method="POST">
			<table id="hotel_reservation_table" class="tbDetailType5" width="100%" cellspacing="0" cellpadding="0" frame="void" rules="all">
		         <colgroup>
		         <col width="7%">
		         <col width="10%">
		         <col width="*">
		         <col width="12%">
		         <col width="12%">
		         <col width="9%">
		         <col width="9%">
		         </colgroup>
         
		         <thead>
		            <tr>
		               <th class="borderDDD">결제코드 </th>
		               <th class="borderDDD">결제날짜 </th>
		               <th class="borderDDD">상품명</th>
		               <th class="borderDDD">인원</th>
		               <th class="borderDDD">체크인/<br>체크아웃</th>
		               <th class="borderDDD">금액</th>
		               <th class="borderDDD">예약상태</th>
		               <th class="borderDDD">비고</th>
		            </tr>
		         </thead>
		         <tbody>
		         <tr>
		            <td align="center" colspan="8" height="50">예약내역이 없습니다.</td>
		         </tr>
		         </tbody>
      		</table>
		</form>
	</div>
</div><!-- agent01 -->






<!-- 렌터카 예약 -->
<div style="position:relative; margin-top:60px;margin-left:30px;padding:10px 10px;" ><p>렌터카 예약</p></div>
<div id="rentcar01">
	<ul class="comTab" style="margin-left:30px;">
		<li><img name="Bookingimg2" id="rentcar_checkBooking" style="cursor: pointer;" src="http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown_on.gif"></li>
		<li><img name="Cancelimg2" id="rentcar_checkCanceling" style="cursor: pointer;"  src="http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown.gif"></li>
	</ul>
	
	<div class="tableLap" style="left:30px;">
		<form id="rentcar_reservation_form" action="/TwoTour/packageTrip/" method="POST">
		<table  id="rentCar_table" width="100%" class="tbDetailType5" rules="all" frame="void" cellspacing="0" cellpadding="0">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="*">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
				<th class="borderDDD">결제번호</th>
				<th class="borderDDD">결제날짜</th>
				<th class="borderDDD">상품명</th>
				<th class="borderDDD">결제금액</th>
				<th class="borderDDD">결제상태</th>
				<th class="borderDDD">비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td height="50" align="center" colspan="6">결제내역이 없습니다.</td>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
</div>




</div>
</body>
</html>











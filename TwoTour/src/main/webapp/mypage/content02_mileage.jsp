<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){//페이지 오픈
	$('#body').css('height', '500px');
	
	$.ajax({
		 	   type:"POST",
		       url:"/TwoTour/mypage/payInformList.do",
		       data:{'id' : '${memId}'},
		       dataType:"json",
		       success: function(data){
		    	   if(data.payInformList==''){}
		    	   else{
		       		$('#basketTable > tbody').remove();
		       		$.each(data.payInformList, function(index, items){
		       			var point= items.total_price*0.01;
		       			items.total_price = (items.total_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
		       			$('#basketTable').append(
		       				'<tr>' +
		       					'<td>'+items.pay_number+'</td>' +
		       					'<td>'+items.logtime + '</td>' +
		       					'<td><a id="'+(items.package_code+items.hotel_code+items.airplane_code+index)+'">'+items.package_name+
	        					items.hotel_name+items.airplane_name+'</a></td>' +
		       					'<td>'+items.total_price+'원</td>' +
		       					'<td>'+point+'</td>' +
		       				'</tr>' 
		       			
		       			);
		       			
	        			//상품명 클릭 시 여행자 정보 페이지로 감
	        			$('#'+items.package_code+items.hotel_code+items.airplane_code+index).on('click',function(){
	        				$('#basketTable').attr('action', '/TwoTour/packageTrip/paymentInformView.do')
	        				$('#basketTable').append(
	        					'<input type="hidden" name="num" value="'+items.pay_number+'"/>' +
	        					'<input type="hidden" name="package_code" value="'+items.package_code+'"/>' +
	        					'<input type="hidden" name="package_name" value="'+items.package_name+'"/>' + 
	        					'<input type="hidden" name="totalPrice" value="'+items.total_price+'"/>'+
	        					'<input type="hidden" name="check_status" value="결제완료"/>'
	        					
	        				); 
	        				$('#basketTable').submit();
	        				
	        			});
		    	   	});
		       	}
		     }
		});//payInformParams
 
		
	//나의 정보
	$.ajax({
		type:"POST",
        url:"/TwoTour/member/getMemberById.do",
        data:{'id' : '${memId}'},
        dataType:"json",
        success: function(data){
        	$('#addedPoint').append(data.memberDTO.point+'점');
        }
	});
   
});

 
$(window).bind('beforeunload', function(){//페이지 클로즈 시
	$('#body').css('height', '1350px');
});
</script>

<style>
table{border-collapse: collapse; empty-cells:show;}
table.tbDetailType5 thead th{padding: 5px 0 5px 0;font-weight: normal;color: #333; background: #FBFBFB;border: 1px solid #CCC;}
table.tbDetailType5, tbody {color: #3d3d3d; font-weight:200; margin: 15px 0 0 10px;
					border: 1px solid #CCC; } 
table.tbDetailType5 td{text-align:center;font-size:14px;}
</style>

</head>
<body>
<div id="wrap" style="position:absolute;padding:10px 10px;width:700px;heigh:500px">
<h1 style="color:#de2685;margin-left:10px;">포인트 조회</h1>
<form name="basketForm" action="" method="POST">
	<table id="basketTable" width="100%" class="tbDetailType5" rules="all" frame="void" cellspacing="0">
		<colgroup>
			<col width="10%">
			<col width="15%">
			<col width="*">
			<col width="10%">
			<col width="15%">
		</colgroup>
		<thead>
			<tr>
				<th>코드</th>
				<th>날짜</th>
				<th>상품명</th>
				<th>상품가격</th>
				<th>포인트</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td height="50" align="center" colspan="5">보유 포인트가 없습니다.</td>
			</tr>
		</tbody>
		
	</table>
</form>

<h1 id="addedPoint" style="margin-left:20px;margin-top:20px;font-size:20px;">누적 포인트 : </h1>

</div>
</body>
</html>
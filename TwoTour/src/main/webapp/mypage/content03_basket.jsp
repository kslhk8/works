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
           url:"/TwoTour/mypage/basketList.do",
           data:{'id' : '${memId}'},
           dataType:"json",
           success: function(data){
        	   if(data.basketInformList==''){}
        		
        	   else{
           		$('#basketTable > tr').remove();
           		$('#basketTable > tbody').remove();
           		$.each(data.basketInformList, function(index, items){
    				    items.adult_price= (items.adult_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    				    items.teen_price= (items.adult_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    				    items.baby_price= (items.adult_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

           			$('#basketTable').append(
           				'<tr id="'+items.seq+'">' +
           					'<td style="text-align:center"><input type="checkbox" name="checkbox" id="checkbox'+index+'"></td>' +
           					'<td style="text-align:left">'+ items.product_name +'</td>' +
           					'<td style="text-align:center">'+ items.depart_date +'</td>' +
           					'<td style="text-align:center">'+'성인: '+items.adult_price+'원' +'<br>'+ '아동: '+items.teen_price+'원'+'<br>'+ '유아: '+items.baby_price+'원'+'</td>' +
           					'<td style="text-align:center"><input type="button" value="검색하기" id="basketButton'+index+'"/></td>'+
           				'</tr>'
           			)
           			$('#basketButton'+index).attr('onclick', 'location.href="'+items.search+'"');
           		
           		});
        	   }
        	   
           }
           
   });
	   
	var checkboxList = document.getElementsByName("checkbox");
 	$('#deleteBasket').on('click', function(){
  	 for (var i = 0; i < checkboxList.length; i++) {
        if (checkboxList[i].checked) {
            var nodeTd = checkboxList[i].parentNode;   //체크박스의 어미노드는 TD
            var nodeTr = nodeTd.parentNode;               //TD 의 어미 노드는 해당 TR
            var basket_seq = $(nodeTr).attr('id');
             $.ajax({
                type:"POST",
                url:"/TwoTour/mypage/deleteBasketList.do",
                data:{'basket_seq' : basket_seq }
            }); 
          
            var nodeTbody = nodeTr.parentNode;          //TR 의 어미 노드는 Tbody
            nodeTbody.removeChild(nodeTr);              //Tbody 에서 해당 TR을 삭제
            i--; // 필수 해당 위치가 삭제가 되면 바로 적용 되어 이전 번지부터 다시 검색을 해야 된다.
        }
    }
  });	
 
   $('#checkboxAll').on('click', function(){
		if(checkboxList.length == $('input[type="checkbox"]:checked').length)
				$(checkboxList).prop('checked', false);
		else
				$(checkboxList).prop('checked', true);			
	
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
					border: 1px solid #CCC;} 
</style>

</head>
<body>
<div id="wrap" style="position:absolute;padding:10px 10px;width:700px;heigh:500px">
<!-- 장바구니 -->
<h4 style="margin-left:10px;">
	<img alt="예약확인" src="http://image1.hanatour.com/2010/images/mypage/h_cart.gif">
</h4>

<form name="basketForm" action="" method="POST">
	<table id="basketTable" width="100%" class="tbDetailType5" rules="all" frame="void" cellspacing="0">
		<colgroup>
			<col width="10%">
			<col width="*">
			<col width="15%">
			<col width="15%">
			<col width="15%">
		</colgroup>
		<thead>
			<tr>
				<th><input id="checkboxAll" type="checkbox"></th>
				<th>상품명</th>
				<th>출발일자</th>
				<th>상품가격</th>
				<th>검색하기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td height="50" align="center" colspan="5">선택된 상품이 없습니다.</td>
			</tr>
		</tbody>
		
	</table>
</form>

<img style="cursor: pointer;position:relative;left:10px;top:10px;" id="deleteBasket"
	alt="삭제" src="http://image1.hanatour.com/2010/images/btn/btn_delete.gif">


</div>
</body>
</html>
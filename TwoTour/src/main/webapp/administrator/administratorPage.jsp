<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	/*  $('#administratorPage_right_menu').css('display', 'block');
	 $('#administratorPage_right_menu').css("background", 
			"url('topmenu.PNG') no-repeat left 0"); 
 */

	//전체메뉴
	 $('#whole_menu').click(function(){
		  if($('#whole_menu_div').css('visibility')=='hidden'){
			  $('#whole_menu_div').hide();
			  $('#administratorPage_wrap01').css('z-index','0');
			  $('#administratorPage_wrap01').css('opacity','1');
		  }
		  else if($('#whole_menu_div').css('visibility')=='visible'){
			  $('#whole_menu_div').show();
			  $('#administratorPage_wrap01').css('z-index','-1');
			  $('#administratorPage_wrap01').css('opacity','0.2');
		  }
	  }); 	
 
 	$('#administratorPage_insertProduct > ul').css('display','none');	
 
	$('#administratorPage_insertProduct').on('click','a',function(){
	 if($(this).text()=='상품등록' && $('#administratorPage_insertProduct > ul').css('display')=='none'){
		$('#administratorPage_insertProduct > ul').css('display','block');
	 }
	 else if($(this).text()=='상품등록' && $('#administratorPage_insertProduct > ul').css('display')=='block'){
		$('#administratorPage_insertProduct > ul').css('display','none');
	 }
	});
	
	
	
	
});


</script>
<link rel="stylesheet" type="text/css" href="../css/administrator/administratorPage.css"/>


</head>
<body>
	<!-- <div id="administratorPage_right_menu"></div> -->



 <div id="administratorPage_wrap01" >

	<div id="administratorPage_left_menu" >
		<h4 >관리자페이지</h4>
		<ul class="administrator_menu_list">
			<li id="administratorPage_insertProduct"><a href="#">상품등록</a>
				<ul style="height:100px;">
					<li><a href="/TwoTour/administrator/insertPackage.do">패키지등록</a></li>
					<li><a href="/TwoTour/administrator/insertPackageDetail.do">상세패키지등록</a></li>
					<li><a href="/TwoTour/administrator/insertAirplane.do">항공등록</a></li>
					<li><a href="/TwoTour/administrator/insertHotel.do">호텔등록</a></li>
				</ul>
			</li>
			<li><a href="/TwoTour/administrator/allPackageList.do">패키지관리</a></li>
			<li><a href="/TwoTour/administrator/reservationManagement.do">예약관리</a></li>
			<li><a href="/TwoTour/administrator/recentViewProduct.do">최근본상품관리</a></li>
			<li><a href="/TwoTour/administrator/paymentManagement.do">매출관리</a></li>		
		</ul>
		

	</div> 
	

	
	<!-- 내용 body -->
	<div id="administratorPage_contents" style="">
		<jsp:include page="${contents}"></jsp:include>
		
	</div>
</div> 
</body>
</html>
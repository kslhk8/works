<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	


<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	 $('#mypage_menu').css('display', 'block');
	 $('#mypage_menu').css("background", 
			"url('/TwoTour/mypage/topmenu.PNG') no-repeat left 0"); 


	//전체메뉴
	 $('#whole_menu').click(function(){
		  if($('#whole_menu_div').css('visibility')=='hidden'){
			  $('#whole_menu_div').hide();
			  $('#mypage_wrap01').css('z-index','0');
			  $('#mypage_wrap01').css('opacity','1');
		  }
		  else if($('#whole_menu_div').css('visibility')=='visible'){
			  $('#whole_menu_div').show();
			  $('#mypage_wrap01').css('z-index','-1');
			  $('#mypage_wrap01').css('opacity','0.2');
		  }
	  }); 
	
	
	//왼쪽메뉴
	$('.depth2').on('click', function(){
		$(this).toggleClass("open");
	});
	

	
});
$(window).bind("beforeunload",function(){
	$('#mypage_menu').css("display","none");

});

</script>
<link rel="stylesheet" type="text/css" href="../css/mypage/mypage.css"/>


<style>

/* 
   padding: 0px 10px 이라면 상하 0px 좌우 10px로
   padding: 10px 0px 10px 0px 와 같다
   
   
 */

/*
	 
	font-family: sans-sarif;
	font-size: 16px;
	line-height: 1.5;
	letter-spacing:1.2em; /* 자간 */

*/




</style>



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>하나투어</title>
</head>
<body>


<div id="mypage_right_menu"></div>



 <div id="mypage_wrap01" >

	<div id="lnb_leftmenu" >
		<h4 >마이페이지</h4>
		<ul class="menu_list">
			<li><a href="/TwoTour/mypage/mypage.do">나의 예약보기</a></li>
			<li><a href="/TwoTour/mypage/commingsoon.do">나의 혜택확인</a></li>
			<li class="depth2 one"><a href="#">나의 포인트</a>
				<ul>
					<li><a href="/TwoTour/mypage/searchPoint.do" class="on">내역조회</a></li>
					<li><a href="/TwoTour/mypage/commingsoon.do">사용안내</a></li>
					<li><a href="/TwoTour/mypage/commingsoon.do">포인트양도</a></li>
					<li><a href="/TwoTour/mypage/commingsoon.do">누락포인트적립</a></li>
				</ul>
			</li>
			<li><a href="/TwoTour/mypage/basket.do">나의 장바구니</a></li>
			<li class="three"><a href="/TwoTour/mypage/checkpwd.do?data=1">나의 정보관리</a>
			</li>
			<li><a href="/TwoTour/mypage/checkpwd.do?data=2">회원탈퇴</a></li>	
		</ul>
		

	</div> 
	

	
	<!-- 내용 body -->
	<div id="contents" style="">
		<jsp:include page="${contents}"></jsp:include>
		
	</div>
</div> 
</body>
</html>


















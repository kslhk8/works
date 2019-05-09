<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../css/template/top.css" />

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  $('#top_ul_First > li').hover(menu_open, menu_close);  
	  
	  $('#top_img_button').click(function(){
		  if($('#top_searchBox').val().length==0){
			  alert('구체적인 도착도시를 입력해주세요!')
		  }
		  else{
		  	$('#topSearchForm').submit();
		  }
	  });
  });
  
  function menu_open(){
	 $(this).find('ul').css('visibility','visible');	
	  //$(this).find('ul').css('display','block');	
	  //$(this).find('ul').css('z-index','0');	
	 // $(this).find('ul').css('display', 'block');
	 $('#top_div_wrap2').css('z-index','-1');
	 $('#body_background_div').css('z-index','-1');
  }
  
  function menu_close(){
	  $(this).find('ul').css('visibility','hidden');
	  //$(this).find('ul').css('display','none');
	  //$(this).find('ul').css('z-index','-1');
	 // $(this).find('ul').css('display','none');
	  $('#top_div_wrap2').css('z-index','0');
	  $('#body_background_div').css('z-index','0');
  }
</script>

</head>
<body>

<div id="header">
	<div id="top_div_wrap" style="z-index:1000">
		<div id="top_div_First">
			<ul id="top_ul_First">
			<c:if test="${memId==null}">
				<li><a href="/TwoTour/member/loginForm.do">로그인</a></li>
				<li><a href="/TwoTour/member/writeForm.do">회원가입</a></li>
			</c:if>
			<c:if test="${memId!=null}">
				<li><a href="/TwoTour/member/logout.do">로그아웃</a></li>
				<li><a href="/TwoTour/mypage/checkpwd.do?data=1">정보수정</a></li>
			</c:if>
			
				<li><a href="/TwoTour/mypage/mypage.do">마이페이지</a>
					<ul>
						<li><a href="#">예약확인/결제</a></li>
						<li><a href="#">참여내역</a></li>
						<li><a href="#">마일리지</a></li>
						<li><a href="#">쿠폰</a></li>
						<li><a href="#">장바구니</a></li>
						<li><a href="#">나의혜택확인</a></li>
					</ul>
				</li>
				<li><a href="/TwoTour/clientCenter/faq.do?summary=oversea">고객센터</a>
					<ul>
						<li><a href='/TwoTour/clientCenter/faq.do?summary=oversea'>자주하는 질문</a></li>
						<li><a href="/TwoTour/clientCenter/notice.do">공지사항</a></li>
						<li><a href="/TwoTour/clientCenter/consult.do">상담문의</a></li>
						<li><a href="/TwoTour/clientCenter/clientBoard.do">고객의 소리</a></li>
						<li><a href="#">이달의 고객만족상</a></li>
					</ul>
				</li>
				<li><a href="#">마일리지클럽</a>
					<ul>
						<li><a href="#">회원혜택</a></li>
						<li><a href="#">마일리지조회</a></li>
						<li><a href="#">하나투어카드</a></li>
					</ul>
				</li>
				<c:if test="${memId=='admin'}">			
				<li><a href="/TwoTour/administrator/administratorPage.do">관리자페이지</a>
				</li>
				</c:if>
				<li>
					<select>
						<option value="">김포/서울</option>
						<option value="">부산/대구</option>
					</select>
				</li>
			</ul>
		</div>
	</div>
		<div id="top_div_wrap2">
			<div id="top_div_logo">
				<img id="img_logo" src="/TwoTour/image/logo1.png" onclick="location.href='http://localhost:8080/TwoTour/main/index.do'" style="cursor:pointer;">	
			</div>
			<form id="topSearchForm" name="topSearchForm" method="post" action="/TwoTour/search/detailSearch.do">
				<div id="top_div_search">			
					<select name="type" style="display:inline-block; width:80px; padding:0 5px;">
						<option value="패키지">패키지</option>
						<option value="호텔">호텔</option>
						<option value="렌트카">렌트카</option>
					</select>
					<input name="arrive_city" id="top_searchBox" type="text" placeholder="도착도시를 입력해주세요" >
					<img id="top_img_button" src="/TwoTour/image/button.png">		
				</div>
			</form>
		</div>		
</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
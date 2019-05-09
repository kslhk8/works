<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../css/template/bottom.css" />
    
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  $('#bottom_ul_Third > li').click(function(){
		  if($(this).find('ul').css('visibility')=='visible'){
			  $(this).find('ul').css('visibility','hidden');
		  }
		  else if($(this).find('ul').css('visibility')=='hidden'){
			  $(this).find('ul').css('visibility','visible');
		  }
	  });
	  
	  $('#bottom_ul_Fourth > li').click(function(){
		  if($(this).find('ul').css('visibility')=='visible'){
			  $(this).find('ul').css('visibility','hidden');
		  }
		  else if($(this).find('ul').css('visibility')=='hidden'){
			  $(this).find('ul').css('visibility','visible');
		  }
	  });
  });
</script>

<div id="bottom">
	<div id="bottom_div_wrap1">
		<div id="bottom_div_First">
			<h5 id="bottom_h5">하나투어와 소통하는 7가지 방법</h5>
			<div id="bottom_div_Second">
				<img src="/TwoTour/image/fb.png">
				<img src="/TwoTour/image/insta.png">
				<img src="/TwoTour/image/blog.png">
				<img src="/TwoTour/image/kakao.png">
				<img src="/TwoTour/image/kakaoP.png">
				<img src="/TwoTour/image/youtube.png">
				<img src="/TwoTour/image/twitter.png">
			</div>
		</div>
		<div id="bottom_div_Third">
			&nbsp;&nbsp;&nbsp;&nbsp;공지사항	
			<a href="" style="float:right; margin-right:20px; margin-top:5px; font:13px Tahoma, Arial; color:grey;">더보기 + </a>	
		</div>
	</div>
	
	<div id="bottom_div_wrap2">
		<div id="bottom_div_Fourth">
			<ul id="bottom_ul_Second">
				<li><a id="aa" href="#">&nbsp;&nbsp;&nbsp;&nbsp;회사소개</a></li>
				<li><a id="aa" href="#">개인처리방침</a></li>
				<li><a id="aa" href="#">여행약관</a></li>
				<li><a id="aa" href="#">이용약관</a></li>
				<li><a id="aa" href="#">해외여행자보험</a></li>
				<li><a id="aa" href="#">마케팅제휴</a></li>
				<li><a href="#">도우미 대리점 검색</a></li>
			</ul>
		</div>	
		<div id="bottom_div_Fifth">	
			<ul id="bottom_ul_Third">
				<li><a style="cursor:pointer;">글로벌 네트워크 + </a>
					<ul>
						<li><a href="#">글로벌네트워크</a></li>
						<li><a href="#">하나투어USA</a></li>
						<li><a href="#">하나투어CHINA</a></li>
						<li><a href="#">하나투어TAIWAN</a></li>
						<li><a href="#">하나투어JAPAN</a></li>
						<li><a href="#">하나투어HONGKONG</a></li>
						<li><a href="#">하나투어BANGKOK</a></li>
						<li><a href="#">하나투어NewZealand</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div id="bottom_div_Sixth">
			<ul id="bottom_ul_Fourth">
				<li><a style="cursor:pointer;">패밀리사이트 + </a>
					<ul>
						<li><a href="#">패밀리사이트</a></li>
						<li><a href="#">기업사이트</a></li>
						<li><a href="#">하나투어CHINA</a></li>
						<li><a href="#">하나투어TAIWAN</a></li>
						<li><a href="#">하나투어JAPAN</a></li>
						<li><a href="#">하나투어HONGKONG</a></li>
						<li><a href="#">하나투어BANGKOK</a></li>
						<li><a href="#">하나투어NewZealand</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
	
		<div id="bottom_div_Seventh">
			<address>&emsp;&emsp;&emsp;(주)용범투어 ┃ 대표:김용범 ┃ 주소:(03138) 서울 종로구 돈화문로 26 단성사빌딩 5층</address>
			<p>&emsp;&emsp;&emsp;사업자 등록번호: 102-81-39440┃통신판매업신고번호: 종로 01-1806호 ┃ 관광사업자 등록번호: 제1993-000006호 ┃ 영업보증보험: 22억1천만원 가입</p>
			<p>&emsp;&emsp;&emsp;고객센터: 1577-1233 ┃ 팩스: 02-734-0392 ┃ 개인정보관리 책임자: 박성재</p>
			<p>&emsp;&emsp;&emsp;부득이한 사정에 의해 여행일정이 변경되는 경우 여행자의 사전 동의를 받습니다.</p>
			<p id="bottom_last_p" style=""class="copyright">&emsp;&emsp;&emsp;&emsp;COPYRIGHT(C) HANATOUR SERVICE INC. ALL RIGHTS RESERVED</p>
	
		</div>
	
	
	
</div>
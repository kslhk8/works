<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../css/template/body.css" />

<style>
	input[type=checkbox]+label {
		display: inline-block;
		cursor: pointer;
		line-height: 12px;
		padding-left: 12px;
		background: url('') left/12px no-repeat;
	}
	
	input[type=checkbox]:checked { 
		visibility:hidden;
		/* z-index: -1; */
	}
	
	input[type=checkbox]:checked+label {
		background-image: url("/TwoTour/image/check.png");
	}
	
	table td{ padding:1px; }
	
	*{font:12px Tahoma, Arial; } 
	a:link{ color:black; }	
</style>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../js/template/body.js"></script>
<script src="../js/calendar.js"></script>
<script>
$(document).ready(function(){
	$('#go_item1').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=1&son_seq=3&arrive_city=코타키나발루';
	});
	$('#go_item2').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=19&son_seq=20&arrive_city=코타키나발루';
	});
	$('#go_item3').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=42&son_seq=45&arrive_city=다낭';
	});
	$('#go_item4').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=69&son_seq=70&arrive_city=홍콩';
	});
	$('#go_item5').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=210&son_seq=211&arrive_city=계림';
	});
	$('#go_item6').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=75&son_seq=78&arrive_city=홍콩';
	});
	$('#go_item7').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=216&son_seq=217&arrive_city=오사카';
	});
	$('#go_item8').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=234&son_seq=236&arrive_city=삿포로';
	});
	$('#go_item9').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=220&son_seq=221&arrive_city=오사카';
	});
	$('#go_item10').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=401&son_seq=402&arrive_city=괌';
	});
	$('#go_item11').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=431&son_seq=432&arrive_city=괌';
	});
	$('#go_item12').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=437&son_seq=438&arrive_city=뉴질랜드';
	});
	$('#go_item13').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=475&son_seq=476&arrive_city=독일';
	});
	$('#go_item14').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=613&son_seq=614&arrive_city=파리';
	});
	$('#go_item15').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=485&son_seq=486&arrive_city=독일';
	});
	$('#go_item16').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=631&son_seq=632&arrive_city=라스베이거스';
	});
	$('#go_item17').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=819&son_seq=820&arrive_city=칸쿤';
	});
	$('#go_item18').click(function(){
		location.href= '/TwoTour/packageTrip/productView.do?seq=849&son_seq=850&arrive_city=부에노스아이레스';
	});
	$('#only_hotel_Search').click( function(){
	      var destination = encodeURI($('#only_hotel_Destination_searchBox').val());
	      var checkInDate = $('#only_hotel_CheckIn_search').val();
	      var checkOutDate = $('#only_hotel_CheckOut_search').val()
	      location.href='/TwoTour/hotel/mainpage.do?city='+ destination + '&checkInDate='+checkInDate
	                  + '&checkOutDate=' + checkOutDate;
	    });
});
</script>


<div id="body">
	
						
	<div id="body_background_div">
	
		<!-- 해외 패키지여행 -->
		<div id="oversea_package_trip_wrap">
			<div id="oversea_package_trip_header">
				해외패키지여행 
				<a id="goMain" href="">메인가기</a>
			</div>
			
			<div id="oversea_package_trip_Content_wrap">
			<form name="oversea_package_trip" id="oversea_package_trip" method="post" action="/TwoTour/packageTrip/packageList.do">
				<div id="oversea_package_Trip_city_wrap">
					<div id="oversea_package_Trip_city">여행도시</div>
					<div id="oversea_package_Trip_city_content">
						<input name="arrive_city" id="oversea_package_Trip_city_searchBox" type="text" placeholder="도시명을 입력해주세요">
						<img class="img_button" src="/TwoTour/image/button.png" style="position:absolute; float:right; right:10px; height:25px; width:25px; cursor:pointer; ">
					</div>
				</div>
				<img id="oversea_package_Arrive_city_search_close" src="/TwoTour/image/close.png" style="float:right; position:absolute; right:50px; height:10px; width:10px;">		
				
				<div id="oversea_package_Arrive_city_search_div" style="position:absolute; width:280px; height:350px; background-color:white;">					
					<table id="oversea_package_Arrive_city_search_table" border="frame" rules="all" width="280px" height="80px" id="" summary="도시코드,도시,국가" style="border:1px solid rgb(217,217,217);">
						<colgroup>
							<col width="33%">
							<col width="33%">
							<col width="33%">
						</colgroup>
						<thead>
							<tr style="background-color:rgb(111,117,130); height:20px;">
								<th style="color:white;">도시코드</th>
								<th style="color:white;">도시</th>
								<th style="color:white;">국가</th>
							</tr>
						</thead>
						<tbody id="oversea_package_Arrive_city_search_tbody"></tbody>
					</table>
					<div id="" style="position:absolute; top:80px;">
						<label style="margin-left:20px; font-size:14px; font-weight:bolder;">
							주요도시바로선택
						</label>
						<table id="maincity_Search_T_OP" border="frame" rules="all" width="280px" style="border:1px solid rgb(217,217,217); margin-top:5px;">
							<tr>
								<th style="padding:3px; background-color:rgb(245,245,245);">
									동남아/<br>대만/<br>서남아<br>
								</th>
								<td>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">코타키나발루</a>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">다낭</a>
								</td>
							</tr>
							<tr>
								<th style="padding:3px; background-color:rgb(245,245,245);">
									중국/<br>홍콩/<br>하이난
								</th>
								<td>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">홍콩</a>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">계림</a>
								</td>
							</tr>
							<tr>
								<th style="padding:3px; background-color:rgb(245,245,245);">일본</th>
								<td>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">오사카</a>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">삿포로</a>
								</td>
							</tr>
							<tr>
								<th style="padding:3px; background-color:rgb(245,245,245);">남태평양</th>
								<td>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">뉴질랜드</a>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">괌</a>
								</td>
							</tr>
							<tr>
								<th style="padding:3px; background-color:rgb(245,245,245);">유럽</th>
								<td>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">독일</a>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">파리</a>
								</td>
							</tr>
							<tr>
								<th style="padding:3px; background-color:rgb(245,245,245);">
									미주/<br>하와이
								</th>
								<td>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">라스베이거스</a>
								</td>
							</tr>
							<tr>
								<th style="padding:3px; background-color:rgb(245,245,245);">중남미</th>
								<td>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">칸쿤</a>
									<a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">부에노스아이레스</a>
								</td>
							</tr>
						</table>				
					</div>
				</div>
				
				<div id="oversea_package_Depart_city_wrap">
					<div id="oversea_package_Depart_city">출발도시</div>
					<div id="oversea_package_Depart_city_content">
						<select name="depart_city">
							<option value="인천" selected>서울(인천/김포)</option>
							<option value="부산">부산</option>
						</select>
					</div>
				</div>
				
				<div id="oversea_package_Depart_month_wrap">
					<div id="oversea_package_Depart_month">출발월</div>
					<div id="oversea_package_Depart_month_content">
						<select name="depart_date">
							<option value="12" selected>2017년 12월</option>
							<option value="01">2018년 01월</option>
							<option value="02">2018년 02월</option>
							<option value="03">2018년 03월</option>
							<option value="04">2018년 04월</option>
							<option value="05">2018년 05월</option>
							<option value="06">2018년 06월</option>
						</select>
					</div>
				</div>
				
				<div id="oversea_package_Depart_date_wrap">
					<div id="oversea_package_Depart_date">출발요일</div>
					<div id="oversea_package_Depart_date_content">
						<input type="checkbox" name="week" id="week" value="week" checked> 
							<label>평일</label> 
						<input type="checkbox" name="week" id="weekend" value="weekend" checked> 
							<label>주말</label>
					</div>
				</div>
				
				<div id="oversea_package_trip_Grade_wrap">
					<div id="oversea_package_trip_Grade">상품등급</div>
					<div id="oversea_package_trip_Grade_content">
						<input type="checkbox" name="grade" id="classic" value="클래식" checked>
							<label>클래식</label> 
							<img id="classic_q" src="/TwoTour/image/question.png">

						<input type="checkbox" name="grade" id="casual" value="캐주얼" checked> 
							<label>캐주얼</label> 
							<img id="casual_q" src="/TwoTour/image/question.png">

						<input type="checkbox" name="grade" id="esave" value="이세이브"> 
							<label>이세이브</label> 
							<img id="esave_q" src="/TwoTour/image/question.png">
					</div>
					<div id="oversea_package_trip_Grade_explain">
						<div id="classic_explain">
							<h5>클래식</h5>
							믿을 수 있는 항공, 엄선된 숙박과 식사,<br> 
							보다 새롭고 다양한 볼거리로 구성된<br> 
							수준높은 전통 패키지
						</div>
						<div id="casual_explain">
							<h5>캐주얼</h5>
							실속파 고객들을 위한 보다 알찬 구성<br> 
							으로 짜여진 경제적인 패키지
						</div>
						<div id="esave_explain">
							<h5>이세이브</h5>
							합리적인 요금의 호텔과 식사로 구성된<br> 
							대한민국 대표 초저가 패키지 여행 브랜드
						</div>
					</div>
				</div>
				
				<div id="oversea_package_trip_Name_wrap">
					<div id="oversea_package_trip_Name">상품명/상품코드</div>
					<div id="oversea_package_trip_Name_content">
						<input type="text" placeholder="상품명 또는 상품코드를 검색해보세요"> 
					</div>
					<input id="oversea_package_trip_Search" type="button" value="검색하기">
				</div>
			</form>
			</div>
		</div>





		<!-- 해외 자유여행 -->
		<div id="oversea_free_trip_wrap">
			<div id="oversea_free_trip">
				해외 자유여헹 
				<a id="goMain" href="">메인가기</a>
			</div>
			<div id="oversea_free_trip_Content_wrap">
				<div id="oversea_free_trip_Menu_wrap">
					<div id="oversea_free_trip_Menu">
						<ul>
							<li id="only_air"><h4>항공</h4></li>
							<li id="only_hotel"><h4>호텔</h4></li>
						</ul>
					</div>
				</div>



			<form id="oversea_freeTripForm" method='POST' action='/TwoTour/productFree/freeResult.do'>
            <div id="oversea_free_trip_Only_air_div">   
               <div>
                  <input type='hidden' id='tripType' name='tripType' value=''>
                  <ul id='air_menu_ul'>
                     <li class='air_menu_li' id="roundtrip">왕복</li>
                     <li class='air_menu_li' id="oneway">편도</li>
                     <li id="air_Menu">항공메인</li>
                     
                  </ul>
               </div>
               
               <div id="only_air_Depart_city_wrap">
                  <div id="only_air_Depart_city">출발도시</div>
                  <div id="only_air_Depart_city_content">
                     <select name='depart_city'>
                        <option value="인천">서울(김포/인천)</option>
                        <option value="부산">부산</option>
                        <option value="대구">대구</option>
                     </select>
                  </div>
               </div>
               
               <div id="only_air_Arrive_city_wrap">
                  <div id="only_air_Arrive_city">도착도시</div>
                  <div id="only_air_Arrive_city_content">
                     <input id="only_air_Arrive_city_searchBox" name='arrive_city' type="text" value='삿포로'> 
                     <img src="/TwoTour/image/blue_button.png" class="img_button">
                  </div>
               </div>
               <img id="only_air_Arrive_city_search_close" src="/TwoTour/image/close.png" style="float:right; position:absolute; top:80px; right:-15px; height:10px; width:10px;">      
               
               <div id="only_air_Arrive_city_search_div" style="position:absolute; top:100px; width:300px; height:300px; background-color:white;">               
                  <table id="only_air_Arrive_city_search_table" border="frame" rules="all" width="330px" height="80px" id="" summary="도시코드,도시,국가" style="border:1px solid rgb(217,217,217);">
                     <colgroup>
                        <col width="33%">
                        <col width="33%">
                        <col width="33%">
                     </colgroup>
                     <thead>
                        <tr style="background-color:rgb(111,117,130); color:white; height:20px;">
                           <th>도시코드</th>
                           <th>도시</th>
                           <th>국가</th>
                        </tr>
                     </thead>
                     <tbody id="only_air_Arrive_city_search_tbody"></tbody>
                  </table>
                  <div id="" style="position:absolute; top:85px;">
                     <label style="margin-left:20px; font-size:14px; font-weight:bolder;">
                        주요도시바로선택
                     </label>
                     <table id="maincity_Search_T_OA" border="frame" rules="all" width="330px" style="border:1px solid rgb(217,217,217); margin-top:5px;">
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">
                              동남아/<br>대만/<br>서남아<br>
                           </th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">코타키나발루</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">다낭</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">
                              중국/<br>홍콩/<br>하이난
                           </th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">홍콩</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">계림</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">일본</th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">오사카</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">삿포로</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">남태평양</th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">뉴질랜드</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">괌</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">유럽</th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">독일</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">파리</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">
                              미주/<br>하와이
                           </th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">라스베이거스</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">중남미</th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">칸쿤</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">부에노스아이레스</a>
                           </td>
                        </tr>
                     </table>            
                  </div>
               </div>

               <div id="only_air_Depart_date_wrap">
                  <div id="only_air_Depart_date">출발일</div>
                  <div id="only_air_Depart_date_content">
                     <input type="text" name='depart_date'  value='' style="margin-right:4px; width:70px;">
                     <img src="/TwoTour/image/calendar.png">
                  </div>                  
               </div>            
               <div id="only_air_Depart_date_calendar"
                  style="position:absolute; background-color:white; border:1px solid black; top:180px; width:200px; height:200px;">
                  <div style="text-align:center; position:relative;">
                        <span onclick="before_month();" style="cursor:pointer;">◀</span>
                      <span id="select_year_A_D">2017</span>년
                        <span id="select_month_A_D">11</span> 월
                       <span onclick="after_month();" style="cursor:pointer;">▶</span>
                     <img id="close_A_D" src="/TwoTour/image/close.png" style="position:absolute; float:right; top:1px; right:5px; height:10px; width:10px; cursor:pointer; ">
                      <div id ="calendar_A_D" style="padding:10px; "></div>
                  </div>
               </div>
                                        
               <div id="only_air_Return_date_wrap">
                  <div id="only_air_Return_date">귀국일</div>
                  <div id="only_air_Return_date_content">
                     <input type="text" name='return_date' value=''>
                     <img src="/TwoTour/image/calendar.png">
                  </div>
               </div>         
               <div id="only_air_Return_date_calendar" 
                  style="position:absolute; background-color:white; border:1px solid black; top:180px;  left:150px; width:200px; height:200px;">
                  <div style="text-align:center; position:relative;">
                        <span onclick="before_month();" style="cursor:pointer;">◀</span>
                      <span id="select_year_A_R">2017</span>년
                        <span id="select_month_A_R">11</span> 월
                       <span onclick="after_month();" style="cursor:pointer;">▶</span>
                     <img id="close_A_R" src="/TwoTour/image/close.png" style="margin-left:10px; top:1px; right:5px; height:10px; width:10px; cursor:pointer; ">
                      <div id ="calendar_A_R" style="padding:10px; "></div>
                  </div>
               </div> 
         
               <div id="only_air_Dont_know_wrap">
                  
                  <!-- 미정을 누르면 귀국일이 전체로 바뀐다! -->
                  <div id="only_air_Dont_know">미정</div>
                  
               </div>
               
               <div id="only_air_Member_wrap">
                  <div id="only_air_Member">인원</div>
                  <div id="only_air_Member_content">
                     <div id="only_air_Adult">
                        <select name='adultCnt'>
                           <option value="1">성인 1명</option>
                           <option value="2">성인 2명</option>
                           <option value="3">성인 3명</option>
                           <option value="4">성인 4명</option>
                           <option value="5">성인 5명</option>
                           <option value="6">성인 6명</option>
                           <option value="7">성인 7명</option>
                           <option value="8">성인 8명</option>
                           <option value="9">성인 9명</option>
                        </select> 
                        <input type="text" value="만 12세이상">
                     </div>
                     <div id="only_air_Child">
                        <select name='childCnt'>
                           <option value='0'>아동0명</option>
                           <option value='1'>아동1명</option>
                           <option value='2'>아동2명</option>
                           <option value='3'>아동3명</option>
                           <option value='4'>아동4명</option>
                           <option value='5'>아동5명</option>
                           <option value='6'>아동6명</option>
                           <option value='7'>아동7명</option>
                           <option value='8'>아동8명</option>
                           <option value='9'>아동9명</option>
                        </select> 
                        <input type="text" value="만 2세~만11세">
                     </div>
                     <div id="only_air_Baby">
                        <select name='babyCnt'>
                           <option value='0'>유아0명</option>
                           <option value='1'>유아1명</option>
                           <option value='2'>유아2명</option>
                           <option value='3'>유아3명</option>
                           <option value='4'>유아4명</option>
                           <option value="5">유아 5명</option>
                           <option value="6">유아 6명</option>
                           <option value="7">유아 7명</option>
                           <option value="8">유아 8명</option>
                           <option value="9">유아 9명</option>
                        </select> 
                        <input type="text" value="만 2세미만">
                     </div>
                  </div>
               </div>
            
               <div id="only_air_Prefer_air_wrap">
                  <div id="only_air_Prefer_air">선호항공</div>
                  <select>
                     <option>전체</option>
                     <option>대한항공</option>
                     <option>아시아나항공</option>
                  </select>
               </div>
               
               <div id="only_air_Seat_grade_wrap">
                  <div id="only_air_Seat_grade">좌석등급</div>
                  <select name='seat_grade'>
                     <option value='일반석'>일반석</option>
                     <option value='프리미엄 일반석'>프리미엄 일반석</option>
                     <option value='비지니스석'>비지니스석</option>
                     <option value='일등석'>일등석</option>
                  </select>
               </div>
               
               <input id="only_air_Search" type="button" value="검색하기">
            </div><!-- oversea_free_trip_Only_air_div -->
            </form><!-- oversea_free_trip_Only_air -->
	
	
				<!-- 호텔 -->
				<div id="oversea_free_trip_Only_hotel_div">
               <div id="only_hotel_Menu">
                  <ul>
                     <li><a href="/TwoTour/hotel/mainpage.do">호텔메인가기</a></li>
             
                  </ul>
               </div>
               
               <div id="only_hotel_Destination_wrap">
                  <div id="only_hotel_Destination">목적지</div>
                  <div id="only_hotel_Destination_content">
                     <input id="only_hotel_Destination_searchBox" type="text" placeholder="도시 검색가능합니다.">
                     <img src="/TwoTour/image/blue_button.png"  class="img_button">
                  </div>
               </div>
               <img id="only_hotel_Destination_search_close" src="/TwoTour/image/close.png" style="float:right; position:absolute; top:80px; right:-15px; height:10px; width:10px;">      
               
               <div id="only_hotel_Destination_search_div" style="position:absolute; top:100px; width:300px; height:300px; background-color:white;">               
                  <table id="only_hotel_Destination_search_table" border="frame" rules="all" width="330px" height="80px" id="" summary="도시코드,도시,국가" style="border:1px solid rgb(217,217,217);">
                     <colgroup>
                        <col width="33%">
                        <col width="33%">
                        <col width="33%">
                     </colgroup>
                     <thead>
                        <tr style="background-color:rgb(111,117,130); color:white; height:20px;">
                           <th style=" color:white;">도시코드</th>
                           <th style=" color:white;">도시</th>
                           <th style=" color:white;">국가</th>
                        </tr>
                     </thead>
                     <tbody id="only_hotel_Destination_search_tbody"></tbody>
                  </table>
                  <div id="" style="position:absolute; top:85px;">
                     <label style="margin-left:20px; font-size:14px; font-weight:bolder;">
                        주요도시바로선택
                     </label>
                     <table id="maincity_Search_T_OH" border="frame" rules="all" width="330px" style="border:1px solid rgb(217,217,217); margin-top:5px;">
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">
                              동남아/<br>대만/<br>서남아<br>
                           </th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">코타키나발루</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">다낭</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">
                              중국/<br>홍콩/<br>하이난
                           </th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">홍콩</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">계림</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">일본</th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">오사카</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">삿포로</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">남태평양</th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">뉴질랜드</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">괌</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">유럽</th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">독일</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">파리</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">
                              미주/<br>하와이
                           </th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">라스베이거스</a>
                           </td>
                        </tr>
                        <tr>
                           <th style="padding:3px; background-color:rgb(245,245,245); width:30%; ">중남미</th>
                           <td>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">칸쿤</a>
                              <a href="#" style="border-right:1px solid rgb(217,217,217); padding:0 3px;">부에노스아이레스</a>
                           </td>
                        </tr>
                     </table>            
                  </div>
               </div>
                  
               <div id="only_hotel_CheckIn_wrap">
                  <div  id="only_hotel_CheckIn">체크인</div>
                  <div id="only_hotel_CheckIn_content">
                     <input type="text" id="only_hotel_CheckIn_search">
                     <img src="/TwoTour/image/calendar.png">
                  </div>
               </div>
               <div id="only_hotel_CheckIn_calendar"
                  style="position:absolute; background-color:white; border:1px solid black; top:180px; width:200px; height:200px;">
                  <div style="text-align:center; position:relative;">
                        <span onclick="before_month();" style="cursor:pointer;">◀</span>
                      <span id="select_year_H_CI">2017</span>년
                        <span id="select_month_H_CI">11</span> 월
                       <span onclick="after_month();" style="cursor:pointer;">▶</span>
                      <img id="close_H_CI" src="/TwoTour/image/close.png" style="position:absolute; margin-left:10px; top:2px; right:7px; height:10px; width:10px; cursor:pointer; ">
                     <div id ="calendar_H_CI" style="padding:10px; "></div>
                  </div>
               </div>
   
               <div id="only_hotel_CheckOut_wrap">
                  <div id="only_hotel_CheckOut">체크아웃</div>
                  <div id="only_hotel_CheckOut_content">
                     <input type="text" value="" id="only_hotel_CheckOut_search">
                     <img src="/TwoTour/image/calendar.png">
                  </div>
               </div>
               <div id="only_hotel_CheckOut_calendar"
                  style="position:absolute; background-color:white; border:1px solid black; top:150px; left:150px; width:200px; height:200px;">
                  <div style="text-align:center; position:relative;">
                        <span onclick="before_month();" style="cursor:pointer;">◀</span>
                      <span id="select_year_H_CO">2017</span>년
                        <span id="select_month_H_CO">11</span> 월
                       <span onclick="after_month();" style="cursor:pointer;">▶</span>
                     <img id="close_H_CO" src="/TwoTour/image/close.png" style="position:absolute; margin-left:10px; top:2px; right:7px; height:10px; width:10px; cursor:pointer; ">
                      <div id ="calendar_H_CO" style="padding:10px; "></div>
                  </div>
               </div>
                              
               <div id="only_hotel_Nights">
                  <select>
                     <option>1박</option>
                     <option>2박</option>
                     <option>3박</option>
                     <option>4박</option>
                     <option>5박</option>
                     <option>6박</option>
                     <option>7박</option>
                     <option>8박</option>
                     <option>9박</option>
                     <option>10박</option>
                  </select> 
               </div>
               
               <div id="only_hotel_Bed_numbers_wrap">
                  <div id="only_hotel_Bed_numbers">객실수</div>
                  <div id="only_hotel_Bed_numbers_content">
                     <select>
                        <option>1개</option>
                        <option>2개</option>
                        <option>3개</option>
                     </select>
                  </div>
               </div>
               
               <div id="only_hotel_Member_per_bed_wrap">
                  <div id="only_hotel_Member_per_bed">객실1 인원선택</div>
                  <div id="only_hotel_Member_per_bed_content">
                     <div id="only_hotel_Adult">
                        <select  style="">
                           <option>성인1명</option>
                           <option>성인2명(더블요청)</option>
                           <option selected>성인2명(트윈요청)</option>
                           <option>성인3명</option>
                           <option>성인4명</option>
                        </select>
                        <input type="text" value="만 12세이상">
                     </div>
                     <div id="only_hotel_Child">
                        <select style="">
                           <option>아동0명</option>
                           <option>아동1명</option>
                           <option>아동2명</option>
                        </select>
                        <input type="text" value="0세~만11세이하">
                     </div>
                     <input id="only_hotel_Search" type="button" value="검색하기">
                  </div>
               </div>   
            </div>
			</div>
		</div>
		
	
		
		
		
		<!-- 제주도여헹 -->
		<div id="jeju_trip_wrap">
			<div id="jeju_trip">
				제주도여행
				<a id="goMain" href="">메인가기</a>
			</div>
			
			<div id="jeju_trip_Content_wrap">
				<div id="jeju_trip_Air">
					<img src="/TwoTour/image/airplane.jpg">
					<label>국내항공</label>
				</div>
				<div id="jeju_trip_Hotel">
					<img src="/TwoTour/image/hotel.jpg">
					<label>국내숙박</label>
				</div>
				<div id="jeju_trip_Rentcar">
				<img src="/TwoTour/image/car.jpeg" onclick="location.href='/TwoTour/rentCar/rentCar1.do'" style="cursor:pointer">
					<label>렌터카</label>
				</div>
			</div>
		</div>
				
	</div>
	
	


	
	<!-- 인기 예약랭킹 -->
	<div id="popular_ranking_wrap">
		<div id="popular_ranking"><h5>인기 예약랭킹TOP3</h5></div>
		<div id="popular_ranking_menu">
			<ul>
				<li id="SouthEastA">동남아</li>
				<li id="C_H_H">중국/홍콩/하이난</li>
				<li id="Jap">일본</li>
				<li id="SouthP">남태평양</li>
				<li id="Europe">유럽</li>
				<li id="A_LatinA">미주/중남미</li>
			</ul>
		</div>
		<div id="popular_ranking_content">
			<!-- 동남아 -->
			<div id="populuar_ranking_SouthEastA">
				<div class="top1"> <!-- 코타키나발루 -->
					<img class="ranking" src="/TwoTour/image/top1.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/cota2.jpg"> <!-- cota1, cota2, cota3 -->
					<div class="top1_explain">
						<h5 style="font-weight:bolder; margin-left:10px;"> [여행박람회]오직 투투어 <br>&emsp;여행박람회에서 만나는 코타키나발루</h5>
						<br>
						1. 코타키나발루 5일_마젤란 수트라하버 가든뷰ㅣ아일랜드+반딧불이+발마사지
						<input class="popular_ranking_button" type="button" id="go_item1" value="상품보기 >" style="margin-top:50px;">
					</div>
				</div>		
				<div class="top2"> <!-- 코나키나발루 -->
					<img class="ranking" src="/TwoTour/image/top2.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/cota6.jpg"> <!-- cota6, cota7, cota8 -->
					<div class="top2_explain">
						<h5 style="font-weight:bolder; margin-left:10px; margin-top:10px; margin-bottom:20px;"> 코타키나발루 일급 & 준특급 관광+휴양</h5>
						<br>
						&emsp;1. [BEST]코타키나발루 5일_베링기스 비치 리조트 | 아일랜드+호텔디너1회+시티투어<br>
						&emsp;2. [하나◆스페셜]코타키나발루 5일_베링기스 비치 리조트 | 아일랜드+반딧불이
						<input class="popular_ranking_button" type="button" id="go_item2" value="상품보기 >" style="margin-top:20px;">
					</div>
				</div>
				<div class="top3"> <!-- 다낭 -->
					<img class="ranking" src="/TwoTour/image/top3.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/다낭1.jpg">
					<div class="top3_explain">
						<h5 style="font-weight:bolder; margin-left:50px; ">다낭*호이안*후에 4,5,6일<br> &emsp;★온라인박람회 전용상품★</h5>
						<br>
						&emsp;1. [오전증편기]다낭/호이안+1일자유일정 4일▒전일정 4성급+호이안 야간씨티▒<br>
						&emsp;2. [오전증편기][관광형]다낭/호이안/후에 3박 4일 ▒전일정 5성급+호이안야경+씨클로▒
						<input class="popular_ranking_button" type="button"  id="go_item3" value="상품보기 >" style="margin-top:20px;">
					</div>
				</div>
			</div>
			<!-- 중국/홍콩/하이난 -->
			<div id="popular_ranking_C_H_H">
				<div class="top1"> <!-- 홍콩 -->
					<img class="ranking" src="/TwoTour/image/top1.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/홍콩2.jpg"> <!-- 홍콩1, 홍콩2, 홍콩3 -->
					<div class="top1_explain">
						<h5 style="font-weight:bolder; margin-left:10px; margin-top:12px;">마카오 직항 4일/5일[마카오 품격 일주]</h5>
						<br>
						&emsp;1. [노쇼핑+마카오 5성급 3박] 마카오 5일◈댄싱워터쇼/유네스코투어/특식3회◈
						<input class="popular_ranking_button" type="button"  id="go_item4" value="상품보기 >" style="margin-top:43px;">
					</div>
				</div>			
				<div class="top2"> <!-- 계림 -->
					<img class="ranking" src="/TwoTour/image/top2.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/계림7.jpg">
					<div class="top2_explain">
						<h5 style="font-weight:bolder; margin-left:10px;  margin-bottom:20px;">[고속열차이동]계림/귀주 6일 이강유람/황과수폭포/만봉림</h5>
						<br>
						&emsp;1. [고속열차이동]계림/귀주 6일 이강유람/황과수폭포/만봉림<br>
						&emsp;2. [고속열차이동]계림/귀주 6일 5성급호텔/다채귀주쇼/3대특식
						<input class="popular_ranking_button" id="go_item5" type="button"  id="go_item5" value="상품보기 >" style="margin-top:10px;">
					</div>
				</div>
				<div class="top3"> <!-- 홍콩 -->
					<img class="ranking" src="/TwoTour/image/top3.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/홍콩5.jpg"> <!-- 홍콩4, 홍콩5, 홍콩6 -->
					<div class="top3_explain">
						<h5 style="font-weight:bolder; margin-left:50px; margin-top:10px;">『로맨틱여행』 홍콩/마카오 4일</h5>
						<br>
						&emsp;1. 홍콩/마카오 4일◈5성급호텔/리무진버스/옹핑케이블카/특식3회◈<br>
						&emsp;2. [선착순6명 야시장] 홍콩/마카오 4일◈5성급호텔/리무진버스/옹핑케이블카/특식3회◈
						<input class="popular_ranking_button" type="button"  id="go_item6" value="상품보기 >" style="margin-top:23px;">
					</div>
				</div> 
			</div>
			<!-- 일본 -->
			<div id="popular_ranking_Jap">
				<div class="top1"> <!-- 오사카 -->
					<img class="ranking" src="/TwoTour/image/top1.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/오사1.jpg" >
					<div class="top1_explain">
						<h5 style="font-weight:bolder; margin-left:50px; margin-top:12px;">&emsp;오사카 3일-1일자유</h5>
						<br>
						&emsp;1. [안녕!이스타] 오사카/나라/고베 3일 【1일자유】 알짜여행 [세미더블]<br>
						&emsp;2. 오사카 3일 [1일자유] 간사이(關西)황금로드(路)+스파월드<br>
						<input class="popular_ranking_button" type="button"  id="go_item7" value="상품보기 >" style="margin-top:33px;">
					</div>
				</div>			
				<div class="top2"> <!-- 삿포로 -->
					<img class="ranking" src="/TwoTour/image/top2.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/삿포7.jpg">
					<div class="top2_explain">
						<h5 style="font-weight:bolder; margin-left:10px; margin-top:10px; margin-bottom:20px;">온천,자연,음식 NO.1 북해도(홋카이도) 4일</h5>
						<br>
						&emsp;1. [HNT단독호텔]◈3大온천마을 숙박◈ 홋카이도 4일<br>
						&emsp;2. [Hot 세일/핵심관광] 홋카이도 4일-온천1박/삿포로2박<br>
					
						<input class="popular_ranking_button" type="button"  id="go_item8" value="상품보기 >" style="margin-top:10px;"">
					</div>
				</div>
				<div class="top3"> <!-- 오사카 -->
					<img class="ranking" src="/TwoTour/image/top3.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/오사5.jpg">
					<div class="top3_explain">
						<h5 style="font-weight:bolder; margin-left:30px; margin-top:12px;">오사카 4일-유니버셜 스튜디오(USJ)</h5>
						<br>
						&emsp;1. *FULL STAY* 오사카/USJ 4일 베스트셀러-유니버셜 아리마온천<br>
						&emsp;2. [테마파크]오사카/유니버설스튜디오재팬 4일♬USJ+전박트윈 +난바 연박+대욕장♨♬<br>
						
						<input class="popular_ranking_button" type="button"  id="go_item9" value="상품보기 >" style="margin-top:23px;">
					</div>
				</div> 
			</div>
			<!-- 남태평양 -->
			<div id="popular_ranking_SouthP">
				<div class="top1"> <!-- 괌 -->
					<img class="ranking" src="/TwoTour/image/top1.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/PGP431_2.jpg">
					<div class="top1_explain">
						<h5 style="font-weight:bolder; margin-left:50px; margin-top:12px;">[오전출발] 괌 PIC 4일</h5>
						<br>
						&emsp;1. 괌 4일 PIC 골드 슈페리어 리티디안 스노클링팩 [시내관광+씨그릴디너]<br>
						&emsp;2. 괌 4일 PIC 골드 시헤키룸 [씨그릴+언더워터월드+피시아이+스낵바구니]
						<input class="popular_ranking_button" type="button"   id="go_item10"value="상품보기 >" style="margin-top:20px;">
					</div>
				</div>		
				<div class="top2"> <!-- 괌 -->
					<img class="ranking" src="/TwoTour/image/top2.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/PGP730_1.jpg">
					<div class="top2_explain">
						<h5 style="font-weight:bolder; margin-left:50px; margin-top:10px;">◆오전출발◆ 괌 특가상품</h5>
						<br>
						&emsp;1. ♥맛집이 가까운 1급호텔♥ 괌 로얄 오키드 4일-[시내관광/조식불포함]<br>
						&emsp;2. ♥오전출발-가성비끝판왕!!♥ 괌 플라자 호텔 4일-[시내관광/조식불포함]<br>
						<input class="popular_ranking_button" type="button"  id="go_item11" value="상품보기 >" style="margin-top:38px; padding-top:8px; height:22px;">
					</div>
				</div>
				<div class="top3"> <!-- 뉴질랜드 -->
					<img class="ranking" src="/TwoTour/image/top3.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/PNP401_1.jpg">
					<div class="top3_explain">
						<h5 style="font-weight:bolder; margin-left:20px; margin-top:12px;">[100% PURE] 뉴질랜드 남북섬 7-9일</h5>
						<br>
						&emsp;1. 뉴질랜드 남북섬 8일★타스만빙하+와이헤케아일랜드★<br>
						&emsp;2. ★뉴질랜드남북섬 9일-빙하투어&모에라키볼더스<br>
						<input class="popular_ranking_button" type="button"  id="go_item12" value="상품보기 >" style="margin-top:23px;">
					</div>
				</div> 
			</div>
			<!-- 유럽 -->
			<div id="popular_ranking_Europe">
				<div class="top1"> <!-- 독일 -->
					<img class="ranking" src="/TwoTour/image/top1.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/EWP305_2.jpg">
					<div class="top1_explain">
						<h5 style="font-weight:bolder; margin-left:10px; margin-top:10px;">[1개국 깊이보기] 독일 완벽일주 8~9일</h5>
						<br>
						&emsp;1. 독일 완벽일주 9일추크슈피체,드레스덴 야경,뤼데스하임<br>
						&emsp;2. 독일 완벽일주 9일추크슈피체,드레스덴 야경
						<input class="popular_ranking_button" type="button"  id="go_item13" value="상품보기 >" style="margin-top:33px;">
					</div>
				</div>			
				<div class="top2"> <!-- 파리 -->
					<img class="ranking" src="/TwoTour/image/top2.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/EWP332_01.jpg">
					<div class="top2_explain">
						<h5 style="font-weight:bolder; margin-left:10px; margin-top:10px; margin-bottom:20px;">[2개국 깊이보기] 영국+프랑스 일주 6~9일</h5>
						<br>
						&emsp;1. 런던+파리 6일 ★대한항공 직항+인솔자 동행★<br>
						&emsp;2. 영국/프랑스 자유+쇼핑 9일 마레, 라발레,비스터빌리지
						<input class="popular_ranking_button" type="button"  id="go_item14" value="상품보기 >" style="margin-top:17px;">
					</div>
				</div>
				<div class="top3"> <!-- 독일 -->
					<img class="ranking" src="/TwoTour/image/top3.png">
					<img class="popular_ranking_img" src="/TwoTour/image/package/EWP308_2.jpg">
					<div class="top3_explain">
						<h5 style="font-weight:bolder; margin-left:30px; margin-top:12px;">[2개국 깊이보기] 프랑스+독일 일주</h5>
						<br>
						&emsp;1. 독일+프랑스 2개국 낭만 일주 9일 ■추크슈피체/독일 온천/쁘띠프랑스/와이너리■
						<input class="popular_ranking_button" type="button" id="go_item15" value="상품보기 >" style="margin-top:53px;">
					</div>
				</div> 
			</div>
			<!-- 미주/중남미 -->
			<div id="popular_ranking_A_LatinA">
				<div class="top1">
					<img class="ranking" src="/TwoTour/image/top1.png"> <!-- 라스베이거스 -->
					<img class="popular_ranking_img" src="/TwoTour/image/package/HWP203_03.jpg">
					<div class="top1_explain">
						<h5 style="font-weight:bolder; margin-left:10px;">[테마][전문가동반] 라스베이거스 CES 관람 여행</h5>
						<br>
						&emsp;1. 미래투자 탐방기행 7일 ◈ 라스베이거스 4연박
						<input class="popular_ranking_button" type="button"  id="go_item16" value="상품보기 >" style="margin-top:60px;">
					</div>
				</div>	
				<div class="top2">
					<img class="ranking" src="/TwoTour/image/top2.png"> <!-- 칸쿤 -->
					<img class="popular_ranking_img" src="/TwoTour/image/package/cacun11.jpg">
					<div class="top2_explain">
						<h5 style="font-weight:bolder; margin-left:10px; margin-top:10px; margin-bottom:20px;">[LATAM 연합]  중남미 7/8개국 18일</h5>
						<br>
						&emsp;1. [LATAM 연합]  중남미 8개국 및 미국 18일/NO옵션
						<input class="popular_ranking_button" type="button"  id="go_item17" value="상품보기 >" style="margin-top:50px;">
					</div>
				</div>
				<div class="top3">
					<img class="ranking" src="/TwoTour/image/top3.png"> <!-- 부에노스 아이레스 -->
					<img class="popular_ranking_img" src="/TwoTour/image/package/buenosares12.jpg">
					<div class="top3_explain">
						<h5 style="font-weight:bolder; margin-left:40px; margin-top:10px; ">[하나단독]중남미 알짜배기 17일</h5>
						<br>
						&emsp;1. [하나단독]중남미 알짜배기 17일 -우유니소금사막/NO 옵션
						<input class="popular_ranking_button" type="button"  id="go_item18" value="상품보기 >" style="margin-top:55px;">
					</div>
				</div> 
			</div>
			
		</div>
	</div>
	
	
	
	
	
	<!-- 고객센터  -->
	<div id="customer_service_center_bigWrap">
		<div id="customer_service_center_logo">
			<img src="/TwoTour/image/logo.png"> 
		</div>
		<div id="customer_service_center_wrap">
			<h1 style="font-size:15pt; font-weight:bolder;">투투어닷컴고객센터  <label style="color:rgb(246,61,139); font-size:15pt; font-weight:bolder;">1004-1004</label></h1>
			고객님의 문의사항에 대해 당담자가 친절히 안내해드립니다.<br><br>
			<div id="customer_service_center_div">
				<label style="font-size:14px; font-weight:bold; color:black; margin-bottom:7px; display:inline-block;">해외여행 문의</label><br>
				1. 평일 해외여행 상담시간(월~금)<br>
				&emsp;&emsp;1)기본상담시간: 09:00~18:00<br>
				&emsp;&emsp;2)당직상담시간: 18:00~20:00<br>
				2. 토요일 해외여행 상담시간<br>
				&emsp;&emsp;1)09:00~18:00<br>
				3. 일요일 및 공휴일은 휴무<br>
			</div>
			<div id="customer_service_center_div2">
				<label style="font-size:14px; font-weight:bold; color:black; margin-bottom:7px; display:inline-block;">ARS상담번호안내</label><br>
				<label style="font-weight:bolder; margin-right:5px;">1번</label>해외여행&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<label style="font-weight:bolder; margin-right:5px;">5번</label>예약한 고객및 예약확인<br>
				<label style="font-weight:bolder; margin-right:5px;">2번</label>자유여행 투프리&nbsp;&nbsp;&emsp;&emsp;&emsp;<label style="font-weight:bolder; margin-right:5px;">6번</label>마일리지 및 카드 국내 공연 예매<br>
				<label style="font-weight:bolder; margin-right:5px;">3번</label>국내여행&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<label style="font-weight:bolder; margin-right:5px;">7번</label>SM면세점 최대30% 할인주문<br>
				<label style="font-weight:bolder; margin-right:5px;">4번</label>기업출장 단체여행&nbsp;&nbsp;&emsp;&emsp;<label style="font-weight:bolder; margin-right:5px;">9번</label>쇼핑 환불 및 여행후 불편사항<br>
				<label style="font-weight:bolder; margin-right:5px; color:rgb(246,61,139);">&emsp;↳</label>[전용상담]1677-8282&nbsp;&nbsp;&emsp;<label style="font-weight:bolder; margin-right:5px;">0번</label>Help Desk<br>
			</div>
			<div id="customer_service_center_div3">
				<label style="font-size:14px; font-weight:bold; color:black; margin-bottom:7px; display:inline-block;">국내여행 단체문의</label><br>
				평일: 09:00~18:00<br>
				<label style="font-weight:bold;">SM면세점 최대30% 할인주문</label><br>
				평일: 10:00~18:00<br>
				(토요일/일요일/공휴일은 휴무) 
			</div>
			<div id="customer_service_center_div4">
				<label style="font-size:15px; font-weight:bold; color:black;">안심카드결제 ARS 1004-1000</label><br><br>
			</div>
		</div>
	</div>
	
	
</div>
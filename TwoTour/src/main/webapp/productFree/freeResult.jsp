<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.timeSch{
	text-align: center;
	font: 20px Tahoma, Arial;
}
.inOutType{
	text-align: center;
	font: 16px Tahoma, Arial;
}
</style>
<link rel="stylesheet" type="text/css" href="../css/productFree/global.css"/>
<link rel="stylesheet" type="text/css" href="../css/productFree/freeResult.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../js/productFree/freeResult.js"></script>

<div class="hana_air_ticket">
<div class="hana_air_result">
<div class="top_search" style="height:118px">


<!-- 상단의 상단-------------------------------------------- -->
<div class="top_search_area" id="topSchdDiv">
	<div class="search_control travel_back" style="display:block">
		<h6 class="tit">왕복</h6>
		<div class="air_info">
			<div class="type01">
				<div class="start">
					<strong>${firstMap.depart_city}</strong>
					<span>${firstMap.depart_date}(토)</span>
				</div>
				<div class="end">
					<strong>${firstMap.arrive_city}</strong>
					<span>${firstMap.return_date }(일)</span><!-- 귀국할 날짜 -->
				</div>
			</div>
		</div>
		<div class="txt">
			<strong class="grade">${firstMap.seat_grade }</strong>
			<ul>
				<li>성인 <strong>${firstMap.adultCnt }</strong>명</li>
				<li>소아 <strong>${firstMap.childCnt }</strong>명</li>
				<li>유아 <strong>${firstMap.babyCnt }</strong>명</li>
			</ul>
		</div>
		<button id="researchBtn" onclick="fnResearchBtnClick('${firstMap.depart_city}',' ${firstMap.depart_date }', '${ firstMap.arrive_city}', '${firstMap.return_date }', '${firstMap.adultCnt }', '${firstMap.childCnt }', '${firstMap.babyCnt }')">재검색</button>
	</div>
</div>
<!-- 상단의 하단----------------------------------------------- -->

<div class="search_view" id="searchView" style="display: none;">
<form id='freeResultForm' method='POST' action='/TwoTour/productFree/getAirplaneSchedule.do'>
	<div class="check_radio">
		<ul>
			<li>
				<input type="radio" name="sum1" id="i11" class="pb_radio bold on" value="왕복">
				<label for="i11">왕복</label>
			</li>
			<li>
				<input type="radio" name="sum1" id="i22" class="pb_radio bold" value="편도">
				<label for="i22">편도</label>
			</li>
		</ul>
	</div>
	

<!-- 상단의 하단 왕복 구간----------------------------------------------------------------->
	<div class="search_box" style="display: block;">
		<ul class="m_t20">
			<li>출국</li>
			<li class="blut">
				<div class="pb_select st_01" id="depCity" style="width: 196px; z-index: 59;">
					<div class="select on">
						<select id="freeResult_depart_city" name='depart_city' class='select_input_int_arrive'>
							
			            	<option value="부산">부산</option>       
			            	<option value="인천">인천</option>     	
						</select>
					</div>
				</div>
			</li><!--   .blut   -->
			<li class="city" id="arr0CityRTLi">
					<!-- ---------------------------------------- -->
					<select id='freeResult_arrive_city' name='arrive_city' class='select_input_int_arrive'>
						
						<option value="코나키나발로">코나키나발로</option>
		            	<option value="다낭">다낭</option>
		            	<option value="홍콩">홍콩</option>
		            	<option value="계림">계림</option>
		            	<option value="오사카">오사카</option>		
		            	<option value="삿포로">삿포로</option>	            	
					</select>
				<!-- </div>	 -->						
			</li>
		</ul>
		<ul class='m_t20'>
			<li>귀국</li>
				<li class="blut" id="arr0CityRTLi">
					<!-- ---------------------------------------- -->
					<select id='freeResult_depart_city_RT' name='depart_city_RT' class='select_input_int_arrive'>
						
						<option value="코나키나발로">코나키나발로</option>
		            	<option value="다낭">다낭</option>
		            	<option value="홍콩">홍콩</option>
		            	<option value="계림">계림</option>
		            	<option value="오사카">오사카</option>		
		            	<option value="삿포로">삿포로</option>	            	
					</select>						
				</li>
				<li class="city">
				<div class="pb_select st_01" id="depCity" style="width: 196px; z-index: 59;">
					<div class="select on">
						<select id="freeResult_arrive_city_RT" name='return_city_RT' class='select_input_int_arrive'>
							
			            	<option value="부산">부산</option>         
			            	<option value="인천">인천</option>   	
						</select>
					</div>
				</div>
			</li><!--   .blut   -->
		</ul>
		<ul class="m_t20" >
			<li>출발일</li>
			<li class="calendar">
				<select class="select_input_int_arrive"  id='freeResult_depart_date' name='depart_date'>
					<option value="20180113">1월13일(토)</option>
					<option value="20180114">1월14일(일)</option>
				</select>
			</li>
			<li class="txt">귀국일</li>
			<li class="calendar">
				<!-- ----------------------------------------- -->
				<select class='select_input_int_arrive' id="freeResult_return_date" name='return_date'><!-- 타국에서의 출발시간 -->
					<option value="20180113">1월13일(토)</option>
					<option value="20180114">1월14일(일)</option>
					<option value="20180115">1월15일(월)</option>
					<option value="20180116">1월16일(화)</option>
					<option value="20180117">1월17일(수)</option>
					<option value="20180118">1월18일(목)</option>
					<option value="20180119">1월19일(금)</option>
					<option value="20180120">1월20일(토)</option>
					<option value="20180121">1월21일(일)</option>
				</select>
				<!-- 미정클릭시: 그냥 둔것 -->
				<select class="retDateValSel" style='display:none;'>
					<option value="">전체</option>
					<option value="5D">5일</option>
					<option value="7D">7일</option>
					<option value="14D">14일</option>
					<option value="20D">20일</option>
					<option value="1M">1개월</option>
					<option value="2M">2개월</option>
					<option value="3M">3개월</option>
					<option value="6M">6개월</option>
					<option value="1Y">1년</option>
				</select>
			</li>
			<li class="day_unsettled"><button type="button" class="" title="도착일 미정">미정</button></li>
		</ul>
		<ul class="user_info">
			<li>인원</li>
			<li class="user_info1">
				<div class="pb_select st_01" id="adultNum" style="width: 93px; z-index: 59;">
					<div class="select on">
					
						<select id="adtCntRT" name='adultCnt'>
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
					</div>
				</div>
				<p>만 12세 이상</p>
			</li>
			<li class="user_info2">
				<div class="pb_select st_01" id="childNum" style="width: 93px; z-index: 59;">
					<div class="select on">
						<select id="chdCntRT" name='childCnt'>
							<option value="0">소아 0명</option>
							<option value="1">소아 1명</option>
							<option value="2">소아 2명</option>
							<option value="3">소아 3명</option>
							<option value="4">소아 4명</option>
							<option value="5">소아 5명</option>
							<option value="6">소아 6명</option>
							<option value="7">소아 7명</option>
							<option value="8">소아 8명</option>
							<option value="9">소아 9명</option>
						</select>
					</div>
				</div>
				<p>만 2세~11세</p>
			</li>
			<li class="user_info3">
				<div class="pb_select st_01" id="infantNum" style="width: 93px; z-index: 59;">
					<div class="select on">	
						<select id="infCntRT" name="babyCnt" >								
							<option value="0">유아 0명</option>
							<option value="1">유아 1명</option>
							<option value="2">유아 2명</option>
							<option value="3">유아 3명</option>
							<option value="4">유아 4명</option>
							<option value="5">유아 5명</option>
							<option value="6">유아 6명</option>
							<option value="7">유아 7명</option>
							<option value="8">유아 8명</option>
							<option value="9">유아 9명</option>
						</select>
			
					</div>
					
				</div>
				<p>만 2세 미만</p>
			</li>
			<li class="txt">좌석</li>
			<li class='user_seatClass'>
				<div class="pb_select st_01 type02" id="seatClass" style="width: 196px; z-index: 59;">
					<div class="select on">
						<select id="compRT" name='compRT'>
							<option value="일반석">일반석</option>
							<option value="프리미엄일반석">프리미엄일반석</option>
							<option value="비즈니스석">비즈니스석</option>
							<option value="일등석">일등석</option>
						</select>
					</div>
				</div>
			</li>
		</ul>
		<div class="btn">
			<!-- <a href="javascript:void(0);" onclick="fnFareSchdSearch('RT');" class="btn_01 type_01">검색하기</a> -->
			<button type="button" id='freeResult_searchBt'> <img alt="searchCondiion" src="/TwoTour/image/clientCenter/searchBt.jpg"></button>
		</div>
	</div>
</form>
	<!-- 왕복 구간-->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!-- 편도 구간   unilateral 단독의--------------------------------------------- -->
<div class="search_box unilateral" style="display: none;">
	<ul class="m_t20">
	<li>출국</li>
	<li class="blut">
		<div class="pb_select st_01" id="depCity" style="width: 196px; z-index: 59;">
			<div class="select on">
				<a href="javascript:void(0)" class="tit" title="">
					<span style="width: 153px;">
						<span id='span_pb_select_st_01'>인천</span>
						<input type="hidden" name='result_departCity_sum2'>
					</span>
				</a>
				<div class="maskDiv_wddo" style="position: absolute; overflow: hidden; left: 0px; top: 30px; height: 90px; width: 196px; display: none;">
					<div class="tweenDiv_wddo" style="height: 90px; margin-top: -201px;">
						<div class="scroll-pane jspScrollable" style="overflow: hidden; height: 200px; padding: 0px; width: 194px;" tabindex="-1">
							<div class="jspContainer" style="width: 194px; height: 200px;">
								<div class="jspPane" style="padding: 0px; width: 177px; top: -60px;">
									<div class="overcon" style="display: block; overflow-y: auto; overflow-x: hidden; height: 600px;">
										<ul class="con" style="height: 100%; background-color:javascript:void(0)ffffff;">
											<li>
												<a href="javascript:void(0)">
													<span>아무거나</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>weareyoung</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>인천</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>부산</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>대구</span>
												</a>
											</li>
										</ul>
										<div class="selectL" style="position: relative; margin-top: 0px;"></div>
										<div class="selectR" style="position: relative; margin-top: 0px; margin-left: 2px;"></div>
									</div>
								</div>
								<!-- <div class="jspVerticalBar">
									<div class="jspCap jspCapTop"></div>
									<a class="jspArrow jspArrowUp"></a>
									<div class="jspTrack" style="height: 166px;">
										<div class="jspDrag" style="height: 56px; top: 16.5px;">
											<div class="jspDragTop"></div>
											<div class="jspDragBottom"></div>
										</div>
									</div>
									<a class="jspArrow jspArrowDown"></a>
									<div class="jspCap jspCapBottom"></div>
								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<select id="dep0CityRT" style="display: none;">
				<option value="ICN">인천</option>
            	<option value="GMP">김포</option>
            	<option value="SEL">인천</option>
            	<option value="PUS">부산</option>
            	<option value="TAE">대구</option>			            	
			</select>
		</div>
	</li><!--   .blut   -->
	<li class="city" id="arr0CityRTLi">
		<!-- <div class="sel_input int_arrive"> --><!--  onclick="fnCitySelect('arr0CityRT');" -->
			<!-- <input type="text" id="arr0CityRTDesc" value="도시명" readonly="">
			<input type="hidden" id="arr0CityRT" value="GUM">
			<button type="button" title="도시명 검색" class="sel_city">
				<span class="ir">도시명 검색</span>
			</button> -->
			<select id="select_input_int_arrive">
				<option value="코나키나발로">코나키나발로</option>
            	<option value="다낭">다낭</option>
            	<option value="홍콩">홍콩</option>
            	<option value="계림">계림</option>
            	<option value="오사카">오사카</option>			            	
			</select>
		<!-- </div>	 -->						
	</li>
</ul>
<ul class="m_t20">
	<li>출발일</li>
	<li class="calendar">
		<select id="freeResult_depart_date3">
			<option value="20180113">1월13일(토)</option>
			<option value="20180114">1월14일(일)</option>
		</select>
	</li>
	<li class="txt">귀국일</li>
	<li class="calendar">
			<select id="freeResult_return_date4">
				<option value="20180113">1월13일(토)</option>
				<option value="20180114">1월14일(일)</option>
				<option value="20180115">1월15일(월)</option>
				<option value="20180116">1월16일(화)</option>
				<option value="20180117">1월17일(수)</option>
				<option value="20180118">1월18일(목)</option>
				<option value="20180119">1월19일(금)</option>
				<option value="20180120">1월20일(토)</option>
				<option value="20180121">1월21일(일)</option>
			</select>
			<select id="retDateValSel" style='display:none;'>
				<option value="">전체</option>
				<option value="5D">5일</option>
				<option value="7D">7일</option>
				<option value="14D">14일</option>
				<option value="20D">20일</option>
				<option value="1M">1개월</option>
				<option value="2M">2개월</option>
				<option value="3M">3개월</option>
				<option value="6M">6개월</option>
				<option value="1Y">1년</option>
			</select>
		<!-- </div> -->
			<!-- 미정 클릭시 -->
	</li>
	<li class="day_unsettled"><button type="button" class="" title="도착일 미정">미정</button></li>
</ul>
<ul class="user_info">
	<li>인원</li>
	<li class="user_info1">
		<div class="pb_select st_01" id="adultNum" style="width: 93px; z-index: 59;">
			<div class="select on">
				<a href="javascript:void(0)" class="tit" title="">
					<span style="width: 50px;">
						<span>성인 1명</span>
					</span>
				</a>
				<div class="maskDiv_wddo" style="position: absolute; overflow: hidden; left: 0px; top: 30px; height: 200px; width: 93px; display: none;">
					<div class="tweenDiv_wddo" style="height: 200px; margin-top: -201px;">
						<div class="scroll-pane jspScrollable" style="overflow: hidden; height: 200px; padding: 0px; width: 91px;" tabindex="-1">
							<div class="jspContainer" style="width: 91px; height: 200px;">
								<div class="jspPane" style="padding: 0px; width: 74px; top: 0px;">
									<div class="overcon" style="display: block; overflow-y: auto; overflow-x: hidden; height: 270px;">
										<ul class="con" style="height: 100%;">
											<li>
												<a href="javascript:void(0)">
													<span>성인 1명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>성인 2명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>성인 3명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>성인 4명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>성인 5명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>성인 6명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>성인 7명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>성인 8명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>성인 9명</span>
												</a>
											</li>
										</ul>
										<div class="selectL" style="position: relative; margin-top: 0px;"></div>
										<div class="selectR" style="position: relative; margin-top: 0px; margin-left: 2px;"></div>
									</div>
								</div>
								<div class="jspVerticalBar">
									<div class="jspCap jspCapTop"></div>
									<a class="jspArrow jspArrowUp jspDisabled"></a>
									<div class="jspTrack" style="height: 166px;">
										<div class="jspDrag" style="height: 123px; top: 0px;">
											<div class="jspDragTop"></div>
											<div class="jspDragBottom"></div>
										</div>
									</div>
									<a class="jspArrow jspArrowDown"></a>
									<div class="jspCap jspCapBottom"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<select id="adtCntRT" style="display: none;">
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
		</div>
		<p>만 12세 이상</p>
	</li>
	<li class="user_info2">
		<div class="pb_select st_01" id="childNum" style="width: 93px; z-index: 59;">
			<div class="select on">
				<a href="javascript:void(0)" class="tit" title="">
					<span style="width: 50px;">
						<span>소아 0명</span>
					</span>
				</a>
				<div class="maskDiv_wddo" style="position: absolute; overflow: hidden; left: 0px; top: 30px; height: 200px; width: 93px; display: none;">
					<div class="tweenDiv_wddo" style="height: 200px; margin-top: -201px;">
						<div class="scroll-pane jspScrollable" style="overflow: hidden; height: 200px; padding: 0px; width: 91px;" tabindex="-1">
							<div class="jspContainer" style="width: 91px; height: 200px;">
								<div class="jspPane" style="padding: 0px; width: 74px; top: 0px;">
									<div class="overcon" style="display: block; overflow-y: auto; overflow-x: hidden; height: 300px;">
										<ul class="con" style="height: 100%;">
											<li>
												<a href="javascript:void(0)">
													<span>소아 0명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>소아 1명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>소아 2명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>소아 3명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>소아 4명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>소아 5명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>소아 6명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>소아 7명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>소아 8명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>소아 9명</span>
												</a>
											</li>
										</ul>
										<div class="selectL" style="position: relative; margin-top: 0px;"></div>
										<div class="selectR" style="position: relative; margin-top: 0px; margin-left: 2px;"></div>
									</div>
								</div>
								<div class="jspVerticalBar">
									<div class="jspCap jspCapTop"></div>
									<a class="jspArrow jspArrowUp jspDisabled"></a>
									<div class="jspTrack" style="height: 166px;">
										<div class="jspDrag" style="height: 111px; top: 0px;">
											<div class="jspDragTop"></div>
											<div class="jspDragBottom"></div>
										</div>
									</div>
									<a class="jspArrow jspArrowDown"></a>
									<div class="jspCap jspCapBottom"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<select id="chdCntRT" style="display: none;">
				<option value="0">소아 0명</option>
				<option value="1">소아 1명</option>
				<option value="2">소아 2명</option>
				<option value="3">소아 3명</option>
				<option value="4">소아 4명</option>
				<option value="5">소아 5명</option>
				<option value="6">소아 6명</option>
				<option value="7">소아 7명</option>
				<option value="8">소아 8명</option>
				<option value="9">소아 9명</option>
			</select>
		</div>
		<p>만 2세~11세</p>
	</li>
	<li class="user_info3">
		<div class="pb_select st_01" id="infantNum" style="width: 93px; z-index: 59;">
			<div class="select on">
				<a href="javascript:void(0)" class="tit" title="">
					<span style="width: 50px;">
						<span>유아 0명</span>
					</span>
				</a>
				<div class="maskDiv_wddo" style="position: absolute; overflow: hidden; left: 0px; top: 30px; height: 200px; width: 93px; display: none;">
					<div class="tweenDiv_wddo" style="height: 200px; margin-top: -201px;">
						<div class="scroll-pane jspScrollable" style="overflow: hidden; height: 200px; padding: 0px; width: 91px;" tabindex="-1">
							<div class="jspContainer" style="width: 91px; height: 200px;">
								<div class="jspPane" style="padding: 0px; width: 74px; top: 0px;">
									<div class="overcon" style="display: block; overflow-y: auto; overflow-x: hidden; height: 300px;">
										<ul class="con" style="height: 100%;">
											<li>
												<a href="javascript:void(0)">
													<span>유아 0명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>유아 1명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>유아 2명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>유아 3명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>유아 4명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>유아 5명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>유아 6명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>유아 7명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>유아 8명</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0)">
													<span>유아 9명</span>
												</a>
											</li>
										</ul>
										<div class="selectL" style="position: relative; margin-top: 0px;"></div>
										<div class="selectR" style="position: relative; margin-top: 0px; margin-left: 2px;"></div>
									</div>
								</div>
								<div class="jspVerticalBar">
									<div class="jspCap jspCapTop"></div>
									<a class="jspArrow jspArrowUp jspDisabled"></a>
									<div class="jspTrack" style="height: 166px;">
										<div class="jspDrag" style="height: 111px; top: 0px;">
											<div class="jspDragTop"></div>
											<div class="jspDragBottom"></div>
										</div>
									</div>
									<a class="jspArrow jspArrowDown"></a>
									<div class="jspCap jspCapBottom"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<select id="infCntRT" style="display: none;">								
				<option value="0">유아 0명</option>
				<option value="1">유아 1명</option>
				<option value="2">유아 2명</option>
				<option value="3">유아 3명</option>
				<option value="4">유아 4명</option>
				<option value="5">유아 5명</option>
				<option value="6">유아 6명</option>
				<option value="7">유아 7명</option>
				<option value="8">유아 8명</option>
				<option value="9">유아 9명</option>
			</select>
		</div>
		<p>만 2세 미만</p>
	</li>
	<li class="txt">좌석</li>
	<li class='user_seatClass'>
		<div class="pb_select st_01 type02" id="seatClass" style="width: 196px; z-index: 59;">
			<div class="select on">
				<a href="javascript:void(0)" class="tit" title="">
					<span style="width: 153px;">
						<span>일반석</span>
					</span>
				</a>
				<div class="maskDiv_wddo" style="position: absolute; overflow: hidden; left: 0px; top: 30px; height: 120px; width: 196px; display: none;">
					<div class="tweenDiv_wddo" style="height: 120px; margin-top: -121px;">
						<div class="overcon" style="display: block; overflow-y: auto; overflow-x: hidden; height: 120px;">
							<ul class="con">
								<li>
									<a href="javascript:void(0)">
										<span>일반석</span>
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<span>프리미엄일반석</span>
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<span>비즈니스석</span>
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<span>일등석</span>
									</a>
								</li>
							</ul>
							<div class="selectL" style="position: relative; margin-top: 0px;"></div>
							<div class="selectR" style="position: relative; margin-top: 0px; margin-left: 2px;"></div>
						</div>
					</div>
				</div>
			</div>
			<select id="compRT" style="display: none;">
				<option value="Y">일반석</option>
				<option value="P">프리미엄일반석</option>
				<option value="C">비즈니스석</option>
				<option value="F">일등석</option>
			</select>
		</div>
	</li>
</ul>
<div class="btn">
	<a href="javascript:void(0);" onclick="fnFareSchdSearch('RT');" class="btn_01 type_01">검색하기</a>
</div>
</div> <!-- search_box unilateral-------------------------------------- -->
<!-- 편도 구간   unilateral 단독의    -->
</div><!-- search_view  ---top의 아랫부분 hidden부분 -->

</div><!-- top_search  ----
------- 윗 부분------------------------------------------------------------------------------------ -->		
		
		
		
		
		
		
		
<!-- ---------------------------------------------------------------------------------------------------------------------------- -->		
<div class="search_result_list" id="airMainDiv">
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!결과내 재검색!!!!!!!!!!!!!!!!!!!!!1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

<div id='left_area' style='border:1px solid black;'>

				<h3 class="tit">결과내 재검색</h3>
				<div class="result_serch">
					<div class="sel_option_list first on"><!-- 리스트 펼침 클릭시 class : on 추가 -->
						<h4>예약가능/대기예약</h4>
						<a class="btn_fold" href="javascript:void(0);"><span class="ir">리스트 접기</span></a><!-- 리스트 펼침 클릭시 class : btn_fold / btn_unfold -->
						<div class="list_box" id="stSel" style="display:block;">
							<ul>
								<li>
									<input type="radio" name="stList" id="stList_1" class="pb_radio bold" onclick="fnResearch();">
									<label for="stList_1">전체<span class="list_count">(186)</span></label>
								</li>
								<li>
									<input type="radio" name="stList" id="stList_2" class="pb_radio bold on" onclick="fnResearch();" checked="">
									<label for="stList_2">예약가능<span class="list_count">(183)</span></label>
								</li>
								<li>
									<input type="radio" name="stList" id="stList_3" class="pb_radio bold" onclick="fnResearch();">
									<label for="stList_3">대기예약<span class="list_count">(3)</span></label>
								</li>
							</ul>
						</div>
					</div>
					<div class="sel_option_list on"><!-- 리스트 펼침 클릭시 class : on 추가 -->
						<h4>직항/경유</h4>
						<a class="btn_fold" href="javascript:void(0);"><span class="ir">리스트 접기</span></a><!-- 리스트 펼침 클릭시 class : btn_fold / btn_unfold -->
						<div class="list_box" id="cnxidSel">
							<ul>
								<li>
									<input type="checkbox" name="cnxidList" id="cnxidList_1" class="pb_check bold on" onclick="fnCheckBoxChange('cnxidList', 1);" checked="">
									<label for="cnxidList_1">전체<span class="list_count">(186)</span></label>
								</li>
								<li>
									<input type="checkbox" name="cnxidList" id="cnxidList_2" class="pb_check bold" value="0" onclick="fnCheckBoxChange('cnxidList', 2);">
									<label for="cnxidList_2">직항<span class="list_count">(186)</span></label>
								</li>
							</ul>
						</div>
					</div>
					<div class="sel_option_list"><!-- 리스트 펼침 클릭시 class : on 추가 -->
						<h4>항공사</h4>
						<a class="btn_unfold" href="javascript:void(0);"><span class="ir">리스트 접기</span></a><!-- 리스트 펼침 클릭시 class : btn_fold / btn_unfold -->
						<div class="list_box" style="display:none" id="airCodeSel">
							<ul>
								<li>
									<input type="checkbox" name="carCodeList" id="carCodeList_1" class="pb_check bold on" onclick="fnCheckBoxChange('carCodeList', 1);" checked="">
									<label for="carCodeList_1">전체<span class="list_count">(186)</span></label>
								</li>
								<li>
									<input type="checkbox" name="carCodeList" id="carCodeList_2" class="pb_check bold" value="KE" onclick="fnCheckBoxChange('carCodeList', 2);">
									<label for="carCodeList_2">대한항공<span class="list_count">(55)</span></label>
								</li>
								<li>
									<input type="checkbox" name="carCodeList" id="carCodeList_3" class="pb_check bold" value="7C" onclick="fnCheckBoxChange('carCodeList', 3);">
									<label for="carCodeList_3">제주항공<span class="list_count">(99)</span></label>
								</li>
								<li>
									<input type="checkbox" name="carCodeList" id="carCodeList_4" class="pb_check bold" value="LJ" onclick="fnCheckBoxChange('carCodeList', 4);">
									<label for="carCodeList_4">진에어<span class="list_count">(31)</span></label></li><li><input type="checkbox" name="carCodeList" id="carCodeList_5" class="pb_check bold" value="TW" onclick="fnCheckBoxChange('carCodeList', 5);"><label for="carCodeList_5">티웨이항공<span class="list_count">(1)</span></label>
								</li>
							</ul>
						</div>
					</div>
					<div class="sel_option_list"><!-- 리스트 펼침 클릭시 class : on 추가 -->
						<h4>가격대</h4>
						<a class="btn_unfold" href="javascript:void(0);"><span class="ir">리스트 접기</span></a><!-- 리스트 펼침 클릭시 class : btn_fold / btn_unfold -->
						<div class="list_box" style="display:none">
							<ul>
								<li class="side">
									<div class="price" id="fareSlide">
										<span id="fareMin">358,000원</span>
										<span>~</span>
										<span id="fareMax">887,000원</span>
									</div>
									<div class="slidebar ui-slider-horizontal ui-widget ui-widget-content ui-corner-all ui-slider">
										<div class="ui-slider-range ui-widget-header ui-corner-all" style="width: 100%; left: 0%;"></div>
										<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 0%;"></span>
										<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 100%;"></span>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="sel_option_list"><!-- 리스트 펼침 클릭시 class : on 추가 -->
						<h4>요금조건</h4>
						<a class="btn_unfold" href="javascript:void(0);"><span class="ir">리스트 접기</span></a><!-- 리스트 펼침 클릭시 class : btn_fold / btn_unfold -->
						<div class="list_box" style="display:none" id="idtSel">
							<ul>
								<li>
									<input type="checkbox" name="idtList" id="idtList_1" class="pb_check bold on" onclick="fnCheckBoxChange('idtList', 1);" checked="">
									<label for="idtList_1">전체<span class="list_count">(186)</span></label>
								</li>
								<li>
									<input type="checkbox" name="idtList" id="idtList_2" class="pb_check bold" value="ADT" onclick="fnCheckBoxChange('idtList', 2);">
									<label for="idtList_2">성인<span class="list_count">(175)</span></label>
								</li>
								<li>
									<input type="checkbox" name="idtList" id="idtList_3" class="pb_check bold" value="RPA" onclick="fnCheckBoxChange('idtList', 3);">
									<label for="idtList_3">장애인<span class="list_count">(10)</span></label>
								</li>
								<li>
									<input type="checkbox" name="idtList" id="idtList_4" class="pb_check bold" value="STU" onclick="fnCheckBoxChange('idtList', 4);">
									<label for="idtList_4">학생<span class="list_count">(1)</span></label>
								</li>
							</ul>
						</div>
					</div>
					<div class="sel_option_list"><!-- 리스트 펼침 클릭시 class : on 추가 -->
						<h4>출발시간</h4>
						<a class="btn_unfold" href="javascript:void(0);"><span class="ir">리스트 접기</span></a><!-- 리스트 펼침 클릭시 class : btn_fold / btn_unfold -->
						<div class="list_box" style="display:none">
							<p>출국</p>
							<ul>
								<!--  input 태그 id 값을 label 태그 for속성 값에 동일하게 맞춰주세요 -->
								<li>
									<input type="checkbox" name="timeListDep" id="timeListDep_1" class="pb_check bold on" onclick="fnCheckBoxChange('timeListDep', 1);" checked="">
									<label for="timeListDep_1">전체</label>
								</li>
								<li>
									<input type="checkbox" name="timeListDep" id="timeListDep_2" class="pb_check bold" onclick="fnCheckBoxChange('timeListDep', 2);">
									<label for="timeListDep_2">오전 00:00~11:59</label>
								</li>
								<li>
									<input type="checkbox" name="timeListDep" id="timeListDep_3" class="pb_check bold" onclick="fnCheckBoxChange('timeListDep', 3);">
									<label for="timeListDep_3">오후 12:00~23:59</label>
								</li>
							</ul>
							<div id="midTime" style="display:none;">
								<p>중간</p>
								<ul>
									<!--  input 태그 id 값을 label 태그 for속성 값에 동일하게 맞춰주세요 -->
									<li>
										<input type="checkbox" name="timeListMid" id="timeListMid_1" class="pb_check bold on" onclick="fnCheckBoxChange('timeListMid', 1);" checked="">
										<label for="timeListMid_1">전체</label>
									</li>
									<li>
										<input type="checkbox" name="timeListMid" id="timeListMid_2" class="pb_check bold" onclick="fnCheckBoxChange('timeListMid', 2);">
										<label for="timeListMid_2">오전 00:00~11:59</label>
									</li>
									<li>
										<input type="checkbox" name="timeListMid" id="timeListMid_3" class="pb_check bold" onclick="fnCheckBoxChange('timeListMid', 3);">
										<label for="timeListMid_3">오후 12:00~23:59</label>
									</li>
								</ul>
							</div>
							<div id="arrTime" style="">
								<p>귀국</p>
								<ul>
									<!--  input 태그 id 값을 label 태그 for속성 값에 동일하게 맞춰주세요 -->
									<li>
										<input type="checkbox" name="timeListArr" id="timeListArr_1" class="pb_check bold on" onclick="fnCheckBoxChange('timeListArr', 1);" checked="">
										<label for="timeListArr_1">전체</label>
									</li>
									<li>
										<input type="checkbox" name="timeListArr" id="timeListArr_2" class="pb_check bold" onclick="fnCheckBoxChange('timeListArr', 2);">
										<label for="timeListArr_2">오전 00:00~11:59</label>
									</li>
									<li>
										<input type="checkbox" name="timeListArr" id="timeListArr_3" class="pb_check bold" onclick="fnCheckBoxChange('timeListArr', 3);">
										<label for="timeListArr_3">오후 12:00~23:59</label>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="sel_option_list"><!-- 리스트 펼침 클릭시 class : on 추가 -->
						<h4>유효기간</h4>
						<a class="btn_unfold" href="javascript:void(0);"><span class="ir">리스트 접기</span></a><!-- 리스트 펼침 클릭시 class : btn_fold / btn_unfold -->
						<div class="list_box" style="display:none" id="vdtSel">
							<ul>
								<li>
									<input type="checkbox" name="vdtList" id="vdtList_1" class="pb_check bold on" onclick="fnCheckBoxChange('vdtList', 1);" checked="">
									<label for="vdtList_1">전체<span class="list_count">(186)</span></label>
								</li>
								<li>
									<input type="checkbox" name="vdtList" id="vdtList_2" class="pb_check bold" value="4일" onclick="fnCheckBoxChange('vdtList', 2);">
									<label for="vdtList_2">4일<span class="list_count">(1)</span></label>
								</li>
								<li>
									<input type="checkbox" name="vdtList" id="vdtList_3" class="pb_check bold" value="5일" onclick="fnCheckBoxChange('vdtList', 3);">
									<label for="vdtList_3">5일<span class="list_count">(2)</span></label>
								</li>
								<li>
									<input type="checkbox" name="vdtList" id="vdtList_4" class="pb_check bold" value="6개월" onclick="fnCheckBoxChange('vdtList', 4);">
									<label for="vdtList_4">6개월<span class="list_count">(25)</span></label>
								</li>
								<li>
									<input type="checkbox" name="vdtList" id="vdtList_5" class="pb_check bold" value="12개월" onclick="fnCheckBoxChange('vdtList', 5);">
									<label for="vdtList_5">12개월<span class="list_count">(149)</span></label>
								</li>
								<li>
									<input type="checkbox" name="vdtList" id="vdtList_6" class="pb_check bold" value="1년" onclick="fnCheckBoxChange('vdtList', 6);">
									<label for="vdtList_6">1년<span class="list_count">(9)</span></label>
								</li>
							</ul>
						</div>
					</div>
					<div class="sel_option_list"><!-- 리스트 펼침 클릭시 class : on 추가 -->
						<h4>항공권</h4>
						<a class="btn_unfold" href="javascript:void(0);"><span class="ir">리스트 접기</span></a><!-- 리스트 펼침 클릭시 class : btn_fold / btn_unfold -->
						<div class="list_box" style="display:none" id="fareTypeSel">
							<ul>
								<li>
									<input type="checkbox" name="fareTypeList" id="fareTypeList_1" class="pb_check bold on" onclick="fnCheckBoxChange('fareTypeList', 1);" checked="">
									<label for="fareTypeList_1">전체<span class="list_count">(186)</span></label>
								</li>
								<li>
									<input type="checkbox" name="fareTypeList" id="fareTypeList_2" class="pb_check bold" onclick="fnCheckBoxChange('fareTypeList', 2);">
									<label for="fareTypeList_2">개별항공권<span class="list_count">(183)</span></label>
								</li>
								<li>
									<input type="checkbox" name="fareTypeList" id="fareTypeList_3" class="pb_check bold" onclick="fnCheckBoxChange('fareTypeList', 3);">
									<label for="fareTypeList_3">
										<p>알짜항공권</p>
										<div class="qs_layer">
											<a href="javascript:void(0);" class="ico qs_02"></a>
											<div class="laypop_txt">
												<span class="blut"></span>
												<p>하나투어가 미리 확보한 항공 좌석을<br>다양한 요금 및 혜택으로 선택의 폭을<br>넓혀주는 실속 알짜배기 항공권</p>
											</div>
										</div>
										<span class="list_count">(3) </span>
									</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- <div class="air_ticket_comparison">
					<h3 id="comparisonTitle">항공권 비교(0)</h3>
					<a class="btn_unfold" href="javascript:void(0);" id="resultAirTicketBoxBtn"><span class="ir">리스트 접기</span></a>리스트 펼침 클릭시 class : btn_fold / btn_unfold
					<div class="list_box" id="resultAirTicketBox" style="display:none;">
						<a href="javascript:void(0);" class="comparison" id="comparison" onclick="fnAirCompare();">선택한 항공권 비교</a>
					</div>
				</div> -->
				<div id="airBanner">

	<div class="air_banner">
		<span class="label">비즈니스 특가</span>
		<a href="http://flight.hanatour.com/dsc/DscSale.hnt?cityGroupType=PB0002&amp;cityCode=GUM&amp;hanacode=air_business" target="_blank">
			<div class="txt">				
				<strong>괌</strong>
				<span>
					
						
						
							중화항공
						
					
				</span>					
				
				<p>878,800원~</p>
			</div>
			<div class="name">
				
				<!-- <img src="http://image1.hanatour.com/2010/images/airline/CI.png" alt=""> -->				
			</div>
		</a>
	</div>
</div>
				<div id="hotelBanner">

		<div class="hotel_banner">			

			<span class="label">추천 호텔</span>			
			<a href="http://www.hanatour.com/asp/booking/lodge/lg-33000.asp?lodge_code=G42041&amp;hanacode=air_cross_hotel" target="_blank">
				<div class="txt">
					<strong>괌</strong>
					
					<span>

								HOTEL NIKKO GUAM
							
						
					</span>
					
						<p>176,330원~</p>
					
				</div>
			</a>
			
			<!-- <img src="http://www.hanatour.com/asp/booking/lodge/view_image.asp?company_code=C00002&amp;obj_img=image1&amp;img_no=214781" alt=""> -->
		</div>
		<div class="hotel_banner">			
			<span class="label">추천 현지투어</span>			
			<a href="http://www.hanatour.com/asp/booking/daytour/dt-20000.asp?compCode=B00002&amp;tourCode=P10AN00656&amp;applySeq=1&amp;TourDate=20171128&amp;hanacode=air_cross_tour" target="_blank">
				<div class="txt">
					<strong>괌</strong>
					<span>		
								[아가나][괌] 돌핀 크루즈
					</span>
					
						<p>52,360원~</p>
					
				</div>
			</a>
			
			<!-- <img src="http://image5.hanatour.com/mst_info_image/4/P001140294_M.jpg" alt=""> -->
		</div>
	
		<div class="hotel_banner">			
			

			<span class="label">추천 입장권</span>			
			<a href="http://www.hanatour.com/asp/booking/pass/ps-10000.asp?searchType=03&amp;useCountryCode1=GU&amp;useCityCode=GUM&amp;prdMstCode=P10PS1P&amp;adultCnt=1&amp;hanacode=air_cross_ticket" target="_blank">
				<div class="txt">
					<strong>괌</strong>
					
					<span>

								[괌] 트롤리패스 5일권

						
					</span>
					
						<p>15,000원~</p>
					
				</div>
			</a>
			
			<!-- <img src="http://image5.hanatour.com/mst_info_image/1/P000632921_S.jpg" alt=""> -->
		</div>
</div>
			
</div>
<div id='result_list_area'>
<table border='1' id='airplane_scheduleT'>
<tr class='airplane_scheduleT_th'>
	<td width='270px'>
		항공사
	</td>
	<td width='100px'>
		경유
	</td>
	<td width='100px'>
		유효기간
	</td>
	<td width='100px'>
		총비행시간
	</td>
	<td width='270px'>
		성인1인총요금
	</td>
</tr>
<c:if test='${combiMap1 eq null}'>
<c:forEach var='airplaneDTO' items='${airplaneList }' varStatus='num'>


<c:if test='${groupNum != airplaneDTO.adult_cost  }'  >
<tr class='freeResult_tr'>
<td colspan='5' style='height: 50px;' id='freeResult_td'>
	<div class='freeResult_divSet' id='freeResult_divSet${num.index }'>
	<div class='freeResult_forTd1' style='padding-bottom:10px;'>
		<img id='productFree_air_logo' src='/TwoTour/image/productFree/${airplaneDTO.imagename}'>
	</div>
	<div class='freeResult_forTd2' style='top:20px;'>
		<span>${ airplaneDTO.airplane_name}</span>
	</div>
	<div class='freeResult_forTd3' style='top:20px;'>
		<span>직 항</span>
	</div>
	<div class='freeResult_forTd4' style='top:20px;'>
		<span>12개월</span>
	</div>
	<div class='freeResult_forTd5' style='top:20px;'>
		<button class='priceTableBt' value='보기'  >보기</button>
	</div>
	<div class='freeResult_forTd6' style='top:20px;'>
		<span> <fmt:formatNumber value = "${ airplaneDTO.adult_cost}" type = "currency"/></span>
	</div>
	</div>
</td>
</tr>
<tr class='data_Tr boom' id='hide_tr${num.index}' style="display: none;">
	<td rowspan='2' width='270px' class='inOutType' >
		<b>출국편</b>
		<br>
		${airplaneDTO.depart_date}&nbsp;&nbsp;&nbsp; ${airplaneDTO.depart_day }
	</td>
	<td colspan='4' height='35px;' class='timeSch' >
		<span>${ airplaneDTO.depart_time}</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		>>>>>>>>>>>>>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${ airplaneDTO.arrive_time}
	</td>
</tr>
<tr class='data_Tr boom' id='next_hide_tr${num.index}'  style='display: none;'>
	<td id='next_out${airplaneDTO.adult_cost}' class='timeSch'  colspan='5' height='35px'>

	</td>
</tr>
<tr  style='display: none;'>
	<td colspan='5' height='20px' align='center'>
		<button type="button" class='reservAirBt'onclick="goToPreInfom()">확인하기</button>
	</td>
</tr>
</c:if>
<%-- <c:if test='${groupNum == airplaneDTO.adult_cost  }'  >
<input id='hidden_code${num.index }' type='hidden' value='${airplaneDTO.airplane_code }'>

</c:if>
 --%>
<c:set var="groupNum" value="${airplaneDTO.adult_cost }"/>

<ul id='testul_${num.index}' style='display:none;'>
	<li class='testil' id="testil_airplane_code">${airplaneDTO.airplane_code }</li>
	<li class='testil' id="testil_depart_city">${airplaneDTO.depart_city }</li>
	<li class='testil' id="testil_depart_date">${airplaneDTO.depart_date }</li>
	<li class='testil' id="testil_depart_time">${airplaneDTO.depart_time }</li>
	<li class='testil' id="testil_arrive_city">${airplaneDTO.arrive_city }</li>
</ul>

</c:forEach>
</c:if>



<!-- 왕복 -->
<c:if test='${combiMap1 != null}'>

<c:forEach var='combiMap1' items='${combiMap1 }' varStatus='num'>


<tr class='freeResult_tr'>
<td colspan='5' style='height: 50px;' id='freeResult_td'>
<!-- freeResult_divSet -->
	<div class='freeResult_divSet RT' id='freeResult_divSet${num.index }' style='padding-bottom:10px;'>
	<div class='freeResult_forTd1'>
		<img id='productFree_air_logo' src='/TwoTour/image/productFree/${combiMap1.value[0].imagename}'>
	</div>
	<div class='freeResult_forTd2'style='top:20px;'>
		<span>${ combiMap1.value[0].airplane_name}</span>
	</div>
	<div class='freeResult_forTd3'style='top:20px;'>
		<span>직항</span>
	</div>
	<div class='freeResult_forTd4'style='top:20px;'>
		<span>12개월</span>
	</div>
	<div class='freeResult_forTd5'style='top:20px;'>
		<button id='priceTableBt' value='보기' >보기</button>
	</div>
	<div class='freeResult_forTd6'style='top:20px;'>
         <fmt:formatNumber value = "${ combiMap1.key}" type = "currency"/></span>
	</div>
	</div>
</td>
</tr>
<tr class='data_Tr boom' id='hide_tr${num.index }' style="display: none;">
	<td rowspan='2' width='270px' class='inOutType' >
		<b>출국편</b>
		<br>
		${combiMap1.value[0].depart_date} ${combiMap1.value[0].depart_day }
	</td>
	<td colspan='4'  height='35px;' class='timeSch' >
		<span>${ combiMap1.value[0].depart_time}</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		>>>>>>>>>>>>>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${ combiMap1.value[0].arrive_time}
	</td>
</tr>
<tr class='data_Tr boom' id='next_hide_tr${num.index}'  style='display: none;'>
	<td id='next_out${combiMap1.key}' class='timeSch'  colspan='5' height='35px'>

	</td>
</tr>
<tr class='data_Tr RT boom' id='hide_tr${num.index }' style="display: none;">
	<td rowspan='2' width='270px'  class='inOutType' >
		<b>귀국편</b>
		<br>
		${combiMap1.value[1].depart_date} ${combiMap1.value[1].depart_day }
	</td>
	<td colspan='4'  height='35px;' class='timeSch' >
		<span>${ combiMap1.value[1].depart_time}</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		>>>>>>>>>>>>>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${ combiMap1.value[1].arrive_time}
	</td>
</tr>
<tr class='data_Tr RT boom' id='next_hide_tr${num.index}'  style='display: none;'>
	<td id='next_in${combiMap1.key}' class='timeSch' colspan='5' height='35px'>
	</td>
</tr>
<tr  style='display: none;'>
	<td colspan='5' height='20px' align='center'>
		<button type="button" id='reservAirBt'onclick="goToPreInfom()">확인하기</button>
	</td>
</tr>



<ul id='testul_${num.index}' style='display:none;'>
	<li class='testil' id="testil_airplane_code">${combiMap1.value[0].airplane_code }</li>
	<li class='testil' id="testil_depart_city">${combiMap1.value[0].depart_city }</li>
	<li class='testil' id="testil_depart_date">${combiMap1.value[0].depart_date }</li>
	<li class='testil' id="testil_depart_time">${combiMap1.value[0].depart_time }</li>
	<li class='testil' id="testil_arrive_city">${combiMap1.value[0].arrive_city }</li>
	
	<li class='testil' id="RTtestil_airplane_code">${combiMap1.value[1].airplane_code }</li>
	<li class='testil' id="RTtestil_depart_city">${combiMap1.value[1].depart_city }</li>
	<li class='testil' id="RTtestil_depart_date">${combiMap1.value[1].depart_date }</li>
	<li class='testil' id="RTtestil_depart_time">${combiMap1.value[1].depart_time }</li>
	<li class='testil' id="RTtestil_arrive_city">${combiMap1.value[1].arrive_city }</li>
</ul>
</c:forEach>

</c:if>
</table>








<div id='hidden_table' style='display: none;'>
<form name='hidden_table_form' id='hidden_table_form' method='POST' action='/TwoTour/productFree/showPre_AirTicketInform.do' >

<input type='hidden' name='airplane_code' value=''>
<input type='hidden' name='depart_city' value=''>
<input type='hidden' name='depart_date' value=''>
<input type='hidden' name='depart_time' value=''>
<input type='hidden' name='arrive_city' value=''>
<c:if test='${combiMap1 != null}'>
<input type='hidden' name='airplane_code1' value=''>
<input type='hidden' name='depart_city1' value=''>
<input type='hidden' name='depart_date1' value=''>
<input type='hidden' name='depart_time1' value=''>
<input type='hidden' name='arrive_city1' value=''>
</c:if>
</form>
</div>
<div id='forAjax' style='display: none;'>
<input type='hidden' name='tripType_forAjax' id='tripType_forAjax' value='${firstMap.tripType}'>
<input type='hidden' name='depart_city_forAjax' value='${firstMap.depart_city}'>
<input type='hidden' name='depart_date_forAjax' value='${firstMap.depart_date }'>
<input type='hidden' name='arrive_city_forAjax' value='${firstMap.arrive_city}'>
<input type='hidden' name='return_date_forAjax' value='${firstMap.return_date}'>
</div>





</div><!-- result_list_area -->
</div><!-- search_result_list 결과내 재검색 ------------------------------------------------------>
		

		
</div><!-- hana_air_result -->
</div><!-- hana_air_ticket -->

<script>
$(document).ready(function(){

});

</script>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="../css/rentCar/rentCar1.css" />
<style>

</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../js/rentCar/rentCar1.js"></script>

<script>
$(document).ready(function(){
	$('#body').css('height','1500px');
	
});
$(window).bind('beforeunload',function(){
	$('#body').css('height','1500px');
});
</script>

<div id="rentCar1">
	<div id="rentCar1_background_div">
		
		<div id="rentCar1_search">
			<div id="rentCar1_search1">
				<img id="car_image" src="/TwoTour/image/렌트카.PNG">
				렌터카 
			</div>
		<form id="checkSearch" name="checkSearch" method="get" action="/TwoTour/rentCar/rentCar2.do">
			<input type="hidden" name="pg" value="1">
			<div id="rentCar1_search2">
				<div class="rentCar1_search2-1">
					<div class="rentCar1_search2-1_location">
						<ul style="height:100%;">
							<li class="rentCar1_search2-1_location_rent">
								<p class="rentCar1_search2-1_location_rentText">대여장소
									<a href="javascript:show_majorNewCity();" class="rentCar1_search2-1_location_rentSearch">주요지점선택</a>
								</p>
								<div class="rentCar1_search2-1_location_rentSearch_content_Div">
									<input type="text" id="rentCar1_search2-1_location_rentSearch_content" name="rentlocation" placeholder="도시,공항 등 검색가능">
								</div>
							</li>
							<li class="rentCar1_search2-1_location_return">
								<p class="rentCar1_search2-1_location_returnText">반납장소
								</p>
								<div class="rentCar1_search2-1_location_returnSearch_content_Div">
									<input type="text" id="rentCar1_search2-1_location_returnSearch_content" name="returnlocation" placeholder="도시,공항 등 검색가능">
								</div>	
							</li>
						</ul>
					</div>
					<div class="rentCar1_search2-1_rentTime">
						<ul style="height:100%">
							<li class="rentCar1_search2-1_rentTime_day">
								<p class="rentCar1_search2-1_rentTime_dayText">대여일시
								</p>
								<div class="rentCar1_search2-1_rentTime_dayText_content_Div">
									<input type="text" id="rentDate" class="rentCar1_search2-1_rentTime_dayText_content" name="rentTime" value="2017-12-08">
									<button type="button" title="달력검색" id="sel_calendar" >
					                	<span class="ir">달력검색</span>
					                </button>
								</div>
							</li>
							<li class="rentCar1_search2-1_rentTime_minute">
								<div class="rentCar1_search2-1_rentTime_minuteDiv">
									<select name="rentMinute">
										<option value="00분">00분</option>
										<option value="15분">15분</option>
										<option value="30분">30분</option>
									</select>						
								</div>
							</li>	
							<li class="rentCar1_search2-1_rentTime_hour">
								<div class="rentCar1_search2-1_rentTime_hourDiv">
									<select name="rentHour">
										<option value="00시">00시</option>
										<option value="01시">01시</option>
										<option value="02시">02시</option>
										<option value="03시">03시</option>
										<option value="04시">04시</option>
										<option value="05시">05시</option>
										<option value="06시">06시</option>
										<option value="07시">07시</option>
										<option value="08시">08시</option>
										<option value="09시">09시</option>
										<option value="10시">10시</option>
										<option value="11시">11시</option>
										<option value="12시">12시</option>
										<option value="13시">13시</option>
										<option value="14시">14시</option>
										<option value="15시">15시</option>
										<option value="16시">16시</option>
										<option value="17시">17시</option>
										<option value="18시">18시</option>
										<option value="19시">19시</option>
										<option value="20시">20시</option>
										<option value="21시">21시</option>
										<option value="22시">22시</option>
										<option value="23시">23시</option>
									</select>
								</div>
							</li>			
						</ul>
					
					</div>
					<div class="rentCar1_search2-1_returnTime">
						<ul style="height:100%">
							<li class="rentCar1_search2-1_returnTime_day">
								<p class="rentCar1_search2-1_returnTime_dayText">반납일시
								</p>
								<div class="rentCar1_search2-1_returnTime_dayText_content_Div">
									<input type="text" id="returnDate" class="rentCar1_search2-1_returnTime_dayText_content" name="returnTime" value="2017-12-08">
									<button type="button" title="달력검색" id="sel_calendar2">
					                	<span class="ir">달력검색</span>
					                </button>
								</div>
							</li>
							<li class="rentCar1_search2-1_returnTime_minute">
								<div class="rentCar1_search2-1_returnTime_minuteDiv">
									<select name="returnMinute">
										<option value="00분">00분</option>
										<option value="15분">15분</option>
										<option value="30분">30분</option>
									</select>						
								</div>
							</li>	
							<li class="rentCar1_search2-1_returnTime_hour">
								<div class="rentCar1_search2-1_returnTime_hourDiv">
									<select name="returnHour">
										<option value="00시">00시</option>
										<option value="01시">01시</option>
										<option value="02시">02시</option>
										<option value="03시">03시</option>
										<option value="04시">04시</option>
										<option value="05시">05시</option>
										<option value="06시">06시</option>
										<option value="07시">07시</option>
										<option value="08시">08시</option>
										<option value="09시">09시</option>
										<option value="10시">10시</option>
										<option value="11시">11시</option>
										<option value="12시">12시</option>
										<option value="13시">13시</option>
										<option value="14시">14시</option>
										<option value="15시">15시</option>
										<option value="16시">16시</option>
										<option value="17시">17시</option>
										<option value="18시">18시</option>
										<option value="19시">19시</option>
										<option value="20시">20시</option>
										<option value="21시">21시</option>
										<option value="22시">22시</option>
										<option value="23시">23시</option>										
									</select>
								</div>
							</li>			
						</ul>	
					</div>
					<div id="divMajorNewCity" style="position: absolute; z-index: 6000; top: 30px; left: 30px; width: 0px; visibility:hidden;">
						<div class="layer_majorcity" style="display: block; left:15px; top:95px;">
							<span class="bul_arrow"></span>
							<p class="title_txt">주요도시를 선택해 주세요</p>
							<dl>
								<dt>
									<span>한국</span>
								</dt>
								<dd>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6034828', '인천국제공항(ICN), 서울, 대한민국')">인천국제공항(ICN), 서울, 대한민국</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000147', '제주국제공항(CJU), 제주, 대한민국')">제주국제공항(CJU), 제주, 대한민국</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6024426', '김포국제공항(GMP), 서울, 대한민국')">김포국제공항(GMP), 서울, 대한민국</a>
								</dd>
							</dl>
							<dl>
								<dt>
									<span>미주</span>
								</dt>
								<dd>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000288', '호놀룰루국제공항(HNL), 호놀룰루, 미국')">호놀룰루국제공항(HNL), 호놀룰루, 미국</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000468', '카훌루이공항(OGG), 마우이, 미국')">카훌루이공항(OGG), 마우이, 미국</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6034399', '코나공항(KOA), 키홀,하와이, 미국')">코나공항(KOA), 키홀,하와이, 미국</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000346', '로스앤젤레스국제공항(LAX), 로스앤젤레스, 미국')">로스앤젤레스국제공항(LAX), 로스앤젤레스, 미국</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000581', '샌프란시스코국제공항(SFO), 샌프란시스코, 미국')">샌프란시스코국제공항(SFO), 샌프란시스코, 미국</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000317', '존에프케네디국제공항(JFK), 뉴욕, 미국')">존에프케네디국제공항(JFK), 뉴욕, 미국</a>
								</dd>
							</dl>
							<dl>
								<dt>
									<span>유럽</span>
								</dt>
								<dd>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000134', '샤를드골국제공항(CDG), 파리, 프랑스')">샤를드골국제공항(CDG), 파리, 프랑스</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000713', '뮌헨')">뮌헨</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000238', '프랑크푸르트')">프랑크푸르트</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000226', '레오나르도다빈치공항(FCO), 로마, 이탈리아')">레오나르도다빈치공항(FCO), 로마, 이탈리아</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6034402', '바르셀로나공항(BCN), 바르셀로나, 스페인')">바르셀로나공항(BCN), 바르셀로나, 스페인</a>
								</dd>
							</dl>
							<dl>
								<dt>
									<span>일본</span>
								</dt>
								<dd>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000461', '나리타국제공항(NRT), 도쿄, 일본')">나리타국제공항(NRT), 도쿄, 일본</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000243', '후쿠오카공항(FUK), 후쿠오카, 일본')">후쿠오카공항(FUK), 후쿠오카, 일본</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000334', '오사카')">오사카</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000469', '나하공항(OKA), 오키나와, 일본')">나하공항(OKA), 오키나와, 일본</a>
								</dd>
							</dl>
							<dl>
								<dt>
									<span>남태평양</span>
								</dt>
								<dd>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000630', '시드니')">시드니</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000022', '오클랜드')">오클랜드</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000271', '괌')">괌</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000609', '사이판국제공항(SPN), 사이판, 사이판')">사이판국제공항(SPN), 사이판, 사이판</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000554', '아리아이공항(ROR), 코로르, 팔라우')">아리아이공항(ROR), 코로르, 팔라우</a>
								</dd>
							</dl>
							<dl>
								<dt>
									<span>동남아시아</span>
								</dt>
								<dd> 
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000085', '칸쿤')">칸쿤</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('180545', '창이 공항 (SIN), 싱가포르')">창이 공항 (SIN), 싱가포르</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6000084', '코타키나발루')">코타키나발루</a>
									<a href="#none" class="city_list" onclick="setCitySearchBoxLayer('6094986', '홍콩')">홍콩</a>
								</dd>
							</dl>
							<button type="button" class="btn_close" id="btnclose" title="닫기" onclick="hidden_majorNewCity();">
								<span class="ir">닫기</span>
							</button>
						</div>
					
					</div>
					<div class="rentCar1_search2-1_ifage">
						<ul style="height:100%" class="rentCar1_search2-1_ifage_ul">
							<li style="width: 100%; margin-top: 7px; list-style:none outside none;">
								<div class="rentCar1_search2-1_ifageDiv1">								
									<input type="checkbox" id="chkage" name="chkage" class="chk_chekbox" data-label="#lbl_chage" checked="true">									
									<label style="color: #666;" for="chkage" class="rent_check on" id="lbl_chage">운전자 연령이 만 25세 이상인 경우</label>									
									<!--체크박스 체크시 라벨 class에 on 추가  -->
									<img class="question" src="/TwoTour/image/question.png">
									<select class="ageHidden hidden">
										<option value="">선택</option>
										<option value="">만21세</option>
										<option value="">만22세</option>
										<option value="">만23세</option>
										<option value="">만24세</option>
									</select>
								</div>
								<div class="rentCar1_search2-1_ifage_question">
									<div class="ifage_questionDiv">
										대여국가 및 장소에 따라 현지에서 만 25세<br>
										미만일 경우 추가 비용 발생 할 수 있습니다.
									</div>
								</div>
								
							</li>
							
													
						</ul>
					
					</div>
					<div class="rentCar1_search2-1_ifcountry">
						<ul style="height:100%" class="rentCar1_search2-1_ifcountry_ul">
							<li style="width: 100%; margin-top: 7px; list-style:none outside none;">
								<div class="rentCar1_search2-1_ifcountryDiv1">								
									<input type="checkbox" id="chkage2" name="chkage2" class="chk_chekbox" data-label="#lbl_chage" checked="true">									
									<label style="color: #666;" for="chkage2" class="rent_check on" id="lbl_chage">국적이 내국인일 경우</label>
									<img class="question2" src="/TwoTour/image/question.png">
									<!--체크박스 체크시 라벨 class에 on 추가  -->
									<select class="countryHidden hidden">
										<option value="">대한민국</option>
										<option value="">중국</option>
										<option value="">일본</option>
										<option value="">미국</option>
										<option value="">독일</option>
										<option value="">러시아</option>
										<option value="">프랑스</option>
										<option value="">영국</option>
										<option value="">스페인</option>
										<option value="">포르투갈</option>
										<option value="">이탈리아</option>
										<option value="">네덜란드</option>
									</select>
								</div>
								<div class="rentCar1_search2-1_ifcountry_question">
									<div class="ifcountry_questionDiv">
										여권기준 운전자 국적이 외국인일 경우, 일부 라이선스 국적에 따라 렌트가 불가능하거나, 
										제휴 렌터카 브랜드에 따라 외국인 예약이 불가할 수 있습니다.
									</div>
								</div>
							</li>
							
												
						</ul>
					</div>
					<div class="rentCar1_search2-1_searchButton">
						<button type="button" class="btn_search" id="btnSearch">검색하기</button>
						
					</div>
					
				</div>
				
				 
			</div>
		</form>
			
		</div>
	
	</div>
	<div id="main_content">
	 	<div id="main_content_info">
	 		<ul style="height:100%;">
	 			<li id="main_content_info_car">
	 				<img class="car" src="/TwoTour/image/rentCar1.PNG">
	 				<p class="tit">실시간으로 최저가 차량 조회</p>
	 				<p class="cont">
	 					전세계 렌터카 차량을 실시간으로 조회하고,최저가 상품으로 골라 타자!
	 				</p>
	 			</li>
	 			<li id="main_content_info_reservation">
	 				<img class="car" src="/TwoTour/image/rentCar2.PNG">
	 				<p class="tit">원하는 대로 쉽고 빠른 예약</p>
	 				<p class="cont">
	 					렌터카 이용에 필요한 옵션 선택하고,원하는 일정대로 쉽고 빠르게 예약까지!
	 				</p>
	 			</li>
	 			<li id="main_content_info_commission">
	 				<img class="car" src="/TwoTour/image/rentCar3.PNG">
	 				<p class="tit">취소수수료 무료</p>
	 				<p class="cont">
	 					취소 수수료 부담 없이 언제든 취소 가능!(단, 중복예약은 불가합니다.)
	 				</p>
	 			</li>
	 		</ul>
	 	</div>
	 	<div id="main_content_guide">
	 		<div id="main_content_guideDiv">
	 			<div id="main_content_guideDiv2">
	 				<h3 style="margin-bottom: 15px; font-size: 16px; color: #FFF;">서비스 이용 가이드</h3>
	 				<div id="main_content_guideDiv2_method">
	 					<h4 id="main_content_guideDiv2_method_h4">하나프리 렌터카<br>예약 및 이용방법</h4>
	 					<ul id="main_content_guideDiv2_method_ul">
	 						<li>
	 							<div style="height:40%; border: 1px solid red; border-color:transparent;">
	 								<img class="car" style="width:100%; height:100%;" src="/TwoTour/image/img_use_01.jpg">
	 							</div>
	 							<div style="height:60%; background-color:white;  border: 1px solid red; border-color:transparent;">
	 								<p class="main_content_guideDiv2_method_ul_p1">예약 전 TIP</p>
	 								<p class="main_content_guideDiv2_method_ul_p1-1">대표 운전자의 정확한 영문으로 예약,여권/국제면허증/신용카드명의와 동일</p>
	 							</div> 						
	 						</li>
		 					<li>
		 						<div style="height:40%; border: 1px solid red; border-color:transparent;">
	 								<img class="car" style="width:100%; height:100%;" src="/TwoTour/image/img_use_02.jpg">
	 							</div>
	 							<div style="height:60%; background-color:rgb(245,246,247);  border: 1px solid red; border-color:transparent;">
	 								<p class="main_content_guideDiv2_method_ul_p1">장소 및 지점선택</p>
	 								<p class="main_content_guideDiv2_method_ul_p1-1">차량 대여/반납 시간 및지점 지정(1일 금액은 24시간 이용 기준)</p>
	 							</div> 	
		 					</li>
		 					<li>
		 						<div style="height:40%; border: 1px solid red; border-color:transparent;">
	 								<img class="car" style="width:100%; height:100%;" src="/TwoTour/image/img_use_03.jpg">
	 							</div>
	 							<div style="height:60%; background-color:white;  border: 1px solid red; border-color:transparent;">
	 								<p class="main_content_guideDiv2_method_ul_p1">등급선택 후 예약</p>
	 								<p class="main_content_guideDiv2_method_ul_p1-1">렌터카 차량 종류 선택 및 고객 정보 입력</p>
	 							</div> 	
		 					</li>
		 					<li>
		 						<div style="height:40%; border: 1px solid red; border-color:transparent;">
	 								<img class="car" style="width:100%; height:100%;" src="/TwoTour/image/img_use_04.jpg">
	 							</div>
	 							<div style="height:60%; background-color:rgb(245,246,247);  border: 1px solid red; border-color:transparent;">
	 								<p class="main_content_guideDiv2_method_ul_p1">예약변경</p>
	 								<p class="main_content_guideDiv2_method_ul_p1-1">예약내용 변경 및취소 요청 시 고객 예약 조회 후 변경/취소 요청</p>
	 							</div> 	
		 					</li>
		 					<li>
		 						<div style="height:40%; border: 1px solid red; border-color:transparent;">
	 								<img class="car" style="width:100%; height:100%;" src="/TwoTour/image/img_use_05.jpg">
	 							</div>
	 							<div style="height:60%; background-color:white;  border: 1px solid red; border-color:transparent;">
	 								<p class="main_content_guideDiv2_method_ul_p1">예약완료</p>
	 								<p class="main_content_guideDiv2_method_ul_p1-1">확정서를 출력하여 해당지점에서 본인 카드로 결제 후 차량 이용</p>
	 							</div> 	
		 					</li>
	 					</ul>
	 				</div>
	 				<div id="main_content_guideDiv2_notice">
	 					<div id="main_content_guideDiv2_noticeDiv1">
	 						<p class="bg_car"></p>
	 						<h4>렌터가 필수 지침사항</h4>
	 						<ul style="height:78%; background-color: #FFF;">
	 							<li>예약 확인서, 대표 운전자 여권, 국내면허증, 국제면허증, 해외사용 가능한 신용카드 지참</li>
	 							<li>렌터카 대여 시 본인 신용카드로 결제, 반납 시 추가 금액이 발생한 경우 추가금액만큼 결제</li>
	 							<li>추가 옵션 사항은 현지에서 차량 대여 시 추가 가능 (추가 비용 발생)</li>
	 							<li>차량 이용 중 문제 발생 시 현지 긴급연락처로 전화</li>
	 							<li>주유 및 과태료 결제 후 현지 영수증을 반드시 보관하고 있어야 중복 결제 시 환불 요청가능</li>
	 						</ul>
	 					</div>
	 					<div id="main_content_guideDiv2_noticeDiv2">
	 						<p style="margin-bottom:10px">
	 							<img src="http://image1.hanatour.com/_images/rentercar/img_millage.jpg" width="238" height="140" alt="">
	 						</p>
	 						<div style="width:205px; margin:0 auto; height:120px; ">
	 							<h4 style="margin-bottom:5px; font-size:18px; color: #333; letter-spacing: -1px;">후불제 렌터카 전용상담</h4>
	 							<p style="font-size:11px; color: #666;">
	 								TEL : 1566-0223
	 							<br>
	 								  담당자 이메일 : oghora13@hanatour.com, sujin8644@hanatour.com
                  				<br>
                  					(통화가 지연될 경우 이메일로 문의 주시면 보다 빠른 연락을 드리도록 하겠습니다.)
	 							</p>
	 						</div>
	 					</div>
	 			
	 				</div>
			
	 			</div>
	 		
	 		</div>
	 	
	 	</div>
	</div>
	<div id="ui-datepicker-div" class="ut-datepicker ui-widget ui-widget-content ui-helper-clearfix
	ui-corner-all ui-datepicker-multi-3 ui-datepicker-multi" style="position: absolute; top: 10px;
    width: 51em; left: 170px; z-index: 101; display: block; width:auto; height:auto; ">
    	<div class="ui-datepicker-group ui-datepicker-group-middle"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix"><div class="ui-datepicker-title"><span class="ui-datepicker-year">2017</span>년&nbsp;<span class="ui-datepicker-month">12월</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일"><font color="red">일</font></span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토"><font color="blue">토</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">1</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">8</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">15</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">22</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">24</a></td><td class=" date-holiday0" title="크리스마스" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">26</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">29</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>
 		<div class="ui-datepicker-group ui-datepicker-group-last"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-right"><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click"><span class="ui-icon ui-icon-circle-triangle-e"></span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2018</span>년&nbsp;<span class="ui-datepicker-month">1월</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일"><font color="red">일</font></span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토"><font color="blue">토</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" date-holiday0" title="신정" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">1</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">2</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">5</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">6</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">8</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">9</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">12</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">13</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">15</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">16</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">19</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">20</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">22</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">23</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">26</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">27</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">29</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">30</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>  
    </div>
    <div id="ui-datepicker-div2" class="ut-datepicker ui-widget ui-widget-content ui-helper-clearfix
	ui-corner-all ui-datepicker-multi-3 ui-datepicker-multi" style="position: absolute; top: 60px;
    width: 51em; left: 170px; z-index: 101; display: block; width:auto; height:auto; ">
    	<div class="ui-datepicker-group ui-datepicker-group-middle"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix"><div class="ui-datepicker-title"><span class="ui-datepicker-year">2017</span>년&nbsp;<span class="ui-datepicker-month">12월</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일"><font color="red">일</font></span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토"><font color="blue">토</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">1</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">8</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">15</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">22</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">24</a></td><td class=" date-holiday0" title="크리스마스" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">26</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">29</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>
 		<div class="ui-datepicker-group ui-datepicker-group-last"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-right"><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click"><span class="ui-icon ui-icon-circle-triangle-e"></span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2018</span>년&nbsp;<span class="ui-datepicker-month">1월</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일"><font color="red">일</font></span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토"><font color="blue">토</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" date-holiday0" title="신정" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">1</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">2</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">5</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">6</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">8</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">9</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">12</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">13</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">15</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">16</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">19</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">20</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">22</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">23</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">26</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">27</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">29</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">30</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>  
    </div>
</div>
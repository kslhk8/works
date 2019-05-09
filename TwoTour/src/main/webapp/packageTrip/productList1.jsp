<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="../css/packageTrip/productList.css" />
<link rel="stylesheet" type="text/css" href="../css/packageTrip/global.css"/>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		//크기설정  조정해야함
		$('#right_menu').css("display","block");
		$('#body').css("height","900px");
		
		//처음들어왔을때 도시랑,날짜 선택
		$('#select_month').val('${depart_date}');
		$('#select_city').val('${depart_city}');

		//처음들어 왔을때 등급,week 선택
		if('${arr_Week0}'==$('#month_week').val()){
			$('#month_week').prop("checked",true);
		}
			else{
				$('#month_weekend').prop("checked",true);
			}
		
		if('${arr_Week1}'!=""){
			$('#month_week').prop("checked",true);
			$('#month_weekend').prop("checked",true);
		}
		if('${arr_Grade1}'!=''){
			if('${arr_Grade1}'==$('#grade_classic').val()){
				$('#grade_classic').prop("checked",true);		
			}
			else if('${arr_Grade1}'==$('#grade_casual').val()){
				$('#grade_casual').prop("checked",true);
			}
			else{
				$('#grade_esavepack').prop("checked",true);
			}
		}
		if('${arr_Grade0}'==$('#grade_classic').val()){
			$('#grade_classic').prop("checked",true);		
		}
		else if('${arr_Grade0}'==$('#grade_casual').val()){
			$('#grade_casual').prop("checked",true);
		}
		else{
			$('#grade_esavepack').prop("checked",true);
		}
		
			
		if('${arr_Grade2}'!=''){
			$('#grade_classic').prop("checked",true);
			$('#grade_casual').prop("checked",true);
			$('#grade_esavepack').prop("checked",true);
		}
	
	
	//검색 누를때
	$('#search_P').click(function(){
		alert("hi");
	});
	//3번째 페이지 갈때?? 미확정
	$('#go_view').click(function(){
		alert("hi");
	})
	//전체버튼 체크
	$('#btn_ALL_MONTH').click(function(){
		if($('#all_box').val()==1){
		$('#month_mon').prop("checked",true);
		$('#month_tue').prop("checked",true);
		$('#month_wed').prop("checked",true);
		$('#month_thu').prop("checked",true);
		$('#month_fri').prop("checked",true);
		$('#month_sat').prop("checked",true);
		$('#month_sun').prop("checked",true);
		$('#all_box').val("0");
		}
		else{
			$('#month_mon').prop("checked",false);
			$('#month_tue').prop("checked",false);
			$('#month_wed').prop("checked",false);
			$('#month_thu').prop("checked",false);
			$('#month_fri').prop("checked",false);
			$('#month_sat').prop("checked",false);
			$('#month_sun').prop("checked",false);
			$('#all_box').val("1");
		}
	});
	//전체 등급체크
	$('#btn_ALL_GRADE').click(function(){
		if($('#all_box1').val()==1){
			$('#grade_classic').prop("checked",true);
			$('#grade_casual').prop("checked",true);
			$('#grade_esavepack').prop("checked",true);
			$('#all_box1').val("0");
		}
		else{
			$('#grade_classic').prop("checked",false);
			$('#grade_casual').prop("checked",false);
			$('#grade_esavepack').prop("checked",false);
			$('#all_box1').val("1");
		}
	});
});
</script>
<body>
<input type="hidden" value="0" id="all_box">
<input type="hidden" value="0" id="all_box1">
<div id="pk_contents">
<div class="master_product">
<div class="thumb_img"><a href="javascript:;" class="btn_gallery on"><span class="ir">갤러리보기</span></a><img class="img" width="250px" height="184px" alt="썸네일이미지" src="../image/${parentTripDTO.getImageName() }"></div>

<div class="master_content"><span class="master_info"><span class="p_name"><span class="icon"><img src="http://image1.hanatour.com/2010/images/icon/ico_packege.gif" alt="패키지"></span><strong class="title">
                [${parentTripDTO.getPackage_code()}] ${parentTripDTO.getPackage_name()}</strong><span class="p_info">${parentTripDTO.getContent()}</span></span></span><ul class="master_list">
<li class="qu_subtitle_45"><strong class="txt_price">상품가격</strong><fmt:formatNumber type="number" value="${parentTripDTO.getAdult_price()}" pattern="#,###"/></li>
<li class="qu_subtitle_45"><strong class="txt_date">여행기간</strong>${parentTripDTO.getDay()}
            </li>
<li class="qu_subtitle_45"><strong class="txt_country">여행도시</strong>${parentTripDTO.getArrive_city() }</li>
<li class="qu_subtitle_45"><strong class="txt_departure">출발요일</strong>
              ${parentTripDTO.getWeek()}</li>
</ul>
</div>
</div>
<div id="LayerArea"></div>
<div id="search_area">

			<div class="pk_search">
				<form id="pkgSearchForm" name="pkgSearchForm" action="/asp/booking/productPackage/pk-11000.asp" method="post" style="margin:0">
	                
					<fieldset style="height:205px">
						<legend>상품상세검색</legend>
						<h3 class="h3 h3_search"><span class="ir">상품상세검색</span></h3>
						<div class="quick_search">
						   <ul class="quick_list">
							<li class="qu_subtitle_50"><strong class="txt_start_day01">출발일</strong>
								<select id="select_month" style="padding-top:1px;">
										<option value="12" selected="selected">2017년12월</option>
										<option value="01">2018년1월</option>	
	                                    <option value="02">2018년2월</option>		
								</select>
							</li>
	
							<li class="qu_subtitle_50"><strong class="txt_start_city01">출발도시</strong>
									<select id="select_city">
										<option value="인천" selected="selected">서울(인천/김포)</option>
	                                    <option value="부산">부산</option>
	                                    
								</select>
							</li>
					
							<li class="qu_subtitle_90">
								<strong class="txt_start_week">출발요일</strong>
								<p class="in_boxarea"><button type="button" class="btn_all" id="btn_ALL_MONTH">전체</button></p>
								<div class="in_boxarea" style="width:231px">
									<input type="checkbox" name="week" id="month_week" value="week" class="jq_seart_day jq_start_week" ><label for="month_mon" style="width:23px">평일</label>
									<input type="checkbox" name="week" id="month_weekend" value="weekend" class="jq_seart_day jq_start_week"><label for="month_tue" style="width:23px">주말</label>
									
								</div>
							</li>
	                      					
														
							<li class="qu_subtitle_100" id="goods_grade_condition">
							<strong class="txt_product_label">상품등급</strong>
							<p class="in_boxarea"><button type="button" class="btn_all" id="btn_ALL_GRADE" key="1">전체</button></p>
							<div class="in_boxarea">
								<input type="checkbox" name="grade" id="grade_classic" value="클래식" class="jq_checkGrade">
								<div class="div_classic" style="float: left">
									<label for="grade_classic" class="ico_classic"><span class="ir">클래식</span></label>
									<div class="layer_classic">
										<p class="title">하나팩 클래식</p>
										<p class="cont">믿을 수 있는 항공, 엄선된 숙박과 식사, 보다 새롭고 다양한 볼거리로 구성된 수준 높은 정통 패키지</p>
							        </div>
								</div>
								<input type="checkbox" name="grade" id="grade_casual" value="캐주얼" class="jq_checkGrade">
								<div class="div_classic" style="float: left">
									<label for="grade_casual" class="ico_casual"><span class="ir">캐주얼</span></label>
									<div class="layer_casual">
										<p class="title">하나팩 캐주얼</p>
										<p class="cont">실속파 고객들을 위한 보다 알찬 구성으로 짜여진 경제적인 패키지</p>
									</div>
								</div>
								<input type="checkbox" name="grade" id="grade_esavepack" value="이세이브" class="jq_checkGrade">
								<div class="div_classic" style="float: left">
									<label for="grade_esavepack" class="ico_esavepack"><span class="ir">이세이브팩</span></label>
								<div class="layer_casual">
										<p class="title">이세이브팩</p>
										<p class="cont">합리적인 요금의 호텔과 식사로 구성된 대한민국 대표 초저가 패키지 여행 브랜드</p>
									</div>
								</div>
							</div>
							</li>
						
							
						
						<li class="qu_subtitle_100"><strong class="txt_product_name01">상품명</strong>					
								<div class="in_boxarea2">
									<input type="text" class="in_box" placeholder="상품명 입력 후 버튼을 눌러주세요." style="width: 300px" id="txt_in_box">
									<input type="button" id="search_P" value="검색" style="height:25px; width:25px; background-color:#F63D8B; color:white; cursor:pointer;">
								</div>
							</li>
						</ul>
						</div>
						</fieldset>
					</form>
					<!--검색조건 노출-->
				
				</div><!--pk_search-->
				
				<div class="pk_ad_banner">
					<iframe src="../image/광고s.jpg" width="288" height="236" style="top:2px;" frameborder="0" scrolling="no"></iframe>
				</div>
		</div>
<hr>
<p><a href="http://www.hanatour.com/asp/custcenter/incentive/ic-00000.asp?hanacode=main_custom" title="단체맞춤여행 견적 이동하기" target="_blank"><img src="http://image1.hanatour.com/_images/pk/banner_incentive.jpg" alt="단체맞춤여행 견적문의하기"></a></p>
<hr>
<div class="startday_list" style="width:900px">
<div class="month_select" id="APP118"><button type="button" class="before" title="이전달"><span class="ir">2017.11</span></button><strong class="this_month">2017.12</strong><button type="button" class="after" title="다음달"><span class="ir">2018.01</span></button><div class="info_reservation type02">
<ul>
<li class="start_imt"><span></span>출발가능
              </li>
<li class="res_imt"><span></span>예약가능
              </li>
</ul>
<div class="qs_layer"><a href="javascript:;" class="ico qs_02" title=""></a><div class="laypop_txt"><span class="blut"></span><ul>
<li class="start_imt"><em>ㆍ</em><span>
                      출발가능<em>-</em></span><p>
                      최소 출발 인원 이상 예약된 상품으로<br>예약과 동시에 출발 확정인 상품입니다.
                    </p>
</li>
<li class="res_imt"><em>ㆍ</em><span>
                      예약가능<em>-</em></span><p>
                      예약은 가능하나 최소 출발 인원이 부족하여<br>출발 미정인 상품입니다.
                    </p>
</li>
</ul>
</div>
</div>
</div>
</div>
<table class="table_calendar" width="100%" cellpadding="0" cellspacing="0" summary="출발월달력">
<caption>출발일 날짜 선택하기</caption>
<thead>
<tr><th class="">금</th><th class="sat">토</th><th class="sun">일</th><th class="">월</th><th class="">화</th><th class="">수</th><th class="">목</th><th class="">금</th><th class="sat">토</th><th class="sun">일</th><th class="">월</th><th class="">화</th><th class="">수</th><th class="">목</th><th class="">금</th><th class="sat">토</th><th class="sun">일</th><th class="">월</th><th class="">화</th><th class="">수</th><th class="">목</th><th class="">금</th><th class="sat">토</th><th class="sun">일</th><th class="">월</th><th class="">화</th><th class="">수</th><th class="">목</th><th class="">금</th><th class="sat">토</th><th class="sun">일</th></tr>
</thead>
<tbody>
<tr><td><a href="javascript:;" class="start_imt" title="출발가능">1</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">2</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">3</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">4</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">5</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">6</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">7</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">8</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">9</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">10</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">11</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">12</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">13</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">14</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">15</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">16</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">17</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">18</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">19</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">20</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">21</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">22</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">23</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">24</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">25</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">26</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">27</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">28</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">29</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">30</a></td><td><a href="javascript:;" class="start_imt" title="출발가능">31</a></td></tr>
</tbody>
</table>
<div class="sort_select">
<ul class="grade_list" id="goods_grade_desc">
<li><img src="http://image1.hanatour.com/2010/images/icon/productPackage/icon_grade_classic.gif" alt="클래식"> 믿을 수 있는 항공, 엄선된 숙박과 식사, 보다 새롭고 다양한 볼거리로 구성된 수준 높은 정통 패키지
                </li>
<li><img src="http://image1.hanatour.com/2010/images/icon/productPackage/icon_grade_casual.gif" alt="캐주얼"> 실속파 고객들을 위한 보다 알찬 구성으로 짜여진 경제적인 패키지
                </li>
<li><img src="http://image1.hanatour.com/2010/images/icon/productPackage/icon_grade_23.gif" alt="이세이브팩"> 합리적인 요금의 호텔과 식사로 구성된 대한민국 대표 초저가 패키지 여행 브랜드
                </li>
</ul>

<table class="table_startday" width="100%" cellpadding="0" cellspacing="0" summary="출/도착시간,항공편,기간,등급,상품명,가격,예약상태">
<caption>항공편 출도착시간 및 상품명 안내</caption>
<colgroup>
<col style="width: 45px">
<col style="width: 105px">
<col style="width: 80px">
<col style="width: 55px">
<col style="width: 90px">
<col style="width: 330px; *width: 310px">
<col style="width: 90px">
<col style="width: *">
</colgroup>
<thead>
<tr id="tre">
<th>비교</th>
<th><a href="javascript:;">
                  출/도착시간<span class="ico_down"></span></a></th>
<th><a href="javascript:;">
                    항공편<span class="ico_down"></span></a></th>
<th><a href="javascript:;">
                  기간<span class="ico_down"></span></a></th>
<th><a href="javascript:;">
                  등급<span class="ico_down"></span></a></th>
<th><a href="javascript:;">
                  상품명<span class="ico_down"></span></a></th>
<th><a href="javascript:;">
                  총 상품가격<span class="ico_down"></span></a></th>
<th><a href="javascript:;">
                  예약상태<span class="ico_down"></span></a></th>
</tr>
</thead>
</table>
<table class="table_startday" id="table_pkg_list" width="100%" cellpadding="0" cellspacing="0" summary="출/도착시간,항공편,기간,등급,상품명,가격,예약상태">
<caption>항공편 출도착시간 및 상품명 안내</caption>
<colgroup>
<col style="width: 45px">
<col style="width: 105px">
<col style="width: 80px">
<col style="width: 55px">
<col style="width: 90px">
<col style="width: 330px; *width: 310px">
<col style="width: 90px">
<col style="width: *">
</colgroup>
	<tbody id="tbody">
	<tr class="bg_gray">
	<td class="check">
			<input type="checkbox" name="pkgCodes" value="APP118171201Z22">
		</td>
		<td class="round">
			<span class="depart_date">12/01 (금) 16:55</span>
			<span class="arrive_date">12/04 (월) 15:55</span>
		</td>
		<td class="airline">
			<img src="http://image1.hanatour.com/2010/images/airline/Z2.png" width="20px" height="14px" alt="필리핀에어아시아"><br>필리핀에어아시아
		</td>
		<td class="period">4일</td>
		<td class="label">
			<img src="http://image1.hanatour.com/2010/images/icon/productPackage/icon_grade_23.gif" alt="이세이브팩">
		</td>
		<td class="product">
			<a id="go_view" href="javascript:;">[온라인여행박람회][선착순 한정판매] 보라카이 4일- [그랜드 보라카이 (또는 동급)] + 황제마사지</a>
		</td>
		<td class="price">
			<strong>399,000원</strong>
		</td>
		<td class="state">
			<span class="start_imt">예약가능</span>
		</td>
	</tr>
	</tbody>
</table>
</div>
</div>
</div>

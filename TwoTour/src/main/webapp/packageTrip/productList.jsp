<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="../css/packageTrip/productList.css" />
<link rel="stylesheet" type="text/css" href="../css/packageTrip/global.css"/>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function go_view(seq){
	$("#son_seq").val(seq);
	document.productSearchForm.action="/TwoTour/packageTrip/productView.do";
	$('.productSearchForm').submit();
}

$(document).ready(function(){
	var date_productList = new Date();
		
	calendar_productList(date_productList.getFullYear(), date_productList.getMonth());
		
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
		document.productSearchForm.action="/TwoTour/packageTrip/productList.do"
		$('.productSearchForm').submit();
	});
			
			
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
	
function calendar_productList(year,month){
	//alert($('.table_calendar > thead > tr > td').length);
	$('.table_calendar > thead > tr > th').remove();
	$('.table_calendar > tbody > tr > td').remove();

	var date = new Date();
	date.setFullYear(year,month,1);
	var endDay = new Date(year,month+1,0).getDate();
	
	for(var i=1; i<=endDay; i++){
		var day = date.getDay();

		if(day==0){
			$("<th/>",{
				text: "일",
				id: "sun",
				class: "sun"
			}).appendTo($('.table_calendar > thead > tr'));
		}
		else if(day==1){
			$("<th/>",{
				text: "월"
			}).appendTo($('.table_calendar > thead > tr'));
		}
		else if(day==2){
			$("<th/>",{
				text: "화"
			}).appendTo($('.table_calendar > thead > tr'));
		}
		else if(day==3){
			$("<th/>",{
				text: "수"
			}).appendTo($('.table_calendar > thead > tr'));
		}
		else if(day==4){
			$("<th/>",{
				text: "목"
			}).appendTo($('.table_calendar > thead > tr'));
		}
		else if(day==5){
			$("<th/>",{
				text: "금"
			}).appendTo($('.table_calendar > thead > tr'));
		}
		else if(day==6){
			$("<th/>",{
				text: "토",
				id: "sat",
				class: "sat"
			}).appendTo($('.table_calendar > thead > tr'));
		}

		date.setDate(date.getDate()+1);
	} 
		
	for(var i=1; i<=endDay; i++){
		$("<td/>",{}).append($("<a/>",{
			id: i,
			text: i,
		})).appendTo($('.table_calendar > tbody > tr'));
	}
	
	
	
	$('.table_calendar > tbody > tr > td').on('click','a',function(){
		
		var week = $('input[name=week]:checked').val();
		
		if($('#month_week').is(':checked') && $('#month_weekend').is(':checked')){
			week = 'week,weekend';	
		}
		
		var grade = $('input[name=grade]:checked').val();
		
		
		if($('#grade_classic').is(':checked') && $('#grade_casual').is(':checked')){
			grade = '클래식,캐주얼';
		}
		if($('#grade_classic').is(':checked') && $('#grade_esavepack').is(':checked')){
			grade = '클래식,이세이브';
		}
		if($('#grade_casual').is(':checked') && $('#grade_esavepack').is(':checked')){
			grade = '캐주얼,이세이브';
		}
		if($('#grade_classic').is(':checked') && $('#grade_casual').is(':checked') && $('#grade_esavepack').is(':checked')){
			grade = '클래식,캐주얼,이세이브';
		}

		var date = $(event.target).text();
		if(date.length==1){
			date = '0'+date;
		}
		


		$.ajax({
			url: "/TwoTour/packageTrip/productList.do",
			data: "depart_date="+$('#select_month').val()+date+"&week="+week
					+"&depart_city="+$('#select_city').val()+"&seq="+$('input[name=seq]').val()+"&arrive_city="+$('input[name=arrive_city]').val()
					+"&grade="+grade+"&val=json",
			dataType: "json",
			error: function(data){
				if(data.packageList==null){
					$('#table_pkg_list > tbody > tr').remove();
					$('#productList_paging').empty();
				}
			},
			success: function(data){
				
				$('#table_pkg_list > tbody > tr').remove();
				
				$.each(data.packageList, function(index,items){
					    items.adult_price= (items.adult_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$("<tr/>").append($("<td/>",{
						class: "check"
						}).append("<input type='checkbox' name='pkgCodes' value='APP118171201Z22'>")).append($("<td/>",{
						class: "round"
						}).append($("<span/>",{
							class: "depart_date",
							text: items.depart_apTime
						})).append($("<span/>",{
							class: "arrive_date",
							text: items.arrive_apTime
						}))).append($("<td/>",{
						class: "airline",	
						text: items.airplane_name
					}).prepend($("<img/>",{
						src:"../image/"+items.imageName,
						style: "width:15px; height:15px; display:block; margin-left:35px;"
					}))).append($("<td/>",{
						class: "period",
						text: items.day
					})).append($("<td/>",{
						class: "label",
						text: items.grade
					})).append($("<td/>",{
						class: "product"
						}).append($("<a/>",{
							onclick: "go_view("+items.seq+")",
							href: "javascript:;",
							text: items.package_name
						}))).append($("<td/>",{
						class: "price"
						}).append($("<strong/>",{
							text: items.adult_price
						}))).append($("</td>",{
						class: "state"
						}).append($("<span/>",{
							class: "start_imt",
							text: "예약가능"
						}))).appendTo($('#table_pkg_list > tbody')); 
					
					$('#table_pkg_list > tbody > tr').addClass('bg_gray');
					
					$('#productList_paging').html(data.packagePaging.pagingHTML);
				}); 
				
				
			}
		});
	});
}

function before_month(){
	var this_month = window.document.getElementById("this_month").innerHTML;
	//alert(this_month);
	var ar = this_month.split(".");
	
	var year= ar[0];
	var month = ar[1];
	

	if(month==1){
		month=12;
		year= parseInt(year)-1;
	}else{
		month=parseInt(month)-1;
	}

	calendar_productList(year,parseInt(month)-1); 
	
	$('#this_month').text(year+'.'+month);
}

function after_month(){
	var this_month = window.document.getElementById("this_month").innerHTML;
	//alert(this_month);
	var ar = this_month.split(".");
	
	var year= ar[0];
	var month = ar[1];

	if(month==12){
		month=1;
		year=parseInt(year)+1;
	}else{
		month=parseInt(month)+1;
	}
    calendar_productList(year,parseInt(month)-1);
	
	$('#this_month').text(year+'.'+month);
}
</script>
<body>
<input type="hidden" value="0" id="all_box">
<input type="hidden" value="0" id="all_box1">

<div id="pk_contents">
	<div class="master_product">
		<div class="thumb_img">
			<a href="javascript:;" class="btn_gallery on"><span class="ir">갤러리보기</span></a>
			<img class="img" width="250px" height="184px" alt="썸네일이미지" src="../image/package/${parentTripDTO.getImageName() }">
		</div>
		<div class="master_content">
			<span class="master_info">
				<span class="p_name">
					<span class="icon">
						<img src="http://image1.hanatour.com/2010/images/icon/ico_packege.gif" alt="패키지">
					</span>
					<strong class="title">
			                [${parentTripDTO.getPackage_code()}] ${parentTripDTO.getPackage_name()}
			        </strong>
			        <span class="p_info">${parentTripDTO.getContent()}</span>
		        </span>
	        </span>
	        <ul class="master_list">
				<li class="qu_subtitle_45">
					<strong class="txt_price">상품가격</strong>
					<fmt:formatNumber type="number" value="${parentTripDTO.getAdult_price()}" pattern="#,###"/>원
				</li>
				<li class="qu_subtitle_45">
					<strong class="txt_date">여행기간</strong>${parentTripDTO.getDay()}
	            </li>
				<li class="qu_subtitle_45">
					<strong class="txt_country">여행도시</strong>${parentTripDTO.getArrive_city() }
				</li>
				<li class="qu_subtitle_45"><strong class="txt_departure">출발요일</strong>
	              ${parentTripDTO.getWeek()}
	            </li>
			</ul>
		</div>
	</div>
	<div id="LayerArea"></div>
	<div id="search_area">
		<div class="pk_search">
			<form class="productSearchForm" name="productSearchForm" action="" method="post" style="margin:0">
				<input type="hidden" name="seq" value="${seq }">
				<input type="hidden" name="son_seq"  id="son_seq" value="0">
				<input type="hidden" name="arrive_city" value="${arrive_city}">
				<input type="hidden" name="val" value="not_json">
				<fieldset style="height:205px">
					<legend>상품상세검색</legend>
					<h3 class="h3 h3_search"><span class="ir">상품상세검색</span></h3>
					<div class="quick_search">
						<ul class="quick_list">
							<li class="qu_subtitle_50">
								<strong class="txt_start_day01">출발일</strong>
								<select name="depart_date" id="select_month" style="padding-top:1px;">
									<option value="11" selected="selected">2017년11월</option>
									<option value="12">2017년12월</option>
									<option value="01">2018년1월</option>	
	                            	<option value="02">2018년2월</option>		
								</select>
							</li>
							<li class="qu_subtitle_50">
								<strong class="txt_start_city01">출발도시</strong>
								<select name="depart_city" id="select_city">
									<option value="인천" selected>서울(인천/김포)</option>
									<option value="부산">부산</option>            
								</select>
							</li>
							<li class="qu_subtitle_90">
								<strong class="txt_start_week">출발요일</strong>
								<p class="in_boxarea">
									<button type="button" class="btn_all" id="btn_ALL_MONTH">전체</button>
								</p>
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
							<li class="qu_subtitle_100">
								<strong class="txt_product_name01">상품명</strong>					
								<div class="in_boxarea2">
									<input type="text" class="in_box" placeholder="상품명 입력 후 버튼을 눌러주세요." style="width: 300px" id="txt_in_box">
									<input type="button" id="search_P" value="검색" style="height:25px; width:70px; border:none; margin-left:20px; background-color:#F63D8B; color:white; cursor:pointer;">
								</div>
							</li>
						</ul>
					</div>
				</fieldset>
			</form>	
		</div><!--pk_search--><!--검색조건 노출-->	

		<div class="pk_ad_banner">
			<iframe src="../image/광고s.jpg" width="288" height="236" style="top:2px;" frameborder="0" scrolling="no"></iframe>
		</div>
	</div>
	<hr>
	<p>
		<a href="http://www.hanatour.com/asp/custcenter/incentive/ic-00000.asp?hanacode=main_custom" title="단체맞춤여행 견적 이동하기" target="_blank">
			<img src="http://image1.hanatour.com/_images/pk/banner_incentive.jpg" alt="단체맞춤여행 견적문의하기">
		</a>
	</p>
	<hr>
	<div class="startday_list" style="width:900px">
		<div class="month_select" id="APP118">
			<button type="button" class="before" title="이전달" onclick="before_month()">
				<!-- <span class="ir">2017.11</span> -->
			</button>
			<strong id="this_month" class="this_month">2017.11</strong>
			<button type="button" class="after" title="다음달" onclick="after_month()">
				<!-- <span class="ir">2018.01</span> -->
			</button>
			<div class="info_reservation type02">
				<ul>
					<li class="start_imt"><span></span>출발가능</li>
					<li class="res_imt"><span></span>예약가능</li>
				</ul>
				<div class="qs_layer">
					<a href="javascript:;" class="ico qs_02" title=""></a>
					<div class="laypop_txt">
						<span class="blut"></span>
						<ul>
							<li class="start_imt">
								<em>ㆍ</em><span>출발가능<em>-</em></span>
								<p>최소 출발 인원 이상 예약된 상품으로<br>예약과 동시에 출발 확정인 상품입니다.</p>
							</li>
							<li class="res_imt">
								<em>ㆍ</em><span>예약가능<em>-</em></span>
								<p> 예약은 가능하나 최소 출발 인원이 부족하여<br>출발 미정인 상품입니다.</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	
		<table class="table_calendar" width="100%" cellpadding="0" cellspacing="0" summary="출발월달력">
			<caption>출발일 날짜 선택하기</caption>
			<thead>
				<tr></tr>
			</thead>
			<tbody>
				<tr></tr>
			</tbody>
		</table>

		
		<div class="sort_select">
			<ul class="grade_list" id="goods_grade_desc">
				<li>
					<img src="http://image1.hanatour.com/2010/images/icon/productPackage/icon_grade_classic.gif" alt="클래식"> 
					믿을 수 있는 항공, 엄선된 숙박과 식사, 보다 새롭고 다양한 볼거리로 구성된 수준 높은 정통 패키지
				</li>
				<li>
					<img src="http://image1.hanatour.com/2010/images/icon/productPackage/icon_grade_casual.gif" alt="캐주얼">
					 실속파 고객들을 위한 보다 알찬 구성으로 짜여진 경제적인 패키지
			    </li>
				<li>
					<img src="http://image1.hanatour.com/2010/images/icon/productPackage/icon_grade_23.gif" alt="이세이브팩"> 
					합리적인 요금의 호텔과 식사로 구성된 대한민국 대표 초저가 패키지 여행 브랜드
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
					<tr>
						<th>비교</th>
						<th>
							<a href="javascript:;"> 출/도착시간<span class="ico_down"></span></a>
						</th>
						<th>
							<a href="javascript:;"> 항공편<span class="ico_down"></span></a>
						</th>
						<th>
							<a href="javascript:;">기간<span class="ico_down"></span></a>
						</th>
						<th>
							<a href="javascript:;">등급<span class="ico_down"></span></a>
						</th>
						<th>
							<a href="javascript:;"> 상품명<span class="ico_down"></span></a>
						</th>
						<th>
							<a href="javascript:;">총 상품가격<span class="ico_down"></span></a>
						</th>
						<th>
							<a href="javascript:;"> 예약상태<span class="ico_down"></span></a>
						</th>
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
				<tbody>
				<c:if test="${packageList!=null }">
					<c:forEach var="packageTripDTO" items="${packageList }">
						<tr class="bg_gray">
							<td class="check">
								<input type="checkbox" name="pkgCodes" value="APP118171201Z22">
							</td>
							<td class="round">
								<span class="depart_date">${packageTripDTO.depart_apTime }</span>
								<span class="arrive_date">${packageTripDTO.arrive_apTime }</span>
							</td>
							<td class="airline">
								<img src="../image/${packageTripDTO.getImageName()}" width="20px" height="14px"><br>${packageTripDTO.airplane_name }
							</td>
							<td class="period">${packageTripDTO.day }</td>
							<td class="label">
								${packageTripDTO.grade }
							</td>
							<td class="product">
								<a class="go_view" href="javascript:" onclick= 'go_view(${packageTripDTO.seq})'>${packageTripDTO.package_name }</a>
							</td>
							<td class="price">
								<strong><fmt:formatNumber type="number" value="${packageTripDTO.getAdult_price()}" pattern="#,###"/>원</strong>
							</td>
							<td class="state">
								<span class="start_imt">예약가능</span>
							</td>
						</tr>
					</c:forEach>				
				</c:if>

				</tbody>
			</table>
				<div id="productList_paging" style="padding:5px; font-size:10pt; text-align:center;">${packagePaging.getPagingHTML()}</div>
		</div>
	</div>
</div>
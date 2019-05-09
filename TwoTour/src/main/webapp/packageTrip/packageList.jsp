<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="../css/packageTrip/packageList.css" />
<link rel="stylesheet" type="text/css" href="../css/packageTrip/global.css"/>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
//productList로 가는거 seq들고
function go_product(seq){
	$("#seq").val(seq);
	document.pkgSearchForm.action="/TwoTour/packageTrip/productList.do";
	$('.pkgSearchForm').submit();
}

//낮은가격일때 페이징처리 ajax
function lowprice(arrive_city,depart_date,depart_city,week,grade,pg){
	$.ajax({
		type:"POST",
		url:"/TwoTour/packageTrip/lowprice.do",
		data: "arrive_city="+arrive_city+"&depart_date="+depart_date+"&depart_city="+depart_city+"&week="+week+"&grade="+grade+"&pg="+pg,
		dataType:"json",
		success: function(data){
			$('.lowprice').css("font-weight","bold");
			$('.on').css("font-weight","normal");
			$(".ul_search_result li").remove();
			$.each(data.packageList, function(index, items){
				    items.adult_price= (items.adult_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$('<li/>').append($('<a/>',{
					href:"javascript:",
					class:"thumb_img jq_detail_link"
					}).append($('<img/>',{src: "../image/package/"+items.imageName, border: "0", width:"113", height:"89"
						}))).append($('<div/>',{class:"product_info"}).append($('<div/>').append($('<a/>',{href:"javascript:",class:"go_product",onclick:"go_product("+items.seq+")"
						}).append($('<span/>',{class:"p_name",text:"["+items.package_code+"] "+items.package_name
						}).append($('<img/>',{src:"../image/package.gif"}))))).append($('<div/>').append($('<span/>',{class:"p_info",text:items.content
						}))).append($('<p/>',{class:"p_date"}).append($('<span/>',{class:"t_txt"}).append($('<span/>',{class:"date"
						}).append($('<span/>',{class:"ir",text:"여행기간"}))).append($('<em/>',{text:items.day
						}))).append($('<span/>',{class:"t_txt"}).append($('<span/>',{class:"date"}).append($('<span/>',{class:"ir",text:"출발요일"}))).append($('<em/>',{text:items.week
						}))))).append($('<div/>',{class:"product_pricendetail"}).append($('<div/>',{class:"price"}).append($('<strong/>').append($('<span/>',{text: items.adult_price+"원~"
						})))).append($('<div/>',{class:"detail_view"}).append($('<a/>',{class:"btn btn_detail go_product", href:"javascript:", onclick:"go_product("+items.seq+")"}).append($('<span/>',{class:"ir",text:"상세보기"
						}))))).appendTo($('.ul_search_result'));
				
			});
			
			$('<li/>',{id:"page",html:data.packagePaging.pagingHTML}).appendTo($('.ul_search_result'));
		}
	});	
}

$(document).ready(function(){
	//처음  바디 크기조절
	$('#right_menu').css("display","block");
	$('#body').css("height","900px");
	
	//처음 도시랑,날짜 선택
	 $('#select_month').val('${depart_date}');
	$('#select_city').val('${depart_city}');

	//처음 week grade체크
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
	
	
	//검색 했을시에 list.do로
	$('#search_P').click(function(){
		document.pkgSearchForm.action="/TwoTour/packageTrip/packageList.do";
		
		document.pkgSearchForm.submit();
	});
	
	//전체 버튼 누를 때
	$('#btn_ALL_MONTH').click(function(){
		if($('#all_box').val()==1){
		$('#month_week').prop("checked",true);
		$('#month_weekend').prop("checked",true);
		$('#all_box').val("0");
		}
		else{
			$('#month_week').prop("checked",false);
			$('#month_weekend').prop("checked",false);
			$('#all_box').val("1");
		}
	});
	//전체 버튼 누를 때
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
	
	
	//낮은 가격순으로 할때
	$('.lowprice').click(function(){
		$.ajax({
			type:"POST",
			url:"/TwoTour/packageTrip/lowprice.do",
			data: "arrive_city=${tripDTO.getArrive_city()}&depart_date=${tripDTO.getDepart_date()}&depart_city=${tripDTO.getDepart_city()}&week=${tripDTO.getWeek()}&grade=${tripDTO.getGrade()}",
			dataType:"json",
			success: function(data){
			
				$('.lowprice').css("font-weight","bold");
				$('.on').css("font-weight","normal");
				$(".ul_search_result li").remove();
				$.each(data.packageList, function(index, items){
					    items.adult_price= (items.adult_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$('<li/>').append($('<a/>',{
						href:"javascript:",
						class:"thumb_img jq_detail_link"
						}).append($('<img/>',{src: "../image/package/"+items.imageName, border: "0", width:"113", height:"89"
							}))).append($('<div/>',{class:"product_info"}).append($('<div/>').append($('<a/>',{href:"javascript:", class:"go_product",onclick:"go_product("+items.seq+")"
							}).append($('<span/>',{class:"p_name",text:"["+items.package_code+"] "+items.package_name
							}).append($('<img/>',{src:"../image/package.gif"}))))).append($('<div/>').append($('<span/>',{class:"p_info",text:items.content
							}))).append($('<p/>',{class:"p_date"}).append($('<span/>',{class:"t_txt"}).append($('<span/>',{class:"date"
							}).append($('<span/>',{class:"ir",text:"여행기간"}))).append($('<em/>',{text:items.day
							}))).append($('<span/>',{class:"t_txt"}).append($('<span/>',{class:"date"}).append($('<span/>',{class:"ir",text:"출발요일"}))).append($('<em/>',{text:items.week
							}))))).append($('<div/>',{class:"product_pricendetail"}).append($('<div/>',{class:"price"}).append($('<strong/>').append($('<span/>',{text: items.adult_price+"원~"
							})))).append($('<div/>',{class:"detail_view"}).append($('<a/>',{class:"btn btn_detail go_product", href:"javascript",onclick:"go_product("+items.seq+")"}).append($('<span/>',{class:"ir",text:"상세보기"
							}))))).appendTo($('.ul_search_result'));
					
					
				});
				
				$('<li/>',{id:"page",html:data.packagePaging.pagingHTML}).appendTo($('.ul_search_result'));
				
			}
		});	
	});
	
	//높은가격으로 돌아갈때
	$('.highprice').click(function(){
		$.ajax({
			type:"POST",
			url:"/TwoTour/packageTrip/highprice.do",
			data: "arrive_city=${tripDTO.getArrive_city()}&depart_date=${tripDTO.getDepart_date()}&depart_city=${tripDTO.getDepart_city()}&week=${tripDTO.getWeek()}&grade=${tripDTO.getGrade()}",
			dataType:"json",
			success: function(data){
			
				$('.highprice').css("font-weight","bold");
				$('.lowprice').css("font-weight","normal");
				$(".ul_search_result li").remove();
				$.each(data.packageList, function(index, items){
						    items.adult_price= (items.adult_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					
					
					$('<li/>').append($('<a/>',{
						href:"javascript:",
						class:"thumb_img jq_detail_link"
						}).append($('<img/>',{src: "../image/package/"+items.imageName, border: "0", width:"113", height:"89"
							}))).append($('<div/>',{class:"product_info"}).append($('<div/>').append($('<a/>',{href:"javascript:",class:"go_product",onclick:"go_product("+items.seq+")"
							}).append($('<span/>',{class:"p_name",text:"["+items.package_code+"] "+items.package_name
							}).append($('<img/>',{src:"../image/package.gif"}))))).append($('<div/>').append($('<span/>',{class:"p_info",text:items.content
							}))).append($('<p/>',{class:"p_date"}).append($('<span/>',{class:"t_txt"}).append($('<span/>',{class:"date"
							}).append($('<span/>',{class:"ir",text:"여행기간"}))).append($('<em/>',{text:items.day
							}))).append($('<span/>',{class:"t_txt"}).append($('<span/>',{class:"date"}).append($('<span/>',{class:"ir",text:"출발요일"}))).append($('<em/>',{text:items.week
							}))))).append($('<div/>',{class:"product_pricendetail"}).append($('<div/>',{class:"price"}).append($('<strong/>').append($('<span/>',{text: items.adult_price+"원~"
							})))).append($('<div/>',{class:"detail_view"}).append($('<a/>',{class:"btn btn_detail go_product", href:"javscript:", onclick:"go_product("+items.seq+")"}).append($('<span/>',{class:"ir",text:"상세보기"
							}))))).appendTo($('.ul_search_result'));
					
				});
				
				$('<li/>',{id:"page",html:data.packagePaging.pagingHTML}).appendTo($('.ul_search_result'));
				
			}
		});	
	});
});
//화면 나갔을때 원래크기로 돌아가기
$(window).bind("beforeunload",function(){
	$('#right_menu').css("display","none");
	$('#body').css("height","1350px");
});
</script>
<body>

	
	<input type="hidden" value="0" id="all_box">
	<input type="hidden" value="0" id="all_box1">
	<div id="pk_contents">
		<form id="quickPkgSearchForm" action="#" style="margin:0">
		</form>
		<c:if test="${imageList.size()!=0}">
		<div id="11000_banner_list">   
	        <ul class="pk_sbanner_list">
		<c:forEach var="PackageTripDTO" items="${imageList}">
		
			    <li><a href="#"><img src="../image/${PackageTripDTO.getImageName()}"></a></li>        
	       </c:forEach>
	        </ul>
		</div>
		</c:if>
		<div id="search_area">

			<div class="pk_search">
				<form class="pkgSearchForm" name="pkgSearchForm" action="" method="post" style="margin:0">
					<input type="hidden" name="arrive_city" value="${arrive_city}">
	                <input type="hidden" name="seq" id="seq" value="1902">
					<fieldset style="height:205px">
						<legend>상품상세검색</legend>
						<h3 class="h3 h3_search"><span class="ir">상품상세검색</span></h3>
						<div class="quick_search">
						   <ul class="quick_list">
							<li class="qu_subtitle_50" style="width:170px;"><strong class="txt_start_day01">출발일</strong>
								<select id="select_month" name="depart_date" style="padding-top:1px;">
										<option value="12">2017년12월</option>
										<option value="01">2018년1월</option>	
	                                    <option value="02">2018년2월</option>		
								</select>
							</li>
	
							<li class="qu_subtitle_50"><strong class="txt_start_city01">출발도시</strong>
									<select id="select_city" name="depart_city">
										<option value="인천">서울(인천/김포)</option>
	                                    <option value="부산">부산</option>
	                                    
								</select>
							</li>
					
							<li class="qu_subtitle_90">
								<strong class="txt_start_week">출발요일</strong>
								<p class="in_boxarea"><button type="button" class="btn_all" id="btn_ALL_MONTH" key="1">전체</button></p>
								<div class="in_boxarea" style="width:231px">
									<input type="checkbox" name="week" id="month_week" value="week" class="jq_seart_day jq_start_week"><label for="month_week" style="width:23px">평일</label>
									<input type="checkbox" name="week" id="month_weekend" value="weekend" class="jq_seart_day jq_start_week"><label for="month_weekend" style="width:23px">주말</label>

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
										<p class="title1">하나팩 클래식</p>
										<p class="cont">믿을 수 있는 항공, 엄선된 숙박과 식사, 보다 새롭고 다양한 볼거리로 구성된 수준 높은 정통 패키지</p>
							        </div>
								</div>
								<input type="checkbox" name="grade" id="grade_casual" value="캐주얼" class="jq_checkGrade">
								<div class="div_classic" style="float: left">
									<label for="grade_casual" class="ico_casual"><span class="ir">캐주얼</span></label>
									<div class="layer_casual">
										<p class="title1">하나팩 캐주얼</p>
										<p class="cont">실속파 고객들을 위한 보다 알찬 구성으로 짜여진 경제적인 패키지</p>
									</div>
								</div>
								<input type="checkbox" name="grade" id="grade_esavepack" value="이세이브" class="jq_checkGrade">
								<div class="div_classic" style="float: left">
									<label for="grade_esavepack" class="ico_esavepack"><span class="ir">이세이브팩</span></label>
								<div class="layer_casual">
										<p class="title1">이세이브팩</p>
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
					<iframe src="../image/광고s.jpg" width="288" height="256" style="top:2px;" frameborder="0" scrolling="no"></iframe>
				</div>
		</div>
		<div>해당 조건에 대해 총
			<span style="color:#ff0000; font-weight:bold;" id="tot_cnt">${packageList.size()}
			</span>개의 여행상품이 있습니다.		
		</div>
		<div class="search_result_list">
			<h3 class="ir">검색결과 리스트</h3>
			<div class="range_list">
				<ul id="ul_product_title">
					<li class="highprice"><a href="javascript:;" key="sort_no" stype="A" vtype="N" class="on">높은가격순</a></li>
					<!-- li><a href="javascript:;" key="sort_no" stype="A" vtype="S">인기순</a></li-->
					<li class="lowprice"><a href="javascript:;" key="min_amt" stype="A" vtype="N">낮은가격순</a></li>
				</ul>
			</div>		   
			<ul class="ul_search_result">
			<c:if test="${packageList!='' }">
			<c:forEach var="tripDTO" items="${packageList}">	
				<li>    
					<a href="javascript:" class="thumb_img jq_detail_link">
						<img src="../image/package/${tripDTO.getImageName()}" border="0" width="113" height="89" alt="">
					</a>					
					<div class="product_info">
						<div>
							<a href="javascript:" class="go_product" onclick="go_product(${tripDTO.getSeq()})"><span class="p_name">
										<img src="../image/package.gif" alt="패키지">
									[${tripDTO.getPackage_code()}] ${tripDTO.getPackage_name()}
								</span></a>
						</div>		
						<div>
							<span class="p_info">${tripDTO.getContent()}</span>
						</div>		
						<input type="hidden" id="hidden_code" name="hidden_code" value="PGP431">		
						<input type="hidden" id="cityList" name="cityList" value="D$GU$GUM">		
						<p class="p_date">		    
							<span class="t_txt">
								<span class="date">
									<span class="ir">여행기간</span>
								</span>
								<em>${tripDTO.getDay()}</em>
							</span>		    
							<span class="t_txt">
								<span class="day">
									<span class="ir">출발요일</span>
								</span>
								<em>${tripDTO.getWeek()}</em>
							</span>	   
						</p>	
					</div>	
					<div class="product_pricendetail ">		 
						<div class="price">
							<strong><span>
						<fmt:formatNumber type="number" value="${tripDTO.getAdult_price()}" pattern="#,###"/>	
						</span>원~</strong>
						</div>		 
						<div class="detail_view">		    
							<a class="btn btn_detail go_product" href="javascript:" onclick="go_product(${tripDTO.getSeq()})"><span class="ir">상세보기</span></a>
						</div>	
					</div>
				</li>
			</c:forEach>
			</c:if>
				<li id="page">${packagePaging.getPagingHTML()}</li>
			</ul>
		
	</div>
		</div>
</form>
</body>
</html>



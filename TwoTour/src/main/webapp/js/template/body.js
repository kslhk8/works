$(document).ready(function() {		
	
	/*제일 처음 시작할때!*/
	$('#tripType').val("편도");
	$('#air_menu_ul').on('click','li.air_menu_li', function(){
		console.log("li태그:"+$(this).text());
		$('#tripType').val($(this).text());
	});
	 $('#only_air_Search').on('click', function(){
		 	$('#oversea_freeTripForm').submit();
		 	
	});
	
	
	
	$('#oversea_free_trip_Only_hotel_div').hide();
	$('#oversea_free_trip_Air_hotel_div').hide();
	$('#oversea_package_Arrive_city_search_div').hide();
	$('#oversea_package_Arrive_city_search_close').hide();
	
	$('#only_air_Depart_date_calendar').hide();
	$('#only_air_Return_date_calendar').hide();
	$('#only_air_Arrive_city_search_div').hide();
	$('#only_air_Arrive_city_search_close').hide();
	
	$('#only_hotel_CheckIn_calendar').hide();
	$('#only_hotel_CheckOut_calendar').hide();
	$('#only_hotel_Destination_search_div').hide();
	$('#only_hotel_Destination_search_close').hide();
	
	$('#air_hotel_Depart_date_calendar').hide();
	$('#air_hotel_Return_date_calendar').hide();
	$('#air_hotel_Arrive_city_search_div').hide();
	$('#air_hotel_Arrive_city_search_close').hide();
	
	$('#popular_ranking_SouthEastA').show();
	$('#popular_ranking_C_H_H').hide();
	$('#popular_ranking_Jap').hide();
	$('#popular_ranking_SouthP').hide();
	$('#popular_ranking_Europe').hide();
	$('#popular_ranking_A_LatinA').hide();
	$('#popular_ranking_Jeju').hide();
	
	
	/*모든 여행도시 검색*/
	$('.img_button').click(function(){
		//alert('gg');
		var arrive_city;
		var table;
		
		if($('#oversea_package_Trip_city_content > .img_button').prop('checked')){
			arrive_city = $('#oversea_package_Trip_city_searchBox').val();
			table = $('#oversea_package_Arrive_city_search_tbody');
		}
		if($('#only_air_Arrive_city_content > .img_button').prop('checked')){
			arrive_city = $('#only_air_Arrive_city_searchBox').val();
			table = $('#only_air_Arrive_city_search_tbody');
		}
		if($('#air_hotel_Arrive_city_content > .img_button').prop('checked')){
			arrive_city = $('#air_hotel_Arrive_city_searchBox').val();
			table = $('#air_hotel_Arrive_city_search_tbody');
		}
		if($('#only_hotel_Destination_content > .img_button').prop('checked')){
			arrive_city = $('#only_hotel_Destination_searchBox').val();
			table = $('#only_hotel_Destination_search_tbody');
		}
		
		$.ajax({
			type: "POST",
			url: "/TwoTour/main/search.do",
			data: "arrive_city="+arrive_city,
			dataType: "json",
			error: function(){
				alert('error!');
			},
			success: function(data){
				if($('#oversea_package_Trip_city_content > .img_button').prop('checked')){
					$('#oversea_package_Arrive_city_search_table tr:gt(0)').remove();
				}
				if($('#only_air_Arrive_city_content > .img_button').prop('checked')){
					$('#only_air_Arrive_city_search_table tr:gt(0)').remove();
				}
				if($('#air_hotel_Arrive_city_content > .img_button').prop('checked')){
					$('#air_hotel_Arrive_city_search_table tr:gt(0)').remove();
				}
				if($('#only_hotel_Destination_content > .img_button').prop('checked')){
					$('#only_hotel_Destination_search_table tr:gt(0)').remove();
				}
					
				$.each(data.list, function(index, items){	
					$("<tr/>").append($("<td/>",{
						align: "center",
						}).append($("<a/>",{
							id: "arrive_city_A",
							href : "javascript:void(0)",
							text : items.city_code
						})
					)).append($("<td/>",{
						align: "center",
						}).append($("<a/>",{
							href : "javascript:void(0)",
							text : items.city
						})
					)).append($("<td/>",{
						align: "center",
						}).append($("<a/>",{
							href : "javascript:void(0)",
							text : items.country
						})
					)).appendTo(table);
				});
				
			}
		});
	});
	
	/*해외여행 패키지 - 여행도시 클릭!*/
	$('#oversea_package_Trip_city_searchBox').click(function(){
		$('#oversea_package_Depart_city_wrap').css('visibility','hidden');
		$('#oversea_package_Depart_month_wrap').css('visibility','hidden');
		$('#oversea_package_Depart_date_wrap').css('visibility','hidden');
		$('#oversea_package_trip_Grade_wrap').css('visibility','hidden');
		$('#oversea_package_trip_Name_wrap').css('visibility','hidden');	
		$('#oversea_package_Arrive_city_search_div').show();
		$('#oversea_package_Arrive_city_search_close').show();
		
		$('#oversea_package_Trip_city_content > .img_button').prop('checked',true);
	});
	
	
	
	/*해외패키지여행 - 여행도시 검색 후 결과 클릭!*/
	$('#oversea_package_Arrive_city_search_table').on('click','a',function(){
		//alert($('#arrive_city_A').text());
		$('#oversea_package_Trip_city_searchBox').val($('#arrive_city_A').text());
			
		$('#oversea_package_Trip_city_content > .img_button').prop('checked',false);
		$('#oversea_package_Arrive_city_search_div').hide();
		$('#oversea_package_Arrive_city_search_close').hide();
		
		$('#oversea_package_Depart_city_wrap').css('visibility','visible');
		$('#oversea_package_Depart_month_wrap').css('visibility','visible');
		$('#oversea_package_Depart_date_wrap').css('visibility','visible');
		$('#oversea_package_trip_Grade_wrap').css('visibility','visible');
		$('#oversea_package_trip_Name_wrap').css('visibility','visible');		
	});
	
	/*해외패키지여행 - 여행도시 닫기버튼 */
	$('#oversea_package_Arrive_city_search_close').click(function(){
		$('#oversea_package_Trip_city_content > .img_button').prop('checked',false);
		$('#oversea_package_Arrive_city_search_div').hide();
		$('#oversea_package_Arrive_city_search_close').hide();
		
		$('#oversea_package_Depart_city_wrap').css('visibility','visible');
		$('#oversea_package_Depart_month_wrap').css('visibility','visible');
		$('#oversea_package_Depart_date_wrap').css('visibility','visible');
		$('#oversea_package_trip_Grade_wrap').css('visibility','visible');
		$('#oversea_package_trip_Name_wrap').css('visibility','visible');		
	});

	/*해외패키지 여행 - 여행도시 검색할 때 주요도시바로가기 테이블에서 도시 클릭*/
	$('#maincity_Search_T_OP').on('click','a',function(){
		//alert($(this).text());
		$('#oversea_package_Trip_city_searchBox').val($(this).text());
		
		$('#oversea_package_Trip_city_content > .img_button').prop('checked',false);
		$('#oversea_package_Arrive_city_search_div').hide();
		$('#oversea_package_Arrive_city_search_close').hide();
		
		$('#oversea_package_Depart_city_wrap').css('visibility','visible');
		$('#oversea_package_Depart_month_wrap').css('visibility','visible');
		$('#oversea_package_Depart_date_wrap').css('visibility','visible');
		$('#oversea_package_trip_Grade_wrap').css('visibility','visible');
		$('#oversea_package_trip_Name_wrap').css('visibility','visible');		
	});
	
	
	
	/*해외패키지여행: 출발요일 - 평일 체크*/
	$('#week').click(function() {
		if ($(this).prop('checked')) {
			$('#week + label').css('background','url("/TwoTour/image/check.png")left/12px no-repeat')
			$('#week + label').css('padding-left', '12px');
			$(this).css('visibility', 'hidden');
		}
	});	
	
	/*해외패키지여행: 출발요일 - 평일 체크풀기*/
	$('#week + label').click(function() {
		$('#week').prop('checked', false);
		$(this).css('background', 'none');
		$('#week').css('visibility', 'visible'); 
		//$('#week').css('z-index', '0');
	});
	
	
	/*해외패키지여행: 출발요일 - 주말 체크*/
	$('#weekend').click(function() {
		if ($(this).prop('checked')) {
			$('#weekend + label').css('background','url("/TwoTour/image/check.png")left/12px no-repeat')
			$('#weekend + label').css('padding-left', '12px');
			$(this).css('visibility','hidden');
		}
	});	
	
	/*해외패키지여행: 출발요일 - 주말 체크풀기*/
	$('#weekend + label').click(function() {
		$('#weekend').prop('checked', false);
		$(this).css('background', 'none');
		//$('#weekend + label').css('padding-left', '0px');
		$('#weekend').css('visibility', 'visible');
	});

	
	
	
	
	/*해외패키지여행: 상품등급 - 클래스 체크*/
	$('#classic').click(function() {
		if ($(this).prop('checked')) {
			$('#classic + label').css('background','url("/TwoTour/image/check.png")left/12px no-repeat')
			$('#classic + label').css('padding-left', '12px');
			$(this).css('visibility','hidden');
		}
	});	
	
	/*해외패키지여행: 상품등급 - 클래스 체크풀기*/
	$('#classic + label').click(function() {
		$('#classic').prop('checked', false);
		$('#classic + label').css('background', 'none');
		/* $('#classic + label').css('padding-left', '0px'); */
		$('#classic').css('visibility', 'visible');
	});

	/*해외패키지여행: 상품등급 - 캐주얼 체크*/
	$('#casual').click(function() {
		if ($(this).prop('checked')) {
			$('#casual + label').css('background','url("/TwoTour/image/check.png")left/12px no-repeat')
			$('#casual + label').css('padding-left', '12px');
			$(this).css('visibility','hidden');
		}
	});	
	
	/*해외패키지여행: 상품등급 - 캐주얼 체크풀기*/
	$('#casual + label').click(function() {
		$('#casual').prop('checked', false);
		$('#casual + label').css('background', 'none');
		//$('#casual + label').css('padding-left', '0px');
		$('#casual').css('visibility', 'visible');
	});
		
	/*해외패키지여행: 상품등급 - 이세이브 체크*/
	$('#esave').click(function() {
		if ($(this).prop('checked')) {
			$('#esave + label').css('background','url("/TwoTour/image/check.png")left/12px no-repeat')
			$('#esave + label').css('padding-left', '12px');
			$(this).css('visibility','hidden');
		}
	});		
	
	/*해외패키지여행: 상품등급 - 이세이브 체크풀기*/
	$('#esave + label').click(function() {
		$('#esave').prop('checked', false);
		$('#esave + label').css('background', 'none');
		//$('#esaver + label').css('padding-left', '0px');
		$('#esave').css('visibility', 'visible');
	});
	
	/*해외패키지여행: 상풍등급 설명마크 */
	$('#classic_q').hover(classic_explain_open, classic_explain_close);
	$('#casual_q').hover(casual_explain_open, casual_explain_close);
	$('#esave_q').hover(esave_explain_open, esave_explain_close);
		

	$('#oversea_package_trip_Search').click(function(){
		if($('#oversea_package_Trip_city_searchBox').val().length==0){
			alert('여행도시를 입력해주세요');
		}
		else{
			$('#oversea_package_trip').submit();
		}
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*해외자유여행: 항공 선택*/	
	$('#only_air').click(function() {
		$(this).css('background-color', 'white');
		$(this).css('color', 'black');
		$('#only_hotel').css('background-color','rgb(117,185,212)');
		$('#only_hotel').css('color', 'white');
		$('#air_hotel').css('background-color','rgb(117,185,212)');
		$('#air_hotel').css('color', 'white');
		$('#oversea_free_trip_Only_air_div').show();
		$('#oversea_free_trip_Only_hotel_div').hide();
		$('#oversea_free_trip_Air_hotel_div').hide();
	});
	
	/*해외자유여행: 호텔 선택*/	
	$('#only_hotel').click(function() {
		$(this).css('background-color', 'white');
		$(this).css('color', 'black');
		$('#only_air').css('background-color','rgb(117,185,212)');
		$('#only_air').css('color', 'white');
		$('#air_hotel').css('background-color','rgb(117,185,212)');
		$('#air_hotel').css('color', 'white');
		$('#oversea_free_trip_Only_air_div').hide();
		$('#oversea_free_trip_Only_hotel_div').show();
		$('#oversea_free_trip_Air_hotel_div').hide();
	});
	
	/*해외자유여행: 항공+호텔 선택*/	
	$('#air_hotel').click(function() {
		$(this).css('background-color', 'white');
		$(this).css('color', 'black');
		$('#only_air').css('background-color','rgb(117,185,212)');
		$('#only_air').css('color', 'white');
		$('#only_hotel').css('background-color','rgb(117,185,212)');
		$('#only_hotel').css('color', 'white');
		$('#oversea_free_trip_Only_air_div').hide();
		$('#oversea_free_trip_Only_hotel_div').hide();
		$('#oversea_free_trip_Air_hotel_div').show();
	});
	
	/*해외자유여행 - 항공: 출발일 달력*/
	$('#only_air_Depart_date_content > img').click(function(){	
		if($('#only_air_Return_date_calendar').css('z-index')=='100'){
			$('#only_air_Return_date_calendar').hide();
		}
		
		$('#only_air_Depart_date_calendar').show();
		$('#only_air_Depart_date_calendar').css('z-index','100');
		
		onload_fn();
	});
	
	/*해외자유여행 - 항공: 출발일 달력 닫기*/
	$('#close_A_D').click(function(){
		$('#only_air_Depart_date_calendar').hide();
	});
	
	
	/*해외자유여행 - 항공: 도착일 달력*/	
	$('#only_air_Return_date_content > img').click(function(){
		if($('#only_air_Depart_date_calendar').css('z-index')=='100'){
			$('#only_air_Depart_date_calendar').hide();
		}
		
		$('#only_air_Return_date_calendar').show();
		$('#only_air_Return_date_calendar').css('z-index','100');
		
		onload_fn();	
	});
	
	/*해외자유여행 - 항공: 도착일 달력 닫기*/
	$('#close_A_R').click(function(){
		$('#only_air_Return_date_calendar').hide();
	});
	
	
	/*해외자유여행 - 항공: 도착도시 검색*/
	$('#only_air_Arrive_city_searchBox').click(function(){
		$('#only_air_Depart_date_wrap').css('visibility','hidden');
		$('#only_air_Return_date_wrap').css('visibility','hidden');
		$('#only_air_Dont_know_wrap').css('visibility','hidden');
		$('#only_air_Member_wrap').css('visibility','hidden');
		$('#only_air_Prefer_air_wrap').css('visibility','hidden');	
		$('#only_air_Seat_grade_wrap').css('visibility','hidden');
		$('#only_air_Search').css('visibility','hidden');	
		$('#only_air_Arrive_city_search_div').show();
		$('#only_air_Arrive_city_search_close').show();
		
		$('#only_air_Arrive_city_content > .img_button').prop('checked',true);
	});
	
	/*해외자유여행 - 항공: 여행도시 검색 후 결과 클릭!*/
	$('#only_air_Arrive_city_search_table').on('click','a',function(){
		//alert($('#arrive_city_A').text());
		$('#only_air_Arrive_city_searchBox').val($('#arrive_city_A').text());
			
		$('#only_air_Arrive_city_content > .img_button').prop('checked',false);
		$('#only_air_Arrive_city_search_div').hide();
		$('#only_air_Arrive_city_search_close').hide();
		
		$('#only_air_Depart_date_wrap').css('visibility','visible');
		$('#only_air_Return_date_wrap').css('visibility','visible');
		$('#only_air_Dont_know_wrap').css('visibility','visible');
		$('#only_air_Member_wrap').css('visibility','visible');
		$('#only_air_Prefer_air_wrap').css('visibility','visible');	
		$('#only_air_Seat_grade_wrap').css('visibility','visible');
		$('#only_air_Search').css('visibility','visible');
	});
	
	/*해외자유여행 - 항공: 여행도시 닫기버튼 */
	$('#only_air_Arrive_city_search_close').click(function(){
		$('#only_air_Arrive_city_content > .img_button').prop('checked',false);
		
		$('#only_air_Arrive_city_search_div').hide();
		$('#only_air_Arrive_city_search_close').hide();
		
		$('#only_air_Depart_date_wrap').css('visibility','visible');
		$('#only_air_Return_date_wrap').css('visibility','visible');
		$('#only_air_Dont_know_wrap').css('visibility','visible');
		$('#only_air_Member_wrap').css('visibility','visible');
		$('#only_air_Prefer_air_wrap').css('visibility','visible');	
		$('#only_air_Seat_grade_wrap').css('visibility','visible');
		$('#only_air_Search').css('visibility','visible');
	});

	/*해외자유여행 - 항공: 여행도시 검색할 때 주요도시바로가기 테이블에서 도시 클릭*/
	$('#maincity_Search_T_OA').on('click','a',function(){
		//alert($(this).text());
		$('#only_air_Arrive_city_searchBox').val($(this).text());
		
		$('#only_air_Arrive_city_content > .img_button').prop('checked',false);
		
		$('#only_air_Arrive_city_search_div').hide();
		$('#only_air_Arrive_city_search_close').hide();
		
		$('#only_air_Depart_date_wrap').css('visibility','visible');
		$('#only_air_Return_date_wrap').css('visibility','visible');
		$('#only_air_Dont_know_wrap').css('visibility','visible');
		$('#only_air_Member_wrap').css('visibility','visible');
		$('#only_air_Prefer_air_wrap').css('visibility','visible');	
		$('#only_air_Seat_grade_wrap').css('visibility','visible');
		$('#only_air_Search').css('visibility','visible');
	});
	
	
	
	
	/*해외자유여행 - 호텔: 여행도시 클릭!*/
	$('#only_hotel_Destination_searchBox').click(function(){
		$('#only_hotel_CheckIn_wrap').css('visibility','hidden');
		$('#only_hotel_CheckOut_wrap').css('visibility','hidden');
		$('#only_hotel_Nights').css('visibility','hidden');
		$('#only_hotel_Bed_numbers_wrap').css('visibility','hidden');
		$('#only_hotel_Member_per_bed_wrap').css('visibility','hidden');
		
		$('#only_hotel_Destination_search_div').show();
		$('#only_hotel_Destination_search_close').show();
		
		$('#only_hotel_Destination_content > .img_button').prop('checked',true);
	});
	
	
	/*해외자유여행 - 호텔: 여행도시 검색 후 결과 클릭!*/
	$('#only_hotel_Destination_search_table').on('click','a',function(){
		//alert($('#arrive_city_A').text());
		$('#only_hotel_Destination_searchBox').val($('#arrive_city_A').text());
			
		$('#only_hotel_Destination_content > .img_button').prop('checked',false);
		
		$('#only_hotel_Destination_search_div').hide();
		$('#only_hotel_Destination_search_close').hide();
		
		$('#only_hotel_CheckIn_wrap').css('visibility','visible');
		$('#only_hotel_CheckOut_wrap').css('visibility','visible');
		$('#only_hotel_Nights').css('visibility','visible');
		$('#only_hotel_Bed_numbers_wrap').css('visibility','visible');
		$('#only_hotel_Member_per_bed_wrap').css('visibility','visible');			
	});
	
	/*해외자유여행 - 호텔: 여행도시 닫기버튼 */
	$('#only_hotel_Destination_search_close').click(function(){
		$('#only_hotel_Destination_content > .img_button').prop('checked',false);
		
		$('#only_hotel_Destination_search_div').hide();
		$('#only_hotel_Destination_search_close').hide();
		
		$('#only_hotel_CheckIn_wrap').css('visibility','visible');
		$('#only_hotel_CheckOut_wrap').css('visibility','visible');
		$('#only_hotel_Nights').css('visibility','visible');
		$('#only_hotel_Bed_numbers_wrap').css('visibility','visible');
		$('#only_hotel_Member_per_bed_wrap').css('visibility','visible');			
	});

	/*해외자유여행 - 호텔: 여행도시 검색할 때 주요도시바로가기 테이블에서 도시 클릭*/
	$('#maincity_Search_T_OH').on('click','a',function(){
		//alert($(this).text());
		$('#only_hotel_Destination_searchBox').val($(this).text());
		
		$('#only_hotel_Destination_content > .img_button').prop('checked',false);
		
		$('#only_hotel_Destination_search_div').hide();
		$('#only_hotel_Destination_search_close').hide();
		
		$('#only_hotel_CheckIn_wrap').css('visibility','visible');
		$('#only_hotel_CheckOut_wrap').css('visibility','visible');
		$('#only_hotel_Nights').css('visibility','visible');
		$('#only_hotel_Bed_numbers_wrap').css('visibility','visible');
		$('#only_hotel_Member_per_bed_wrap').css('visibility','visible');		
	});
	
	/*해외자유여행 - 호텔: 체크인 달력*/	
	$('#only_hotel_CheckIn_content > img').click(function(){	
		if($('#only_hotel_CheckOut_calendar').css('z-index')=='100'){
			$('#only_hotel_CheckOut_calendar').hide();
		}
		
		$('#only_hotel_CheckIn_calendar').show();
		$('#only_hotel_CheckIn_calendar').css('z-index','100');
		
		onload_fn();
	});
	
	/*해외자유여행 - 호텔: 체크인 달력 닫기*/	
	$('#close_H_CI').click(function(){
		$('#only_hotel_CheckIn_calendar').hide();
	});
	
	/*해외자유여행 - 호텔: 체크아웃 달력*/	
	$('#only_hotel_CheckOut_content > img').click(function(){	
		if($('#only_hotel_CheckIn_calendar').css('z-index')=='100'){
			$('#only_hotel_CheckIn_calendar').hide();
		}
		
		$('#only_hotel_CheckOut_calendar').show();
		$('#only_hotel_CheckOut_calendar').css('z-index','100');
		
		onload_fn();
	});	
	
	/*해외자유여행 - 호텔: 체크아웃 달력 닫기*/	
	$('#close_H_CO').click(function(){
		$('#only_hotel_CheckOut_calendar').hide();
	});
	
	
	/*해외자유여행 - 항공+호텔: 출발일 달력*/	
	$('#air_hotel_Depart_date_content > img').click(function(){	
		if($('#air_hotel_Return_date_calendar').css('z-index')=='100'){
			$('#air_hotel_Return_date_calendar').hide();
		}
		
		$('#air_hotel_Depart_date_calendar').show();
		$('#air_hotel_Depart_date_calendar').css('z-index','100');
		
		onload_fn();
	});
	
	/*해외자유여행 - 항공+호텔: 출발일 달력 닫기*/	
	$('#close_AH_D').click(function(){
		$('#air_hotel_Depart_date_calendar').hide();
	});
	
	/*해외자유여행 - 항공+호텔: 도착일 달력*/		
	$('#air_hotel_Return_date_content > img').click(function(){
		if($('#air_hotel_Depart_date_calendar').css('z-index')=='100'){
			$('#air_hotel_Depart_date_calendar').hide();
		}
		
		$('#air_hotel_Return_date_calendar').show();
		$('#air_hotel_Return_date_calendar').css('z-index','100');
		
		onload_fn();	
	});
	
	/*해외자유여행 - 항공+호텔: 도착일 달력 닫기*/	
	$('#close_AH_R').click(function(){
		$('#air_hotel_Return_date_calendar').hide();
	});
	
	
	
	
	
	/*해외자유여행: 왕복 선택*/
	$('#roundtrip').click(function() {
		$('#only_air_Return_date_wrap').show();
	});
	
	/*해외자유여행: 편도 선택*/
	$('#oneway').click(function() {
		$('#only_air_Return_date_wrap').hide();
	});
	
	
	
	var today = new Date();	
	/*해외자유여행 - 항공 도착일,출발일*/
	$('#only_air_Depart_date_content > input[type=text]').val(today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate());
	$('#only_air_Return_date_content > input[type=text]').val(today.getFullYear()+'-'+(today.getMonth()+1)+'-'+(today.getDate()+1));
	
	
	/*해외자유여행 - 호텔 도착일,출발일*/
	$('#only_hotel_CheckIn_content > input[type=text]').val(today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate());
	$('#only_hotel_CheckOut_content > input[type=text]').val(today.getFullYear()+'-'+(today.getMonth()+1)+'-'+(today.getDate()+1));
	
	
	/*해외자유여행 - 호텔+항공 도착일,출발일*/
	$('#air_hotel_Depart_date_content > input[type=text]').val(today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate());
	$('#air_hotel_Return_date_content > input[type=text]').val(today.getFullYear()+'-'+(today.getMonth()+1)+'-'+(today.getDate()+1));
	
	
	
	
	
	
	/*해외자유여행 - 항공+호텔: 도착도시 검색*/
	$('#air_hotel_Arrive_city_searchBox').click(function(){
		$('#air_hotel_Depart_date_wrap').css('visibility','hidden');
		$('#air_hotel_Return_date_wrap').css('visibility','hidden');
		$('#air_hotel_Seat_grade_wrap').css('visibility','hidden');
		$('#air_hotel_Bed_numbers_wrap').css('visibility','hidden');
		$('#air_hotel_Member_per_bed_wrap').css('visibility','hidden');	

		$('#air_hotel_Arrive_city_search_div').show();
		$('#air_hotel_Arrive_city_search_close').show();
		
		$('#air_hotel_Arrive_city_content > .img_button').prop('checked',true);
	});
	
	/*해외자유여행 - 항공+호텔: 여행도시 검색 후 결과 클릭!*/
	$('#air_hotel_Arrive_city_search_table').on('click','a',function(){
		//alert($('#arrive_city_A').text());
		$('#air_hotel_Arrive_city_searchBox').val($('#arrive_city_A').text());
			
		$('#air_hotel_Arrive_city_content > .img_button').prop('checked',false);
		
		$('#air_hotel_Arrive_city_search_div').hide();
		$('#air_hotel_Arrive_city_search_close').hide();
		
		$('#air_hotel_Depart_date_wrap').css('visibility','visible');
		$('#air_hotel_Return_date_wrap').css('visibility','visible');
		$('#air_hotel_Seat_grade_wrap').css('visibility','visible');
		$('#air_hotel_Bed_numbers_wrap').css('visibility','visible');
		$('#air_hotel_Member_per_bed_wrap').css('visibility','visible');	

	});
	
	/*해외자유여행 - 항공+호텔: 여행도시 닫기버튼 */
	$('#air_hotel_Arrive_city_search_close').click(function(){
		$('#air_hotel_Arrive_city_content > .img_button').prop('checked',false);
		
		$('#air_hotel_Arrive_city_search_div').hide();
		$('#air_hotel_Arrive_city_search_close').hide();
		
		$('#air_hotel_Depart_date_wrap').css('visibility','visible');
		$('#air_hotel_Return_date_wrap').css('visibility','visible');
		$('#air_hotel_Seat_grade_wrap').css('visibility','visible');
		$('#air_hotel_Bed_numbers_wrap').css('visibility','visible');
		$('#air_hotel_Member_per_bed_wrap').css('visibility','visible');	
	});

	/*해외자유여행 - 항공+호텔: 여행도시 검색할 때 주요도시바로가기 테이블에서 도시 클릭*/
	$('#maincity_Search_T_AH').on('click','a',function(){
		//alert($(this).text());
		$('#air_hotel_Arrive_city_searchBox').val($(this).text());
		
		$('#air_hotel_Arrive_city_content > .img_button').prop('checked',false);
		
		$('#air_hotel_Arrive_city_search_div').hide();
		$('#air_hotel_Arrive_city_search_close').hide();
		
		$('#air_hotel_Depart_date_wrap').css('visibility','visible');
		$('#air_hotel_Return_date_wrap').css('visibility','visible');
		$('#air_hotel_Seat_grade_wrap').css('visibility','visible');
		$('#air_hotel_Bed_numbers_wrap').css('visibility','visible');
		$('#air_hotel_Member_per_bed_wrap').css('visibility','visible');	
	});
	
	
	
	 /*예약랭킹 TOP3 메뉴 클릭시 색 바뀌게*/
	 $('#popular_ranking_menu > ul > li').click(function(){
		 $(this).css('color', 'rgb(241, 84, 155)').css('font-weight', 'bolder');
		 $('li').not(this).css('color', 'black').css('font-weight', 'normal');
	 });
	 
	 /*예약랭킹TOP3 메뉴 클릭시 그것에 맞는 div 나오게 만들기!*/
	 $('#SouthEastA').click(function(){
		 $('#popular_ranking_SoutEasthA').show();
		 $('#popular_ranking_C_H_H').hide();
		 $('#popular_ranking_Jap').hide();
		 $('#popular_ranking_SouthP').hide();
		 $('#popular_ranking_Europe').hide();
		 $('#popular_ranking_A_LatinA').hide();
		 $('#popular_ranking_Jeju').hide();
	 });	 
	 $('#C_H_H').click(function(){
		 $('#popular_ranking_C_H_H').show();
		 $('#popular_ranking_SoutEasthA').hide();
		 $('#popular_ranking_Jap').hide();
		 $('#popular_ranking_SouthP').hide();
		 $('#popular_ranking_Europe').hide();
		 $('#popular_ranking_A_LatinA').hide();
		 $('#popular_ranking_Jeju').hide();
	 });	 
	 $('#Jap').click(function(){
		 $('#popular_ranking_Jap').show();
		 $('#popular_ranking_SoutEasthA').hide();
		 $('#popular_ranking_C_H_H').hide();
		 $('#popular_ranking_SouthP').hide();
		 $('#popular_ranking_Europe').hide();
		 $('#popular_ranking_A_LatinA').hide();
		 $('#popular_ranking_Jeju').hide();
	 });
	 
	 $('#SouthP').click(function(){
		 $('#popular_ranking_SouthP').show();
		 $('#popular_ranking_SoutEasthA').hide();
		 $('#popular_ranking_C_H_H').hide();
		 $('#popular_ranking_Jap').hide();
		 $('#popular_ranking_Europe').hide();
		 $('#popular_ranking_A_LatinA').hide();
		 $('#popular_ranking_Jeju').hide();
	 });
	 $('#Europe').click(function(){
		 $('#popular_ranking_Europe').show();
		 $('#popular_ranking_SoutEasthA').hide();
		 $('#popular_ranking_C_H_H').hide();
		 $('#popular_ranking_Jap').hide();
		 $('#popular_ranking_SouthP').hide();		 
		 $('#popular_ranking_A_LatinA').hide();
		 $('#popular_ranking_Jeju').hide();
	 });
	 $('#A_LatinA').click(function(){
		 $('#popular_ranking_A_LatinA').show();
		 $('#popular_ranking_SoutEasthA').hide();
		 $('#popular_ranking_C_H_H').hide();
		 $('#popular_ranking_Jap').hide();
		 $('#popular_ranking_SouthP').hide();
		 $('#popular_ranking_Europe').hide();
		 $('#popular_ranking_Jeju').hide();
	 });
	 $('#Jeju').click(function(){
		 $('#popular_ranking_Jeju').show();
		 $('#popular_ranking_SoutEasthA').hide();
		 $('#popular_ranking_C_H_H').hide();
		 $('#popular_ranking_Jap').hide();
		 $('#popular_ranking_SouthP').hide();
		 $('#popular_ranking_Europe').hide();
		 $('#popular_ranking_A_LatinA').hide();
	 });
	 
	 
	 
	 
	 $('#popular_ranking_content').on('mouseenter','.top1',function(){
		//alert('hover'); 
		 $('.top1_explain').css('overflow', 'visible');
		 $('.top1_explain').css('height','130px');
		// $('.top1 > img').css('height','50px');
	 }).on('mouseleave','.top1',function(){
		 $('.top1_explain').css('overflow', 'hidden');
		 $('.top1_explain').css('height','35px');
	 });
	 
	 $('#popular_ranking_content').on('mouseenter','.top2',function(){
		//alert('hover'); 
		 $('.top2_explain').css('overflow', 'visible');
		 $('.top2_explain').css('height','130px');
	 }).on('mouseleave','.top2',function(){
		 $('.top2_explain').css('overflow', 'hidden');
		 $('.top2_explain').css('height','35px');
	 });
	 
	 $('#popular_ranking_content').on('mouseenter','.top3',function(){
		//alert('hover'); 
		 $('.top3_explain').css('overflow', 'visible');
		 $('.top3_explain').css('height','130px');
	 }).on('mouseleave','.top3',function(){
		 $('.top3_explain').css('overflow', 'hidden');
		 $('.top3_explain').css('height','35px');
	 });

});


function classic_explain_open() {
	$('#classic_explain').css('visibility', 'visible');
	$('#classic_explain').css('z-index', '1');
}
function classic_explain_close() {
	$('#classic_explain').css('visibility', 'hidden');
	$('#classic_explain').css('z-index', '0');
}

function casual_explain_open() {
	$('#casual_explain').css('visibility', 'visible');
	$('#casual_explain').css('z-index', '1');
}
function casual_explain_close() {
	$('#casual_explain').css('visibility', 'hidden');
	$('#casual_explain').css('z-index', '0');
}

function esave_explain_open() {
	$('#esave_explain').css('visibility', 'visible');
	$('#esave_explain').css('z-index', '1');
}
function esave_explain_close() {
	$('#esave_explain').css('visibility', 'hidden');
	$('#esave_explain').css('z-index', '0');
}










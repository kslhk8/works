//상단 재검색 버튼 클릭
function fnResearchBtnClick(depart_city, depart_date, arrive_city, return_date, adultCnt, childCnt, babyCnt){

	if($('div.top_search').hasClass('on')){
		$("#searchView").hide();
		$('div.top_search').removeClass('on');
		$('#researchBtn').removeClass('on');
		$("div.top_search").css("height", 118);
	}else{
		$('div.top_search').addClass('on');
		$('#researchBtn').addClass('on');
		$("div.top_search").css("height", 410);
		$("#searchView").show();
	}
//---------------------------------------------------------------------------------그분들이한거	
	//console.log("??"+babyCnt);
	//console.log("!!"+depart_city);
	//var contact = JSON.parse(firstMap);
	//console.log(contact.depart_date + ", " + contact.arrive_city);
	//console.log(contact.adultCnt);
	
	
	$('#freeResult_depart_city').val(depart_city).attr('selected', 'selected');	
	$('#freeResult_arrive_city').val(arrive_city).attr('selected', 'selected');
	$('#freeResult_depart_city_RT').val(arrive_city).attr('selected', 'selected');
	$('#freeResult_arrive_city_RT').val(depart_city).attr('selected', 'selected');
	
	//var departDateArr = depart_date.split('-');
	//var departDateStr = departDateArr[0]+'0'+departDateArr[1]+departDateArr[2];
	//$('#freeResult_depart_date').val(departDateStr.trim()).attr('selected', 'selected');
	$('#freeResult_depart_date').val(depart_date).attr('selected', 'selected');
	
	//var returnDateArr = return_date.split('-');
	//var returnDateStr = returnDateArr[0]+'0'+returnDateArr[1]+returnDateArr[2];
	//$('#freeResult_return_date').val(returnDateStr.trim()).attr('selected', 'selected');
	$('#freeResult_return_date').val(return_date).attr('selected', 'selected');
	
	$('#adtCntRT option:eq('+(adultCnt-1)+')').attr('selected', 'selected');
	$('#chdCntRT option:eq('+childCnt+')').attr('selected', 'selected');
	$('#infCntRT option:eq('+babyCnt+')').attr('selected', 'selected');
}
function goToPreInfom(){
	if($('#hidden_table_form>input[name="depart_time"]').val()==''){
		alert("예약하실 [출국행]부터 클릭해주세요.");
	}else if($('#hidden_table_form>input[name="depart_time1"]').val()==''){
		alert("예약하실 [귀국행]도 클릭해주세요.");
	}else{
		alert($('#hidden_table_form>input[name="depart_time"]').val());
		$('#hidden_table_form').submit();
	}
}

/*function test(a){
	console.log(a);
	$('#hidden_table_form>input[name="airplane_code"]').val(a);
	$('#hidden_table_form>input[name="depart_city"]').val(b);
	$('#hidden_table_form>input[name="depart_date"]').val(c);
	$('#hidden_table_form>input[name="depart_time"]').val(d);
	$('#hidden_table_form>input[name="arrive_city"]').val(e);
}*/
function test(){console.log("그지같아");}

//재검색 내 선택 버튼들
$(document).ready(function(){
	var depart = false;
	var uniDepart = false;
	var arrive = false;
	var adult = false;
	var uniAdult = false;
	var child = false;
	var uniChild = false;
	var infant = false;
	var uniInfant = false;
	var seat = false;
	var uniSeat = false;
	var checkinData = false;
	
	//-------------------------------------------------------그분들이한거//
	
 	$.ajax({
		type: "POST"
		, url: "/TwoTour/productFree/test_freeResult.do"
		, data: {
			"tripType":$('input[name="tripType_forAjax"]').val()
			, "depart_city":$('input[name="depart_city_forAjax"]').val()
			, "arrive_city":$('input[name="arrive_city_forAjax"]').val()
			, "depart_date":$('input[name="depart_date_forAjax"]').val()
			, "return_date":$('input[name="return_date_forAjax"]').val()
		}
		, dataType: "json"
		, error: function(x, o, e){
			var msg = "페이지 호출 중 error!\n"+x.status+":"+o+":"+e;
			alert(msg);
		}
		, success: function(data){
			//alert(JSON.stringify(data));
			if($('#tripType_forAjax').val()=='편도'){
				$.each(data.hiddenList ,function(index, item){
					var idString = $("#next_out"+item.adult_cost).parent().prop("id");
					idString = idString.slice(-1);
					var a = item.airplane_code;
				
					$('#next_out'+item.adult_cost).html("<span>"
							+item.depart_time+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>>>>>>>>>>>>>"				
							+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+item.arrive_time);
					$('#next_out'+item.adult_cost).on('click',function(){
						$('#hidden_table_form>input[name="airplane_code"]').val(item.airplane_code);
						$('#hidden_table_form>input[name="depart_city"]').val(item.depart_city);
						$('#hidden_table_form>input[name="depart_date"]').val(item.depart_date);
						$('#hidden_table_form>input[name="depart_time"]').val(item.depart_time);
						$('#hidden_table_form>input[name="arrive_city"]').val(item.arrive_city);
					});
					
				});
			}else{
				$.each(data.rtMap ,function(index, item){
					$('#next_out'+index).html("<span>"
							+item[0].depart_time+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>>>>>>>>>>>>>"				
							+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+item[0].arrive_time);
					$('#next_in'+index).html("<span>"
							+item[1].depart_time+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>>>>>>>>>>>>>"				
							+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+item[1].arrive_time);
					
					$('#next_out'+index).on('click',function(){
						$('#hidden_table_form>input[name="airplane_code"]').val(item[0].airplane_code);
						$('#hidden_table_form>input[name="depart_city"]').val(item[0].depart_city);
						$('#hidden_table_form>input[name="depart_date"]').val(item[0].depart_date);
						$('#hidden_table_form>input[name="depart_time"]').val(item[0].depart_time);
						$('#hidden_table_form>input[name="arrive_city"]').val(item[0].arrive_city);
					});
					$('#next_in'+index).on('click',function(){
						$('#hidden_table_form>input[name="airplane_code1"]').val(item[1].airplane_code);
						$('#hidden_table_form>input[name="depart_city1"]').val(item[1].depart_city);
						$('#hidden_table_form>input[name="depart_date1"]').val(item[1].depart_date);
						$('#hidden_table_form>input[name="depart_time1"]').val(item[1].depart_time);
						$('#hidden_table_form>input[name="arrive_city1"]').val(item[1].arrive_city);
					});
				});		
			}
			
		}
	});	
	$('#airplane_scheduleT').on('click','.data_Tr>td',function(){
		var t3 = $(this).parent().prop('id');
		var lastNum = t3.slice(-1);
		
		
	} )
	//-------------------------------------------------------//
	$('.freeResult_divSet').hover(
			function(){
				$(this).attr('style', 'border: 1.6px solid black;');
			}, function(){
				$(this).attr('style', 'border: none;');
			}
	);
	var cntDiv=0;
	$('.freeResult_divSet').on('click', function(){
		var t1 = $(this)[0].id;
		
		var t2 = $(this).get(0).id;
		var t3 = $(this).prop('id');

		//console.log(t3);//freeResult_divSet2
		var lastNum = t3.slice(-1);
		//alert($('#hidden_table'+lastNum).find('input[name="airplane_name"]').val());
		//var please = $('#hidden_table'+lastNum).find('input').val();
		//alert(please.slice(12));
		//var airplaneArr = please.slice(12).split(",");
		//$('#hidden_table_form'+lastNum).submit();
		//$('#hidden_table'+lastNum).find('#hidden_table_form'+lastNum).submit();
		if(cntDiv!=0 && $(this)!=previous){
			previous.parent().parent().next().css('display','none');
			previous.parent().parent().next().next().css('display','none');
			previous.parent().parent().next().next().next().css('display','none');
			if($(this).hasClass("RT")){
				previous.parent().parent().next().css('display','none');
				previous.parent().parent().next().next().css('display','none');
				previous.parent().parent().next().next().next().css('display','none');
				previous.parent().parent().next().next().next().next().css('display','none');
				previous.parent().parent().next().next().next().next().next().css('display','none');
			}
		}
 		if(!$(this).hasClass("displayed") && !$(this).hasClass("RT")){
 			$(this).parent().parent().next().css('display','table-row');
 			$(this).parent().parent().next().next().css('display','table-row');
 			$(this).parent().parent().next().next().next().css('display','table-row');
 			$(this).addClass("displayed");
 		}else if($(this).hasClass("displayed") &&! $(this).hasClass("RT")){
 			$(this).parent().parent().next().css('display','none');
 			$(this).parent().parent().next().next().css('display','none');
 			$(this).parent().parent().next().next().next().css('display','none');
 			$(this).removeClass("displayed");
 		}else if(!$(this).hasClass("displayed") && $(this).hasClass("RT")){
 			$(this).parent().parent().next().css('display','table-row');
 			$(this).parent().parent().next().next().css('display','table-row');
 			$(this).parent().parent().next().next().next().css('display','table-row');
 			$(this).parent().parent().next().next().next().next().css('display','table-row');
 			$(this).parent().parent().next().next().next().next().next().css('display','table-row');
 			$(this).addClass("displayed");
 		}else if($(this).hasClass("displayed") && $(this).hasClass("RT")){
 			$(this).parent().parent().next().css('display','none');
 			$(this).parent().parent().next().next().css('display','none');
 			$(this).parent().parent().next().next().next().css('display','none');
 			$(this).parent().parent().next().next().next().next().css('display','none');
 			$(this).parent().parent().next().next().next().next().next().css('display','none');
 			$(this).removeClass("displayed");
 		}
 		previous = $(this); cntDiv++;
		console.log("pre:"+previous.prop("tagName"));
	});
	
	$('tr.data_Tr>td').hover(
		function(){
			$(this).css('cursor','pointer');
		}, function(){
			$(this).css('cursor','none');
		}
	);
	var previous; var cnt=0; var previous_RT; var cnt_RT=0;
	$('tr.data_Tr>td').on('click', function(){	
		var t3=$(this).parent().prop('id');
		var lastNum = t3.slice(-1);
		console.log("lastNum::"+lastNum);
		if(!$(this).hasClass("clicked")){
			if(cnt!=0 && $(this)!=previous && !$(this).parent().hasClass('RT')){
				console.log('일반1');
				previous.css('background-color','#ffffff');
				previous.removeClass("clicked");
			}else if(cnt_RT!=0 && $(this)!=previous_RT && $(this).parent().hasClass('RT')){
				console.log('RT1');
				previous_RT.css('background-color','#ffffff');
				previous_RT.removeClass("clicked");
			}
			$(this).addClass("clicked");
			$(this).css('background-color','#f2f2f2');
			if(!$(this).parent().hasClass("RT")){
				$('#hidden_table_form>input[name="airplane_code"]').val($('#testul_'+lastNum).find('#testil_airplane_code').text());
				$('#hidden_table_form>input[name="depart_city"]').val($('#testul_'+lastNum).find('#testil_depart_city').text());
				$('#hidden_table_form>input[name="depart_date"]').val($('#testul_'+lastNum).find('#testil_depart_date').text());
				$('#hidden_table_form>input[name="depart_time"]').val($('#testul_'+lastNum).find('#testil_depart_time').text());
				$('#hidden_table_form>input[name="arrive_city"]').val($('#testul_'+lastNum).find('#testil_arrive_city').text());
				console.log('일반2');
			}
			
			if($(this).parent().hasClass("RT")){
				console.log('RT2');
				$('#hidden_table_form>input[name="airplane_code1"]').val($('#testul_'+lastNum).find('#RTtestil_airplane_code').text());
				$('#hidden_table_form>input[name="depart_city1"]').val($('#testul_'+lastNum).find('#RTtestil_depart_city').text());
				$('#hidden_table_form>input[name="depart_date1"]').val($('#testul_'+lastNum).find('#RTtestil_depart_date').text());
				$('#hidden_table_form>input[name="depart_time1"]').val($('#testul_'+lastNum).find('#RTtestil_depart_time').text());
				$('#hidden_table_form>input[name="arrive_city1"]').val($('#testul_'+lastNum).find('#RTtestil_arrive_city').text());
			}
		}else if($(this).hasClass("clicked")){
			$(this).removeClass("clicked");
			$(this).css('background-color','#ffffff');
			if(!$(this).parent().hasClass("RT")){
				console.log('일반3');
				$('#hidden_table_form>input[name="airplane_code"]').val('');
				$('#hidden_table_form>input[name="depart_city"]').val('');
				$('#hidden_table_form>input[name="depart_date"]').val('');
				$('#hidden_table_form>input[name="depart_time"]').val('');
				$('#hidden_table_form>input[name="arrive_city"]').val('');
			}
			
			if($(this).parent().hasClass("RT")){
				console.log('RT3');
				$('#hidden_table_form>input[name="airplane_code1"]').val('');
				$('#hidden_table_form>input[name="depart_city1"]').val('');
				$('#hidden_table_form>input[name="depart_date1"]').val('');
				$('#hidden_table_form>input[name="depart_time1"]').val('');
				$('#hidden_table_form>input[name="arrive_city1"]').val('');
			}
		}
		if(!$(this).parent().hasClass("RT")){
			previous = $(this); cnt++;
			console.log('일반4');
		}else if($(this).parent().hasClass("RT")){
			console.log('RT4');
			previous_RT = $(this); cnt_RT++;
		}
		
	});
	
	/*$('#airplane_scheduleT').on('click', 'tr.data_Tr>td', function(){
		console.log($(this).text());
	});*/

	
	
	
	
	/*$('div.jspContainer li a').hover(
			function(){
				$(this).attr('style','font-weight:bold; background-color: #ffffff;');
				//css('font-weight','bold').css('background-color','#ffffff');
			}
			,function(){
				$(this).removeAttr('style');
			}
	);
	$('div.jspContainer li a').on('click', function(){
		var element = $(this).children();
		var test = element.get(0).innerHTML;
		console.log("list에서 얻어온 값: "+test);
		var slicedNum = test.charAt(3);
		console.log("sliced숫자!!: "+slicedNum);
		//console.log(element.get(0).html()); -안되는 이유 모르겟음.
		//$('#depCity').find('span').find('span').text(test);
		//$('#arrCity').find('span').find('span').text(test);
		var testP = $(this).parents('.m_t20').get(0);
		console.log($(this).parents('.maskDiv_wddo').parents('.pb_select st_01').get(0));
		console.log($(this).parents('.m_t20').find('.tit').find('span').find('span'));
		$(this).parents('.pb_select st_01').find('span').find('span').text(test);
		$(this).parents('.m_t20').find('.tit').find('span').find('span').text(test);
		$(this).parents('.m_t20').find('.tit').find('span').find('input').val(test);
		
		$(this).parents('.user_info1').find('.tit').find('span').find('span').text(test);
		
		//console.log("제발좀 되라!!! "+$('#adtCntRT').val(test).get(0));
		$('#adtCntRT option:eq('+(slicedNum-1)+')').attr('selected','selected');
		
		$(this).parents('.user_info2').find('.tit').find('span').find('span').text(test);
		$('#chdCntRT option:eq('+(slicedNum-1)+')').attr('selected','selected');
		
		$(this).parents('.user_info3').find('.tit').find('span').find('span').text(test);
		$('#infCntRT option:eq('+(slicedNum-1)+')').attr('selected','selected');
		
		
	});*/
	
	/*$('#arr0CityRTLi').on('click', function(){
		console.log("???");
		$(this).attr('style','z-index: 100; display: block;')
	});*/
	
	
	
	
	
	$('.day_unsettled button').on('click', function(){//그냥 해놓은 것
		$('#freeResult_return_date').attr('style','display: none;');
		$('#retDateValSel').attr('style','display: block;');
	});
	
	
	/*$('#seatClass li a').on('click', function(){
		var element = $(this).children();
		var test = element.get(0).innerHTML;
		console.log(test);
		$(this).parents('.user_seatClass').find('.tit').find('span').find('span').text(test);
	});*/
	
	$('#freeResult_searchBt').on('click', function(){
		console.log("검색하기 눌렀을떄!: "+$('select[name=adCntRT]').get(0));
		console.log("검색하기 눌렀을떄: "+$('#adtCntRT option').index($('#adtCntRT option:selected')));
		//$("#test option").index($("#test option:selected"));
		//$("#selectBox option:selected").val();
		console.log("button눌럿을떄: "+$('#adtCntRT option:selected').val());
		
		//$('.start').find('strong').text('RkRNd');
		//$('#adtCntRT option:select').val();
		/*$.ajax({
			type: "POST"
			, url: "/TwoTour/productFree/getFreeResultTop.do"
			, data: {}
			, dataType: "json"
			, 
		});*/
	});
	
	
	//-------------------------------------------------------//	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//--------------		
	//왕복 라디오버튼 클릭시
	$('#i11').click(function(){
		$(this).addClass("on");
		$('#i22').removeClass("on");
		$('.search_box').css('display', 'block');
		$('.unilateral').css('display', 'none');
	});
	//편도 라디오버튼 클릭시
	$('#i22').click(function(){
		$(this).addClass("on");
		$('#i11').removeClass("on");
		$('.search_box').css('display', 'none');
		$('.unilateral').css('display', 'block');
	});
	
	//출국 select 클릭시
	$('#depCity .tit').click(function(){
		//출국 리스트가 숨겨져 있을시..
		if(depart == false){
			//출국 리스트 보이기 & 스타일 변화
			$('#depCity').css('z-index', '84212');
			$(this).addClass("on");
			$('#depCity .maskDiv_wddo').css('display', 'block');
			$('#depCity .tweenDiv_wddo').css('margin-top', '0px');
			$('#depCity .con > li').addClass("on");
			depart = true;
			
			//다른 항목 리스트들 감추기
			$('#arrCity').css('z-index', '59');
			$('#arrCity .maskDiv_wddo').css('display', 'none');
			$('#arrCity .tit').removeClass("on");
			arrive = false;
			$('#adultNum').css('z-index', '59');
			$('#adultNum .maskDiv_wddo').css('display', 'none');
			$('#adultNum .tit').removeClass("on");
			adult = false;
			$('#childNum').css('z-index', '59');
			$('#childNum .maskDiv_wddo').css('display', 'none');
			$('#childNum .tit').removeClass("on");
			child = false;
			$('#infantNum').css('z-index', '59');
			$('#infantNum .maskDiv_wddo').css('display', 'none');
			$('#infantNum .tit').removeClass("on");
			infant = false;
			$('#seatClass').css('z-index', '59');
			$('#seatClass .maskDiv_wddo').css('display', 'none');
			$('#seatClass .tit').removeClass("on");
			seat = false;
		//출국 리스트가 펼쳐져 있을 시..
		}else if(depart ==true){
			$('#depCity').css('z-index', '59');
			$(this).removeClass("on");
			$('#depCity .maskDiv_wddo').css('display', 'none');
			$('#depCity .tweenDiv_wddo').css('margin-top', '-201px');
			depart = false;
		}
	});
	
	
	$('#arrCity .tit').click(function(){
		if(arrive == false){
			$('#arrCity').css('z-index', '84212');
			$(this).addClass("on");
			$('#arrCity .maskDiv_wddo').css('display', 'block');
			$('#arrCity .tweenDiv_wddo').css('margin-top', '0px');
			arrive = true;
			
			$('#depCity').css('z-index', '59');
			$('#depCity .maskDiv_wddo').css('display', 'none');
			$('#depCity .tit').removeClass("on");
			depart = false;
			$('#adultNum').css('z-index', '59');
			$('#adultNum .maskDiv_wddo').css('display', 'none');
			$('#adultNum .tit').removeClass("on");
			adult = false;
			$('#childNum').css('z-index', '59');
			$('#childNum .maskDiv_wddo').css('display', 'none');
			$('#childNum .tit').removeClass("on");
			child = false;
			$('#infantNum').css('z-index', '59');
			$('#infantNum .maskDiv_wddo').css('display', 'none');
			$('#infantNum .tit').removeClass("on");
			infant = false;
			$('#seatClass').css('z-index', '59');
			$('#seatClass .maskDiv_wddo').css('display', 'none');
			$('#seatClass .tit').removeClass("on");
			seat = false;
			
		}else if(arrive ==true){
			$('#arrCity').css('z-index', '59');
			$(this).removeClass("on");
			$('#arrCity .maskDiv_wddo').css('display', 'none');
			$('#arrCity .tweenDiv_wddo').css('margin-top', '-201px');
			arrive = false;
		}
	});
	$('#adultNum .tit').click(function(){
		if(adult == false){
			$('#adultNum').css('z-index', '84212');
			$(this).addClass("on");
			$('#adultNum .maskDiv_wddo').css('display', 'block');
			$('#adultNum .tweenDiv_wddo').css('margin-top', '0px');
			adult = true;
			
			$('#arrCity').css('z-index', '59');
			$('#arrCity .maskDiv_wddo').css('display', 'none');
			$('#arrCity .tit').removeClass("on");
			arrive = false;
			$('#depCity').css('z-index', '59');
			$('#depCity .maskDiv_wddo').css('display', 'none');
			$('#depCity .tit').removeClass("on");
			depart = false;
			$('#childNum').css('z-index', '59');
			$('#childNum .maskDiv_wddo').css('display', 'none');
			$('#childNum .tit').removeClass("on");
			child = false;
			$('#infantNum').css('z-index', '59');
			$('#infantNum .maskDiv_wddo').css('display', 'none');
			$('#infantNum .tit').removeClass("on");
			infant = false;
			$('#seatClass').css('z-index', '59');
			$('#seatClass .maskDiv_wddo').css('display', 'none');
			$('#seatClass .tit').removeClass("on");
			seat = false;
		}else if(adult ==true){
			$('#adultNum').css('z-index', '59');
			$(this).removeClass("on");
			$('#adultNum .maskDiv_wddo').css('display', 'none');
			$('#adultNum .tweenDiv_wddo').css('margin-top', '-201px');
			adult = false;
		}
	});
	$('#childNum .tit').click(function(){
		if(child == false){
			$('#childNum').css('z-index', '84212');
			$(this).addClass("on");
			$('#childNum .maskDiv_wddo').css('display', 'block');
			$('#childNum .tweenDiv_wddo').css('margin-top', '0px');
			child = true;
			
			$('#arrCity').css('z-index', '59');
			$('#arrCity .maskDiv_wddo').css('display', 'none');
			$('#arrCity .tit').removeClass("on");
			arrive = false;
			$('#adultNum').css('z-index', '59');
			$('#adultNum .maskDiv_wddo').css('display', 'none');
			$('#adultNum .tit').removeClass("on");
			adult = false;
			$('#depCity').css('z-index', '59');
			$('#depCity .maskDiv_wddo').css('display', 'none');
			$('#depCity .tit').removeClass("on");
			depart = false;
			$('#infantNum').css('z-index', '59');
			$('#infantNum .maskDiv_wddo').css('display', 'none');
			$('#infantNum .tit').removeClass("on");
			infant = false;
			$('#seatClass').css('z-index', '59');
			$('#seatClass .maskDiv_wddo').css('display', 'none');
			$('#seatClass .tit').removeClass("on");
			seat = false;
		}else if(child ==true){
			$('#childNum').css('z-index', '59');
			$(this).removeClass("on");
			$('#childNum .maskDiv_wddo').css('display', 'none');
			$('#childNum .tweenDiv_wddo').css('margin-top', '-201px');
			child = false;
		}
	});
	$('#infantNum .tit').click(function(){
		if(infant == false){
			$('#infantNum').css('z-index', '84212');
			$(this).addClass("on");
			$('#infantNum .maskDiv_wddo').css('display', 'block');
			$('#infantNum .tweenDiv_wddo').css('margin-top', '0px');
			infant = true;
			
			$('#arrCity').css('z-index', '59');
			$('#arrCity .maskDiv_wddo').css('display', 'none');
			$('#arrCity .tit').removeClass("on");
			arrive = false;
			$('#adultNum').css('z-index', '59');
			$('#adultNum .maskDiv_wddo').css('display', 'none');
			$('#adultNum .tit').removeClass("on");
			adult = false;
			$('#childNum').css('z-index', '59');
			$('#childNum .maskDiv_wddo').css('display', 'none');
			$('#childNum .tit').removeClass("on");
			child = false;
			$('#depCity').css('z-index', '59');
			$('#depCity .maskDiv_wddo').css('display', 'none');
			$('#depCity .tit').removeClass("on");
			depart = false;
			$('#seatClass').css('z-index', '59');
			$('#seatClass .maskDiv_wddo').css('display', 'none');
			$('#seatClass .tit').removeClass("on");
			seat = false;
		}else if(infant ==true){
			$('#infantNum').css('z-index', '59');
			$(this).removeClass("on");
			$('#infantNum .maskDiv_wddo').css('display', 'none');
			$('#infantNum .tweenDiv_wddo').css('margin-top', '-201px');
			infant = false;
		}
	});
	$('#seatClass .tit').click(function(){
		if(seat == false){
			$('#seatClass').css('z-index', '84212');
			$(this).addClass("on");
			$('#seatClass .maskDiv_wddo').css('display', 'block');
			$('#seatClass .tweenDiv_wddo').css('margin-top', '0px');
			seat = true;
			
			$('#arrCity').css('z-index', '59');
			$('#arrCity .maskDiv_wddo').css('display', 'none');
			$('#arrCity .tit').removeClass("on");
			arrive = false;
			$('#adultNum').css('z-index', '59');
			$('#adultNum .maskDiv_wddo').css('display', 'none');
			$('#adultNum .tit').removeClass("on");
			adult = false;
			$('#childNum').css('z-index', '59');
			$('#childNum .maskDiv_wddo').css('display', 'none');
			$('#childNum .tit').removeClass("on");
			child = false;
			$('#infantNum').css('z-index', '59');
			$('#infantNum .maskDiv_wddo').css('display', 'none');
			$('#infantNum .tit').removeClass("on");
			infant = false;
			$('#depCity').css('z-index', '59');
			$('#depCity .maskDiv_wddo').css('display', 'none');
			$('#depCity .tit').removeClass("on");
			depart = false;
		}else if(seat ==true){
			$('#seatClass').css('z-index', '59');
			$(this).removeClass("on");
			$('#seatClass .maskDiv_wddo').css('display', 'none');
			$('#seatClass .tweenDiv_wddo').css('margin-top', '-201px');
			seat = false;
		}
	});
	$('#depCityUni .tit').click(function(){
		if(uniDepart == false){
			$('#depCityUni').css('z-index', '84212');
			$(this).addClass("on");
			$('#depCityUni .maskDiv_wddo').css('display', 'block');
			$('#depCityUni .tweenDiv_wddo').css('margin-top', '0px');
			uniDepart = true;
			
			$('#adultNumUni').css('z-index', '59');
			$('#adultNumUni .maskDiv_wddo').css('display', 'none');
			$('#adultNumUni .tit').removeClass("on");
			uniAdult = false;
			$('#childNumUni').css('z-index', '59');
			$('#childNumUni .maskDiv_wddo').css('display', 'none');
			$('#childNumUni .tit').removeClass("on");
			uniChild = false;
			$('#infantNumUni').css('z-index', '59');
			$('#infantNumUni .maskDiv_wddo').css('display', 'none');
			$('#infantNumUni .tit').removeClass("on");
			uniInfant = false;
			$('#seatClassUni').css('z-index', '59');
			$('#seatClassUni .maskDiv_wddo').css('display', 'none');
			$('#seatClassUni .tit').removeClass("on");
			uniSeat = false;
		}else if(uniDepart ==true){
			$('#depCityUni').css('z-index', '59');
			$(this).removeClass("on");
			$('#depCityUni .maskDiv_wddo').css('display', 'none');
			$('#depCityUni .tweenDiv_wddo').css('margin-top', '-201px');
			uniDepart = false;
		}
	});
	$('#adultNumUni .tit').click(function(){
		if(uniAdult == false){
			$('#adultNumUni').css('z-index', '84212');
			$(this).addClass("on");
			$('#adultNumUni .maskDiv_wddo').css('display', 'block');
			$('#adultNumUni .tweenDiv_wddo').css('margin-top', '0px');
			uniAdult = true;
			
			$('#depCityUni').css('z-index', '59');
			$('#depCityUni .maskDiv_wddo').css('display', 'none');
			$('#depCityUni .tit').removeClass("on");
			uniDepart = false;
			$('#childNumUni').css('z-index', '59');
			$('#childNumUni .maskDiv_wddo').css('display', 'none');
			$('#childNumUni .tit').removeClass("on");
			uniChild = false;
			$('#infantNumUni').css('z-index', '59');
			$('#infantNumUni .maskDiv_wddo').css('display', 'none');
			$('#infantNumUni .tit').removeClass("on");
			uniInfant = false;
			$('#seatClassUni').css('z-index', '59');
			$('#seatClassUni .maskDiv_wddo').css('display', 'none');
			$('#seatClassUni .tit').removeClass("on");
			uniSeat = false;
		}else if(uniAdult ==true){
			$('#adultNumUni').css('z-index', '59');
			$(this).removeClass("on");
			$('#adultNumUni .maskDiv_wddo').css('display', 'none');
			$('#adultNumUni .tweenDiv_wddo').css('margin-top', '-201px');
			uniAdult = false;
		}
	});
	$('#childNumUni .tit').click(function(){
		if(uniChild == false){
			$('#childNumUni').css('z-index', '84212');
			$(this).addClass("on");
			$('#childNumUni .maskDiv_wddo').css('display', 'block');
			$('#childNumUni .tweenDiv_wddo').css('margin-top', '0px');
			uniChild = true;
			
			$('#depCityUni').css('z-index', '59');
			$('#depCityUni .maskDiv_wddo').css('display', 'none');
			$('#depCityUni .tit').removeClass("on");
			uniDepart = false;
			$('#adultNumUni').css('z-index', '59');
			$('#adultNumUni .maskDiv_wddo').css('display', 'none');
			$('#adultNumUni .tit').removeClass("on");
			uniAdult = false;
			$('#infantNumUni').css('z-index', '59');
			$('#infantNumUni .maskDiv_wddo').css('display', 'none');
			$('#infantNumUni .tit').removeClass("on");
			uniInfant = false;
			$('#seatClassUni').css('z-index', '59');
			$('#seatClassUni .maskDiv_wddo').css('display', 'none');
			$('#seatClassUni .tit').removeClass("on");
			uniSeat = false;
		}else if(uniChild ==true){
			$('#childNumUni').css('z-index', '59');
			$(this).removeClass("on");
			$('#childNumUni .maskDiv_wddo').css('display', 'none');
			$('#childNumUni .tweenDiv_wddo').css('margin-top', '-201px');
			uniChild = false;
		}
	});
	$('#infantNumUni .tit').click(function(){
		if(uniInfant == false){
			$('#infantNumUni').css('z-index', '84212');
			$(this).addClass("on");
			$('#infantNumUni .maskDiv_wddo').css('display', 'block');
			$('#infantNumUni .tweenDiv_wddo').css('margin-top', '0px');
			uniInfant = true;
			
			$('#depCityUni').css('z-index', '59');
			$('#depCityUni .maskDiv_wddo').css('display', 'none');
			$('#depCityUni .tit').removeClass("on");
			uniDepart = false;
			$('#adultNumUni').css('z-index', '59');
			$('#adultNumUni .maskDiv_wddo').css('display', 'none');
			$('#adultNumUni .tit').removeClass("on");
			uniAdult = false;
			$('#childNumUni').css('z-index', '59');
			$('#childNumUni .maskDiv_wddo').css('display', 'none');
			$('#childNumUni .tit').removeClass("on");
			uniChild = false;
			$('#seatClassUni').css('z-index', '59');
			$('#seatClassUni .maskDiv_wddo').css('display', 'none');
			$('#seatClassUni .tit').removeClass("on");
			uniSeat = false;
		}else if(uniInfant ==true){
			$('#infantNumUni').css('z-index', '59');
			$(this).removeClass("on");
			$('#infantNumUni .maskDiv_wddo').css('display', 'none');
			$('#infantNumUni .tweenDiv_wddo').css('margin-top', '-201px');
			uniInfant = false;
		}
	});
	$('#seatClassUni .tit').click(function(){
		if(uniSeat == false){
			$('#seatClassUni').css('z-index', '84212');
			$(this).addClass("on");
			$('#seatClassUni .maskDiv_wddo').css('display', 'block');
			$('#seatClassUni .tweenDiv_wddo').css('margin-top', '0px');
			uniSeat = true;
			
			$('#depCityUni').css('z-index', '59');
			$('#depCityUni .maskDiv_wddo').css('display', 'none');
			$('#depCityUni .tit').removeClass("on");
			uniDepart = false;
			$('#adultNumUni').css('z-index', '59');
			$('#adultNumUni .maskDiv_wddo').css('display', 'none');
			$('#adultNumUni .tit').removeClass("on");
			uniAdult = false;
			$('#childNumUni').css('z-index', '59');
			$('#childNumUni .maskDiv_wddo').css('display', 'none');
			$('#childNumUni .tit').removeClass("on");
			uniChild = false;
			$('#infantNumUni').css('z-index', '59');
			$('#infantNumUni .maskDiv_wddo').css('display', 'none');
			$('#infantNumUni .tit').removeClass("on");
			uniInfant = false;
		}else if(uniSeat ==true){
			$('#seatClassUni').css('z-index', '59');
			$(this).removeClass("on");
			$('#seatClassUni .maskDiv_wddo').css('display', 'none');
			$('#seatClassUni .tweenDiv_wddo').css('margin-top', '-201px');
			uniSeat = false;
		}
	});
	
	$('.sel_option_list.first .btn_fold').click(function(){
		$(this).removeClass('btn_fold').addClass('btn_unfold');
		$('.sel_option_list.first').removeClass('on');
		$('.sel_option_list.first .list_box').css('display', 'none');
	});
	$('.sel_option_list.first .btn_unfold').click(function(){
		alert("hi");
		$(this).removeClass('btn_unfold').addClass('btn_fold');
		$('.sel_option_list.first').addClass('on');
		$('.sel_option_list.first .list_box').css('display', 'block');
	});
	
	/*$('.defult_product_list').click(function(){
		
	});*/
	
	$('.sel_input.sel_checkin.night_select').click(function(){
		if(checkinData==false){
			$('#ui-datepicker-div').css('display', 'block');
			checkinData=true;
		}else if(checkinData==true){
			$('#ui-datepicker-div').css('display', 'none');
			checkinData=false;
		}
	});
	
	$('.sel_input.sel_checkout.type02.night_select').click(function(){
		$('#ui-datepicker-div').removeClass('datepicker-check-in-active ui-datepicker-multi-3');
		$('#ui-datepicker-div').addClass('datepicker-check-out-active ui-datepicker-multi-3');
	});
});

//운임클릭 시 스케줄 리스트
function fnSchdMake(s){
	if($('#schdDiv_'+s).css('display')=='none'){
		$('#schdDiv_'+s).show();
		$("#schdDetailDiv_"+s).show();
		$('.product_list .best.icon').addClass('product_open');
		/*$('.airport_info').css('display', 'block');
		$('.airport_info_choice').css('display', 'block');*/
	}else{
		//$(".airport_info").empty();
		$(".airport_info").hide();
		//$(".airport_info_choice").empty();
		$(".airport_info_choice").hide();
	}		
}


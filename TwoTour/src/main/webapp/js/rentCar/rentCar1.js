$(document).ready(function(){
	
	$('.question').hover(ifage_questionDiv_open, ifage_questionDiv_close);
	$('.question2').hover(ifcountry_questionDiv_open, ifcountry_questionDiv_close);
	$('#chkage').change(function(){
		if($(this).is(":checked")){
			$('.ageHidden').addClass('hidden');
		}else{
			$('.ageHidden').removeClass('hidden');
		}
		
	});
	$('#chkage2').change(function(){
		if($(this).is(":checked")){
			$('.countryHidden').addClass('hidden');
		}else{
			$('.countryHidden').removeClass('hidden');
		}
		
	});
	$('#btnSearch').click(function(){
		$("#checkSearch").submit();
	});
	$('#ui-datepicker-div').hide();
	$('#ui-datepicker-div2').hide();
	
	$('#sel_calendar').click(function(){
		$('#ui-datepicker-div').show();
		$('.ui-datepicker-group-middle .ui-state-default').click(function(){
			var date = $(this).text();
			$('#rentDate').val('2017-12-'+date);
			$('#ui-datepicker-div').hide();
			
		});
		$('.ui-datepicker-group-last .ui-state-default').click(function(){
			var date = $(this).text();
			$('#rentDate').val('2018-01-'+date);
			$('#ui-datepicker-div').hide();
		});
		
	});
	$('#sel_calendar2').click(function(){
		$('#ui-datepicker-div2').show();
		$('.ui-datepicker-group-middle .ui-state-default2').click(function(){
			var date = $(this).text();
			$('#returnDate').val('2017-12-'+date);
			$('#ui-datepicker-div2').hide();
			
		});
		$('.ui-datepicker-group-last .ui-state-default2').click(function(){
			var date = $(this).text();
			$('#returnDate').val('2018-01-'+date);
			$('#ui-datepicker-div2').hide();
		});
	});
});
 
function ifage_questionDiv_open() {
	$('.ifage_questionDiv').css('visibility', 'visible');
	$('.ifage_questionDiv').css('z-index', '1');
}
function ifage_questionDiv_close() {
	$('.ifage_questionDiv').css('visibility', 'hidden');
	$('.ifage_questionDiv').css('z-index', '0');
}
function ifcountry_questionDiv_open() {
	$('.ifcountry_questionDiv').css('visibility', 'visible');
	$('.ifcountry_questionDiv').css('z-index', '1');
}
function ifcountry_questionDiv_close() {
	$('.ifcountry_questionDiv').css('visibility', 'hidden');
	$('.ifcountry_questionDiv').css('z-index', '0');
}
function show_majorNewCity(){
	var div = document.getElementById("divMajorNewCity"); 
	div.style.visibility="visible";
}
function hidden_majorNewCity(){
	var div = document.getElementById("divMajorNewCity"); 
	div.style.visibility="hidden";
	
}
function setCitySearchBoxLayer(x,y){
	document.getElementById("rentCar1_search2-1_location_rentSearch_content").value = y;
	document.getElementById("rentCar1_search2-1_location_returnSearch_content").value = y;
	var div = document.getElementById("divMajorNewCity"); 
	div.style.visibility="hidden";
	
}

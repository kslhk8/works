$(document).ready(function(){
	$('#btnSummarylocationtype').click(function(){
		$('#ulSummarylocationtype').slideUp("fast"); 
		if($('#ulSummarylocationtype').css("display")=="none"){
			$('#ulSummarylocationtype').slideDown("fast"); 
		}
	});
	$('#btnSummarylocationtype2').click(function(){
		$('#ulSummarylocationtype2').slideUp("fast"); 
		if($('#ulSummarylocationtype2').css("display")=="none"){
			$('#ulSummarylocationtype2').slideDown("fast"); 
		}
	});
	$('#btnSummarylocationtype3').click(function(){
		$('#ulSummarylocationtype3').slideUp("fast"); 
		if($('#ulSummarylocationtype3').css("display")=="none"){
			$('#ulSummarylocationtype3').slideDown("fast"); 
		}
	});
	$('#btnSummarylocationtype4').click(function(){
		$('#ulSummarylocationtype4').slideUp("fast"); 
		if($('#ulSummarylocationtype4').css("display")=="none"){
			$('#ulSummarylocationtype4').slideDown("fast"); 
		}
	});
	$('#btnSummarylocationtype5').click(function(){
		$('#ulSummarylocationtype5').slideUp("fast"); 
		if($('#ulSummarylocationtype5').css("display")=="none"){
			$('#ulSummarylocationtype5').slideDown("fast"); 
		}
	});
	$('#btnSummarylocationtype6').click(function(){
		$('#ulSummarylocationtype6').slideUp("fast"); 
		if($('#ulSummarylocationtype6').css("display")=="none"){
			$('#ulSummarylocationtype6').slideDown("fast"); 
		}
	});
	
	$('#popVehicleType').hide();
	
	$('#btnVehicleType').click(function(){
		$('#popVehicleType').show();
		
	});
	$('#btnVehicleTypeClose').click(function(){
		$('#popVehicleType').hide();
		
	});
	
	$('#popVehicle').hide();
	
	$('#btnVehcleCompare').click(function(){
		$('#popVehicle').show();
	});
	$('#btnPopupVehicleClose').click(function(){
		$('#popVehicle').hide();
		
	});
	
	
});



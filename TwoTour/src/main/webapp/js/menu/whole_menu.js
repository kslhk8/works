$(document).ready(function(){
		$('#whole_menu_div').hide();
		
		 $('#whole_menu').click(function(){
			  if($('#whole_menu_div').css('visibility')=='visible'){
				  $('#whole_menu_div').css('visibility','hidden');
				  $('#whole_menu_div').hide();
				  $('#body_background_div').css('z-index','0');
				  $('#body_background_div').css('opacity','1');
				  $('#writeForm_background_div').css('z-index','0');
				  $('#writeForm_background_div').css('opacity','1');
				  $('#loginForm_background_div').css('z-index','0');
				  $('#loginForm_background_div').css('opacity','1');
				  $('#pk_contents').css('z-index','0');
				  $('#pk_contents').css('opacity','1');
				  //$('#body_background_div').show();
				  
			  }
			  else if($('#whole_menu_div').css('visibility')=='hidden'){
				  $('#whole_menu_div').css('visibility','visible');
				  $('#whole_menu_div').show();
				  $('#body_background_div').css('z-index','-1');
				  $('#body_background_div').css('opacity','0.2');
				  $('#writeForm_background_div').css('z-index','-1');
				  $('#writeForm_background_div').css('opacity','0.2');
				  $('#loginForm_background_div').css('z-index','-1');
				  $('#loginForm_background_div').css('opacity','0.2');
				  $('#pk_contents').css('z-index','-1');
				  $('#pk_contents').css('opacity','0.2');
				  //$('#body_background_div').hide();
			  }
		  }); 
	});
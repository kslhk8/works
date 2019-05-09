$(document).ready(function(){

	$('.tte_box').hide();

	$('.on .tte_box').show();

	

	$('#agree01').click(function(){

		$('#liAgree1').removeClass('on');

		$('#liAgree3').removeClass('on');

		$('#liAgree4').removeClass('on');

		$('#liAgree2').addClass('on');

		$('#liAgree1 .tte_box').hide();

		$('#liAgree3 .tte_box').hide();

		$('#liAgree4 .tte_box').hide();

		$('#liAgree2 .tte_box').show();		

	});

	$('#agree02').click(function(){

		$('#liAgree1').removeClass('on');

		$('#liAgree2').removeClass('on');

		$('#liAgree4').removeClass('on');

		$('#liAgree3').addClass('on');

		

		$('#liAgree2 .tte_box').hide();

		$('#liAgree1 .tte_box').hide();

		$('#liAgree4 .tte_box').hide();

		$('#liAgree3 .tte_box').show();		

	});

	$('#agree03').click(function(){

		$('#liAgree1').removeClass('on');

		$('#liAgree3').removeClass('on');

		$('#liAgree2').removeClass('on');

		$('#liAgree4').addClass('on');

		$('#liAgree2 .tte_box').hide();

		$('#liAgree3 .tte_box').hide();

		$('#liAgree1 .tte_box').hide();

		$('#liAgree4 .tte_box').show();

	});

	

	

	$('.tt_01').click(function(){

		$('#liAgree2').removeClass('on');

		$('#liAgree3').removeClass('on');

		$('#liAgree4').removeClass('on');

		$('#liAgree1').addClass('on');

		

		$('#liAgree2 .tte_box').hide();

		$('#liAgree3 .tte_box').hide();

		$('#liAgree4 .tte_box').hide();		

		$('#liAgree1 .tte_box').show();

		

	});

	$('.tt_02').click(function(){

		$('#liAgree1').removeClass('on');

		$('#liAgree3').removeClass('on');

		$('#liAgree4').removeClass('on');

		$('#liAgree2').addClass('on');

		$('#liAgree1 .tte_box').hide();

		$('#liAgree3 .tte_box').hide();

		$('#liAgree4 .tte_box').hide();

		$('#liAgree2 .tte_box').show();

			

	});

	$('.tt_03').click(function(){

		$('#liAgree1').removeClass('on');

		$('#liAgree2').removeClass('on');

		$('#liAgree4').removeClass('on');

		$('#liAgree3').addClass('on');

		

		$('#liAgree2 .tte_box').hide();

		$('#liAgree1 .tte_box').hide();

		$('#liAgree4 .tte_box').hide();

		$('#liAgree3 .tte_box').show();

		

	});

	$('.tt_04').click(function(){

		$('#liAgree1').removeClass('on');

		$('#liAgree3').removeClass('on');

		$('#liAgree2').removeClass('on');

		$('#liAgree4').addClass('on');

		$('#liAgree2 .tte_box').hide();

		$('#liAgree3 .tte_box').hide();

		$('#liAgree1 .tte_box').hide();

		$('#liAgree4 .tte_box').show();

		

	});

	

	$('#chkAllAgree').change(function(){

		if($(this).is(":checked")){

			$('#chkNoticeAgree02').prop('checked',true);

			$('#chkNoticeAgree03').prop('checked',true);

			$('#chkNoticeAgree04').prop('checked',true);

		}else{

			$('#chkNoticeAgree02').prop('checked',false);

			$('#chkNoticeAgree03').prop('checked',false);

			$('#chkNoticeAgree04').prop('checked',false);

		}

		

	});

	

	var jbOffset=$('#reservation_desc').offset();

	$(window).scroll(function(){

		if($(document).scrollTop()>jbOffset.top){

			$('#reservation_desc').attr('style',"position: fixed;");

			$('#reservation_desc').css({right:250});

			$('#reservation_desc').css({top:0});

		}else{

			$('#reservation_desc').attr('style',"position: relative;");

		}	

	});

	

	$('#warn_chkNoticeAgree02').hide();

	$('#warn_chkNoticeAgree03').hide();

	$('#warn_chkNoticeAgree04').hide();

	

	$('#btnReservation').click(function(){

		if($('#agree01').is(":checked")==false){

			alert("여행상품 관련 약관에 동의해 주세요");
			$('#agree01').focus();
		}

		else if($('#agree02').is(":checked")==false){

			alert("여행상품 관련 약관에 동의해 주세요");
			$('#agree02').focus();

		}

		else if($('#agree03').is(":checked")==false){

			alert("여행상품 관련 약관에 동의해 주세요");
			$('#agree03').focus();
		}

		else if($('#agree04').is(":checked")==false){

			alert("여행상품 관련 약관에 동의해 주세요");
			$('#agree04').focus();
		}

		

		else if($('#chkNoticeAgree02').is(":checked")==false){

			$('#warn_chkNoticeAgree02').show();
			$('#lblchkNoticeAgree02').focus();
		}

		else if($('#chkNoticeAgree03').is(":checked")==false){

			$('#warn_chkNoticeAgree03').show();
			$('#lblchkNoticeAgree03').focus();
		}

		else if($('#chkNoticeAgree04').is(":checked")==false){

			$('#warn_chkNoticeAgree04').show();
			$('#lblchkNoticeAgree04').focus();
		}

		

		else if($('#bkr_name_S').val().length==0){	

			

			$('.warning_txt2').attr('style',"display: block;");

			$('.warning_txt2').text("한글 성을 입력해주세요");		
			$('#bkr_name_S').focus();

		}

		else if($('#bkr_name_G').val().length==0){	

			

			$('.warning_txt2').attr('style',"display: block;");

			$('.warning_txt2').text("한글 이름을 입력해주세요");			
			$('#bkr_name_G').focus();
		}

		else if($('#SurName').val().length==0){	

			

			$('.warning_txt2').attr('style',"display: block;");

			$('.warning_txt2').text("영문 성을 입력해주세요");
			$('#SurName').focus();

		}

		else if($('#GivenName').val().length==0){	

			

			$('.warning_txt2').attr('style',"display: block;");

			$('.warning_txt2').text("영문 이름을 입력해주세요");	
			$('#GivenName').focus();

		}

		else if($('#BirthDateYYYY').val().length==0||$('#BirthDateMM').val().length==0||$('#BirthDateDD').val().length==0){	

			$('.warning_txt2').remove();

			$('.warning_txt3').attr('style',"display: block;");

			$('.warning_txt3').text("생년월일을 입력해주세요");			
			$('#BirthDateYYYY').focus();

		}

		else if($('#phoneNum').val().length==0||$('#phoneNum1').val().length==0){	

			

			$('.warning_txt4').attr('style',"display: block;");

			$('.warning_txt4').text("휴대폰번호를 입력해주세요");			
			$('#phoneNum').focus();

		}

		else if($('#txtEmail1').val().length==0||$('#txtEmail2').val().length==0){	

			

			$('.warning_txt5').attr('style',"display: block;");

			$('.warning_txt5').text("이메일을 입력해주세요");			
			$('#txtEmail1').focus();

		}

		else{

			$('#rentLayer').css({

				"top":"150px",

				"left":"300px"

			}).show();

			$('#mask_loader').show();

		}

	});

	$('#bkr_name_S').keyup(function(){

		if($(this).val().length==0){

			$('.warning_txt2').attr('style',"display: block;");

			$('.warning_txt2').text("한글 성을 입력해주세요");

		}else

			$('.warning_txt2').text("");

	});

	$('#bkr_name_G').keyup(function(){

		if($(this).val().length==0){

			$('.warning_txt2').attr('style',"display: block;");

			$('.warning_txt2').text("한글 이름을 입력해주세요");

		}else

			$('.warning_txt2').text("");

	});

	$('#SurName').keyup(function(){

		if($(this).val().length==0){

			$('.warning_txt2').attr('style',"display: block;");

			$('.warning_txt2').text("영문 성을 입력해주세요");

		}else

			$('.warning_txt2').text("");

	});

	$('#GivenName').keyup(function(){

		if($(this).val().length==0){

			$('.warning_txt2').attr('style',"display: block;");

			$('.warning_txt2').text("영문 이름을 입력해주세요");

		}else

			$('.warning_txt2').text("");

	});

	$('#BirthDateDD').change(function(){

		if($(this).val().length==0){

			$('.warning_txt3').attr('style',"display: block;");

			$('.warning_txt3').text("생년월일을 입력해주세요");

		}else

			$('.warning_txt3').text("");

	});

	$('#PhoneNumber2').keyup(function(){

		if($(this).val().length==0){

			$('.warning_txt4').attr('style',"display: block;");

			$('.warning_txt4').text("휴대폰번호를 입력해주세요");

		}else

			$('.warning_txt4').text("");

	});

	$('#txtEmail1').keyup(function(){

		if($(this).val().length==0){

			$('.warning_txt5').attr('style',"display: block;");

			$('.warning_txt5').text("이메일을 입력해주세요");

		}else

			$('.warning_txt5').text("");

	});

	$('#selEmail2').change(function(){

		if($(this).val()==0){

			$('.warning_txt5').attr('style',"display: block;");

			$('.warning_txt5').text("이메일을 입력해주세요");

		}else

			$('.warning_txt5').text("");

	});	

	

	$('#rentLayer').hide();

	$('#mask_loader').hide();

	

	$('#btnClose').click(function(){

		$('#rentLayer').hide();

		$('#mask_loader').hide();

		

	});

	

	

	$('#chkAllAgree').change(function(){

		if($('#chkAllAgree').is(":checked")){

			if($('#chkNoticeAgree02').is(":checked")){

				$('#warn_chkNoticeAgree02').hide();

			}

			if($('#chkNoticeAgree03').is(":checked")){

				$('#warn_chkNoticeAgree03').hide();

			}

			if($('#chkNoticeAgree04').is(":checked")){

				$('#warn_chkNoticeAgree04').hide();

			}

		}

	});

	

	$('#chkNoticeAgree02').change(function(){

		if($('#chkNoticeAgree02').is(":checked")){

			$('#warn_chkNoticeAgree02').hide();

		}

		

	});

	$('#chkNoticeAgree03').change(function(){

		if($('#chkNoticeAgree03').is(":checked")){

			$('#warn_chkNoticeAgree03').hide();

		}

		

	});

	$('#chkNoticeAgree04').change(function(){

		if($('#chkNoticeAgree04').is(":checked")){

			$('#warn_chkNoticeAgree04').hide();

		}

		

	});

	

	$('#selEmail2').change(function(){

		var email=$(this).val();

		$('#txtEmail2').val(email);

		

	});

	

	

});

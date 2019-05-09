<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/member/findInform.css" />
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){//페이지 오픈
		   $('#body').css("height","490px");
	
	$('#top_id_wrap').click(function(){
		$('.content_body_id').css("visibility","visible");
		$('.content_body_pwd').css("visibility","hidden");
		$('.top_id_wrap').css("color","black");
		$('.top_id_wrap').css("background-color","white");
		$('.top_pwd_wrap').css("color","white");
		$('.top_pwd_wrap').css("background-color","#4a505d");
	});
	$('#top_pwd_wrap').click(function(){
		$('.content_body_pwd').css("visibility","visible");
		$('.content_body_id').css("visibility","hidden");
		$('.top_pwd_wrap').css("color","black");
		$('.top_pwd_wrap').css("background-color","white");
		$('.top_id_wrap').css("color","white");
		$('.top_id_wrap').css("background-color","#4a505d");
		
	});
	$('#content_id_accept').click(function(){
		if($('#name').val().length==0){
			$('#notice_div').text("아이디 입력");
		}
		else if($('#email').val().length==0){
			$('#notice_div').text("이메일 입력");
		}
		else{
			$.ajax({
				type:"POST",
				url:"/TwoTour/member/findId.do",
				data:"name="+$('#name').val()+"&emails="+$('#email').val()+"&year="+$('#year').val()+"&month="+$('#month').val()+"&day="+$('#day').val(),
				dataType:"text",
				success: function(data){
					if(data=="not_exist"){
						alert("아이디를 찾을 수 없습니다.");
					}
					else {
						alert("아이디는"+data+"입니다.");
					}
				}
			});	
		}
	});
	
	$('#content_pwd_accept').click(function(){
		$('#findForm').submit();
	});
});
	$(window).bind('beforeunload', function(){//페이지 클로즈 시
		   $('#body').css("height","1350px");
		});
</script>
</head>
<body>
	<div id="background_find_inform">
			<div id="findInform_text_wrap">
	   		<div id="inform_text1">아이디/비밀번호 찾기</div>
	   		<div id="inform_text2">Hanatour.com 회원인 경우 등록된 정보로 아이디/비밀번호 찾기가 가능합니다.<br></div>	
   		</div>
		<div id="findInform_content_wrap">
			<div id="content_top_wrap">
				<div class="top_id_wrap" id="top_id_wrap" style="border-left:none; border-top:none;">아이디 찾기</div>
				<div class="top_pwd_wrap" id="top_pwd_wrap">비밀번호 찾기</div>
			</div>
			<div class="content_body_id" id="content_body_id">
				<div id="id_img"><img src="../image/find_id.png"></div>
				<div id="body_id_name">이름&nbsp <input type="text" name="name" id="name"></div>
				<div id="body_id_email">이메일&nbsp <input type="text" name="emails" id="email">
				</div>
				<div id="body_id_birth">
					생년월일&nbsp
					<select id="year" name="year">
						<option value="1995">1995년</option>
						<option value="1994">1994년</option>
						<option value="1993">1993년</option>
						<option value="1992">1992년</option>
						<option value="1991">1991년</option>
						<option value="1990">1990년</option>
						<option value="1989">1989년</option>
						<option value="1988">1988년</option>
						
					</select>
					<select id="month" name="month">
						<option value="01">01월</option>
	   					<option value="02">02월</option>
	   					<option value="03">03월</option>
	   					<option value="04">04월</option>
	   					<option value="05">05월</option>
	   					<option value="06">06월</option>
	   					<option value="07">07월</option>
	   					<option value="08">08월</option>
	   					<option value="09">09월</option>
	   					<option value="10">10월</option>
	   					<option value="11">11월</option>
	   					<option value="12">12월</option>	
					</select>
					<select id="day" name="day">
						<option value="01">01일</option>
   						<option value="02">02일</option>
   						<option value="03">03일</option>
   						<option value="04">04일</option>
   						<option value="05">05일</option>
   						<option value="06">06일</option>
   						<option value="07">07일</option>
   						<option value="08">08일</option>
   						<option value="09">09일</option>
   						<option value="10">10일</option>
   						<option value="11">11일</option>
   						<option value="12">12일</option>	
   						<option value="13">13일</option>
   						<option value="14">14일</option>
   						<option value="15">15일</option>
   						<option value="16">16일</option>
   						<option value="17">17일</option>
   						<option value="18">18일</option>
   						<option value="19">19일</option>
   						<option value="20">20일</option>
   						<option value="21">21일</option>
   						<option value="22">22일</option>
   						<option value="23">23일</option>
   						<option value="24">24일</option>	
   						<option value="25">25일</option>
   						<option value="26">26일</option>
   						<option value="27">27일</option>
   						<option value="28">28일</option>
   						<option value="29">29일</option>
   						<option value="30">30일</option>
   						<option value="31">31일</option>
					</select>
			</div>
			<div id="notice_div"></div>
			<div id="content_id_accept">
			<label>확인</label>
		</div>
		</div>
		<form action="/TwoTour/member/findPw.do" id="findForm" method="post">
		<div class="content_body_pwd" id="content_body_pwd">
			<div id="pwd_img">
				<img src="../image/email_send.png">
			</div>
	
			<div id="body_pwd_id">아이디&nbsp <input type="text" name="id" id="id"></div>
				<div id="body_pwd_email">이메일&nbsp <input type="text" name="email" id="email"></div>
				<div id="body_pwd_notice">(최대 10분 소요. 중복 발송 시 마지막 수신된 임시번호로 로그인 가능)</div>
				<div id="content_pwd_accept">
				<label>확인</label></div>
		</div>
		</form>
		
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/member/loginForm.css" />
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){//페이지 오픈
		   $('#body').css("height","630px");
		

		$(window).bind('beforeunload', function(){//페이지 클로즈 시
		   $('#body').css("height","1350px");
		});
	
	//비회원
	$('#loginForm_inform_box2').click(function(){
		$('#loginForm_inform_noMember').css('visibility','visible');
		$('#loginForm_inform_member').css('visibility','hidden');
		$('#loginForm_inform_box2').css("color","white");
		$('#loginForm_inform_box2').css("background-color","#4a505d");
		$('#loginForm_inform_box1').css("color","black");
		$('#loginForm_inform_box1').css("background-color","rgb(235,235,235)");
	});
	
	//회원
	$('#loginForm_inform_box1').click(function(){
		$('#loginForm_inform_member').css('visibility','visible');
		$('#loginForm_inform_noMember').css('visibility','hidden');
		$('#loginForm_inform_box1').css("color","white");
		$('#loginForm_inform_box1').css("background-color","#4a505d");
		$('#loginForm_inform_box2').css("color","black");
		$('#loginForm_inform_box2').css("background-color","rgb(235,235,235)");
	});
	//key up
	$('#login_id').keyup(function(){
		if($(this).val().length==0){
			$('#login_idDiv').text("아이디 입력");
		}
		else
			$('#login_idDiv').text("");
		});
	
	
	$('#login_pwd').keyup(function(){
		if($(this).val().length==0){
			$('#login_pwdDiv').text("비밀번호 입력");
		}
		else
			$('#login_pwdDiv').text("");
		});
	
	$('#noLogin_name').keyup(function(){
		if($(this).val().length==0){
			$('#noLogin_nameDiv').text("이름 입력");
		}
		else
			$('#noLogin_nameDiv').text("");
		});
	
	$('#noLogin_reservation').keyup(function(){
		if($(this).val().length==0){
			$('#noLogin_reservationDiv').text("예약번호 입력");
		}
		else
			$('#noLogin_reservationDiv').text("");
		});
	//로그인 기능
	$('#accpet_login').click(function(){
		if($('#admin_check').is(":checked")){
			$.ajax({
				type:"POST",
				url:"/TwoTour/member/adminLogin.do",
				data: "id="+$('#login_id').val()+"&pwd="+$('#login_pwd').val(),
				dataType:"text",
				success: function(result){
					if(result=="exist"){
						//$('#loginForm').submit();
						location.href="/TwoTour/main/index.do";
					}
					else if(result=="not_exist"){
						alert("관리자 아이디가 아닙니다.");
						$('#login_id').focus();
					}
					else if(result=="empty"){
						if($('#login_id').val().length==0){
							$('#login_idDiv').text("아이디를 입력하세요.");
						}
						if($('#login_pwd').val().length==0){
							$('#login_pwdDiv').text("비밀번호를 입력하세요.");
						}
					
					
					}
				}
			});
		}
		else{
		$.ajax({
			type:"POST",
			url:"/TwoTour/member/login.do",
			data: "id="+$('#login_id').val()+"&pwd="+$('#login_pwd').val(),
			dataType:"text",
			success: function(result){
				if(result=="exist"){
					//$('#loginForm').submit();
					location.href="/TwoTour/main/index.do";
				}
				else if(result=="not_exist"){
					alert("아이디또는 비밀번호가 틀렸습니다.");
					$('#login_id').focus();
				}
				else if(result=="empty"){
					if($('#login_id').val().length==0){
						$('#login_idDiv').text("아이디를 입력하세요.");
					}
					if($('#login_pwd').val().length==0){
						$('#login_pwdDiv').text("비밀번호를 입력하세요.");
					}
				
				
				}
				else if(result=="no_accept"){
					alert("로그인이 불가능 합니다.")
				}
			}
		});
		}
	});
	$('#go_writeForm').click(function(){
		location.href="/TwoTour/member/writeForm.do";
	});
	$('#search_pwd').click(function(){
		$('.content_body_pwd').css("visibility","visible");
		$('.content_body_id').css("visibility","hidden");
		$('.top_pwd_wrap').css("color","black");
		$('.top_pwd_wrap').css("background-color","white");
		$('.top_id_wrap').css("color","white");
		$('.top_id_wrap').css("background-color","black");
		location.href="/TwoTour/member/findInform.do"

	
	});
	$('#search_id').click(function(){
		$('.content_body_id').css("visibility","visible");
		$('.content_body_pwd').css("visibility","hidden");
		$('.top_id_wrap').css("color","black");
		$('.top_id_wrap').css("background-color","white");
		$('.top_pwd_wrap').css("color","white");
		$('.top_pwd_wrap').css("background-color","black");
		location.href="/TwoTour/member/findInform.do"

	})
	
	
	$('#noLogin_accept_show').click(function(){
		$.ajax({
			type:"POST",
			url:"/TwoTour/member/noLogin.do",
			data: "name="+$('#noLogin_name').val()+"&reservation_number="+$('#noLogin_reservation_number').val()+"&email="+$('#email_content').val(),
			dataType:"text",
			success: function(result){
				alert("hi");
				if(result=="exist"){
					
					$('#no_login_show').submit();
				}
				else if(result=="not_exist"){
					alert("일치하는 정보가 없습니다.");
					$('#login_id').focus();
				}
				else if(result=="empty"){
					if($('#noLogin_name').val().length==0){
						$('#noLogin_nameDiv').text("이름을 입력하세요.");
					}
					if($('#noLogin_reservation_number').val().length==0){
						$('#noLogin_reservationDiv').text("예약번호를 입력하세요.");
					}
				
				
				}
			}
		});
	})
});
	
</script>


<div id="loginForm">
	
	<div id="loginForm_background_div">
 	  	<div id="loginForm_text_wrap">
	   		<div id="text_1">로그인<br></div>
	   		<div id="text_2">하나투어와 함께 즐겁고 행복한 여행 되세요.<br></div>	
	   		<div id="text_3">로그인을 하시면 더욱 다양한 하나투어 서비스를 이용하실 수 있습니다.</div>
   		</div>
   		
   		<div id="loginForm_inform_wrap">
   			<div id="loginForm_inform_box">
   				<div id="loginForm_inform_box1"><label id="member">회원</label></div>
   				<div id="loginForm_inform_box2"><label id="noMember">비회원 (예약조회)</label></div>
   			</div>
   			<div id="loginForm_inform_member">
   			<div id="border_line"></div>
   				<div id="login_text_wrap">
   					<div id="login_text">아이디로 로그인</div>
   				</div>
   				<div id="loginForm_id_content">
   						<input type="text" id="login_id" name="id" placeholder="하나투어 아이디">
   						<div id="login_idDiv"></div>
   				</div>
   				<div id="loginForm_pwd_content">
   						<input type="password" id="login_pwd" name="pwd" placeholder="비밀번호">
   						<div id="login_pwdDiv"></div>
   					</div>
   				<div id="loginForm_accept_login">
   					<div id="accpet_login">
   						<label id="login">로그인</label>
   					</div>
   					<div id="admin_login">
   				<input type="checkbox" id="admin_check" value=""><label> 관리자 모드</label>
   				</div>
   				</div>
   				<div id="loginForm_function_table">
   					<div id="function_table">
   						<ul>
							<li id="search_id"><h4>아이디 찾기</h4></li>
							<li id="search_pwd"><h4>비밀번호 찾기</h4></li>
							<li id="go_writeForm"><h4>회원가입</h4></li>
						</ul>
   					</div>
   				</div>
   			</div>
   			
   			<div id="loginForm_inform_noMember">
   				<div id="noLogin_text_wrap">
   					<div id="noLogin_text">비회원 예약조회</div>

   				</div>
   			<form id="no_login_show" method="POST" action="/TwoTour/mypage/no_memberInform.do">
   				<div id="noLogin_name_content">
   						<input type="text" id="noLogin_name" name="name" placeholder="이름">
   						<div id="noLogin_nameDiv"></div>
   				</div>
   				<div id="noLogin_reservation_content">
   						<input type="text" id="noLogin_reservation_number" name="reservation_number" placeholder="예약번호">
   						<div id="noLogin_reservationDiv"></div>
   				</div>
   				<div id="noLogin_contact_content">
   					<div id="contact_select">
   						<select id="contact" name="contact">
   							<option>이메일</option>
   						</select>	
   					</div>
   					<div id="contact_content">
   						<input type="text" id="email_content" name="email">
   					</div>
   				</div>
   				<div id="noLogin_accept_show">
   					<div id="accpet_show">
   						<label id="reservation_show">예약 조회</label>
   					</div>
   				</div>
   			</form>
   				<div id="noLogin_notice_table">
   					이름, 예약번호와 함께<br>
   					예약 시 제공한 본인의 연락처 또는 이메일 정보를 <br>
   					좌측에 입력해 주시기 바랍니다.
   				</div>
   				
   				<div id="noLogin_notice_box">
   					<div id="notice_box1">※ 비회원 예약 안내</div>
   					<div id="notice_box2">·입력하신 정보가 하나투어에 등록된 예약정보와 일치할 경우,
 					비회원 예약 조회가 가능합니다.
 					</div>
 					<div id=notice_box3">·예약 데이터에 해당 고객의 연락처 또는 이메일 정보가 없는 경우, 유선을 통한 예약확인만 가능합니다.<br>
 						 (예약관리 대리점으로 문의하여 주시기 바랍니다.)<br>
  						비회원 예약 조회가 가능합니다.
  					</div>
   				</div>
   			</div>
   		
   </div>
   </div>
   </div>


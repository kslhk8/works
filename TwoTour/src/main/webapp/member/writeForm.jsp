<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/member/writeForm.css" />
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	
	//중복체크
	$('#check_id').click(function(){
		if($('#id').val().length==0){
			$('#idDiv').text("아이디 입력");
		}
		else{
			$.ajax({
				type:"POST",
				url:"/TwoTour/member/checkId.do",
				data:"id="+$('#id').val(),
				dataType:"text",
				success: function(data){
					if(data=="not_exist"){
						$('#idDiv').text("아이디가 사용가능합니다.");
						$('#idDiv').css("color","cyan");
						$('#check').val($('#id').val());
					}
					else if(data=="exist"){
						$('#idDiv').text("이미 사용중인 아이디 입니다");
						$('#id').focus();
					}
				}
			});	
		}
	});
	
	//키업
	$('#name').keyup(function(){
		if($(this).val().length==0){
			$('#nameDiv').text("이름 입력");
		}
		else
			$('#nameDiv').text("");
		});
	
	
	$('#id').keyup(function(){
		if($(this).val().length==0){
			$('#idDiv').text("아이디 입력");
		}
		else
			$('#idDiv').text("");
		});
	
	$('#pwd').keyup(function(){
		if($(this).val().length!=0){
			if(!/^.*(?=^.{9,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test($('#pwd').val())){
				$('#pwdDiv').text("9~15자리 영문 대소문자, 숫자, 특수문자 중 2가지 이상 사용해주세요.");
			}
			else{
			$('#pwdDiv').text("");
			}
		}
		else
			$('#pwdDiv').text("비밀번호 입력");	
		});
	$('#repwd').keyup(function(){
		if($('#pwd').val()!=$('#repwd').val())
			$('#pwdDiv').text("비밀번호가 다릅니다.");
		else{
			$('#pwdDiv').text("");
		}
	});
	
	$('#email').keyup(function(){
		if($(this).val().length==0){
			$('#emailDiv').text("이메일 입력");
		}
		else
			$('#emailDiv').text("");
		});
	
	//성별
	$('#man').click(function(){
		$('#man').css("background-color","rgb(241,84,155)").css("color","white");
		$('#girl').css("background-color","rgb(235,235,235)").css("color","black");
		$('#gender').val("1");
		
	
	});
	//성별
	$('#girl').click(function(){
		$('#girl').css("background-color","rgb(241,84,155)").css("color","white");
		$('#man').css("background-color","rgb(235,235,235)").css("color","black");
		$('#gender').val("0");
		
	});
	
	//인증 이메일 보내기
	$('#send_email').click(function(){
		$.ajax({
			type:"POST",
			url:"/TwoTour/member/checkEmail.do",
			data:"email="+$('#email').val()+"&email1="+$('#email1').val(),
			dataType:"text",
			success: function(data){
				alert("인증번호를 보냈습니다.");
				$('#check_number').val(data);
			}
		});	
	});
	
	//체크이메일
	$('#email_check').click(function(){
		if($('#certification_number').val()!=$('#check_number').val())
			alert("인증번호가 다릅니다.");
		else{
			alert("인증 되었습니다.");
		}
				
	});
	
	//약관동의
	$('#total_accept').click(function(){
		
		if($('#total_accept').is(":checked")){
			
			$('#accept1').prop("checked",true);
			$('#accept2').prop("checked",true);
			
		}
		else{
		$('#accept1').prop("checked",false);
		$('#accept2').prop("checked",false);
		}
	});
	$('#write').click(function(){
		if($('#name').val().length==0){
			$('#nameDiv').text("이름 입력");
			$('#name').focus();
			
		}
		else if($('#id').val().length==0){
			$('#idDiv').text("아이디 입력");
			$('#id').focus();
			
		}
		else if($('#pwd').val().length==0){
			$('#pwdDiv').text("비밀번호 입력");
			$('#pwd').focus();
			
		}
		
		else if(!/^.*(?=^.{9,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test($('#pwd').val())){
			$('#pwdDiv').text(" 9~15자리 영문 대소문자, 숫자, 특수문자 중 2가지 이상 사용해주세요.");
			$('#pwd').focus();
		}
		else if($('#pwd').val()!=$('#repwd').val()){
			$('#pwdDiv').text("비밀 번호가 다릅니다.");
			$('#pwd').focus();
			
		}
		else if($('#email').val().length==0){
			$('#emailDiv').text("이메일 입력");
			$('#email').focus();
		}
		 else if($('#check').val()!=$('#id').val()){
			alert("중복체크 하세요");
			$('#id').focus();
		}
		
		else if($('#certification_number').val()!=$('#check_number').val()){
			alert("이메일 인증하세요");
			$('#email').focus();
		}
		else if($('#accept1').is(":checked")==false || $('#accept2').is(":checked")==false){
			alert("약관에 동의하세요");
			$('#accept1').focus();
		}
		else{
			alert("회원가입 완료");
			$('#writeForm').submit();
		}
	});
});
</script>
<form id="writeForm" name="writeForm" method="post" action="/TwoTour/member/write.do">
<input type="hidden" name="gender" id="gender" value="1">
<input type="hidden" name="check" id="check">
<input type="hidden" name="check_number" id="check_number" value="bdfbdb">
<div id="writeForm">
	
	<div id="writeForm_background_div">
   
   		<div id="writeform_text_wrap">
	   		<div id="text_1">회원가입<br></div>
	   		<div id="text_2">투투어와 함께 즐겁고 행복한 여행 되세요.<br></div>	
	   		<div id="text_3">회원가입을 하시면 마일리지 적립, 연중 상시 이벤트와 우대혜택 등 여행과 관련된 특별한 혜택을 드립니다.</div>
   		</div>
   
   	
   		<div id="writeForm_inform_wrap">
   			<div id="writeForm_inform_box">
   				<div id="writeForm_inform_box1">닷컴 아이디에 SNS 아이디 연동하기</div>
   				<div id="writeForm_inform_box2">신규 회원가입</div>
   			</div>
   			
   			<div id="writeForm_inform_table">
   				<div id="table_name_wrap">
   					<div id="table_name">이름</div>
   					<div id="table_name_content">
   						<input type="text" id="name" name="name" placeholder="이름">
   						<div id="nameDiv"></div>
   					</div>
   					<div id="table_name_sex">
   						<ul>
							<li id="man"><h4>남</h4></li>
							<li id="girl"><h4>여</h4></li>
						</ul>
   					</div>
   					<div id="table_name_foreigner">
   					<select name="foreigner">
   						<option value="local">내국인</option>
   						<option value="foreigner">외국인</option>
   					</select>
   					</div>
   				</div>
   				
   				<div id="table_id_wrap">
   					<div id="table_id">아이디</div>
   					<div id="table_id_content">
   						<input type="text" id="id" name="id" placeholder="투투어 아이디">
   						<div id="idDiv"></div>
   					</div>
   					
   					<div id="table_id_check">
   						<label id="check_id">중복여부확인</label>
   					</div>
   				</div>
   				
   				<div id="table_pwd_wrap">
   					<div id="table_pwd">비밀번호</div>
   					<div id="table_pwd_content">
   						<input type="password" id="pwd" name="pwd" placeholder="비밀번호">
   						<div id="pwdDiv"></div>
   						<div id="pwd_notice">※ 9~15자리 영문 대소문자, 숫자, 특수문자 중 2가지 이상 사용해주세요.</div>
   					</div>
   					<div id="table_repwd_content">
   						<input type="password" id="repwd" name="repwd" placeholder="비밀번호 확인">
   					</div>
   				</div>
   				
   				<div id="table_email_wrap">
   					<div id="table_email">이메일</div>
   					<div id="table_email_content">
   						<input type="text" id="email" name="email" placeholder="이메일 입력">
   						<div id="emailDiv"></div>
   					</div>
   					<div id="golbange2">@</div>
   					<div id="table_email_email">
   					<select name="email1" id="email1">
   						<option>naver.com</option>
   						<option>daum.net</option>
   						<option>hanmail.net</option>
   						<option>gmail.com</option>
   					</select>
   					</div>
   					<div id="table_email_send">
   						<label id="send_email">인증번호요청</label>
   					</div>
   					<div id="table_email_number">
   						<input type="text" id="certification_number" placeholder="인증번호 입력">
   					</div>
   					<div id="table_email_check">
   						<label id="email_check">확인</label>
   					</div>
   				</div>
   				
   				<div id="table_birth_wrap">
   					<div id="table_birth">생년원일</div>
   					<div id="table_birth_year">
   						<select name="year" id="year">
   						<option>1995</option>
   						<option>1994</option>
   						<option>1993</option>
   						<option>1992</option>
   						<option>1991</option>
   						<option>1990</option>
   						<option>1989</option>
   						<option>1988</option>
   						<option>1987</option>
   						<option>1986</option>
   						<option>1985</option>
   						<option>1984</option>	
   					</select>
   					</div>
   					
   				<div id="table_birth_month">
   				년
   					<select name="month" id="month">
	   					<option>01</option>
	   					<option>02</option>
	   					<option>03</option>
	   					<option>04</option>
	   					<option>05</option>
	   					<option>06</option>
	   					<option>07</option>
	   					<option>08</option>
	   					<option>09</option>
	   					<option>10</option>
	   					<option>11</option>
	   					<option>12</option>	
   						</select>
   				</div>
   				
   				<div id="table_birth_day">
   				월
   					<select name="day" id="day">
   						<option>01</option>
   						<option>02</option>
   						<option>03</option>
   						<option>04</option>
   						<option>05</option>
   						<option>06</option>
   						<option>07</option>
   						<option>08</option>
   						<option>09</option>
   						<option>10</option>
   						<option>11</option>
   						<option>12</option>	
   						<option>13</option>
   						<option>14</option>
   						<option>15</option>
   						<option>16</option>
   						<option>17</option>
   						<option>18</option>
   						<option>19</option>
   						<option>20</option>
   						<option>21</option>
   						<option>22</option>
   						<option>23</option>
   						<option>24</option>	
   						<option>25</option>
   						<option>26</option>
   						<option>27</option>
   						<option>28</option>
   						<option>29</option>
   						<option>30</option>
   						<option>31</option>
   					</select>
   				</div>
   				<div id="il">일</div>
   			</div>
   			<div id="table_period_wrap">
   				<div id="table_period">웹회원 유지기간</div>
   				<div id="table_period_content">
   					<input type="radio" id=""  value="one" name="period" checked> 1년
					<input type="radio"  id="" value="two" name="period"> 2년
					<input type="radio"  id="" value="three" name="period"> 3년
					<input type="radio"  id=""  value="end" name="period"> 회원 탈퇴 시 까지
   				</div>
   				<div id="table_period_notice">※ 별도 선택이 없을 시 회원 유지 기간은 1년으로 기간 이후 휴면 계정으로 변경됩니다.</div>
   			</div>
  				 
   </div>
   
   <div id="writeForm_terms_table">
   		<div id="table_accept_wrap">
   			<div id="table_accept_content">약관동의</div>
   			<div id="table_accept_content1">※ 여행상품 예약 시, 여행서비스(예약, 보험가입, 현지행사 진행) 수행을 위해 고객님의 개인정보 제공이 반드시 필요합니다.</div>
   		</div>
   		
   		<div id="table_terms_box">
   			<div id="table_box_content">
   				<div id="box1">
   				<input type="checkbox" id="accept1" name="accept1"><label> 투투어 온라인 몰 통합 회원 약관 동의 (필수)</label>
   				</div>
   				<div id="box2">
   					<label>전문보기</label>
   				</div>
   				<div id="box3">
   				<input type="checkbox" id="accept2" name="accept2"><label> 개인정보 수집 및 이용에 대한 동의(필수)</label>
   				</div>
   				<div id="box4">
   					<label>전문보기</label>
   				</div>
   			</div>
   			<div id="table_box_content1">
   				<div id="box5">
   				<input type="checkbox" id="total_accept" tvalue=""><label> [전체 동의] 위의 이용 약관에 모두 동의합니다.</label>
   				</div>
   			</div>
   		</div>
   		<div id="table_important_terms">
   			<div id="important_terms"><label>약관 중요사항 고지 안내</label></div>
   			<div id="important_terms1">약관전문은 위의 이용약관 항목에 약관전체보기로 전문이 게시되어 있습니다.</div>
   		</div>
   
   		<div id="table_terms_guide">
   			<div id="guide_name">
   				<label>투투어 온라인 몰 통합 회원 약관 동의</label>
   			</div>
   			<div id="guide_value">
   				<pre><textarea rows="7" cols="147"  id="content" name="content">
제1조 (목적)

이 통합약관은 투투어 주식회사가 운영하는 A: 투투어닷컴, B:투티켓 등 인터넷쇼핑몰(이하 "회사"라 한다)에서 제공하는 인터넷관련 서비스(이하 "서비스"라 한다)를 하나의 ID 로 각 사이트에 가입하여 이용함에 있어 투투어 및 투투어서비스와 이용자의 권리 의무 및 책임사항을 규정함을 목적으로 합니다.

제2조(정의)
① "회사" 란 투투어주식회사가 재화 또는 용역(이하 "재화등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신 설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 인터넷쇼핑몰을 운영하는 사업자의 의미로도 사용합니다
② "이용자"란 "회사"에 접속하여 이 약관에 따라 "회사"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ '회원'이라 함은 "회사"에 개인정보를 제공하여 회원등록을 한 자로서, "회사"의 정보를 지속적으로 제공받으며, "회사"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
④ '비회원'이라 함은 회원에 가입하지 않고 "회사"가 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관 등의 명시와 설명 및 개정)
① "회사"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 팩스번호, 전자우편 주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 인터넷쇼핑몰의 초기 서비스화면(전면)에 게시합니다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② "회사"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회,배송책임,환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다. 
③ "회사"은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
④ "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 인터넷쇼핑몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "회사"는 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 
⑤ "회사"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에'”회사"에 송신하여 "회사"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경)
① "회사"는 다음과 같은 업무를 수행합니다. 1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 또는 용역의 배송
3. 기타 "회사"가 정하는 업무

② "회사"는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
③ "회사"가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
④ 전항의 경우 "회사"는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "회사"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(서비스의 중단)
① "회사"는 컴퓨터 등 정보통신설비의 보수점검,교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
② "회사"는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, "회사"가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
③ 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "회사"는 제8조에 정한 방법으로 이용자에게 통지하고 당초 "회사"에서 제시한 조건에 따라 소비자에게 보상합니다.

제6조(회원가입) 
① 이용자는 "회사"가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다. 
② "회사"는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다. 1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 "회사"의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 "회사"의 기술상 현저히 지장이 있다고 판단되는 경우

③ 회원가입계약의 성립시기는 "회사"의 승낙이 회원에게 도달한 시점으로 합니다.
④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.

제7조(회원 탈퇴 및 자격 상실 등)
① 회원은 "회사"에 언제든지 탈퇴를 요청할 수 있으며 "회사"는 즉시 회원탈퇴를 처리합니다.
② 회원이 다음 각호의 사유에 해당하는 경우, "몰"은 회원자격을 제한 및 정지시킬 수 있습니다. 1. 가입 신청시에 허위 내용을 등록한 경우
2. "회사"를 이용하여 구입한 재화등의 대금, 기타 "회사"이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
3. 다른 사람의 "회사" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
4. "회사"를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

③ "회사"가 회원 자격을 제한,정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 "회사"는 회원자격을 상실시킬 수 있습니다.
④ "회사"가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제8조(회원에 대한 통지)
① "회사"가 회원에 대한 통지를 하는 경우, 회원이 "회사"와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
② "회사"는 불특정다수 회원에 대한 통지의 경우 1주일이상 "회사" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.

제9조(구매신청)
"회사"이용자는 "회사"상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, "회사"는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
1. 재화등의 검색 및 선택
2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
3. 각 상품별 약관내용, 청약철회권이 제한되는 서비스, 배송료,설치비 등의 비용부담과 관련한 내용에 대한 확인
4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5. 재화등의 구매신청 및 이에 관한 확인 또는 "회사"의 확인에 대한 동의
6. 결제방법의 선택

제10조 (계약의 성립) 
① "회사"는 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다. 1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
3. 기타 구매신청에 승낙하는 것이 "회사" 기술상 현저히 지장이 있다고 판단하는 경우

② "회사"의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 후 계약금이 입금된 시점에 계약이 성립한 것으로 봅니다.
③ "회사"의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.

제11조(지급방법)
"회사"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법 중 가용한 방법으로 할 수 있습니다. 단, "회사"는 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다. 1. 온라인무통장입금
2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3. 당사 내사방문 후 대금지급
4. 투투어 여행상품권에 의한 결제


제12조(수신확인통지,구매신청 변경 및 취소)
① "회사"는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를요청할 수 있고 "회사"는 배송전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.

제13조(재화 등의 공급)
① "회사"는 이용자와 재화등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, "회사"가 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 "회사"는 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다. 다만, 여행상품과 같은 무형의 재화 공급은 해당 상품에 적용되는 별도의 약관교부하고 차질 없이 출발할 수 있도록 일련이 조치를 하여야 합니다.
② "회사"는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "회사"가 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 "회사"가 고의,과실이 없음을 입증한 경우에는 그러하지 아니합니다. 단, 여행상품과 같은 무형의 재화 공급은 예약한 상품에 대한 별도의 여행자 계약서 등을 교부하여 이용자가 상기 상품에 대해 이용할 수 있도록 하여야 합니다.

제14조(환급)
"회사"는 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다. 단, 여행상품의 경우 상품의 특성상 이용자가 출발일전 모든 예약이 완료된 이후 계약을 해지할 경우 국내(외) 여행표준약관 및 국내(외) 소비자 피해보상규정에 의거 손해 배상액을 공제하고 환불하며, 기타 상품의 상품이용 계약체결 시 계약한 특별약관 등의 규정에 의거한 상품의 취소 및 환불 수수료를 공제하고 환불해 드립니다.

제15조(청약철회 등)
① "회사"와 재화 등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다. 단, 여행상품의 경우 국외,국내여행 표준약관에 의한 환급기준에 따라 별도의 취소수수료가 부가될 수 있습니다.
② 이용자는 재화 등을 배송 받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우

③ 제2항 제2호 내지 제4호의 경우에 "회사"가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회등이 제한되지 않습니다.
④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시되 광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화등을 공급받은 날부터 3월이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

제16조(청약철회 등의 효과)
① "회사"는 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 "회사"가 이용자에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
② "회사"는 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
③ 청약철회 등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. "회사"는 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화등 의 반환에 필요한 비용은 "회사"가 부담합니다.
④ 이용자가 재화 등을 제공받을때 발송비를 부담한 경우에 "회사"는 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.

제17조("회원"서비스 제공)
① "회사"는 약관이 정하는 바에 따라 지속적이고 안정적으로 상품 또는 서비스를 제공하는데 최선을 다합니다
② “회사”는 서비스이용과 관련하여 "회원"으로부터 제기된 문의, 요청사항 및 기타 불만사항이 정당하다고 인정할 경우에는 이를 처리하여야 합니다."
③ “회사”는 회원여부 확인 및 회원서비스의 원할한 수행 목적을 위해 필요한 경우 당사 상품 판매처인, 투투어전문판매점 (도우미 대리점)에 제한적으로 최소한의 회원정보를 공유합니다. 이 사항에 대하여는 "회원"가입시 명시적인 고지와 동의 절차를 준행합니다.
④ "회사"는 신속하고 원활한 고객응대 및 효율적인 여행상담 진행을 위해 투투어닷컴 콜센터 대리점 제도를 운영합니다. 이 사항에 대하여는 당사 [개인정보처리방침] 에 개인정보 취급위탁 항목으로 상세하게 안내드립니다.

제18조(개인정보보호)
① "회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보취급방침이 적용되지 않습니다.
② “회사”는 정보통신망법에서 규정하는 개인정보 유효기간제도를 준행하며 1년 동안 당사의 정보통신 서비스를 이용하지 않은 않은 고객의 개인정보는 절차에 의하여 파기하거나 별도로 분리하여 저장, 관리하여 개인정보 보호 정책을 추진하고 있습니다.
③ “회사”는 이용자가 제공한 개인정보를 당해 동의 없이 이 약관에 정한 목적 이외의 용도로 이용하거나,회원서비스 수행목적 범위를 넘어서서 임의의 목적으로 제3자 에게 제공하지 않습니다.

제19조(정보전송 및 제공)
① "회사"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만,"회원"은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신거절을 할 수 있습니다.
② 제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 "회원"의 사전 동의를 받아서 전송합니다. 다만, "회원"의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 예외됩니다.

제20조("회사"의 의무)
① "회사"는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화,용역을 제공하는데 최선을 다하여야 합니다.
② "회사"는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
③ "회사"는 상품이나 용역에 대하여 「표시,광고의공정화에관한법률」 제3조 소정의 부당한 표시 광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
④ "회사"는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제21조(회원의 ID 및 비밀번호에 대한 의무)
① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
③ 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "회사"에 통보하고 "회사"의 안내가 있는 경우에는 그에 따라야 합니다.

제22조(이용자의 의무)

이용자는 다음 행위를 하여서는 안됩니다
1. 신청 또는 변경 시 허위 내용의 등록 
2. 타인의 정보 도용
3. "회사"에 게시된 정보의 변경
4. "회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5. "회사" 기타 제3자의 저작권 등 지적재산권에 대한 침해
6. "회사" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 인터넷쇼핑몰에 공개 또는 게시하는 행위

제23조(연결"회사"와 피연결"회사" 간의 관계)
① 상위 "회사"와 하위 "회사"가 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 "회사"(웹 사이트)이라고 하고 후자를 피연결 "회사"(웹사이트)이라고 합니다.
② 연결"회사"는 피연결"회사"가 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결"회사"의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.

제24조(저작권의 귀속 및 이용제한)
① "회사"가 작성한 저작물에 대한 저작권 기타 지적재산권은 "회사"에 귀속합니다.
② 이용자는 "회사"를 이용함으로써 얻은 정보 중 "회사"에게 지적재산권이 귀속된 정보를 "회사"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
③ "회사"는 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
④ "회사"와 상품구매및 서비스이용 계약을 체결하지 않고 이용자가 "회사"에 게시된 정보를 사용으로 인한 피해는 전적으로 이용자에게 있습니다.

제25조(회원의 게시물 및 저작권)
① 게시물이라 함은 회원이 서비스를 이용하면서 게시한 글, 사진, 각종 파일과 링크 등을 말합니다.
② 회원의 게시물에 의한 손해나 기타 문제가 발생하는 경우, 회원은 이에 대한 책임을 지게 되며, "회사"는 책임을 지지 않습니다.
③ "회사"는 다음 각 호에 해당하는 게시물 등을 회원의 사전 동의 없이 임의 게시, 중단, 수정, 삭제, 이동 또는 등록 거부 등의 관련 조치를 할 수 있습니다. - 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
- 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
- 불법복제 또는 해킹을 조장하는 내용인 경우
- 제 3자의 저작권을 침해하여 게시중단 요청을 받은 경우
- 영리를 목적으로 하는 광고일 경우
- 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
- 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우
- 사적인 정치적 판단이나 종교적 견해의 내용으로 회사가 서비스 성격에 부합하지 않는다고 판단하는 경우
- 회사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우
- 기타 관계법령에 위배된다고 판단되는 경우

④ 회원이 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 단, "회사"는 서비스의 운영, 전시, 전송, 배포, 홍보의 목적으로 회원의 별도 허락없이 무상으로 저작권법에 규정하는 공정한 관행에 합치되게 회원의 게시물을 사용할 수 있습니다.
⑤ "회사"는 전항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우, 전화, 팩스, 전자우편 등의 방법을 통해 사전에 회원의 동의를 얻어야 합니다.
⑥ 회원이 이용계약 해지를 한 경우 타인에 의해 보관, 담기 등으로 재게시 되거나 복제된 게시물과, 타인의 게시물과 결합되어 제공되는 게시물, 공용 게시판에 등록된 게시물 등은 삭제되지 않습니다.

제26조(분쟁해결)
① "회사"는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치운영합니다.
② "회사"는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
③ "회사"와 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시/도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.

제27조(재판권 및 준거법)
① "회사"와 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
② "회사"와 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.

제28조(특별규정)
① 당 약관에 명시되지 않은 사항은 전자거래기본법, 전자서명법, 전자상거래등에서의 소비자보호에 관한 법률 기타 관련법령의 규정 및 국내외 여행표준약관 등에 의합니다.

[부칙]
1. 본 약관은 2015년 8월 18일부터 적용됩니다.
2. 2007년 9월 7일부터 시행되던 종전의 약관은 본 약관으로 대체합니다.

개인정보 수집 및 이용에 대한 동의

   				</textarea></pre>
   			</div>
   			<div id="guide_name1">
   				<label>개인정보 수집 및 이용에 대한 동의</label>
   			</div>
   			<div id="guide_value1">
   				<pre><textarea rows="7" cols="147"  id="content" name="content">1. 개인정보 수집 및 이용목적
 회사는 여행상품의 예약 및 여행관련 서비스 제공 등의 업무처리를 위하여 고객으로부터 최소한의 필수정보를 수집하며, 제공한 모든 개인정보는 별도의 동의가 없는 한 해당목적 이외의 다른 목적으로 사용하지 않습니다.
회사는 수집한 개인정보를 다음의 목적을 위하여 사용합니다. 

가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
 여행상품 예약, 여행자보험 가입, 항공권/호텔 등의 예약 및 출입국 정보확인, 예약내역의 확인 및 상담, 컨텐츠 제공, 여행서비스 이용 시 회원의 우대 구매 및 요금결제, 투투어 마일리지 가입 및 적립/사용 (투
 투어 마일리지 회원(HC클럽)가입자에 한함), 물품배송 또는 청구서 등 발송, 금융서비스 등
 나. 회원관리
 회원제 서비스 이용을 위한 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 이용 및 이용횟수 제한, 연령확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 분쟁조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 등 

2. 개인정보 수집 항목 및 보유 및 이용기간
 가. 회사는 적법한 절차와 법적 기준에 의거하여 고객의 개인정보를 수집하고 있으며, 고객의 서비스이용에 필요한 최소한의 정보만을 수집하고 있습니다.
정보통신망법과 개인정보보호법에 의거하여 수집, 이용을 제한하고 있습니다.
나. 회사는 고객의 인권을 침해할 우려가 있는 민감한 개인정보항목(인종, 종교, 사상, 정치적 성향, 건강상태, 성생활정보 등)은 수집하지 않습니다.

필수정보 아이디(E-Mail), 비밀번호, 이름, 내외국인정보, 생년월일, 성별, 휴대전화번호 회원 서비스 제공 및 본인 식별 서비스 해지 시 까지 단, 해지 시 상법 등 법령의 규정에 의하여 거래 관련 권리의무관계의 확인 등을 이유로 일정기간 보유해야 할 필요가 있을 경우에는 관련법령이 정한 기간 

3. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
개인정보 주체자는 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있습니다. 동의를 거부할 경우 회원가입이 불가함을 알려드립니다. 
   				</textarea></pre>
   			</div>
   		</div>
   		
   		<div id="table_accept_write">
   			<div id="accpet_write">
   				<label id="write">
   					<div id="write1">간편 회원 가입</div>
   					<div id="write2">만 14세 이상만 가입 가능합니다</div>
   				</label>
   			</div>
   		</div>
   
   </div>
   </div>
   </div>
   </div>
</form>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){//페이지 오픈
	$('#body').css('height', '600px');
	
});
$(window).bind('beforeunload', function(){//페이지 클로즈 시
	$('#body').css('height', '1350px');
});
</script>
<style>
table {
    border-collapse: collapse;
    empty-cells: show;
}

table{margin-left:30px;margin-top:20px;width:500px;}
table tr{height:40px;}
table th, td{text-align:left;padding: 0 10px;}

input.type_text1 {
    vertical-align: middle;
    height: 16px;
    margin: 0 0 0 0;
    padding: 2px 2px 0 2px;
    border: solid 1px #CCCCCC;
    color: #666666;
}
table.tbDetailType7 {
    margin-top: 10px;
    table-layout: fixed;
    border-top: 1px solid #E6E5DD;
    border-bottom: 1px solid #E6E5DD;
}

</style>
</head>
<body>
<div class="wrap" style="position:absolute;height:1000px;width:800px;">
	<h4 style="margin-left:10px;">
	<img alt="회원정보 변경" src="https://imagessl.hanatour.com/dotcom/2010/images/mypage/h_member_change.gif">
	</h4>




<form name="frmPassport" action="" method="POST">
<input name="EncChk" type="hidden" value="">

<table width="100%" class="tbDetailType7" id="tblPassLap" border="1" rules="all" 
	   frame="void" cellspacing="0" cellpadding="0">
	<colgroup>
		<col width="20%">
		<col width="*">
	</colgroup>
	
	<tbody>
	<tr>
		<th>영문이름</th>
		<td>
			 <input name="e_lname" class="type_text1" onchange="javascript:nameUpper(this);"
				   type="text" value=" "> (성)
		     <input name="e_fname" class="type_text1" onchange="javascript:nameUpper(this);" 
		     	   type="text" value=" "> (이름)
		</td>
	</tr>
	<tr>
		<th>여권번호</th>
		<td><input name="passport_no" class="type_text1" onchange="javascript:nameUpper(this);"
				   type="text" maxlength="9"></td>
	</tr>
	<tr>
		<th>여권발급일</th>
		<td><input name="passport_issue_yyyy" class="type_text1" type="text" 
				   size="7" maxlength="4"> 년
	          <input name="passport_issue_mm" class="type_text1" type="text" size="3" maxlength="2"> 월
	          <input name="passport_issue_dd" class="type_text1" type="text" size="3" maxlength="2"> 일
	          <input name="passport_issue_date" class="type_text1" type="hidden"></td>
	</tr>
	<tr>
	<th>여권만료일</th>
		<td class="cord">
			<input name="passport_expire_yyyy" class="type_text1" type="text" size="7" 
				   maxlength="4"> 년
              <input name="passport_expire_mm" class="type_text1" type="text" size="3" maxlength="2"> 월
              <input name="passport_expire_dd" class="type_text1" type="text" size="3" maxlength="2"> 일
              <input name="passport_expire_date" class="type_text1" type="hidden">
        </td>
	</tr>
	</tbody>
	</table>
</form>

<p class="btnType3" style="position:relative;left:450px;">
	<a onclick="fcRestrictedArea(this);" href="javascript:passportInsert();" type="a">
		<img alt="저장" src="https://dotcomssl.hanatour.com/2010/images/btn/btn_save.gif">
	</a>
</p>


<!-- 비자정보 -->

<form name="frmNewVisa" action="" method="POST">	
	<table width="100%" class="tbDetailType7" border="1" rules="all" frame="void" 
	  	   cellspacing="0" cellpadding="0">
	<colgroup>
		<col width="20%">
		<col width="*">
	</colgroup>
	
	<tbody>
	<tr>
		<th>영문이름</th>
		<td><input name="e_lname" class="type_text1" style="width: 60px;" type="hidden" value=" ">&nbsp;<input name="e_fname" class="type_text1" style="width: 90px;" type="hidden" value=""></td>
	</tr>
	<tr>
		<th>비자국가</th>
		<td><select name="country_select"><option value="">국가선택</option><option value="GH">가나</option><option value="GA">가봉</option><option value="GM">감비아</option><option value="GN">기니</option><option value="GW">기니 비사우</option><option value="NA">나미비아</option><option value="NG">나이지리아</option><option value="NP">네팔</option><option value="NE">니제르</option><option value="LB">레바논</option><option value="RW">르완다</option><option value="LY">리비아</option><option value="MH">마샬 제도</option><option value="MK">마케도니아</option><option value="MW">말라위</option><option value="ML">말리</option><option value="MR">모리타니</option><option value="MZ">모잠비크</option><option value="MD">몰도바</option><option value="MN">몽골</option><option value="US">미국</option><option value="MM">미얀마</option><option value="VI">미연방 버진 군도</option><option value="AS">미연방 사모아</option><option value="BH">바레인</option><option value="BD">방글라데시</option><option value="BJ">베넹</option><option value="BY">벨라루스</option><option value="BZ">벨리체</option><option value="BW">보츠와나</option><option value="BO">볼리비아</option><option value="BI">부룬디</option><option value="BT">부탄</option><option value="KP">북한</option><option value="SA">사우디 아라비아</option><option value="CY">사이프러스</option><option value="ST">상투메 프린시페</option><option value="SN">세네갈</option><option value="SO">소말리아</option><option value="SD">수단</option><option value="LK">스리랑카</option><option value="SY">시리아</option><option value="SL">시에라 리온</option><option value="AM">아르메니아</option><option value="AZ">아제르바이잔</option><option value="AF">아프가니스탄</option><option value="AD">안도라</option><option value="DZ">알제리</option><option value="AO">앙골라</option><option value="ER">에리트레아</option><option value="YE">예멘</option><option value="OM">오만</option><option value="HN">온두라스</option><option value="JO">요르단</option><option value="UG">우간다</option><option value="UY">우루과이</option><option value="UZ">우즈베키스탄</option><option value="WF">월리스 푸투나</option><option value="ET">이디오피아</option><option value="IQ">이라크</option><option value="IR">이란</option><option value="EG">이집트</option><option value="IN">인도</option><option value="ZM">잠비아</option><option value="GQ">적도 기니</option><option value="GE">조지아</option><option value="CN">중국</option><option value="CF">중앙아프리카 공화국</option><option value="DJ">지부티</option><option value="ZW">짐바브웨</option><option value="TD">차드</option><option value="CM">카메룬</option><option value="CV">카보베르데</option><option value="KZ">카자흐스탄</option><option value="QA">카타르</option><option value="KH">캄보디아</option><option value="KE">케냐</option><option value="KY">케이먼 제도</option><option value="KM">코모로스</option><option value="CI">코트디브와르</option><option value="CG">콩고</option><option value="CD">콩고민주공화국</option><option value="CU">쿠바</option><option value="KW">쿠웨이트</option><option value="TZ">탄자니아</option><option value="TG">토고</option><option value="TM">투르크메니스탄</option><option value="TV">투발루</option><option value="PG">파푸아 뉴기니</option><option value="PR">푸에르토리코</option><option value="AU">호주</option></select></td>
	</tr>
	<tr>
	<th>유효기간</th>
	<td class="cord"><input name="visa_issue_yyyy" class="type_text1" type="text" size="7" maxlength="4"> 년
           <input name="visa_issue_mm" class="type_text1" type="text" size="3" maxlength="2"> 월
           <input name="visa_issue_dd" class="type_text1" type="text" size="3" maxlength="2"> 일
           <input name="visa_issue_date" class="type_text1" type="hidden"> ~
           <input name="visa_expire_yyyy" class="type_text1" type="text" size="7" maxlength="4"> 년
           <input name="visa_expire_mm" class="type_text1" type="text" size="3" maxlength="2"> 월
           <input name="visa_expire_dd" class="type_text1" type="text" size="3" maxlength="2"> 일
           <input name="visa_expire_date" class="type_text1" type="hidden"></td>
	</tr>
	</tbody>
	</table>
</form>
	<p class="btnType3" style="position:relative;left:450px;">
		<a onclick="fcRestrictedArea(this);" href="javascript:visaInsert();" 
			type="a"><img alt="저장" 
			src="https://dotcomssl.hanatour.com/2010/images/btn/btn_save.gif"></a>
	</p>
</div>
</body>
</html>
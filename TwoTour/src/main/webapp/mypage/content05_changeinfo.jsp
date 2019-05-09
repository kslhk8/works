<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){//페이지 오픈
	$('#body').css('height', '500px');
	
	var email = $('#email').val();
	
	if('${memberDTO.gender}' == 0){
		$('#gender').text('여');
	}else{
		$('#gender').text('남
				');
	}
	
	
	$('#submit_btn').on('click', function(){
		var value = $('#email').val();
		var id = document.getElementById('email_id_span').innerHTML;
		var pwd = $('#pwd').val();
		if(value=="") {
			alert('이메일을 써주세요');
		}
		
		else if (value.indexOf('@') < 0) {
			alert('이메일형식으로 변경하세요');
		}
		
		else {
			 
			$.ajax({
					type : "POST",
					url :"/TwoTour/mypage/changeinfosave.do",
					data : { "id" : id, "email" : value , 'pwd' : pwd },
					dataType: "json",
					success: function(data){
						alert("정보가 변경되었습니다. 다시 로그인 해주세요.");
						location.href= "/TwoTour/member/logout.do"
					}
				
			}); 
		}//else
	});
	

});

$(window).bind('beforeunload', function(){//페이지 클로즈 시
	$('#body').css('height', '1350px');
});
</script>
<style>
input { color: #666; margin-left:10px;}

table.tbDetailType7 {
    margin-top: 10px;
    margin-left:20px;
    table-layout: fixed;
    border-top: 1px solid #E6E5DD;
    border-bottom: 1px solid #E6E5DD;
}
table {
    border-collapse: collapse;
    empty-cells: show;
}
.tbDetailType7 th .t_required {
    display: inline-block;
    color: #e85581;
    line-height: inherit;
}
#memberChange01 h3.h3Type9 {
    font: 600 12px/120% "돋움", Dotum;
    color: #333;
    line-height: 18px;
}
#memberChange01 h3.gap {
    margin-top: 30px;
}

.txt_box_st1 {
    padding: 7px 10px 0;
    font: 12px/1.5em "돋움", Dotum;
    color: #666;
    line-height: 18px;
}

input.type_text1 {
    vertical-align: middle;
    height: 16px;
    margin: 0 0 0 0;
    padding: 2px 2px 0 2px;
    border: solid 1px #CCCCCC;
    color: #666666;
}


table tr{height:40px;}
table th, td{text-align:left; padding: 0 10px;}
table th{background-color:#FBFBFB;}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="wrap" style="position:absolute;top:10px;height:1000px;width:500px;">
<h4 style="margin-left:10px;">
<img alt="회원정보 변경" src="https://imagessl.hanatour.com/dotcom/2010/images/mypage/h_member_change.gif">
</h4>

<form name="frmBasicInfo" method="POST" action="/TwoTour/mypage/changeinfo.do" >
	
	<div style="position:absolute;top:30px;left:10px;">
	<table width="100%" class="tbDetailType7" border="1" rules="all" frame="void" cellspacing="0" cellpadding="0">
	<colgroup>
		<col width="15%">
		<col width="*">
	</colgroup>
	<tbody>
		<tr>
		<th>이름</th>
		<td class="change_name">${memberDTO.name}</td>
		</tr>
		<tr>
		<th>아이디</th>
			<td>
				<span id="email_id_span">${memberDTO.id}</span>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${memberDTO.year } 년 ${memberDTO.month } 월 ${memberDTO.day } 일  </td>
		</tr>
		<tr>
			<th>성별</th>
			<td id="gender"></td>
		</tr>
		<tr>
		<th>이메일<span class="t_required">*</span></th>
		<td>
			<input id="email" name="email" class="type_text1" style="width: 170px;" type="text" 
			value="${memberDTO.email}@${memberDTO.email1 }">&nbsp;&nbsp;
		</td>
		</tr>
		<tr>
		<th>비밀번호<span class="t_required"></span></th>
		<td>
			<input id="pwd" name="pwd" class="type_text1" style="width: 170px;" type="text" 
			value="">&nbsp;&nbsp;
		</td>
		</tr>
		
	</tbody>
	</table>
</div>
</form>
	
	<div class="btn_area" style="position:relative;margin-left:100px;top:280px;">
	<a id="submit_btn" href="">
		<img alt="저장하기" src="http://image1.hanatour.com/2010/images/btn/btn_save02.gif">
	</a> &nbsp;&nbsp;
	
	<a  href="">
		<img alt="다시하기" src="http://image1.hanatour.com/2010/images/btn/btn_over_again.gif">
	</a>
	</div>	

</div>

</body>
</html>









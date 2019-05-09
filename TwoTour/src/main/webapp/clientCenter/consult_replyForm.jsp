<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.consult_replyFormT{
	border-collapse: collapse;
	border-style: hidden;
	border-top: 1px solid #6d7588;
	border-bottom: 1px solid #c6c6c6; 
	width: 100%;
	
}
.consult_replyFormT td{
	border: 1px solid #c6c6c6;
	height: 60px;
	padding-left: 20px;
	vertical-align: center;
} 
td.consult_replyFormT_col{
	font: bold 15px Tahoma, Arial;
	background-color: #f2f2f2;
	width: 180px;
}

.consult_replyFormT intput {
	border: none;
}

.consult_replyFormT input[name="name"]{
	border: none;
	border-color: transparent;
	height: 30px;
	width: 80px;
	font: 15px Tahoma, Arial;
	text-align: right;
}

.consult_replyFormT input[name="email1"], .consult_replyFormT input[name="consult_replyFormT_tel"]
, .consult_replyFormT input[name="email2"]
, .consult_replyFormT input[name="reservation_num"]{
	height: 30px;
	width: 300px;
	font: 15px Tahoma, Arial;
}
input.consult_replyFormT_type{
	height: 30px;
	width: 150px;
	font: 15px Tahoma, Arial;
}
.consult_replyFormT input[name="subject"]{
	height: 30px;
	width: 98%;
	font: 15px Tahoma, Arial;
}


.consult_replyFormT textarea[name="content"]{
	height: 350px;
	width: 98%;
	vertical-align: top;
	font: 15px Tahoma, Arial;
	margin: 5px;
}
#consult_replyFormT_count{
	font: 12px Tahoma, Arial;
	text-align: right;
	margin-right: 5px;
	margin: 3px;
}
#consult_replyFormT_count > input{
	text-align: right;
	border: none;
	border-color: transparent;
}
.directDisp{
	font: 15px Tahoma, Arial;
}

#consult_replyFormT_btDiv{
	width:200px;
	margin: 0 42%;
}
#consult_replyFormT_goBackBt{
	background-color: #ffffff; 
    border: #e85581 0.8px solid;
    color: #e85581;
    padding: 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
    width: 80px;
    height: 30px;
}

#consult_replyFormT_replyBt{
	background-color: #e85581; 
    border: none;
    color: white;
    padding: 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 2px 2px;
    cursor: pointer;
    border-radius: 4px;
    width: 80px;
    height: 30px;
}
</style>

<form  id='consult_replyForm' method='post' action='/TwoTour/clientCenter/consult_replyAction.do'>
<table class='consult_replyFormT'>

<tr>
	<td class='consult_replyFormT_col'>
		상담 작성자<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input type='text' name='name' readonly value="${memberDTO.name }">

		<input type='hidden' name='id'	value='${memberDTO.id }'>
	</td>
</tr>
<tr>
	<td class='consult_replyFormT_col'>
		이메일<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input type='text' name='email1' readonly value='${memberDTO.email1 }'>
		<font size='2'>@</font>
		<input type='text' name='email2' readonly value='${memberDTO.email2 }'>
	</td>
</tr>
<tr>
	<td class='consult_replyFormT_col' >
		전화번호
	</td>
	<td >
		<input type='text' name='consult_replyFormT_tel' readonly value="${memberDTO.memTel1}-${ memberDTO.memTel2}-${memberDTO.memTel3 }">
		<!-- 일단은 전화번호 뿌리기만 // 나중에 수정 기능을 ㅠㅠ// name명!!조심합시다-->
	</td>
</tr>
<tr>
	<td class='consult_replyFormT_col' >
		예약번호
	</td>
	<td >
		<input type='text' name='reservation_num' readonly value="${memberDTO.reservation_num}">
		<!--예약번호는 멤버 디비가 가지고 있다? -->
	</td>
</tr>

<tr>
	<td class='consult_replyFormT_col' >
		상담 유형<font color='#e85581'><b>*</b></font>
	</td>
	<td id='consult_replyFormT_col'>
			<input type='text' name='consult_type1' class='consult_replyFormT_type' readonly value='${consultDTO.consult_type1 }'>		
		&nbsp;
		<input type='text' name='consult_type2' class='consult_replyFormT_type' readonly value='${consultDTO.consult_type2 }'>
		&nbsp;
		<input type='text' name='consult_type3' class='consult_replyFormT_type' readonly value='${consultDTO.consult_type3 }'>

	</td>
</tr>
<tr>
	<td class='consult_replyFormT_col'>
		제목<font color='#e85581'><b>*</b></font>
	</td>
	<td class='directDisp'>
		${consultDTO.subject }
	</td>
</tr>
<tr>
	<td class='consult_replyFormT_col'>
		상담 내용<font color='#e85581'><b>*</b></font>
	</td>
	<td class='directDisp'>
		${consultDTO.content }
	</td>
</tr>
</table>
<p style='font: bold 20px Tahoma, Arial; margin:10px;'>답 변</p>

<input type='hidden' name='pseq' value='${pseq}'>
<!-- 원글번호 넘기기 -->
<table class='consult_replyFormT'>
<tr>
	<td class='consult_replyFormT_col'>
		제목<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input id='replyForm_subject' type='text' name='subject' value=''>
	</td>
</tr>
<tr>
	<td class='consult_replyFormT_col'>
		상담 내용<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<textarea id='replyForm_content' name='content'></textarea>
		<p id='consult_replyFormT_count'>
			<input type='text' name='count' value='0'> 
			/ 50자
		</p>
	</td>
</tr>
</table>


<div id='consult_replyFormT_bottomDiv'>
	<div id='consult_replyFormT_btDiv'>
	<button type="reset" id='consult_replyFormT_goBackBt'>취 소</button>
	<button type="button" id='consult_replyFormT_replyBt'>답글쓰기</button> 
	</div>
</div>
</form>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#consult_replyFormT_replyBt').on('click', function(){
		if($('#replyForm_subject').val()==''){
			alert('제목입력해주세요.');
		}else if($('#replyForm_content').val().length==0){
			alert('내용입력해주세요.');
		}else{
			$('#consult_replyForm').submit();	
		}
		return false;
	});
	
	$("#replyForm_content").on('keyup', function(event) {
	    var currentString = $("#replyForm_content").val()
	    $("#consult_replyFormT_count>input").val(currentString.length);
	    if (currentString.length <= 50 )  { 
	    	$("#consult_replyFormT_count>input").css('color','#000000');
	    } else {
	    	$("#consult_replyFormT_count>input").css('color','red');
	    }
	});
});
</script>
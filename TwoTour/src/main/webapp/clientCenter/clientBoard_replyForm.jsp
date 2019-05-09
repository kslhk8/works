<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.cb_replyFormT{
	border-collapse: collapse;
	border-style: hidden;
	border-top: 1px solid #6d7588;
	border-bottom: 1px solid #c6c6c6; 
	width: 100%;
	
}
.cb_replyFormT td{
	border: 1px solid #c6c6c6;
	height: 60px;
	padding-left: 20px;
	vertical-align: center;
} 
td.cb_replyFormT_col{
	font: bold 15px Tahoma, Arial;
	background-color: #f2f2f2;
	width: 180px;
}

.cb_replyFormT intput {
	border: none;
}

.cb_replyFormT input[name="name"]{
	border: none;
	border-color: transparent;
	height: 30px;
	width: 80px;
	font: 15px Tahoma, Arial;
	text-align: right;
}

.cb_replyFormT input[name="email1"], .cb_replyFormT input[name="cb_replyFormT_tel"]
, .cb_replyFormT input[name="email2"]
, .cb_replyFormT input[name="reservation_num"]{
	height: 30px;
	width: 300px;
	font: 15px Tahoma, Arial;
}
input.cbViewT_type{
	height: 30px;
	width: 150px;
	font: 15px Tahoma, Arial;
}
.cb_replyFormT input[name="subject"]{
	height: 30px;
	width: 98%;
	font: 15px Tahoma, Arial;
}


.cb_replyFormT textarea[name="content"]{
	height: 350px;
	width: 98%;
	vertical-align: top;
	font: 15px Tahoma, Arial;
	margin: 5px;
}
#cb_replyFormT_count{
	font: 12px Tahoma, Arial;
	text-align: right;
	margin-right: 5px;
	margin: 3px;
}
#cb_replyFormT_count > input{
	text-align: right;
	border: none;
	border-color: transparent;
}
.directDisp{
	font: 15px Tahoma, Arial;
}

#cb_replyFormT_btDiv{
	width:200px;
	margin: 0 42%;
}
#cb_replyFormT_goBackBt{
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

#cb_replyFormT_replyBt{
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

<form  id='cb_replyForm' method='post' action='/TwoTour/clientCenter/clientBoard_replyAction.do'>
<table class='cb_replyFormT'>

<tr>
	<td class='cb_replyFormT_col'>
		상담 작성자<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input type='text' name='name' readonly value="${memberDTO.name }">

		<input type='hidden' name='id'	value='${memberDTO.id }'>
	</td>
</tr>
<tr>
	<td class='cb_replyFormT_col'>
		이메일<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input type='text' name='email1' readonly value='${memberDTO.email1 }'>
		<font size='2'>@</font>
		<input type='text' name='email2' readonly value='${memberDTO.email2 }'>
	</td>
</tr>
<tr>
	<td class='cb_replyFormT_col' >
		전화번호
	</td>
	<td >
		<input type='text' name='cb_replyFormT_tel' readonly value="${memberDTO.memTel1}-${ memberDTO.memTel2}-${memberDTO.memTel3 }">
		<!-- 일단은 전화번호 뿌리기만 // 나중에 수정 기능을 ㅠㅠ// name명!!조심합시다-->
	</td>
</tr>
<tr>
	<td class='cb_replyFormT_col' >
		예약번호
	</td>
	<td >
		<input type='text' name='reservation_num' readonly value="${memberDTO.reservation_num}">
		<!--예약번호는 멤버 디비가 가지고 있다? -->
	</td>
</tr>

<tr>
	<td class='cb_replyFormT_col' >
		상담 유형<font color='#e85581'><b>*</b></font>
	</td>
	<td id='cb_replyFormT_col'>
			<input type='text' name='clientboard_type1' class='cbViewT_type' readonly value='${cb.clientboard_type1 }'>		
		&nbsp;
		<input type='text' name='clientboard_type2' class='cbViewT_type' readonly value='${cb.clientboard_type2 }'>
		&nbsp;
		<input type='text' name='clientboard_type3' class='cbViewT_type' readonly value='${cb.clientboard_type3 }'>

	</td>
</tr>
<tr>
	<td class='cb_replyFormT_col'>
		제목<font color='#e85581'><b>*</b></font>
	</td>
	<td class='directDisp'>
		${cb.subject }
	</td>
</tr>
<tr>
	<td class='cb_replyFormT_col'>
		상담 내용<font color='#e85581'><b>*</b></font>
	</td>
	<td class='directDisp'>
		${cb.content }
	</td>
</tr>
</table>
<p style='font: bold 20px Tahoma, Arial; margin:10px;'>답 변</p>

<input type='hidden' name='pseq' value='${cb.seq_cb}'>
<!-- 원글번호 넘기기 -->
<table class='cb_replyFormT'>
<tr>
	<td class='cb_replyFormT_col'>
		제목<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input id='replyForm_subject' type='text' name='subject' value=''>
	</td>
</tr>
<tr>
	<td class='cb_replyFormT_col'>
		상담 내용<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<textarea id='replyForm_content' name='content'></textarea>
		<p id='cb_replyFormT_count'>
			<input type='text' name='count' value='0'> 
			/ 50자
		</p>
	</td>
</tr>
</table>


<div id='cb_replyFormT_bottomDiv'>
	<div id='cb_replyFormT_btDiv'>
	<button type="reset" id='cb_replyFormT_goBackBt'>취 소</button>
	<button type="button" id='cb_replyFormT_replyBt'>답글쓰기</button> 
	</div>
</div>
</form>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#cb_replyFormT_replyBt').on('click', function(){
		if($('#replyForm_subject').val()==''){
			alert('제목입력해주세요.');
		}else if($('#replyForm_content').val().length==0){
			alert('내용입력해주세요.');
		}else{
			$('#cb_replyForm').submit();
			
		}
		return false;
	});
	
	$("#replyForm_content").on('keyup', function(event) {
	    var currentString = $("#replyForm_content").val()
	    $("#cb_replyFormT_count>input").val(currentString.length);
	    if (currentString.length <= 50 )  { 
	    	$("#cb_replyFormT_count>input").css('color','#000000');
	    } else {
	    	$("#cb_replyFormT_count>input").css('color','red');
	    }
	});
});
</script>
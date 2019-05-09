<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' type="text/css" href='/TwoTour/css/clientCenter/consult_view.css'>


<!-- <form name='consult_view' id='cbWriteForm' method='post' action='/TwoTour/clientCenter/clientBoard_writeAction.do'> -->
<table id='consult_viewT'>
<tr>
	<td class='consult_viewT_col'>
		작성자<font color='#e85581'><b>*</b></font>
	</td>
	<td class='directDisp'>
		${memberDTO.name }
	</td>
</tr>
<c:if test='${consultDTO.lev==0 }'>
<tr>
	<td class='consult_viewT_col'>
		이메일<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input type='text' name='email1' readonly value='${memberDTO.email }'>
		<font size='2'>@</font>
		<input type='text' name='email2' readonly value='${memberDTO.email1 }'>
	</td>
</tr>

</c:if>
<tr>
	<td class='consult_viewT_col' >
		상담 유형<font color='#e85581'><b>*</b></font>
	</td>
	<td id='consult_viewT_col'>
		<input type='text' name='clientBoard_type1' class='consult_viewT_type' readonly value='${consultDTO.consult_type1 }'>		
		&nbsp;
		<input type='text' name='clientBoard_type2' class='consult_viewT_type' readonly value='${consultDTO.consult_type2 }'>
		&nbsp;
		<input type='text' name='clientBoard_type3' class='consult_viewT_type' readonly value='${consultDTO.consult_type3 }'>

	</td>
</tr>
<tr>
	<td class='consult_viewT_col'>
		제목<font color='#e85581'><b>*</b></font>
	</td>
	<td class='directDisp'>
		${consultDTO.subject }
	</td>
</tr>
<tr>
	<td class='consult_viewT_col'>
		상담 내용<font color='#e85581'><b>*</b></font>
	</td>
	<td class='directDisp'>
		${consultDTO.content }
	</td>
</tr>
</table>
<div id='consult_viewT_bottomDiv'>
	<div id='consult_viewT_btDiv'>
	<button type="button" id='consult_viewT_goBackBt' onclick='javascript:history.go(-1)'>뒤 로</button>
	<c:if test='${consultDTO.reply==0 }'>
	<button type="button" id='consult_viewT_replyBt'>답 글</button>
	</c:if>
	</div>
</div>
<!-- </form> -->


<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#consult_viewT_replyBt').on('click', function(){
		location.href='/TwoTour/clientCenter/consult_replyForm.do?pseq=${seq_consult}';
	});
	
});
</script>
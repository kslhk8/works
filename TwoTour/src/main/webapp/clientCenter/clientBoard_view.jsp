<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>


#cbViewT{
	border-collapse: collapse;
	border-style: hidden;
	border-top: 1px solid #6d7588;
	border-bottom: 1px solid #c6c6c6; 
	width: 100%;
	
}
#cbViewT td{
	border: 1px solid #c6c6c6;
	height: 60px;
	padding-left: 20px;
	vertical-align: center;
} 
td.cbViewT_col{
	font: bold 15px Tahoma, Arial;
	background-color: #f2f2f2;
	width: 180px;
}

#cbViewT intput {
	border: none;
}

#cbViewT input[name="name"]{
	border: none;
	border-color: transparent;
	height: 30px;
	width: 80px;
	font: 15px Tahoma, Arial;
	text-align: right;
}
/* #cbViewT input[name="travler"]{
	height: 30px;
	width: 100px;
	font: 15px Tahoma, Arial;
} */
#cbViewT input[name="email1"], #cbViewT input[name="cbViewT_tel"]
, #cbViewT input[name="email1"], #cbViewT input[name="email2"]
, #cbViewT input[name="reservation_num"]{
	height: 30px;
	width: 300px;
	font: 15px Tahoma, Arial;
}
input.cbViewT_type{
	height: 30px;
	width: 150px;
	font: 15px Tahoma, Arial;
}
#cbViewT input[name="subject"]{
	height: 30px;
	width: 98%;
	font: 15px Tahoma, Arial;
}


#cbViewT textarea[name="content"]{
	height: 350px;
	width: 98%;
	vertical-align: top;
	font: 15px Tahoma, Arial;
	margin: 5px;
}
#cbViewT_count{
	font: 12px Tahoma, Arial;
	text-align: right;
	margin-right: 5px;
	margin: 3px;
}
#cbViewT_count > input{
	text-align: right;
	border: none;
	border-color: transparent;
}
.directDisp{
	font: 15px Tahoma, Arial;
}
#cbViewT_btDiv{
	width:200px;
	margin: 0 42%;
}
#cbViewT_goBackBt{
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
#cbViewT_replyBt{
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
<table id='cbViewT'>
<tr>
	<td class='cbViewT_col'>
		작성자<font color='#e85581'><b>*</b></font>
	</td>
	<td class='directDisp'>
		${memberDTO.name }
	</td>
</tr>
<c:if test='${cb.lev==0 }'>

</c:if>
<tr>
	<td class='cbViewT_col' >
		게시판 유형<font color='#e85581'><b>*</b></font>
	</td>
	<td id='cbViewT_col'>
		<input type='text' name='clientBoard_type1' class='cbViewT_type' readonly value='${cb.clientboard_type1 }'>		
		&nbsp;
		<input type='text' name='clientBoard_type2' class='cbViewT_type' readonly value='${cb.clientboard_type2 }'>
		&nbsp;
		<input type='text' name='clientBoard_type3' class='cbViewT_type' readonly value='${cb.clientboard_type3 }'>

	</td>
</tr>
<tr>
	<td class='cbViewT_col'>
		제목<font color='#e85581'><b>*</b></font>
	</td>
	<td class='directDisp'>
		${cb.subject }
	</td>
</tr>
<tr>
	<td class='cbViewT_col'>
		게시글 내용 내용<font color='#e85581'><b>*</b></font>
	</td>
	<td class='directDisp'>
		${cb.content }
	</td>
</tr>
</table>
<div id='cbViewT_bottomDiv'>
	<div id='cbViewT_btDiv'>
	<button type="button" id='cbViewT_goBackBt' onclick='javascript:history.go(-1)'>뒤 로</button>
	<c:if test='${cb.reply==0 }'>
	<button type="button" id='cbViewT_replyBt'>답 글</button>
	</c:if>
	</div>
</div>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#cbViewT_replyBt').on('click',function(){
		location.href='/TwoTour/clientCenter/clientBoard_replyForm.do?seq_cb=${seq_cb}';
	});
});
</script>
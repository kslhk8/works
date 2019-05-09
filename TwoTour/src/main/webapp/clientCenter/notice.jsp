<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' type='text/css' href='/TwoTour/css/clientCenter/notice.css'>
<style>
#noticeT{
	/* border-collapse: collapse; 
	border-top: 0.5px solid #c6c6c6;
	border-bottom: 0.5px solid #c6c6c6; 
	cell-spacing: '0';*/
	width: 1064px;
	
}
#noticeT td{
	/* border-bottom: 0.5px solid #c6c6c6; */
} 
#notice_head{
	/* border: 1px solid blue; */
	height: 80px;
	font-size: 20px;
    font-weight: 600;
}
#notice_writeBt{
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
<table id='noticeT' style='position:absolute; top:150px; height:655px; width:100%;'>
<tr id='notice_head'>
	<td>공지사항</td>
</tr>
<tr height='30px'>
	<td align='right'>
		<!-- <input id='notice_writeBt' type="image" src='/TwoTour/image/clientCenter/writeBt.jpg'> -->
		<c:if test='${memId eq  "admin"}'>
		<button type='button' id='notice_writeBt'>글쓰기</button>
		</c:if>
	</td>
</tr>
<tr height='575px' >
	<td width='1064px' valign='top'>
		<jsp:include page="${display_notice }" />
	</td>
</tr>
</table>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#notice_writeBt').on('click',function(){
		location.href='/TwoTour/clientCenter/notice_writeForm.do';
	});
});
$('#cc_right_menu').css('display', 'block');
$(window).bind("beforeunload", function(){
	$('#cc_right_menu').css("display", 'none');
});

</script>
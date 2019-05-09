<%@ page language="java" contentType="text/html; charset=utf-8"%>
<link rel='stylesheet' type='text/css' href='/TwoTour/css/clientCenter/notice_writeForm.css'>

<form name='notice_writeForm' method="post" action="/TwoTour/clientCenter/notice_write.do">
<table id='notice_writeFormT'>
<tr>
	<td class='notice_write_col'>
		제목
	</td>
	<td>
		<input name='subject' type='text' >
	</td>
</tr>
<tr>
	<td class='notice_write_col'>
		글쓴이
	</td>
	<td>
		<input name='writer' type='text' value='하나투어'>
	</td>
</tr>
<tr>
	<td class='notice_write_col'>
		내용
	</td>
	<td>
		<textarea name='content'></textarea>
	</td>
</tr>
<tr>
<td height='32px;' colspan='2' align='center'>
<div id='notice_writeForm_BtZone'>
<!-- <input type="image" id='notice_writeForm_listBt' src="/TwoTour/image/clientCenter/listBt.jpg" formaction='/TwoTour/clientCenter/notice.do' formmethod='get'> 
<input type="image" id='notice_writeForm_resetBt' src="/TwoTour/image/clientCenter/resetBt.jpg" formaction='/TwoTour/clientCenter/notice_writeForm.do' formmethod='get'> 
<button id='notice_writeForm_registertBt'><img src='/TwoTour/image/clientCenter/registerBt.jpg'/></button>
 -->
<button type='button' id='notic_writeForm_listBt' > 목 록 </button>
<button type='button' id='notic_writeForm_resetBt' >다시쓰기</button>
<button type='button' id='notic_writeForm_writeBt' >글쓰기</button>
 </div>
</td>
</tr>
</table>

</form>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	/* $('#notice_writeForm_listBt').on('click',function(){
		//location.href='/TwoTour/clientCenter/notice.do';
		console.log('여기 온거 맞낳아');
	});
	$('#notice_writeForm_resetBt').on('click',function(){
		//$("form[name='notice_writeForm']")[0].reset();
		document.notice_writeForm.reset();
	});*/
	$('#notice_writeForm_registerBt').on('click',function(){
		console.log('#notice_writeForm_registerBt  여기 오잖아 ㅠㅠ');
		document.notice_writeForm.submit();
	}); 
	
	
});

</script>
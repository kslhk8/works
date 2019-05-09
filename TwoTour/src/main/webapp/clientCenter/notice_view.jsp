<%@ page language="java" contentType="text/html; charset=utf-8"%>

<link rel='stylesheet' type='text/css' href='/TwoTour/css/clientCenter/notice_view.css'>

<table id='notice_viewT'>
<tr>
	<td class='notice_view_col'>
		제목
	</td>
	<td colspan='3' class='notice_view_value'>
		${noticeDTO.subject }
	</td>
</tr>

<tr>
	<td class='notice_view_col'>
		글쓴이
	</td>
	<td class='notice_view_value'>
		${noticeDTO.writer }
	</td>
	<td class='notice_view_col'>
		작성일
	</td>
	<td class='notice_view_value' id='notice_view_logtime'>
		${noticeDTO.logtime}
	</td>
</tr>

<tr>
	<td colspan='4'>
		<textarea name='content'>
			${noticeDTO.content }
		</textarea>
	</td>

</tr>
</table>
<div id='notice_view_BtZone'>

<%-- <input type="image" id='notice_view_listBt' src="/TwoTour/image/clientCenter/listBt.jpg" formaction='/TwoTour/clientCenter/notice.do' formmethod='get'> 
<input type="image" id='notice_view_previousBt' src="/TwoTour/image/clientCenter/previousBt.jpg" formaction='/TwoTour/clientCenter/notice_view.do?seq_notice=${seq_notice-1 }' formmethod='get'>
<input type="image" id='notice_view_nextBt' src="/TwoTour/image/clientCenter/nextBt.jpg" formaction='/TwoTour/clientCenter/notice_view.do?seq_notice=${seq_notice+1 }' formmethod='get'>
 --%>
 
 </div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var seq_notice = ${seq_notice};
	var biggestSeq = ${biggestSeq};
	var logtime = ${noticeDTO.logtime};
	
	//페이지 처리 제대로 해야해!!~!
	
	
	
	//console.log(totalNotice);//2
	//console.log(seq_notice);//2
	//console.log(biggestSeq);//4
	console.log('${noticeDTO.logtime}');
	if(seq_notice==biggestSeq){
		alert
		$('#notice_view_nextBt').remove();
	}
	if((seq_notice-1)==0){
		$('#notice_view_previousBt').remove();
	}
	
	//var formmatedlogtime = getFormmattedDate(logtime);
	//console.log(formmatedlogtime);
	/* $('#notice_view_logtime').getFormmatedDate();
	
	$.fn.getFormattedDate = function(date) {
	console.log("함수들어왔지???: "+date);
	  var year = date.getFullYear();

	  var month = (1 + date.getMonth()).toString();
	  month = month.length > 1 ? month : '0' + month;

	  var day = date.getDate().toString();
	  day = day.length > 1 ? day : '0' + day;
	  
	  return this.each(function(){
		  this.text(month + '/' + day + '/' + year);
	  });
	  
	} */
	
	//$('#notice_view_logtime').text(new Date(${noticeDTO.logtime}).toUTCString());
});

</script>
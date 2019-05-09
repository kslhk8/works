<%@ page language="java" contentType="text/html; charset=utf-8"%>

<link rel='stylesheet' type='text/css' href='/TwoTour/css/clientCenter/notice_list.css'>
<table id='notice_listT'>
<tr class='notice_list_col'>
	<td >
		번호
	</td>
	<td>
		제목
	</td>
	<td>
		등록일
	</td>
	<td>
		조회수
	</td>
</tr>

</table>
<input type="hidden" name="pg" value="1">
<div id='notice_listT_pagingDiv' style='margin:5px 45%;font: 20px Tahoma, Arial;'>

</div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$.ajax({
		type: "GET"
		, url: "/TwoTour/clientCenter/notice_listAction.do"
		, data: {"pg": "${pg}"}//나중엔 pg값 연동되게 하자!!
		, dataType: "json"
		, error: function(){
			alert("error!! ");
		}
		, success: function(data){
			/* alert(JSON.stringify(data)); */
			$.each(data.noticeList ,function(index, item){				
				$('<tr/>',{
					height: '40px'
				}).append($('<td/>',{
					text: item.seq_notice
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).append($('<td/>',{
					text: item.subject
					, style:  'font: 15px Tahoma, Arial'
					, class: 'notice_list_subject'
					, id: item.seq_notice
					/* , click: function(){
						if(data.existSession)
							location.href="/TwoTour/clientCenter/notice_view.do?seq_notice="+item.seq_notice+'&pg=${pg}';
						else
							alert("먼저 로그인하세요");
					} */
				})).append($('<td/>',{
					text: new Date(item.logtime).toLocaleDateString()
					, style:  'text-align: center; font: 15px Tahoma, Arial;'
				})).append($('<td/>',{
					text: item.hit
					, style:  'text-align: center; font: 15px Tahoma, Arial;'
				})).appendTo($('#notice_listT'));
			});//$.each
			$('#notice_listT_pagingDiv').html(data.noticePaging.pagingHTML);
		}//success
	});//$.ajax
	
	$('#notice_listT').on('mouseenter','td.notice_list_subject', function(){
		
		$(this).css('cursor','pointer');//.css('font-weight','bold')
	}).on('mouseleave','td.notice_list_subject', function(){
		
		$(event.target).css('font-weight', 'normal').css('cursor','auto');
	}).on('click', 'td.notice_list_subject', function(){
		//의미있는 동기화!
	});

});

/* 
 * 
// 아깝다.
//console.log("생 logtime: "+item.logtime);
//1511303748000
//controller: 2017-11-22
function getFormattedDate(date) {
	console.log("함수들어왔지???: "+date);
	  var year = date.getFullYear();

	  var month = (1 + date.getMonth()).toString();
	  month = month.length > 1 ? month : '0' + month;

	  var day = date.getDate().toString();
	  day = day.length > 1 ? day : '0' + day;
	  
	  return month + '/' + day + '/' + year;
} */
</script>
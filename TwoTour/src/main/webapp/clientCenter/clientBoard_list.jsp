<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
@charset "UTF-8";

#cbList_inform1 {
	/* border: 1px solid red;  */
	height: 50px;
	font: 15px Tahoma, Arial;
}

#cbList_inform2 {
	position: relative;
	border: 1px solid #d5d5d5;
	height: 78px;
}

#cbList_inform2_box {
	/* border: yellow dashed 1px; */
	position: relative;
	display: inline-block;
	width: 60px;
}

#cbList_inform2_box>img {
	display: inline-block;
	height: 76px;
}

#cbList_inform2_ul {
	/* border: 1px solid pink; */
	postioin: absolute;
	display: inline-block;
	left: 300px;
	top: 0px;
	margin-bottom: 10px;
}

#cbList_inform2_ul>li {
	font: 13px Tahoma, Arial;
	padding: 5px;
}

#search_td {
	align: right;
}

#cbList_inform3 {
	/* border: 1px solid blue; */
	position: relative;
	/* display: inline-block; */
	marging: 5px;
	float: left;
	margin-right: 0px;
	width: 98%;
}

#cbList_inform3>select {
	width: 100px;
	height: 30px;
	padding-left: 10px;
	color: #000000;
	/* border: 1px solid #f63d8b; */
	border-radius: 2px;
	margin-bottom: 5px;
}

#cbList_inform3>select>option {
	font: 15px Tahoma, Arial;
}

#cbList_inform3>input[name="keyword"] {
	/* border: none; */
	/* border-color: transparent; */
	/* outline: none; */
	height: 27px;
	width: 200px;
	font: 15px Tahoma, Arial;
	margin-bottom: 5px;
}

#cbList_searchBt {
	background-color: #e85581;
	border: none;
	color: white;
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



#cbListT {
	border-collapse: collapse;
	border-style: hidden;
	border-top: 1px solid #6d7588;
	border-bottom: 1px solid #6d7588;
	width: 1061px;
	height: 30px;
}

tr.cbList_col td {
	background-color: #f2f2f2;
	font: bold 15px Tahoma, Arial;
	text-align: center;
	height: 40px;
}

#cbListT>tr>td {
	font: 15px Tahoma, Arial;
}

#cbList_bottomDiv {
	/* border: 1px solid blue; */
	position: relative;
	height: 36px;
	padding-top: 20px;
	font: 16px Tahoma, Arial;
}

#cbList_bottomT {
	border: 1;
	cellspacing: 0px;
	cellpadding: 0px;
	height: 35px;
	width: 100%;
}

#cbList_writeBt {
	background-color: #e85581;
	border: none;
	color: white;
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
</style>
<table id=''>
	<tr>
		<td>

			<div id='cbList_inform1'>
				[등록]누를때, 로그인 검사 고객님께서 경험하신 하나투어 가이드 및 인솔자의 친절한 응대와 일정 동안 느끼셨던 소감을
				남겨주세요. <br> <b> 작성해주신 글은 해당 직원에게 전달이 되며, 칭찬 접수 건수, 정성도,
					칭찬상품수에 가산점 및 비중을 두어 [Best 가이드/인솔자]로 선정이 됩니다. </b>
			</div>
			<div id='cbList_inform2'>
				<div id='cbList_inform2_box'>
					<img src='/TwoTour/image/clientCenter/clientBoard_inform.jpg'>
				</div>
				<div style='position: absolute; left: 110px; top: 10px;'>
					<ul id='cbList_inform2_ul'>

						<li>상업적인 광고 및 음해성 글의 경우 서비스 관리자에 의해 임의 삭제될 수 있음을 알려드립니다.</li>
						<li>개인정보유출 방지를 위해, 휴대폰 번호와 같은 정보를 남기실 경우, [상담문의]게시판을 이용해주시길
							바랍니다.</li>
					</ul>
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<td id='search_td' align='right'>
			<div id='cbList_inform3'>
				<select id='cbList_searchSelect'>
					<option value='subject'>제목</option>
					<option value='id'>작성자</option>
				</select> 
				<input type='text' name='keyword' id='keyword'>
				<button type="button" id='cbList_searchBt'>검 색</button>
			</div>
		</td>
	</tr>
	<tr>
	<td>
	<table id='cbListT'>
		<tr class='cbList_col'>
			<td width='10%'>글번호</td>
			<td width='50%'>제목</td>
			<td width='20%'>작성자</td>
			<td width='10%'>등록일</td>
			<td width='10%'>조회</td>
		</tr>

	</table>
	</td>
	</tr>
</table>
<table>

</table>
<div id='cbList_bottomDiv'>
	<table id='cbList_bottomT'>
		<tr>
			<td width='15%'></td>
			<td width='70%' id='cbList_paging' align='center'>
				<div id='paingDiv'></div>
			</td>
			<td width='15%' align='right'>
				<button type="button" id='cbList_writeBt'
					style='margin-right: 20px;'>등 록</button>
			</td>
		</tr>
	</table>
</div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function searchClientBoard(type, keyword){
	$.ajax({
		type: "POST"
		, url: "/TwoTour/clientCenter/clientBoard_searchAction.do"
		, data: {"type": type
			,"keyword":keyword}
		, dataType: "json"
		, error: function(x, o, e){
			var msg = "페이지 호출 중 error!\n"+x.status+":"+o+":"+e;
			alert(msg);
		}
		,success: function(data){
			$("#cbListT tr:gt(0)").remove();
			$.each(data.cbList, function(index, item){
				$('<tr/>',{
					height: '40px'
				}).append($('<td/>',{
					text: item.seq_cb
					,width: '107px'
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).append($('<td/>',{
					text: item.subject
					, style:  'font: 15px Tahoma, Arial; padding: 3px;'
					, width: '530px'
					, class: 'cbList_subject'
					, id: item.seq_cb
				})).append($('<td/>',{
					width: '212px'
					,text: item.id
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).append($('<td/>',{
					width: '106px'
					,text: new Date(item.logtime).toLocaleDateString()
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).append($('<td/>',{
					width: '106px'
					,text: item.hit
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).appendTo($('#cbListT'));
				
				 if(item.pseq!=0){
						for(var i=1; i<=item.lev; i++){
							$('#'+item.seq_cb).prepend("&nbsp;&nbsp;&nbsp;>>>");//prepend
						}
						
				} 
	
			/* $('td.cbList_subject').on('click', function(){
				location.href='/TwoTour/clientCenter/clientBoardView.do?seq_cb='+item.seq_cb;
			});	 *///계속실행되는마법.
		
		});
				/* $('td.cbList_subject').on('click', function(){
					location.href='/TwoTour/clientCenter/clientBoardView.do?seq_cb='+item.seq_cb;
				});	 *///계속실행되는마법.
				$('#paingDiv').html(data.boardPaging.pagingHTML);
			
		}
	});
}
$(document).ready(function(){
	$('#cbList_writeBt').on('click',function(){
		location.href='/TwoTour/clientCenter/clientBoard_writeForm.do';
	});
	
	$.ajax({
		type: "GET"
		, url: "/TwoTour/clientCenter/clientBoard_getList.do"
		, data: {"pg": '${pg}'}
		, dataType: "json"
		, error: function(x, o, e){
			var msg = "페이지 호출 중 error!\n"+x.status+":"+o+":"+e;
			alert(msg);
		}
		,success: function(data){
					$.each(data.cbList, function(index, item){
						$('<tr/>',{
							height: '40px'
						}).append($('<td/>',{
							text: item.seq_cb
							,width: '107px'
							, style:  'text-align: center; font: 15px Tahoma, Arial; '
						})).append($('<td/>',{
							text: item.subject
							, style:  'font: 15px Tahoma, Arial; padding: 3px;'
							, width: '530px'
							, class: 'cbList_subject'
							, id: item.seq_cb
						})).append($('<td/>',{
							width: '212px'
							,text: item.id
							, style:  'text-align: center; font: 15px Tahoma, Arial; '
						})).append($('<td/>',{
							width: '106px'
							,text: new Date(item.logtime).toLocaleDateString()
							, style:  'text-align: center; font: 15px Tahoma, Arial; '
						})).append($('<td/>',{
							width: '106px'
							,text: item.hit
							, style:  'text-align: center; font: 15px Tahoma, Arial; '
						})).appendTo($('#cbListT'));
						
						 if(item.pseq!=0){
								for(var i=1; i<=item.lev; i++){
									$('#'+item.seq_cb).prepend("&nbsp;&nbsp;&nbsp;>>>");//prepend
								}
								
						} 
			
					/* $('td.cbList_subject').on('click', function(){
						location.href='/TwoTour/clientCenter/clientBoardView.do?seq_cb='+item.seq_cb;
					});	 *///계속실행되는마법.
				
				});
				/* $('td.cbList_subject').on('click', function(){
					location.href='/TwoTour/clientCenter/clientBoardView.do?seq_cb='+item.seq_cb;
				});	 *///계속실행되는마법.
				$('#paingDiv').html(data.boardPaging.pagingHTML);
			
		}
	});
	
	$('#cbListT').on('mouseenter','td.cbList_subject', function(){
		
		$(this).css('font-weight','bold').css('cursor','pointer');
	}).on('mouseleave','td.cbList_subject', function(){
		
		$(event.target).css('font-weight', 'normal').css('cursor','auto');
	}).on('click', 'td.cbList_subject', function(){
		location.href='/TwoTour/clientCenter/clientBoardView.do?seq_cb='+$(this).parent().find('td').eq(0).text();
		//location.href = '/TwoTour/clientCenter/consult_view.do?seq_consult='+seq;
	});
	
	$('#cbList_searchBt').on('click', function(){
		if($('#keyword').val().length==0){
			alert("검색어 입력해주세요.");
		}else{
			searchClientBoard($('#cbList_searchSelect').val(), $('#keyword').val());
			//location.href='/TwoTour/clientCenter/clientBoard_search'
		}
	});

	
	
	
});
</script>
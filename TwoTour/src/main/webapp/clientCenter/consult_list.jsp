<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel='stylesheet' type="text/css" href='/TwoTour/css/clientCenter/consult_list.css'>

<table id='consult_listT'>
<tr id='consult_list_index'>
<td colspan='5' height='36px;'style='margin-bottom:10px;'>
<span>상담 목록</span>
<div id='consult_list_select'style='/* border:1px solid red; */ display: inline-block; float: right;margin-bottom:10px;'>
<form id='consult_listForm' method="POST" action="/TwoTour/clientCenter/consult_searchList.do">
	<select name='consult_type1' id='consult_writeForm_type1' class='consult_writeForm_select'>
		<option value=''>::상담유형::</option>
		<option value='해외여행'>해외여행</option>
		<option value='예약'>예약</option>
	</select>
	&nbsp;
	<select name='consult_type2' id='consult_writeForm_type2' class='consult_writeForm_select'>
		<option value=''>::상담유형::</option>
	</select>
	&nbsp;
	<select name='consult_type3' id='consult_writeForm_type3' class='consult_writeForm_select' >
		<option value=''>::상담유형::</option>
	</select>
	<button type='button' id='consult_list_searchBt'>검 색</button>
	<input type='hidden' name='consult_type2'>
	<input type='hidden' name='consult_type3'>
</form>
</div>
</td>
</tr>
<tr class='consult_list_col'>
	<td width='30px'>
		글번호
	</td>
	<td  width='200px'>
		제목
	</td>
	<td width='50px'>
		등록일
	</td>
	<td width='30px'>
		ID
	</td>
	<td width='30px'>
		답변유무
	</td>
</tr>

</table>
<div id='consult_list_bottom_div'>
	<div id='consult_list_temp'>
<!-- 	<button type="button" id='consult_replyBt'> <img alt="replyConsult_list" src="/TwoTour/image/clientCenter/replyBt.jpg"></button>
	<button type="reset" id='consult_resetBt'><img alt="resetConsult_list" src="/TwoTour/image/clientCenter/resetBt.jpg"></button> --> 
	</div>
</div>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function consultSearch(type1, type2, type3){
	console.log("search함수:"+type1+","+type2+","+type3);
	if($('#consult_writeForm_type1').val()==''){
		type2=''; type3='';
	}
	$.ajax({
		type: "POST"
		, url: "/TwoTour/clientCenter/consult_searchList.do"
		, data: {"pg": '${pg}'
			,"consult_type1":type1
			,"consult_type2":type2
			,"consult_type3":type3}
		, dataType: "json"
		, error: function(x, o, e){
			var msg = "페이지 호출 중 error!\n"+x.status+":"+o+":"+e;
			alert(msg);
		}
		,success: function(data){
			$("#consult_listT tr:gt(1)").remove();
			$.each(data.consultList, function(index, item){
				seq= item.seq_consult;
				var takeAnswered;
				if(item.reply===0 && item.lev==0){
					takeAnswered='미완료';
					//takeAnswered.prop('font-color','blue');
				}else if(item.reply>=1){
					takeAnswered='답변완료';
					//takeAnswered.css('font-color','red');
				}else if(item.lev!=0){
					takeAnswered='답변';
				}
				$('<tr/>',{
					height: '40px'
				}).append($('<td/>', {
					text: item.seq_consult
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
					
				})).append($('<td/>', {
					text: item.subject
					, style:  'font: 15px Tahoma, Arial; padding: 3px;'
					, class: 'consult_list_subject'
					, id: item.seq_consult
				})).append($('<td/>',{
					text: new Date(item.logtime).toLocaleDateString()
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).append($('<td/>',{
					text: item.id
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).append($('<td/>',{
					text: takeAnswered
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).appendTo($('#consult_listT'));
				 if(item.pseq!=0){
					for(var i=1; i<=item.lev; i++){
						$('#'+item.seq_consult).prepend("&nbsp;&nbsp;&nbsp;>>>");//prepend
					}
					/* $('#'+item.seq_consult).before($('<img/>',{
						src : "/TwoTour/clientCenter/image/reply.gif"
					})); */
				} 
			});//.each
			
			
			
			$('#consult_list_temp').html(data.boardPaging.pagingHTML);
		}//success	
	});
	
}
$(document).ready(function(){
	var select = "<option>::상담유형::</option>"; 
	var seq;
	$("#consult_writeForm_type1").on('change',function() {		
		
		if($("#consult_writeForm_type1").val() == "") { 
			// select의 value가 ""이면, "선택" 메뉴만 보여줌.
			//alert("click만 걸리네, 조건절은 걸리니??");
			$("#consult_writeForm_type2").find("option").remove().end().append(select);
			$("#consult_writeForm_type3").find("option").remove().end().append(select);
		} else {
			//alert("else로 빠지니?");
			comboChange($(this).val());
			
		}
	});
	
	function comboChange(){
		//alert($('#consult_writeForm_type1').val());
		$.ajax({
			type: "POST"
			, url: "/TwoTour/clientCenter/getConsult_type2.do"
			, data: {"consult_type1": $('#consult_writeForm_type1').val()}
			, dataType: "json"
			, error: function(x, o, e){
				var msg = "페이지 호출 중 error!\n"+x.status+":"+o+":"+e;
				alert(msg);
			}
			, success: function(data){
				if(data.consult_type2List.length > 0){
					$('#consult_writeForm_type2').find('option').remove().end().append(select);
					$("#consult_writeForm_type3").find("option").remove().end().append(select);
					$.each(data.consult_type2List, function(index, item){
						$('#consult_writeForm_type2').append($('<option/>',{
							value: item
							, text: item
						}));
					});
				}else{
					$('#consult_writeForm_type2').find('option').remove().end().append($('<option/>',{
						text: 'No-Subtype'
					}));
				}
			}
		});
	}//comboChange()
	//앞쪽: 부모  // 뒤쪽: 이벤트를 발생시키는 애
	//writeForm에서 table 이름만 바꿔주었음!
	$('#consult_listT').on('change', '#consult_writeForm_type2', function(){
		
		$('#consult_listForm>input[name="consult_type2"]').val($('#consult_writeForm_type2').val());
		
		 $.ajax({
			type:"POST"
			, url: "/TwoTour/clientCenter/getConsult_type3.do"
			, data: {"consult_type2": $('#consult_writeForm_type2').val()}
			, dataType: "json"
			, error: function(){
				alert("뜨지말자!!");
			}
			, success: function(data){
			
				if(data.consult_type3List===null){
					$('#consult_writeForm_type3').find('option').remove().end().append($('<option/>',{
						text: 'No-Subtype'
					}));
				}else if(data.consult_type3List.length === 0){
					$('#consult_writeForm_type3').find('option').remove().end().append($('<option/>',{
						text: 'No-Subtype'
					}));
				}else if(data.consult_type3List.length > 0){
					$('#consult_writeForm_type3').find('option').remove().end().append(select);
					
					$.each(data.consult_type3List, function(index, item){
						$('#consult_writeForm_type3').append($('<option/>',{
							value: item
							, text: item
						}));
					});//.each
				}else{
				}
				
			}//success
		});//.ajax	
	});
	$('#consult_listT').on('change', '#consult_writeForm_type3', function(){
		$('#consult_listForm>input[name="consult_type3"]').val($('#consult_writeForm_type3').val());
	});
	
 	$.ajax({
		type: "GET"
		, url: "/TwoTour/clientCenter/consult_getListA.do"
		, data: {"pg": '${pg}'}
		, dataType: "json"
		, error: function(x, o, e){
			var msg = "페이지 호출 중 error!\n"+x.status+":"+o+":"+e;
			alert(msg);
		}
		,success: function(data){
			//alert(JSON.stringify(data));
			$.each(data.consultList, function(index, item){
				seq= item.seq_consult;
				var takeAnswered;
				if(item.reply===0 && item.lev==0){
					takeAnswered='미완료';
					//takeAnswered.prop('font-color','blue');
				}else if(item.reply>=1){
					takeAnswered='답변완료';
					//takeAnswered.css('font-color','red');
				}else if(item.lev!=0){
					takeAnswered='답변';
				}
				$('<tr/>',{
					height: '40px'
				}).append($('<td/>', {
					text: item.seq_consult
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
					
				})).append($('<td/>', {
					text: item.subject
					, style:  'font: 15px Tahoma, Arial; padding: 3px;'
					, class: 'consult_list_subject'
					, id: item.seq_consult
				})).append($('<td/>',{
					text: new Date(item.logtime).toLocaleDateString()
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).append($('<td/>',{
					text: item.id
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).append($('<td/>',{
					text: takeAnswered
					, style:  'text-align: center; font: 15px Tahoma, Arial; '
				})).appendTo($('#consult_listT'));
				 if(item.pseq!=0){
					for(var i=1; i<=item.lev; i++){
						$('#'+item.seq_consult).prepend("&nbsp;&nbsp;&nbsp;>>>");//prepend
					}
					/* $('#'+item.seq_consult).before($('<img/>',{
						src : "/TwoTour/clientCenter/image/reply.gif"
					})); */
				} 
			});//.each
			
			
			
			$('#consult_list_temp').html(data.boardPaging.pagingHTML);
		}//success	
	});//.ajax
	
	$('#consult_listT').on('mouseenter','td.consult_list_subject', function(){
		
		$(this).css('font-weight','bold').css('cursor','pointer');
	}).on('mouseleave','td.consult_list_subject', function(){
		
		$(event.target).css('font-weight', 'normal').css('cursor','auto');
	}).on('click', 'td.consult_list_subject', function(){
		location.href = '/TwoTour/clientCenter/consult_view.do?seq_consult='+$(this).parent().find('td').eq(0).text();
		//location.href = '/TwoTour/clientCenter/consult_view.do?seq_consult='+seq;
	});
	

	$('#consult_list_searchBt').on('click', function(){
		//$('#consult_listForm').submit();//검색용
		consultSearch($("#consult_writeForm_type1").val() ,$('#consult_listForm>input[name="consult_type2"]').val()
				, $('#consult_listForm>input[name="consult_type3"]').val());
	});
	/* $("#boardSearch").on("click", function(){
		consultSearch($("#consult_writeForm_type1").val()
				, $("#consult_writeForm_typew").val(),  $("#consult_writeForm_typew").val());
	}) */
	
	
	$('#consult_listT').on('mouseenter','td.consult_list_subject', function(){
		$(this).css('font-weight','bold').css('cursor','pointer');
	}).on('mouseleave','td.consult_list_subject', function(){
		$(event.target).css('font-weight', 'normal').css('cursor','auto');
	}).on('click', 'td.consult_list_subject', function(){
		location.href = '/TwoTour/clientCenter/consult_view.do?seq_consult='+$(this).parent().find('td').eq(0).text();
	});

});



</script>
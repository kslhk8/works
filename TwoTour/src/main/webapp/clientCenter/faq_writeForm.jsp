<%@ page language="java" contentType="text/html; charset=utf-8"%>
<link rel='stylesheet' type='text/css' href='/TwoTour/css/clientCenter/faq_writeForm.css'>

<form name='faq_writeForm' id ='faq_writeForm' method="post" action="/TwoTour/clientCenter/faq_write.do">

<table id='faq_writeFormT'>
<tr>
	<td class='faq_writeForm_col'>
		중분류
	</td>
	<td><!-- summaryname -->
		<select name='summaryname' id='faq_summaryname'>
			<option>:: 선택 ::</option>
			<option value='해외항공권'>해외항공권</option>
			<option value='국내항공권'>국내항공권</option>
			<option value='해외패키지'>해외패키지</option>
			<option value='해외호텔'>해외호텔</option>
			<option value='국내숙박/팬션'>국내숙박/팬션</option>
		</select>
	</td>
</tr>
<tr>
	<td class='faq_writeForm_col'>
		소분류
	</td>
	<td>
	<!-- 
	type나오게 하는 부분
	맨처음엔 없었다가 앞에꺼 선택하면 그에 맞춰서 띠우자 ㅠㅠ.. -->
		<select name='type' id='faq_type'>
			<option>:: 선택 ::</option>
		</select>
	</td>
</tr>
<tr>
	<td class='faq_writeForm_col'>
		제목
	</td>
	<td>
		<input type='text' name='subject'>
	</td>
</tr>
<tr>
	<td class='faq_writeForm_col' valign="top">
		내용
	</td>
	<td>
		<textarea name='content'></textarea>
	</td>
</tr>
</table>
<div id='faq_writeForm_bt_div'>
	<input type='button' id='faq_writeBt' >
	<button type="reset" id='faq_resetBt'><img alt="resetFaqForm" src="/TwoTour/image/clientCenter/resetBt.jpg"></button> 
	<!-- <input type='reset' id='faq_resetBt'> -->
	<!-- <input type='image' src='/TwoTour/image/clientCenter/resetBt.jpg' onclick='document.faq_writeForm.reset()'> --><!-- 이걸하면 계속 db를 치고와.. -->
	
</div>
</form>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var select = "<option>:: 선택 ::</option>"; 
	
	$("#faq_summaryname").change(function() {	
		if($("#faq_summaryname").val() == "") { // select의 value가 ""이면, "선택" 메뉴만 보여줌.
			$("#faq_type").find("option").remove().end().append(select);
		} else {
			comboChange($(this).val());
		}
	});
	
	function comboChange(){
		//alert($('#faq_summaryname').val());
		$.ajax({
			type: "POST"
			, url: "/TwoTour/clientCenter/faq_type.do"
			, data: {"summaryname": $('#faq_summaryname').val()}//$('#faq_writeForm').serialize()
			, dataType: "json"
			, error: function(x, o, e){
				var msg = "페이지 호출 중 error!\n"+x.status+":"+o+":"+e;
				alert(msg);
			}
			, success: function(data){
				if(data.summaryList.length > 0){
					$('#faq_type').find('option').remove().end().append(select);
					
					$.each(data.summaryList, function(index, item){
						$('#faq_type').append($('<option>',{
							value: item
							, text: item
						}));
					});
				}else{
					$('#faq_type').find('option').remove().end().append($('<option>',{
						text: 'No-Sub'
					}));
				}
			}
		});
	}//comboChange()
	
	$('#faq_writeBt').on('click', function(event){
		//$.post("/TwoTour/clientCenter/faq_write.do", $('#faq_writeForm').serialize());
		//event.preventDefault();
		$('#faq_writeForm').submit();
		event.preventDefault();
		//return false;
		
	});
	
/* 	$('#faq_resetBt').on('click', function(){
		console.log('each문 밖');
		var i=0;
         $("faq_writeForm").each(function() {
        	console.log('each문 안'+ i);
            this.reset();
            i++;
         });  
	}); */
	
	
});

	
	

</script>
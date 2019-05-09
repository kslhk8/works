<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel='stylesheet' type="text/css" href='/TwoTour/css/clientCenter/consult_writeForm.css'>
<div id='consult_writeForm_inform' >
최근 상담문의 증가로 인해 답변처리가 지연되고 있으나 최대한 신속히 회신 드리도록 하겠습니다.
<br>
<b>
상품을 예약하신 고객님께서는 최초에 예약하신 상담처로 문의주시면 보다 빠른 답변을 받을실 수 있습니다.
</b>

</div>
<div id='consult_writeForm_inf_box'>
	<div id='consult_writeForm_inf_box1'>
		<img src='/TwoTour/image/clientCenter/consult_inform.jpg'>
	</div>
	<!-- <div id='consult_inf_box2'> -->
		<ul id='consult_writeForm_inform_ul'>

			<li>예약하신 상품의 취소를 원하실 경우 위약금이 발생할 수 있으니 예약하신 대리점을 통해 문의 부탁드립니다. </li>
			<li>여행상품의 판매 및 상담은 전국의 하나투어 도우미 여행사와 함께 하고 있습니다. <button >[하나투어전문점 보기]</button></li>
			<li>문의주신 내용에 대한 답변은 <b>[마이페이지>참여내역]</b>에서 확인 부탁드립니다. </li>
			<li>상업적인 광고 및 음해성 글의 경우 서비스 관리자에 의해 임의 삭제될 수 있음을 알려드립니다. </li>

		</ul>
	<!-- </div> -->
</div>
<p id='consult_writeForm_P'>
	<span><font color='#e85581'><b>*</b></font>표시는 필수입력 항목입니다.</span>
</p>
<form name='consult_writeForm' id='consult_writeForm' method='post' action='/TwoTour/clientCenter/consult_writeAction.do'>
<table id='consult_writeFormT'>
<tr>
	<td class='consult_writeForm_col' >
		상담유형<font color='#e85581'><b>*</b></font>
	</td>
	<td id='consult_writeForm_select_td'>
		<select name='consult_type1' id='consult_writeForm_type1' class='consult_writeForm_select'>
			<option>::상담유형::</option>
			<option value='해외여행'>해외여행</option>
			<option value='예약'>예약</option>
		</select>
		&nbsp;
		<select name='consult_type2' id='consult_writeForm_type2' class='consult_writeForm_select'>
			<option>::상담유형::</option>
		</select>
		&nbsp;
		<select name='consult_type3' id='consult_writeForm_type3' class='consult_writeForm_select' >
			<option>::상담유형::</option>
		</select>
	</td>
</tr>
<tr>
	<td class='consult_writeForm_col'>
		이름<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input type='text' name='name' readonly value="${memberDTO.name }">
		<input type='hidden' name='id'	value='${memberDTO.id }'>
	</td>
</tr>
<tr>
	<td class='consult_writeForm_col'>
		이메일<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input type='text' name='email1' value='${memberDTO.email }'>
		<font size='2'>@</font>
		<select name='email2'  class='consult_writeForm_select' >
			<option value='naver.com'>naver.com</option>
			<option value='hanmail.net'>hanmail.net</option>
			<option value='직접입력'>직접입력</option>
		</select>
	</td>
</tr>
<tr>
	<td class='consult_writeForm_col'>
		예약번호
	</td>
	<td>
		<input type='text' name='reservation_num'>
	</td>
</tr>

<tr>
	<td class='consult_writeForm_col'>
		제목<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input type='text' name='subject'>
	</td>
</tr>
<tr>
	<td class='consult_writeForm_col'>
		문의내용<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<textarea name='content'></textarea>
		<p id='consult_writeForm_count'>
			<input type='text' name='count' value='0'> 
			/ 2500자
		</p>
	</td>
</tr>
</table>
<div id='consult_writeForm_bt_div'>
	<div id='consult_writeForm_temp'>
	<button type="button" id='consult_writeBt'> <img alt="submitconsult_writeForm" src="/TwoTour/image/clientCenter/writeBt.jpg"></button>
	<button type="reset" id='consult_resetBt'><img alt="resetconsult_writeForm" src="/TwoTour/image/clientCenter/resetBt.jpg"></button> 
	</div>
</div>
</form>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var select = "<option>::상담유형::</option>"; 
	
	$("#consult_writeForm_type1").on('change',function() {		
		
		if($("#consult_writeForm_type1").val() == "") { 
			// select의 value가 ""이면, "선택" 메뉴만 보여줌.
			alert("click만 걸리네, 조건절은 걸리니??");
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
	
	
	
	//상담유형1
/* 	$("#consult_writeForm_type1>option").on('click', function(){
		alert("?222211?");
		$.ajax({
			type: "POST"
			, url: "/TwoTour/clientCenter/getConsult_type2.do"
			, data: {"consult_type1": $("#consult_writeForm_type1").val()}
			, dataType: "json"
			, error: function(){
				alert("뜨지말자!!");
			}
			, success: function(data){
				//console.log("consult_writeForm1: "+JSON.stringify(data));
				$.each(data.consult_type2List, function(index, item){
					$('#consult_writeForm_type2').append($('<option>',{
						value: item
						, text: item
						// , onclick: function goSync(item)
					}));
				});//.each
			}//success
		});//.ajax	
	}); */
	

	//앞쪽: 부모  // 뒤쪽: 이벤트를 발생시키는 애
	$('#consult_writeFormT').on('change', '#consult_writeForm_type2', function(){
		//alert("동기"+event.target.text());
		//alert('gg');
		 $.ajax({
			type:"POST"
			, url: "/TwoTour/clientCenter/getConsult_type3.do"
			, data: {"consult_type2": $('#consult_writeForm_type2').val()}
			, dataType: "json"
			, error: function(){
				alert("뜨지말자!!");
			}
			, success: function(data){
				console.log("consult_writeForm2: "+JSON.stringify(data));
				console.log("consult_writeForm3List: "+JSON.stringify(data.consult_type3List));
				if(data.consult_type3List===null){
					console.log("설마 null?");
					$('#consult_writeForm_type3').find('option').remove().end().append($('<option/>',{
						text: 'No-Subtype'
					}));
				}else if(data.consult_type3List.length === 0){
					console.log("length=0");
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
					console.log("이런 경우는 없길!");	
				}
			}//success
		});//.ajax	
	});
	
	$('#consult_writeBt').on('click', function(){
		//유효성 검사 해야해!!!
		
		
		$('#consult_writeForm').submit();
		return false;
	});
});
/* function goSync(item){
	alert("동기"+item);
	location.href="/TwoTour/clientCenter/getConsult_type3.do?consult_type2="+item;
} */

</script>
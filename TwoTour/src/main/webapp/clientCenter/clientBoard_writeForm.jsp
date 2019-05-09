<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel='stylesheet' type="text/css" href='/TwoTour/css/clientCenter/clientBoard_writeForm.css'>
<style>
#cbWriteForm_inform1{
	/* border: 1px solid red;  */
	height: 50px;
	font: 15px Tahoma, Arial ;
}
#cbWriteForm_inform2{
	position: relative;
	border: 1px solid #d5d5d5;
	height: 78px;
}
#cbWriteForm_inform2_box{
	/* border: yellow dashed 1px; */
	position: relative;
	display: inline-block;
	width: 60px;
}

#cbWriteForm_inform2_box>img{
	display: inline-block;
	height: 76px;
}
#cbWriteForm_inform2_ul{
	/* border: 1px solid pink; */
	postioin: absolute;
	display: inline-block;
	left: 300px;
	top: 0px;
}
#cbWriteForm_inform2_ul > li{
	font: 13px Tahoma, Arial;
	padding: 5px;
}
</style>
<table id=''>
<tr>
<td>

<div id='cbWriteForm_inform1'>
고객님께서 경험하신 하나투어 가이드 및 인솔자의 친절한 응대와 일정 동안 느끼셨던 소감을 남겨주세요.
<br>
<b>
작성해주신 글은 해당 직원에게 전달이 되며, 칭찬 접수 건수, 정성도, 칭찬상품수에 가산점 및 비중을 두어 [Best 가이드/인솔자]로 선정이 됩니다.
</b>
</div>
<div id='cbWriteForm_inform2'>
	<div id='cbWriteForm_inform2_box'>
		<img src='/TwoTour/image/clientCenter/clientBoard_inform.jpg'>
	</div>
	<div style='position:absolute; left:110px; top:0px;'>
		<ul id='cbWriteForm_inform2_ul'>
			<li>고객님의 말씀에 회신을 드리기까지는 여행지별 시차와 특성, 시안에 따라 확인하는데 2~6일까지 소요됨을 양해하여 주시기 바랍니다.</li>
			<li>상업적인 광고 및 음해성 글의 경우 서비스 관리자에 의해 임의 삭제될 수 있음을 알려드립니다. </li>
			<li>개인정보유출 방지를 위해, 휴대폰 번호와 같은 정보를 남기실 경우, [상담문의]게시판을 이용해주시길 바랍니다.</li>
		</ul>
	</div>
</div>
</td>
</tr>
<tr>
<td id=''>
<p id='cbWriteForm_p'>
	<span><font color='#e85581'><b>*</b></font>표시는 필수입력 항목입니다.</span>
</p>

</td>
</tr>

<tr>
<td>

<form name='cbWriteForm' id='cbWriteForm' method='post' action='/TwoTour/clientCenter/clientBoard_writeAction.do'>
<table id='cbWriteFormT'>

<tr>
	<td class='cbWriteFormT_col'>
		작성자<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input type='text' name='name' readonly value="${memberDTO.name }">
		<input type='hidden' name='id'	value='${memberDTO.id }'>
	</td>
</tr>
<tr>
	<td class='cbWriteFormT_col'>
		이메일<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input type='text' name='email1' value='${memberDTO.email }'>
		<font size='2'>@</font>
		<input type='text' name='email2' value='${memberDTO.email1 }'>
	</td>
</tr>



<tr>
	<td class='cbWriteFormT_col' >
		게시판 유형<font color='#e85581'><b>*</b></font>
	</td>
	<td id='cbWriteFormT_select_td'>
		<select name='clientboard_type1' id='clientboard_type1' class='cbWriteFormT_select'>
			<option>::게시판유형::</option>
			<option value='칭찬글/여행후기'>칭찬글/여행후기</option>
			<option value='개선의 소리'>개선의 소리</option>
		</select>
		&nbsp;
		<select name='clientboard_type2' id='clientboard_type2' class='cbWriteFormT_select'>
			<option>::게시판유형::</option>
		</select>
		&nbsp;
		<select name='clientboard_type3' id='clientboard_type3' class='cbWriteFormT_select' >
			<option>::게시판유형::</option>
		</select>
	</td>
</tr>
<tr>
	<td class='cbWriteFormT_col'>
		제목<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<input id='cbWriteFormT_subject' type='text' name='subject'>
	</td>
</tr>
<tr>
	<td class='cbWriteFormT_col'>
		게시글 내용<font color='#e85581'><b>*</b></font>
	</td>
	<td>
		<textarea name='content' id='cbWriteFormT_content'></textarea>
		<p id='cbWriteFormT_count'>
			<input type='text' name='count' value='0'> 
			/ 50자
		</p>
	</td>
</tr>
</table>
<div id='cbWriteFormT_bottomDiv'>
	<div id='cbWriteFormT_btDiv'>
	<button type="reset" id='cbWriteFormT_resetBt'>취 소</button>
	<button type="button" id='cbWriteFormT_writeBt'>등 록</button> 
	</div>
</div>
</form>
</td>
</tr>
</table>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var select = "<option>::게시판유형::</option>"; 
	
	$("#clientboard_type1").on('change',function() {		
		
		if($("#clientboard_type1").val() == "") { 
			// select의 value가 ""이면, "선택" 메뉴만 보여줌.
			$("#clientboard_type2").find("option").remove().end().append(select);
			$("#clientboard_type3").find("option").remove().end().append(select);
		} else {
			comboChange($(this).val());
			
		}
	});
	
	function comboChange(){
		$.ajax({
			type: "POST"
			, url: "/TwoTour/clientCenter/getClientBoard_type2.do"
			, data: {"clientboard_type1": $('#clientboard_type1').val()}
			, dataType: "json"
			, error: function(x, o, e){
				var msg = "페이지 호출 중 error!\n"+x.status+":"+o+":"+e;
				alert(msg);
			}
			, success: function(data){
				if(data.clientboard_type2List.length > 0){
					$('#clientboard_type2').find('option').remove().end().append(select);
					$("#clientboard_type3").find("option").remove().end().append(select);
					$.each(data.clientboard_type2List, function(index, item){
						$('#clientboard_type2').append($('<option/>',{
							value: item
							, text: item
						}));
					});
				}else{
					$('#clientboard_type2').find('option').remove().end().append($('<option/>',{
						text: 'No-Subtype'
						,value: ''
					}));
				}
			}
		});
	}//comboChange()
	
	//앞쪽: 부모  // 뒤쪽: 이벤트를 발생시키는 애
	$('#cbWriteFormT').on('change', '#clientboard_type2', function(){
		//alert("동기"+event.target.text());
		//alert('gg');
		console.log("clientboard_type2: "+$('#clientboard_type2').val());
		 $.ajax({
			type:"POST"
			, url: "/TwoTour/clientCenter/getClientBoard_type3.do"
			, data: {"clientboard_type2": $('#clientboard_type2').val()}
			, dataType: "json"
			, error: function(){
				alert("뜨지말자!!");
			}
			, success: function(data){
				console.log("clientboard_type3List: "+JSON.stringify(data.clientboard_type3List));
				if(data.clientboard_type3List===null){
					$('#clientboard_type3').find('option').remove().end().append($('<option/>',{
						text: 'No-Subtype'
					}));
				}else if(data.clientboard_type3List.length === 0){
					$('#clientboard_type3').find('option').remove().end().append($('<option/>',{
						text: 'No-Subtype'
					}));
				}else if(data.clientboard_type3List.length > 0){
					$('#clientboard_type3').find('option').remove().end().append(select);
					
					$.each(data.clientboard_type3List, function(index, item){
						$('#clientboard_type3').append($('<option/>',{
							value: item
							, text: item
						}));
					});//.each
				}else{
				}
			}//success
		});//.ajax	
	});

	
	$("#cbWriteFormT_content").on('keyup', function(event) {
	    var currentString = $("#cbWriteFormT_count").val()
	    $("#cbWriteFormT_count>input").val(currentString.length);
	    if (currentString.length <= 50 )  { 
	    	$("#cbWriteFormT_count>input").css('color','#000000');
	    } else {
	    	$("#cbWriteFormT_count>input").css('color','red');
	    }
	});
	$('#cbWriteFormT_writeBt').on('click', function(){
		if($('#cbWriteFormT_subject').val()==''){
			alert('제목입력해주세요.');
		}else if($('#cbWriteFormT_content').val().length==0){
			alert('내용입력해주세요.');
		}else{
			$('#cbWriteForm').submit();
			return false;
		}
		
	});
});  
</script>
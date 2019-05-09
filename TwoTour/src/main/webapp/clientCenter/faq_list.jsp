<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' type='text/css' href='/TwoTour/css/clientCenter/faq_list.css'>
<style>
@charset "utf-8";

#faq_conts_head{
	/* border: 2px indigo dashed; */
	position: relative;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 40px;
}
#faq_search_div{
	/* border: 2px sienna solid; */
	position: absolute;
	top: 0px;
	left: 500px;
	/* right: 0px; */
	width: 360px;
	hegith: 30px;
}
#total_span{
	/* border: 1px red solid; */
	font: bold 13px Tahoma, Arial ;
}

#faq_search_subDiv1{
	/* border: 1px solid yellow; */
	display: inline-block;
	position: absolute;
	float: left;
	top: 2px;
	width: 180px;
	height: 30px;
}
#faq_search_subDiv2{
	/* border: 1px dashed blue; */
	display: inline-block;
	position: absolute;
	float: none;
	top: 0px;
	left: 180px;
	width:95px;
	height: 30px;
}

#faq_search_subDiv3{
	/* border: 1px solid red; */
	display: inline-block;
	position: absolute;
	float: none;
	top: 0px;
	left: 275px;
	width: 80px;
	height: 30px;
}
#faq_search_ip{
	top: 0px;
	width: 167px;
	height: 28px;
	font: 13px Tahoma, Arial;
} 

#faq_search_bt{
	position: absolute;
	border: none;
	background: none;
	paadding: 0;
	left: 196px;
}
#faq_wirte_bt{
	position: absolute;
	border: none;
	background: none;
	paadding: 0;
	/* left: 276px; */
}
#faq_search_img{
	cursor: pointer;
}
#faq_write_img{
	cursor: pointer;
}


#faq_summary_div{
	/* border: 1px blue dashed; */
	position: relative;
	height: 80px;
}
#faq_summayT{
	border-collapse: collapse;
	border-top: 1px solid #d5d5d5;
}
#faq_summaryT td{
	border: 0.5px solid #d5d5d5;
	width:214px;
	height: 30px;
	top: 10px;
	font: 15px Tahoma, Arial;
	text-align: center;
}


#faq_cont_faqList_div{
	/* border: 1px crimson solid; */
	position: relative;
}
#faqListT{
	border-collapse: collapse;
}
#faqListT td{
	border-top: 0.5px solid #d5d5d5;
	border-bottom: 0.5px solid #d5d5d5;
	width: 858px;
	height: 20px;
	top: 10px;
	font: 15px Tahoma, Arial;
	text-align: left;
	padding: 15px;
}
tr.ot_subject{
	cursor: pointer;
	font: 15px Tahoma, Arial;
}
tr.ot_content{
	font: 15px Tahoma, Arial;
}





</style>
<div id='faq_conts_head'>
	<h6>
	
	
	
	
	
	
	<!-- total처리해야한다!! -->
	
	
	
	
	<span id='total_span'>( <span id='total_title'> </span> 건)</span>
	
	
	
	
	
	
	
	
	</h6>
	<div id='faq_search_div'>		
		<div id='faq_search_subDiv1'>
			<input type='text' id='faq_search_ip' placeholder='자주하는 질문 검색' maxlength='10'>
		</div>
		<div id='faq_search_subDiv2'>
			<button  class='faq_search_bt'><img id='faq_search_img' src='/TwoTour/image/clientCenter/searchBt.jpg'> </button>
		</div>
		<c:if test='${memId eq "admin" }'>
		<div id='faq_search_subDiv3'>
			<button  class='faq_write_bt'><img id='faq_write_img' src='/TwoTour/image/clientCenter/writeBt.jpg'> </button>
		</div>
		</c:if>
	</div>
</div><!-- faq_conts_head -->
<div id='faq_summary_div'>
<table id='faq_summaryT'>
<tr>
	<td id='faq00'></td>
	<td id='faq01'></td>
	<td id='faq02'></td>
	<td id='faq03'></td>
</tr>
<tr>
	<td id='faq10'></td>
	<td id='faq11'></td>
	<td id='faq12'></td>
	<td id='faq13'></td>
</tr>
</table>
</div>
<div id='faq_cont_faqList_div'>
<table id='faqListT'>

</table>
</div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
var summaryname='';
$(document).ready(function(){
	$('#faq_write_img').on('click',function(){
		location.href='/TwoTour/clientCenter/faq_writeForm.do';
	});
	summaryname='${summary}';
	if(summaryname=='oversea'){
		summaryname='해외항공권';
	}else if(summaryname='domestic'){
		summaryname='국내항공권';
	}
	$.ajax({
		type: "POST"
		, url: "/TwoTour/clientCenter/faq_type_list.do"
		, data: {"summaryname": summaryname, "type":"모두"}
		, dataType: "json"
		, error: function(){
			alert("error!! 여긴 딱 처음 들어왔을 떄 한 번만!!!");
		}
		, success: function(data){
			/* alert(JSON.stringify(data)); */
			/* var data = data; */
			
			$.each(data.summaryList, function(index, item){
				var row = Math.floor(index /4);
				var col = index % 4;
				var idName = "faq"+row+col;
				$('#' + idName).text(item); ///왜 안될까 ㅠㅠㅠ...yeah~~~
				$('#' + idName).attr('name',item);
				$('#' + idName).css('cursor','pointer');
			});//$.each_summaryList
			
			$.each(data.faqList, function(index, item){
				console.log("현재index: "+index);
				$('<tr/>',{
					class: 'ot_subject'
					, id: index
				}).append($('<td/>',{
					text: item.subject
				})).appendTo($('#faqListT'));
				$('<tr/>',{
					class: 'ot_content'
					, id: index
					, width: '856px'
				}).append($('<td/>').append($('<pre/>',{
					text: item.content
				}))).appendTo($('#faqListT'));
			});//$.each_faqList
			
			$('.ot_content').hide();//success안 쪽 맞겠지?!
			//$('#faq_search_ip').focus();
			$('#faq_conts_head>h6').text(summaryname);
			$('span#total_title').text(data.totalA);
		}//success
	});//$.ajax
	
	//지금 1빠 문제. tr의 hover가 안되고 있어 씹...
	/* $('#faqListT>tr:gt(0)').hover(function(event){
		console.log("hover: "+event.target.tagName);
	}); */
	var previous= '';
	$('#faqListT').on('mouseenter','tr.ot_subject',function(){
		$(event.target).css('font-weight','bold');
	}).on('mouseleave','tr.ot_subject',function(){
		$(event.target).css('font-weight', 'normal');
	}).on('click', 'tr.ot_subject', function(){
		var index= $(this).prop('id');
		if(previous!=index){
			//console.log("동기index:  "+index);
			//console.log("id: "+$('tr.ot_content').eq(index).prop('id'));
			$('tr.ot_content').eq(previous).css('display','none');
			$('tr.ot_content').eq(index).css('display','table-row');
			$('tr.ot_content').eq(index).css('background-color','#f8f8f8');
			previous = $(this).prop('id');
		}else if(previous===index){
			$('tr.ot_content').eq(index).css('display','none');
			previous = -1;
		}
		
		
		
		
		//console.log("previous: "+previous);
	});
	
	$('#faqListT').on('click', 'tr.ot_content_on', function(){
		
	});
	$('#faq_summaryT').on('mouseenter','tr',function(){
		$(event.target).css('font-weight','bold');
		$(event.target).css('background-color','#f8f8f8');
	}).on('mouseleave','tr',function(){
		$(event.target).css('font-weight', 'normal');
		$(event.target).css('background-color','#ffffff');
	});
	
	
	$('#faq_summaryT').on('click','td',function(){
		//alert($(this).text());
		$.ajax({
			type: "POST"
			, url: "/TwoTour/clientCenter/faq_type_list.do"
			, data: {"summaryname": summaryname, "type":$(this).text()}
			, dataType: "json"
			, success: function(data){
				$('#faqListT>tr:gt(0)').remove();
				$('#faqListT>tr:eq(0)').remove();
				$.each(data.faqList, function(index, item){
					$('<tr/>',{
						class: 'ot_subject'
						, id: index
					}).append($('<td/>',{
						text: item.subject
					})).appendTo($('#faqListT'));
					$('<tr/>',{
						class: 'ot_content'
						, id: index
					}).append($('<td/>').append($('<pre/>',{
						text: item.content
					}))).appendTo($('#faqListT'));
				});//$.each		
				$('.ot_content').hide();
			}//success
		});
	});
	

});

</script>
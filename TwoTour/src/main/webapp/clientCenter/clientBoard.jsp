<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<style>
#clientBoard_container{
	/* border: 1px solid black; */
	/* position: relative;
	width: 1064px;
	height: 1000px;/*높이 고정안되나?? : 된다:  873px*/ 
	margin: 0 auto;
	position:absolute; top:150px; height:655px; width:100%;
	background-color:#ffffff;'
}

#clientBoard_head{
	/* border: 1px solid blue; */
	margin-top: 10px;
	font-size: 20px;
    font-weight: 600;
    height: 60px;
}

</style>
<div id='clientBoard_container'>
<div id='clientBoard_head' >
<p>고객게시판</p>
</div>
<div id='clientBoard_conts' style='height:700px'>
	<jsp:include page="${display_clientBoard }" />
</div>

</div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

$('#cc_right_menu').css('display', 'block');
$(window).bind("beforeunload", function(){
	$('#cc_right_menu').css("display", 'none');
});

</script>
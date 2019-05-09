<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<link rel='stylesheet' type='text/css' href='/TwoTour/css/clientCenter/consult.css'>
<div id='consult_container' style='position:absolute; top:150px; height:655px; width:100%;background-color:#ffffff;'>

<div id='consult_head' style='height: 60px;'>
<p>상담문의</p>
</div>
<div id='consult_conts'>
	<jsp:include page="${display_consult }" />
</div>
</div><!-- consult_container -->

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

$('#cc_right_menu').css('display', 'block');
$(window).bind("beforeunload", function(){
	$('#cc_right_menu').css("display", 'none');
});

</script>
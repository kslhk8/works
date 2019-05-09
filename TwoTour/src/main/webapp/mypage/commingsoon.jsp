<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){//페이지 오픈
	$('#body').css('height', '500px');
	
});
$(window).bind('beforeunload', function(){//페이지 클로즈 시
	$('#body').css('height', '700px');
});
</script>

<title>Insert title here</title>
<style>

.commingsoon{
	position:absolute;
	top:100px;
	left:50px;
	width:600px;
	height:250px;
	background:url(not_ready.PNG) no-repeat left 0;
}
</style>

</head>
<body>
<div class="commingsoon"></div>
</body>
</html>
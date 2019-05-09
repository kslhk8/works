<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){//페이지 오픈
	$('#ko').click(function(){
		$('#ko').attr("value","수정완료");
		$('#ko').attr("id","bobo");
		
		alert($(this).attr("id"));
	})
});
</script>
	<body>
<input type="button" id="ko" value="수정하기">

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
window.onload= function(){
	if('${reservation_result}'=="예약성공"){
		alert("예약번호를 메일로 전송하였습니다.");
		location.href="/TwoTour/main/index.do";	
	}
	else if('${result}'=='reservation'){
		alert("예약되었습니다.");
		location.href="/TwoTour/mypage/mypage.do"
	}
	
	if('${pay_result}'=="결제성공"){
		alert("결제번호를 메일로 전송하였습니다.");
		location.href="/TwoTour/main/index.do";	
	}
	else if('${result}'=='pay'){
		alert("${total_price}원결제되었습니다.");
		location.href="/TwoTour/mypage/mypage.do"
	}
	if('${result}'=='modify'){
		alert("수정 되었습니다.")
		location.href="/TwoTour/mypage/mypage.do"
	}
	if('${reservation_result}'=='예약취소'){
		alert("예약취소 내역을 메일로 전송하였습니다.");
		location.href="/TwoTour/main/index.do";	
	}
	else if('${result}'=='cancel'){
		alert("취소 되었습니다.");
		location.href="/TwoTour/main/index.do";	
	}
	
	if('${pay_result}'=='pay_cancel'){
		alert("결제 취소내역을 메일로 전송하였습니다.")
		location.href="/TwoTour/main/index.do"
	}
	else if('${result}'=='pay_cancel'){
		alert("결제취소 되었습니다. \n ${total_price}원 환불 되었습니다.")
		location.href="/TwoTour/mypage/mypage.do"
	}
}
</script>
</head>
<body>

</body>
</html>
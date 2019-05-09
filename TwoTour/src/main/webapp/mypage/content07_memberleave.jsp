<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#member_leave h3 {
    margin-bottom: 10px;
    height: 13px;
    padding-left: 12px;
    font-size: 14px;
    background: url(//image1.hanatour.com/2010/images/mypage/ico_leave.gif) no-repeat 0 4px;
    color: #424242;
    letter-spacing: -1px;
}
#member_leave {
    position: relative;
    height: 171px;
    width: 680px;
    margin: 29px 0 30px;
    border-bottom: 2px solid #41444D;
    background: url(//image1.hanatour.com/2010/images/mypage/img_leave.gif) no-repeat 0 0;

}

</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function memberleave(){
	$.ajax({
		type:"POST",
        url:"/TwoTour/mypage/deleteMember.do",
        data:{'id' : '${memId}'},
	});
	
	alert('회원탈퇴 완료');
	location.href="/TwoTour/main/index.do";
	
};
</script>
</head>
<body>
<div id="memberLeaveWrap" style="position:absolute;left:20px;">
	<h2><img src="http://image1.hanatour.com/2010/images/mypage/h_meber_cancel.gif" 
		alt="회원탈퇴"></h2>

	<div id="member_leave"></div>
	
	
	<div class="btn_area" style="position:absolute;left:150px;">
	<a href="#" id="leave" onclick="javascript:memberleave();">
		<img src="http://image1.hanatour.com/2010/images/mypage/btn_member_leave.gif" alt="회원탈퇴">
	</a>
	<a href="#" id="cancel" onclick="javascript:location.href='/TwoTour/mypage/mypage.do';">
		<img src="http://image1.hanatour.com/2010/images/mypage/btn_member_cancel.gif" alt="취소">
	</a>
	</div>

</div>
</body>
</html>
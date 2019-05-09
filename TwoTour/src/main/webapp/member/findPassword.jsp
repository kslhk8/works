<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/TwoTour/member/findPw.do" id="findForm" method="post">
    <fieldset>
        <legend class="screen_out">비밀번호 찾기 폼</legend>
 
 
 		<div class="box email">
            <label for="email">아이디</label>
            <input type="text" id="id" name="id" autofocus autocomplete="off" required />
        </div>
        
        <div class="box email">
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" autofocus autocomplete="off" required />
        </div>
        <!-- // .box.email -->
 
        <div class="box btn">
            <button type="submit" class="btn join">
                <i class="fa fa-envelope"></i>
               		 이메일 전송
            </button>
        </div>
        <!-- // .box.btn -->
    </fieldset>
</form>
</body>
</html>
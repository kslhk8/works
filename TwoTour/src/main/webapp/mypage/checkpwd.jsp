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
	$('#body').css('height', '500px');

	$("#submit").on('click', function(){
		var id = $('#id').text();
		var pwd = $('#pwd').val();
		var paramData = ${param.data};
		
		if(pwd==""){
			alert("비밀번호를 입력하세요");
		
		}else{
			
			 $.ajax({
				type : "POST",
				url :"/TwoTour/mypage/checkidandpwd.do",
				data : {"id" : id, "pwd" : pwd },
				success : function(data){
					
						if(data == 'incorrect'){
							alert('비밀번호가 틀렸습니다');
						
						}else if(data == 'correct'){
							
							if(paramData=='1'){
								$('#checkpwd').attr('action', '/TwoTour/mypage/changeinfo.do');
							}else if(paramData=='2'){
								$('#checkpwd').attr('action', '/TwoTour/mypage/memberleave.do');
							}
							
							$('#checkpwd').submit();						
						}
					
				}
				
			}); 
			
		}	
	});
});
$(window).bind('beforeunload', function(){//페이지 클로즈 시
	$('#body').css('height', '1350px');
});

</script>
<style>
.wrap{
	position:absolute;
	top:70px;
	left:50px;
	width:600px;
	height:300px;
	border:1px solid #777;
}

.p{font-size:16px;font-weight:1000;color:#686767;margin-left:100px;margin-top:40px;}
.p2{font-size:16px;font-weight:1000;color:#dc108a;margin-left:160px;margin-top:8px;}

.innerdiv{position:relative;height:100px;width:400px;top:30px;
	left:100px; background-color:#f1f1f1;}
.span2{position:relative;color:black;font-size:20px;margin-top:10px;margin-left:10px;float:left;}

table{position:absolute; top:10px;left:40px;font-size:18px;color:black;}
table tr{height:40px;}
input{width:150px; height:30px;}
</style>
</head>
<body>
<h4 style="margin-left:10px;margin-top:10px">
<img alt="비밀번호 재입력" src="http://image1.hanatour.com/2010/images/mypage/h_pw_confirm.gif">
</h4>
<div class="wrap">
	<p class="p">${memId}님의 정보를 안전하게 보호하기 위하여 <br>
			<p class="p2">비밀번호를 다시 한번 확인합니다</p></p>
	
	<div class="innerdiv">
		<form id="checkpwd" name="checkpwd" method="post" action="">
			<input type="hidden" name="id" value="${memId}" />
 			<table>
				<tr>
					<td width="130px"><li>아이디 </li></td>
					<td width="200px" style="color:#3d3d3d"><span id="id">${memId}</span></td>
				</tr>
				<tr>
					<td><li>비밀번호</li></td>
					<td>
						<input id="pwd" name="pwd" type="password"/>
					</td>
				</tr>
			</table> 
		
		
		
		
		
		
	<%--	
		
				<span class="span2" style="positon:absolute;left:-220px"><li>아이디 : </li></span>
				<span class="span2" id="id">${memId}</span>
				
				<input type="hidden" name="id" value="${memId}" />
				
				<span class="span2" style="position:absoulte;top:40px;left:-220px;"><li>비밀번호</li></span>
 				<input id="pwd" class="span2" type="password" name="pwd" width="80px" height="30px"
					   style="margin-left:10px;">	 
	--%>
		</form>
	</div>
	
	<div class="btn_area" style="position:relative;margin-left:200px;top:50px;">
	<a id="submit" href="">
		<img alt="확인" src="http://image1.hanatour.com/2010/images/mypage/btn_confirm2.gif">
	</a> &nbsp;&nbsp;
	<a href="javascript:history.go(-1);">
		<img alt="취소" src="http://image1.hanatour.com/2010/images/mypage/btn_cancel4.gif">
	</a>
	</div>	
	
	
</div>


</body>
</html>
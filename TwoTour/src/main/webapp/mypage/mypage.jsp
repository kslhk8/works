<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	


<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	 $('#mypage_menu').css('display', 'block');
	 $('#mypage_menu').css("background", 
			"url('/TwoTour/mypage/topmenu.PNG') no-repeat left 0"); 


	//��ü�޴�
	 $('#whole_menu').click(function(){
		  if($('#whole_menu_div').css('visibility')=='hidden'){
			  $('#whole_menu_div').hide();
			  $('#mypage_wrap01').css('z-index','0');
			  $('#mypage_wrap01').css('opacity','1');
		  }
		  else if($('#whole_menu_div').css('visibility')=='visible'){
			  $('#whole_menu_div').show();
			  $('#mypage_wrap01').css('z-index','-1');
			  $('#mypage_wrap01').css('opacity','0.2');
		  }
	  }); 
	
	
	//���ʸ޴�
	$('.depth2').on('click', function(){
		$(this).toggleClass("open");
	});
	

	
});
$(window).bind("beforeunload",function(){
	$('#mypage_menu').css("display","none");

});

</script>
<link rel="stylesheet" type="text/css" href="../css/mypage/mypage.css"/>


<style>

/* 
   padding: 0px 10px �̶�� ���� 0px �¿� 10px��
   padding: 10px 0px 10px 0px �� ����
   
   
 */

/*
	 
	font-family: sans-sarif;
	font-size: 16px;
	line-height: 1.5;
	letter-spacing:1.2em; /* �ڰ� */

*/




</style>



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ϳ�����</title>
</head>
<body>


<div id="mypage_right_menu"></div>



 <div id="mypage_wrap01" >

	<div id="lnb_leftmenu" >
		<h4 >����������</h4>
		<ul class="menu_list">
			<li><a href="/TwoTour/mypage/mypage.do">���� ���ຸ��</a></li>
			<li><a href="/TwoTour/mypage/commingsoon.do">���� ����Ȯ��</a></li>
			<li class="depth2 one"><a href="#">���� ����Ʈ</a>
				<ul>
					<li><a href="/TwoTour/mypage/searchPoint.do" class="on">������ȸ</a></li>
					<li><a href="/TwoTour/mypage/commingsoon.do">���ȳ�</a></li>
					<li><a href="/TwoTour/mypage/commingsoon.do">����Ʈ�絵</a></li>
					<li><a href="/TwoTour/mypage/commingsoon.do">��������Ʈ����</a></li>
				</ul>
			</li>
			<li><a href="/TwoTour/mypage/basket.do">���� ��ٱ���</a></li>
			<li class="three"><a href="/TwoTour/mypage/checkpwd.do?data=1">���� ��������</a>
			</li>
			<li><a href="/TwoTour/mypage/checkpwd.do?data=2">ȸ��Ż��</a></li>	
		</ul>
		

	</div> 
	

	
	<!-- ���� body -->
	<div id="contents" style="">
		<jsp:include page="${contents}"></jsp:include>
		
	</div>
</div> 
</body>
</html>


















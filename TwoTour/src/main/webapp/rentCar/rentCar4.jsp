<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
   window.onload= function(){
	   if('${result}'=='pay'){
			alert("${total_price}�� �����Ǿ����ϴ�.");
			location.href="/TwoTour/mypage/mypage.do"
		}
   }
</script>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
   window.onload= function(){
	   if('${result}'=='pay'){
			alert("${total_price}원 결제되었습니다.");
			location.href="/TwoTour/mypage/mypage.do"
		}
   }
</script>
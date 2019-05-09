<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel='stylesheet' type='text/css' href='/TwoTour/css/clientCenter/faq.css'>
<div id='faq_container' style='position:absolute; top:150px; height:655px; width:100%;background-color:#ffffff;'>
<div id='faq_head'>
	<p>자주하는 질문</p>
</div>
<div id='faq_category'><!-- 여기까지 relative -->
	<div id='faq_category_index'>
		<div id='faq_category_indexTitle'>
			<p>카테고리 선택</p>
		</div>
		<ul id='faq_category_ul' style='list-style: none;'>
			<li><a href='/TwoTour/clientCenter/faq.do?summary=oversea'>해외항공권</a></li>
			<li><a href='/TwoTour/clientCenter/faq.do?summary=domestic'>국내항공권</a></li>
			<li><a href='#'>해외호텔</a></li>
			<li><a href='#'>국내숙박/팬션</a></li>
			<li><a href='#'>해외패키지</a></li>
			<li><a href='#'>허니문</a></li>
			<li><a href='#'>성지순례</a></li>
			<li><a href='#'>자유여행</a></li>
			<li><a href='#'>골프여행</a></li>
			<li><a href='#'>국내여행</a></li>
			<li><a href='#'>해외박람회</a></li>
			<li><a href='#'>상품예약/결제</a></li>
			<li><a href='#'>사이트이용안내</a></li>
			<li><a href='#'>회원혜택안내</a></li>
			<li><a href='#'>금융서비스</a></li>
		</ul>
	</div><!-- category_index -->
	<div id='faq_conts'>
		<jsp:include page="${display_faq }" />
	</div><!-- faq_conts -->
</div><!-- category -->

</div><!-- container -->
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
$('#cc_right_menu').css('display', 'block');
$(window).bind("beforeunload", function(){
	$('#cc_right_menu').css("display", 'none');
});
$(document).ready(function() {
	$('ul#faq_category_ul > li').hover(font_colored, font_uncolored);
	$('ul#faq_category_ul > li').hover(category_li_open, category_li_close);
});

function category_li_open(){
	/* console.log("open들어왔냐");
	$('ul#faq_category_ul>li>a').append('<img>', {
		id: 'category_arrow'
		, src: '../image/pinkArrow.jpg'
	}); 왜안됭??!!*/
	$('<img>').attr({
		src:'/TwoTour/image/clientCenter/pinkArrow.jpg'
		, id:'category_img_arrow'
		, 'class': 'hover_img'/*이것도 왜안돼 ㅠㅠㅠ.....*/
	}).appendTo(this);//'ul#faq_category_ul>li>a'
}

function category_li_close(){
	/* console.log("close들어오고 있잖아");
	$('ul#faq_category_ul>li>a').remove('img); 왜안됭??!! */
	$('ul#faq_category_ul>li>a>img').remove(); //이건 됬다가 한놈만(this) 되게 하니까 안되 ㅠㅠㅠ
	/* $(this).remove('ul#faq_category_ul>li>a>img'); 이것도 안돼!!!*/
	/* $(this).remove('#category_img_arrow'); */
	$('#category_img_arrow').remove();
}

function font_colored() {
	$(this).find('a').css('color', '#f63d8b');
}
function font_uncolored() {
	$(this).find('a').css('color', '#4d4d4d');
}



</script>
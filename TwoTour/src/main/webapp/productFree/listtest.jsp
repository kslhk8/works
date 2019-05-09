<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<link rel='stylesheet' href='/TwoTour/css/productFree/listtest.css'>
<span>${map.tripType }  ${map.depart_city }</span>


<table border='1' id='airplane_scheduleTT'>
<tr class='airplane_scheduleTT_th'>
	<td width='270px'>
		항공사
	</td>
	<td width='100px'>
		경유
	</td>
	<td width='100px'>
		유효기간
	</td>
	<td width='100px'>
		총비행시간
	</td>
	<td width='270px'>
		성인1인총요금
	</td>
</tr>


<c:forEach var='combiMap1' items='${combiMap1 }' varStatus='num'>
<%--  <c:set var="amount" value="${combiMap1.value.size()}"/> --%>
<%-- <c:if test='${groupNum != airplaneDTO.groupnum  }'  > --%>
<tr>
	<td colspan='5' height='50px'>
	<div class='forClick ${combiMap1.key}'style='border:1px solid green;'>
		${combiMap1.key}// // ${num.index }
	</div>
	</td>
</tr>
<tr class='outType_tr' id='outType_tr${num.index }'  ><!-- style='display: none;' -->
	<td rowspan='2' width='270px'>
		<b>출국편</b>
		<br>
		<%-- <input type='text' name='' value='${combiMap1.value[num.index].depart_date}'> --%>
		${combiMap1.value[0].depart_date} ${combiMap1.value[0].depart_day }
	</td>
	<td colspan='4'>
		<span>${ combiMap1.value[0].depart_time}</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		>>>>>>>>>>>>>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${ combiMap1.value[0].arrive_time}
	</td>
</tr>


<tr id='next_outType_tr${num.index }'  ><!-- style='display: none;' -->
	<td  id='next_out${combiMap1.key}' colspan='5' height='50px'>
	
	</td>
</tr>
<tr class='inType_tr' id='inType_tr${num.index }'  ><!-- style='display: none;' -->
	<td rowspan='2' width='270px'>
		<b>귀국편</b>
		<br>
		${combiMap1.value[1].depart_date} ${combiMap1.value[1].depart_day }
	</td>
	<td colspan='4'>
		<span>${ combiMap1.value[1].depart_time}</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		>>>>>>>>>>>>>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${combiMap1.value[1].arrive_time}
	</td>
</tr>


<tr id='next_inType_tr${num.index }'  ><!-- style='display: none;' -->
	<td id='next_in${combiMap1.key}' colspan='5' height='50px'>
	
	</td>
</tr>

<%-- </c:if> --%>
<%-- <c:set var="groupNum" value="${airplaneDTO.groupnum }"/>  --%>

<ul id='testul_${num.index}' style='display:none;'>
	<li class='testil' id='testil_combiMap1_amount' value='${fn:length(combiMap1.value)}'>${fn:length(combiMap1.value)}</li>
	<li class='testil' id="testil_airplane_code"></li>
	<li class='testil' id="testil_depart_city"></li>
	<li class='testil' id="testil_depart_date"></li>
	<li class='testil' id="testil_depart_time"></li>
	<li class='testil' id="testil_arrive_city"></li>
</ul>
</c:forEach>

</table>
<div id='' style='display: none;'>
<input type='hidden' name='combiMap1_forAjax' value='${combiMap1}'>
<input type='hidden' name='tripType_forAjax' value='${firstMap.tripType}'>
<input type='hidden' name='depart_city_forAjax' value='${firstMap.depart_city}'>
<input type='hidden' name='depart_date_forAjax' value='${firstMap.depart_date }'>
<input type='hidden' name='arrive_city_forAjax' value='${firstMap.arrive_city}'>
<input type='hidden' name='return_date_forAjax' value='${firstMap.return_date}'>
</div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	console.log("????오자오자 들어오자");
	//console.log("추워:"+$('#testul_'+index).find('#testil_combiMap1_amount').val());
	
 	$.ajax({
		type: "POST"
		, url: "/TwoTour/productFree/test_freeResult.do"
		, data: {
			"combiMap1": $('input[name="combiMap1_forAjax"]').val()
			, "tripType":$('input[name="tripType_forAjax"]').val()
			, "depart_city":$('input[name="depart_city_forAjax"]').val()
			, "arrive_city":$('input[name="arrive_city_forAjax"]').val()
			, "depart_date":$('input[name="depart_date_forAjax"]').val()
			, "return_date":$('input[name="return_date_forAjax"]').val()
		}
		, dataType: "json"
		, error: function(x, o, e){
			var msg = "페이지 호출 중 error!\n"+x.status+":"+o+":"+e;
			alert(msg);
		}
		, success: function(data){
			alert(JSON.stringify(data));
			$.each(data.rtMap ,function(index, item){
				
				/* if(item.lev>0){
					console.log("제발 들어와줘..:");	
					$('#next_hide_tr').find('td').html("<span>"+item.depart_time+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>>>>>>>>>>>>>"				
					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+item.arrive_time);
				} */
				//console.log(index);
				//console.log(item[0].airplane_code);
				/* $('#next_outn${combiMap1.key}').html("<span>"
						+item[0].depart_time+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>>>>>>>>>>>>>"				
						+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+item[0].arrive_time); */
				$('#next_out'+index).html("<span>"
						+item[0].depart_time+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>>>>>>>>>>>>>"				
						+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+item[0].arrive_time);
				$('#next_in'+index).html("<span>"
						+item[1].depart_time+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>>>>>>>>>>>>>"				
						+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+item[1].arrive_time);
				
			});
		}
	});	
 	$('div.forClick').hover(function(){
 		$(this).attr('style','cursor:pointer;');
 	}, function(){
 		$(this).attr("style", 'cursor:none;');
 	})
 	$('div.forClick').on('click', function(){
 		console.log("클릭이벤트가 발생안하는거 같아..");
 		$(this).parent().parent().next().css('display','table-row');
 		$(this).parent().parent().next().next().css('display','table-row');
 	})
});

</script>
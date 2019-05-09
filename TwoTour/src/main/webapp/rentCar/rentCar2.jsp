<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="rentCar.dao.RentCarDAO"%>
<%@page import="rentCar.bean.RentCarDTO"%>    
<%@page import= "java.util.List" %> 
<link rel="stylesheet" type="text/css" href="../css/rentCar/rentCar2.css" />
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../js/rentCar/rentCar2.js"></script>
<script type="text/javascript">
function rentCarPaging(pg){
	location.href="/TwoTour/rentCar/rentCar2.do?pg="+pg+"&rentlocation=${rentlocation}&returnlocation=${returnlocation}&rentTime=${rentTime}&returnTime=${returnTime}&rentMinute=${rentMinute}&rentHour=${rentHour}&returnMinute=${returnMinute}&returnHour=${returnHour}";
	
}

function reservation(seq){
		$('#get_seq').val(seq);
	if('${memId}'==''){
		$('#loginForm_inform_wrap').css("visibility","visible");
		 $('#rentCar2').css('opacity','0.2');
		 $('#loginForm_inform_wrap').css('opacity','1');
	}
	else{
		location.href="/TwoTour/rentCar/rentCar3.do?no_member=member&seq="+seq+"&rentlocation=${rentlocation}&returnlocation=${returnlocation}&rentTime=${rentTime}&returnTime=${returnTime}&rentMinute=${rentMinute}&rentHour=${rentHour}&returnMinute=${returnMinute}&returnHour=${returnHour}";
	}
}

function initMap() {;
	if('${rentlocation}'=='��õ��������(ICN), ����, ���ѹα�'){var uluru = {lat: 37.448783, lng: 126.451230};}
	else if('${rentlocation}'=='���ֱ�������(CJU), ����, ���ѹα�'){var uluru = {lat: 33.507062, lng:126.493073 };}
	else if('${rentlocation}'=='������������(GMP), ����, ���ѹα�'){var uluru = {lat: 37.559021, lng: 126.802935 };}
	else if('${rentlocation}'=='ȣ���籹������(HNL), ȣ����, �̱�'){var uluru = {lat: 21.324773, lng:-157.924902 };}
	else if('${rentlocation}'=='ī�Ƿ��̰���(OGG), ������, �̱�'){var uluru = {lat: 20.896802, lng:-156.433024 };}
	else if('${rentlocation}'=='�ڳ�����(KOA), ŰȦ,�Ͽ���, �̱�'){var uluru = {lat: 19.736916, lng:-156.042549 };}
	else if('${rentlocation}'=='�ν�����������������(LAX), �ν���������, �̱�'){var uluru = {lat: 33.941954, lng:-118.408669 };}
	else if('${rentlocation}'=='�������ý��ڱ�������(SFO), �������ý���, �̱�'){var uluru = {lat: 37.621466, lng:-122.379245 };}
	else if('${rentlocation}'=='�������ɳ׵�������(JFK), ����, �̱�'){var uluru = {lat: 40.641580, lng: -73.778311};}
	else if('${rentlocation}'=='�������������(CDG), �ĸ�, ������'){var uluru = {lat: 49.009951, lng:2.547570 };}
	else if('${rentlocation}'=='�ڱ׷������(ZAG), �ڱ׷���, ũ�ξ�Ƽ��'){var uluru = {lat: 45.740773, lng:16.067372 };}
	else if('${rentlocation}'=='����'){var uluru = {lat: 48.353946, lng:11.774575 };}
	else if('${rentlocation}'=='����ũǪ��Ʈ'){var uluru = {lat: 50.050577, lng:8.570974 };}
	else if('${rentlocation}'=='�ٸ����γ�����(BCN), �ٸ����γ�, ������'){var uluru = {lat:41.303006, lng:2.079322 };}
	else if('${rentlocation}'=='����Ÿ��������(NRT), ����, �Ϻ�'){var uluru = {lat:35.772431, lng:140.392399 };}
	else if('${rentlocation}'=='�����ī����(FUK), �����ī, �Ϻ�'){var uluru = {lat:33.590413, lng:130.446795 };}
	else if('${rentlocation}'=='����ī'){var uluru = {lat:34.789932,  lng:135.438690 };}
	else if('${rentlocation}'=='���ϰ���(OKA), ��Ű����, �Ϻ�'){var uluru = {lat:26.206605, lng:127.650340 };}
	else if('${rentlocation}'=='�õ��'){var uluru = {lat:-33.943741,  lng:151.182637 };}
	else if('${rentlocation}'=='��Ŭ����'){var uluru = {lat:-37.005285,  lng:174.782683 };}
	else if('${rentlocation}'=='��'){var uluru = {lat: 13.486819, lng:144.800810 };}
	else if('${rentlocation}'=='�����Ǳ�������(SPN), ������, ������'){var uluru = {lat:15.120232,  lng:145.727440 };}
	else if('${rentlocation}'=='�Ƹ����̰���(ROR), �ڷθ�, �ȶ��'){var uluru = {lat:7.367633, lng:134.539288 };}
	else if('${rentlocation}'=='ĭ��'){var uluru = {lat:21.042053,  lng:-86.874723 };}
	else if('${rentlocation}'=='â�� ���� (SIN), �̰�����'){var uluru = {lat: 1.359882, lng:103.989681 };}
	else if('${rentlocation}'=='��ŸŰ���߷�'){var uluru = {lat:5.925573, lng:116.051103 };}
	else if('${rentlocation}'=='ȫ��'){var uluru = {lat:22.308325,  lng:113.917998 };}
    var map = new google.maps.Map(document.getElementById('googlemap'), {
      zoom: 16,
      center: uluru
    });
    var marker = new google.maps.Marker({
      position: uluru,
      map: map
    });
  }
$(document).ready(function(){
	$('#body').css('height','2000px');
	
	$('#rentHour2').val('${rentHour}');
	$('#rentMinute2').val('${rentMinute}');
	$('#returnHour2').val('${returnHour}');
	$('#returnMinute2').val('${returnMinute}');
	$('#ui-datepicker-div').hide();
	$('#ui-datepicker-div2').hide();
	
	
	
	
	$('#sel_calendar').click(function(){
		$('#ui-datepicker-div').show();
		$('.ui-datepicker-group-middle .ui-state-default').click(function(){
			var date = $(this).text();
			$('#txtPickUpTime').val('2017-12-'+date);
			$('#ui-datepicker-div').hide();
			
		});
		$('.ui-datepicker-group-last .ui-state-default').click(function(){
			var date = $(this).text();
			$('#txtPickUpTime').val('2018-01-'+date);
			$('#ui-datepicker-div').hide();
		});
		
	});
	$('#sel_calendar2').click(function(){
		$('#ui-datepicker-div2').show();
		$('.ui-datepicker-group-middle .ui-state-default2').click(function(){
			var date = $(this).text();
			$('#txtReturnTime').val('2017-12-'+date);
			$('#ui-datepicker-div2').hide();
			
		});
		$('.ui-datepicker-group-last .ui-state-default2').click(function(){
			var date = $(this).text();
			$('#txtReturnTime').val('2018-01-'+date);
			$('#ui-datepicker-div2').hide();
		});
	});
	$('.chk_chekbox').change(function(){	
		
		if($('#sum_optionlocationtypeal1').is(":checked")){var eurocar='ok'}else{var eurocar='no'}
		if($('#sum_optionlocationtypeal2').is(":checked")){var herlz='ok'}else{var herlz='no'}
		if($('#sum_optionlocationtypeal6').is(":checked")){var small='ok'}else{var small='no'}
		if($('#sum_optionlocationtypeal8').is(":checked")){var medium='ok'}else{var medium='no'}
		if($('#sum_optionlocationtypeal12').is(":checked")){var auto='ok'}else{var auto='no'}
		if($('#sum_optionlocationtypeal13').is(":checked")){var manual='ok'}else{var manual='no'}
		if($('#sum_optionlocationtypea1500').is(":checked")){var five='ok'}else{var five='no'}
		if($('#sum_optionlocationtypea1501').is(":checked")){var four='ok'}else{var four='no'}
		
		
		$.ajax({			
			type : "POST",
			url : "/TwoTour/rentCar/rentCarRadioChecked.do",
			data : "pg=${pg}&rentlocation=${rentlocation}&eurocar="+eurocar+"&herlz="+herlz+"&small="+small+"&medium="+medium+"&auto="+auto+"&manual="+manual+"&five="+five+"&four="+four,
			dataType : "json",
			success : function(data){
				
				$('.list_info').remove();
				$.each(data.list, function(index, items){
				 
					$("<li/>",{class :"list_info"}).append($("<p/>",{class:"rent_thumb"}).append($("<span/>",{class:"rent_ci"}).append($("<span/>",
							{class:"ir",text:"ZE"}))).append($("<img/>",{src:"../image/rentCar/"+items.imageName,style:"vertical-align: top;border:0;width:218px;height:144px;",class:"car_thumb"}))
							).append($("<div/>",{class:"rent_desc"}).append($("<div/>",{class:"chk_choice"}).append($("<input/>",{
								type:"checkbox", id:"rent_check0", class:"chk_chekbox", value:"0"})).append($("<label/>",{for:"rent_check0",id:"lbl_rent_check0",class:"rent_check",text:items.car_name}))
								.append($("<span/>",{class:"car_label",text:items.car_type+"/ ����(��ü)"}))).append($("<table/>",{
									width:"100%", cellpadding:"0", cellspacing:"0", class:"desc_list", summary:"ž���ο�,����������,���ӱ�Ÿ��,����Ÿ��"})
									.append($("<tbody/>").append($("<tr/>",{class:"bg"}).append($("<th/>",{text:"ž���ο�"})).append($("<td/>",{text:items.occupancy+"��"})).append($("<th/>",{text:"���ӱ� Ÿ��:"}))
											.append($("<td/>",{text:items.transmission_type}))).append($("<tr/>").append($("<th/>",{text:"����������:"})).append($("<td/>",
													{text:"����"})).append($("<th/>",{text:"����Ÿ��:"})).append($("<td/>",{text:"����"}))))).append($("<div/>",{class:"opt_alert"}).append($("<div/>",{class:"imply im_01"}).append($("<p/>",
															{class:"txt",text:"���๫����"}))).append($("<div/>",{class:"imply im_02"}).append($("<p/>",{class:"txt",text:"��������"}))).append($("<div/>",{class:"imply im_03"}).append($("<p/>"
																	,{class:"txt",text:"��������"}))))).append($("<div/>",{class:"rent_price"}).append($("<strong/>",{class:"tit_price",text:"���� �뿩 ���"})).append($("<strong/>",{class:"rent_total",text:"KRW"+items.price}))
																			.append($("<p/>",{class:"tax",html:"��"+items.price+"<br>����ȯ�� ���� <br> �� �뿩�� ���� (��������)"})).append($("<button/>",{class:"btn_reservation",id:"btnReservation",onclick:"javascript:reservation("+items.seq+"); return false;"}).append($("<span/>",{text:"�����ϱ�"})))
																			).appendTo($('.result_list'));
																			
							
					
	
				});	
			}
		});	
	});
	$('#sum_optionlocationtypeal00').click(function(){
		$('#sum_optionlocationtypeal').prop('checked',true);
		$('#sum_optionlocationtypeal5').prop('checked',true);
		$('#sum_optionlocationtypeal11').prop('checked',true);
		$('#sum_optionlocationtypeal14').prop('checked',true);
	});	
	
	$('#sum_optionlocationtypeal5001').click(function(){
		$('.list_info').remove();
	});
	
	$('#close_login').click(function(){
		$('#loginForm_inform_wrap').css("visibility","hidden");
		 $('#rentCar2').css('opacity','1');
		 $('#loginForm_inform_wrap').css('opacity','0.2');
	});
	
	//�α��ΰ���
	$('#login_id').keyup(function(){
		if($(this).val().length==0){
			$('#login_idDiv').text("���̵� �Է�");
		}
		else
			$('#login_idDiv').text("");
		});
	
	
	$('#login_pwd').keyup(function(){
		if($(this).val().length==0){
			$('#login_pwdDiv').text("��й�ȣ �Է�");
		}
		else
			$('#login_pwdDiv').text("");
		});
	//�α���
	$('#accpet_login').click(function(){
		$.ajax({
			type:"POST",
			url:"/TwoTour/member/login.do",
			data: "id="+$('#login_id').val()+"&pwd="+$('#login_pwd').val(),
			dataType:"text",
			success: function(result){
				if(result=="exist"){
					location.href="/TwoTour/rentCar/rentCar3.do?no_member=member&seq="+$('#get_seq').val()+"&rentlocation=${rentlocation}&returnlocation=${returnlocation}&rentTime=${rentTime}&returnTime=${returnTime}&rentMinute=${rentMinute}&rentHour=${rentHour}&returnMinute=${returnMinute}&returnHour=${returnHour}";
				}
				else if(result=="not_exist"){
					alert("���̵�Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");
					$('#login_id').focus();
				}
				else if(result=="empty"){
					if($('#login_id').val().length==0){
						$('#login_idDiv').text("���̵� �Է��ϼ���.");
					}
					if($('#login_pwd').val().length==0){
						$('#login_pwdDiv').text("��й�ȣ�� �Է��ϼ���.");
					}
				
				
				}
			}
		});
	});
	$('#go_writeForm').click(function(){
		location.href="/TwoTour/member/writeForm.do";
	});
	$('#search_id').click(function(){
		location.href="/TwoTour/member/findInform.do"
	});
	$('#search_pwd').click(function(){
		location.href="/TwoTour/member/findInform.do"
	})
});
$(window).bind('beforeunload',function(){
	$('#body').css('height','2000px');
});
</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9FgH0243gXnLYR1t6TqXKvpoYPri6_ak&callback=initMap">
    </script>
    <style>
    #currentPaging{
	color : red;
	text-decoration : underline;
	cursor:pointer;
}
#paging{
	color : black;
	text-decoration : none;
	cursor:pointer;
}
#privious{
	color : black;
	text-decoration : none;
	cursor:pointer;
}
#next{
	color : black;
	text-decoration : none;
	cursor:pointer;
}
    
    
    </style>
<div id="rentCar2" style="height:1900px; background-color:rgb(248,248,248);" onload="initialize()">
	<input type="hidden" name="seq" id="get_seq" value="">
	<div id="rentCar2_Div" style="height:100%; margin-top:40px; margin-bottom:40px;">
		<div id="rentCar2_Div1">
		<form id="checkSearch" name="checkSearch" method="get" action="/TwoTour/rentCar/rentCar2.do">
			<div class="search_option">
				<div style="height:100%;">
					<div id="search_div1">
						<ul style="height:166px;">
							<li style="width:100%;" class="f_left">
								<p class="title_name">�뿩��� / �Ͻ�</p>
								<div class="sel_input" style="width: 200px; padding: 3px 5px 2px 5px;">
									<input type="text" data-locid="#PickUpLocation" data-locname="#PickUpLocationNM" name="rentlocation" id="txtPickUpLocation" value="${rentlocation}">
								</div>
							</li>
							<li style="width:100%;" class="f_left">
								<div class="sel_input" style="width: 200px; padding: 3px 5px 2px 5px;">
									<input type="text" data-locid="#PickUpTime" data-locname="#PickUpTimeNM"  name="rentTime" id="txtPickUpTime" value="${rentTime}">
									<button type="button" title="�޷°˻�" id="sel_calendar" class="sel_calendar_PickUp"></button>
								</div>
							</li>
							<li style="width:46%;" class="f_left">
								<div class="selbox1">			
									<select id="rentHour2" name="rentHour">
										<option value="00��">00��</option>
										<option value="01��">01��</option>
										<option value="02��">02��</option>
										<option value="03��">03��</option>
										<option value="04��">04��</option>
										<option value="05��">05��</option>
										<option value="06��">06��</option>
										<option value="07��">07��</option>
										<option value="08��">08��</option>
										<option value="09��">09��</option>
										<option value="10��">10��</option>
										<option value="11��">11��</option>
										<option value="12��">12��</option>
										<option value="13��">13��</option>
										<option value="14��">14��</option>
										<option value="15��">15��</option>
										<option value="16��">16��</option>
										<option value="17��">17��</option>
										<option value="18��">18��</option>
										<option value="19��">19��</option>
										<option value="20��">20��</option>
										<option value="21��">21��</option>
										<option value="22��">22��</option>
										<option value="23��">23��</option>
									</select>										
								</div>
							</li>
							<li style="width:46%; margin-left:12px;" class="f_left">
								<div class="selbox2">			
									<select id="rentMinute2" name="rentMinute">
										<option value="00��">00��</option>
										<option value="15��">15��</option>
										<option value="30��">30��</option>
									</select>										
								</div>
							
							</li>
						</ul>
						<ul style="height:166px;">
							<li style="width:100%;" class="f_left">
								<p class="title_name">�ݳ���� / �Ͻ�</p>
								<div class="sel_input" style="width: 200px; padding: 3px 5px 2px 5px;">
									<input type="text" data-locid="#ReturnLocation" data-locname="#ReturnLocationNM" name="returnlocation" id="txtReturnLocation" value="${returnlocation}">
								</div>
							</li>
							<li style="width:100%;" class="f_left">
								<div class="sel_input" style="width: 200px; padding: 3px 5px 2px 5px;">
									<input type="text" data-locid="#ReturnTime" data-locname="#ReturnTimeNM" name="returnTime" id="txtReturnTime" value="${returnTime}">
									<button type="button" title="�޷°˻�" id="sel_calendar2"class="sel_calendar_Return"></button>
								</div>
							</li>
							<li style="width:46%;" class="f_left">
								<div class="selbox3">			
									<select id="returnHour2" name="returnHour">
										<option value="00��">00��</option>
										<option value="01��">01��</option>
										<option value="02��">02��</option>
										<option value="03��">03��</option>
										<option value="04��">04��</option>
										<option value="05��">05��</option>
										<option value="06��">06��</option>
										<option value="07��">07��</option>
										<option value="08��">08��</option>
										<option value="09��">09��</option>
										<option value="10��">10��</option>
										<option value="11��">11��</option>
										<option value="12��">12��</option>
										<option value="13��">13��</option>
										<option value="14��">14��</option>
										<option value="15��">15��</option>
										<option value="16��">16��</option>
										<option value="17��">17��</option>
										<option value="18��">18��</option>
										<option value="19��">19��</option>
										<option value="20��">20��</option>
										<option value="21��">21��</option>
										<option value="22��">22��</option>
										<option value="23��">23��</option>
									</select>										
								</div>
							</li>
							<li style="width:46%;margin-left:12px;" class="f_left">
								<div class="selbox4">			
									<select id="returnMinute2" name="returnMinute">
										<option value="00��">00��</option>
										<option value="15��">15��</option>
										<option value="30��">30��</option>
									</select>										
								</div>		
							</li>		
						</ul>
					</div>
					<div class="sel_option">
						<p class="title_name">���ÿɼ�</p>
						<ul id="rentOption">
							<li style="width:50%;" class="f_left">
								<input type="checkbox" id="sel_option1" name="sel_option" class="chk_chekbox" data-label="#lbl_sel_option1" checked="true">									
								<label for="sel_option1" id="lbl_sel_option1" class="rent_check">�׺���̼�</label>
							</li>
							<li style="width:50%;" class="f_left">
								<input type="checkbox" id="sel_option2" name="sel_option" class="chk_chekbox" data-label="#lbl_sel_option2" checked="true">									
								<label for="sel_option2" id="lbl_sel_option2" class="rent_check">���ƿ� ī��Ʈ</label>
							</li>
							<li style="width:50%;" class="f_left">
								<input type="checkbox" id="sel_option3" name="sel_option" class="chk_chekbox" data-label="#lbl_sel_option3" checked="true">									
								<label for="sel_option3" id="lbl_sel_option3" class="rent_check">�Ƶ��� ī��Ʈ</label>
							</li>
							<li style="width:50%;" class="f_left">
								<input type="checkbox" id="sel_option4" name="sel_option" class="chk_chekbox" data-label="#lbl_sel_option4" checked="true">									
								<label for="sel_option4" id="lbl_sel_option4" class="rent_check">�ν��� ī��Ʈ</label>
							</li>
						</ul>
					</div>
					<input type="hidden" name="pg" value="1">
					<div class="search_btn_area" style="height:35px; margin-top:15px;">
						<button class="btn_search" id="btnSearch">�˻��ϱ�</button>
					</div>
				</div>
			</div>
			</form>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype">
					 	<span class="h3_title">�α� �ֿ�ü�</span>
					 	<span class="icon"><span class="ir">�α� �ֿ�ü� ����/�ݱ�</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype">
					<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypeal00" data-sumcode="locationtype" name="sum_optionlocationtype" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal00" id="lblsum_optionlocationtypeall" class="rent_check on">��ü (${totalA})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal5000" data-sumcode="locationtype" name="sum_optionlocationtype" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal5000" id="lblsum_optionlocationtypeall" class="rent_check on">����(��ü) (${totalA})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal5001" data-sumcode="locationtype" name="sum_optionlocationtype" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal5001" id="lblsum_optionlocationtypeall" class="rent_check on">����(��Ʋ�����̿���) (0)
						</label> 
					</li>
				</ul>
			</div>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype2">
					 	<span class="h3_title2">�뿩����</span>
					 	<span class="icon"><span class="ir">�α� �ֿ�ü� ����/�ݱ�</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype2">
				<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypeal" data-sumcode="locationtype" name="sum_optionlocationtype2" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal" id="lblsum_optionlocationtypeall1" class="rent_check on">��ü (${totalA})
						</label> 
					</li>																
					<li>
						<input type="radio" id="sum_optionlocationtypeal1" data-sumcode="locationtype" name="sum_optionlocationtype2" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal1" id="lblsum_optionlocationtypeall1" class="rent_check on">����ī(${eurocarTotal})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal2" data-sumcode="locationtype" name="sum_optionlocationtype2" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal2" id="lblsum_optionlocationtypeall1" class="rent_check on">����(${herlzTotal})
						</label> 
					</li>					
				</ul>
			</div>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype3">
					 	<span class="h3_title3">��������</span>
					 	<span class="icon"><span class="ir">�α� �ֿ�ü� ����/�ݱ�</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype3">
					<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypeal5" data-sumcode="locationtype" name="sum_optionlocationtype3" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal5" id="lblsum_optionlocationtypeall" class="rent_check on">��ü (${totalA})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal6" data-sumcode="locationtype" name="sum_optionlocationtype3" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal6" id="lblsum_optionlocationtypeall" class="rent_check on">������ (${smallTotal})
						</label>
						 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal8" data-sumcode="locationtype" name="sum_optionlocationtype3" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal8" id="lblsum_optionlocationtypeall" class="rent_check on">������ (${mediumTotal})
						</label> 
					</li>
					
				</ul>
			</div>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype4">
					 	<span class="h3_title4">���ӱ�Ÿ��</span>
					 	<span class="icon"><span class="ir">�α� �ֿ�ü� ����/�ݱ�</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype4">
					<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypeal11" data-sumcode="locationtype" name="sum_optionlocationtype4" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal11" id="lblsum_optionlocationtypeall" class="rent_check on">��ü (${totalA})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal12" data-sumcode="locationtype" name="sum_optionlocationtype4" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal12" id="lblsum_optionlocationtypeall" class="rent_check on">�ڵ� (${autoTotal})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypeal13" data-sumcode="locationtype" name="sum_optionlocationtype4" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal13" id="lblsum_optionlocationtypeall" class="rent_check on">���� (${manualTotal})
						</label> 
					</li>
					
				</ul>
			</div>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype5">
					 	<span class="h3_title5">ž���ο�</span>
					 	<span class="icon"><span class="ir">�α� �ֿ�ü� ����/�ݱ�</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype5">
					<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypeal14" data-sumcode="locationtype" name="sum_optionlocationtype5" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypeal14" id="lblsum_optionlocationtypeall" class="rent_check on">��ü (${totalA})
 						</label> 
					</li>					
					<li>
						<input type="radio" id="sum_optionlocationtypea1500" data-sumcode="locationtype" name="sum_optionlocationtype5" class="chk_chekbox" value="all">
						<label for="sum_optionlocationtypea1500" id="lblsum_optionlocationtypeall" class="rent_check on">5 �� (${fiveTotal})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypea1501" data-sumcode="locationtype" name="sum_optionlocationtype5" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypea1501" id="lblsum_optionlocationtypeall" class="rent_check on">4 �� (${fourTotal})
						</label> 
					</li>
					
				</ul>
			</div>
			<div class="select_facility" style="height:auto; ">
				<h3 style="font-size:12px; height:39px; width:254px;  ">
					 <button type="button" id="btnSummarylocationtype6">
					 	<span class="h3_title6">����Ÿ�����</span>
					 	<span class="icon"><span class="ir">�α� �ֿ�ü� ����/�ݱ�</span></span>
					</button>
				</h3>
				<ul	class="option_list" id="ulSummarylocationtype6">
					<li>
						<input type="radio" checked="checked" id="sum_optionlocationtypea18" data-sumcode="locationtype" name="sum_optionlocationtype6" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypea18" id="lblsum_optionlocationtypeall" class="rent_check on">��ü (${totalA})
						</label> 
					</li>
					<li>
						<input type="radio" id="sum_optionlocationtypea19" data-sumcode="locationtype" name="sum_optionlocationtype6" class="chk_chekbox" value="all" >
						<label for="sum_optionlocationtypea19" id="lblsum_optionlocationtypeall" class="rent_check on">����Ÿ� ������ (${totalA})
						</label> 
					</li>
					
				</ul>
			</div>
		</div>
		<div id="rentCar2_Div2">
			<div id="googlemap">
				
			
			</div>
			<div class="choice_rent">
				<p class="impers_res_car">
					<strong class="total">${totalA}��</strong>
					�� ������ 
					<strong class="res_imp">���డ��</strong> 
					�մϴ�. 
					<b class="txt">�� �������� �������� ���� �����Ͻô� 
					<strong>�ĺ���</strong> 
					�����Դϴ�.</b>
				</p>
				<div class="sort_group" id="rentsortgroup">
					<div class="compare_car">
						<b class="txt_tit">�ִ� 3�� �������� ���� �� ����</b>
						<button type="button" class="btn_sel" id="btnVehcleCompare">����������</button>
					</div>
					<div class="type_car">
						<b class="txt_tit">���� ����� ���� ���� ���� �ȳ�</b>
						<button type="button" class="btn_sortinfo" id="btnVehicleType">���������ȳ�</button>
					</div>
					<div class="sort_car search_li">
						<b class="txt_tit">��������</b>
						<select>
								<option value="">��������</option>
								<option value="">�ְ���</option>				
						</select>
					</div>
				</div>
				
			</div>
			<div id="rentcarList">
					<ul class="result_list">					
					<c:if test="${requestScope.list!=null }">	
						<c:forEach var="rentCarDTO" items="${list}" >
						<li class="list_info">
							<p class="rent_thumb">      
								<span class="rent_ci">
									 
									<span class="ir">ZE</span>            
								</span>               
								<img src="../image/rentCar/${rentCarDTO.imageName}" width="218px" height="144" alt="�����̹���" class="car_thumb" style="vertical-align: top; border:0;" onerror="rentCommon.imgError(this, 'rentcar', false);">
							</p>
							<div class="rent_desc">
								<div class="chk_choice">
									<input type="checkbox" data-label="#lbl_rent_check0" id="rent_check0" class="chk_chekbox" value="0" onclick="javascript:setOptionStat(this, 'rent_check');">
									<label for="rent_check0" id="lbl_rent_check0" class="rent_check">${rentCarDTO.car_name}</label>
									<span class="car_label">������(Economy) / ����(��ü)</span>
								</div>
								<table width="100%" cellpadding="0" cellspacing="0" class="desc_list" summary="ž���ο�,����������,���ӱ�Ÿ��,����Ÿ��">            
									<tbody>
									    <tr class="bg">
										    <th>ž���ο�:</th>
										    <td>${rentCarDTO.occupancy}��</td>             
										    <th>���ӱ� Ÿ��:</th>                     
										    <td>${rentCarDTO.transmission_type}</td>                   
									    </tr>                    
									    <tr>                     
										    <th>����������:</th>                   
										    <td>����</td>                    
										    <th>����Ÿ��:</th>                      
										    <td>����</td>  
										</tr>                             
								    </tbody>             
								</table>
								<div class="opt_alert">
									<div class="imply im_01">                 
									   <p class="txt">���๫����</p>       
									</div>
									<div class="imply im_02">
									   <p class="txt">��������</p> 
									</div>
									<div class="imply im_03">
									   <p class="txt">��������</p> 												
									</div>
								</div>	
							</div>
							<div class="rent_price">        
									<strong class="tit_price">���� �뿩 ���</strong>           
									<strong class="rent_total">KRW&nbsp;${rentCarDTO.price}</strong>      
								    <p class="tax">              
								    	<b>��${rentCarDTO.price}</b>����ȯ�� ����<br>�� �뿩�� ���� (��������)								 
								    </p>              
								    <button type="button" class="btn_reservation" id="btnReservation" onclick="javascript:reservation(${rentCarDTO.seq}); return false;">     
								    	<span>�����ϱ�</span>					
								    </button>         
								   
								</div>
						</li>
						</c:forEach>
					</c:if>					
					</ul>			
				</div>
				<div class="page-number">
					<div class="pagination" id="pagination">
						${rentCarPaging.pagingHTML}
					</div>
				</div>
		</div>
	
		
	
	
	
	</div>
	<div class="layer_event" id="popVehicleType" style="top: 260.5px; left: 274.5px; display: block;">
<p class="h_title">��������</p>
<div class="compare_table sort_list">
<table cellpadding="0" cellspacing="0" width="100%" summary="����ī�귣��,����,����,ž���ο�,���Ϲ�����,����������,���ӱ�Ÿ��,����Ÿ��,����Ÿ�,�����뿩��ݾȳ�">
<caption>����ī ������ �ȳ�</caption>
<colgroup>
<col width="12%">
<col width="22%">
<col width="22%">
<col width="22%">
<col width="22%">
</colgroup>
<tbody>
<tr>
<td class="bg">
                ũ�⿡<br>����<br>�з�
              </td>
<td><b class="type">������ (Economy)</b><span class="car_type economy"></span><p class="desc_txt">
                  �����ϰ� �����<br>���� ��� ����, ���۹̴� ����
                </p>
</td>
<td><b class="type">�߼����� (Compact)</b><span class="car_type compact"></span><p class="desc_txt">
                  �����ϰ� �����<br>���� ��� ����
                </p>
</td>
<td><b class="type">������ (Midsize)</b><span class="car_type midsize"></span><p class="desc_txt">
                  �ִ� 5�� ž�� ����<br>���� �α� �ִ� ���´�<br>���ܰ� �����̼� �ְ���.
                </p>
</td>
<td><b class="type">���/������ (Executive)</b><span class="car_type executive"></span><p class="desc_txt">
                  ���� �ǳ������� �а�<br>������ ���� ����� ����<br>��޽����� ���۵� ����
                </p>
</td>
</tr>
<tr>
<td class="bg" rowspan="2">
                ������<br>����<br>�з�
              </td>
<td><b class="type">�����ͺ� (Convertible)</b><span class="car_type convertible"></span><p class="desc_txt">
                  �������� ���� ������,<br>õ���� ���� ������ ����<br>Ư¡�� ����
                </p>
</td>
<td><b class="type">��������ƿ��Ƽ (SUV)</b><span class="car_type suv"></span><p class="desc_txt">
                  ����ɷ��� �پ<br>���� ������Ȱ���� ������<br>�������� �ٸ�������
                </p>
</td>
<td><b class="type">���� (Sedan)</b><span class="car_type sadan"></span><p class="desc_txt">
                  ���� 4���� ��¡ �Ϲ�����<br>�ڵ����� ���� ����<br>���� �� �ִ� ����
                </p>
</td>
<td><b class="type">�ְ� (Wagon)</b><span class="car_type wagon"></span><p class="desc_txt">
                  õ���� Ʈ��ũ����<br>�������� ���ʿ�<br>���� �޸� �¿���
                </p>
</td>
</tr>
<tr>
<td><b class="type">���� (Coupe)</b><span class="car_type coupe"></span><p class="desc_txt">
                  �����ο��� �������<br>���� 2���� ������ �¿�����<br>������ ���� ���� Ư¡
                </p>
</td>
<td><b class="type">��ġ�� (Hatch-back)</b><span class="car_type hatchback"></span><p class="desc_txt">
                  Ʈ��ũ�� �� ������ �Բ�<br>������ �������� �ְǿ� ����<br>Ʈ��ũ ���̰� ª��
                </p>
</td>
<td><b class="type">�� (VAN)</b><span class="car_type van"></span><p class="desc_txt">
                  ȭ���� ���� �� �ִ�<br>ȭ��ĭ�� �޷��־� �� ����<br>��������� ���� ����
                </p>
</td>
<td><b class="type">�Ⱦ�Ʈ�� (Pick-up Truck)</b><span class="car_type pickup"></span><p class="desc_txt">
                  ������ ���� ��������<br>�ִ� �������� ���� Ʈ��<br>������ ����
                </p>
</td>
</tr>
</tbody>
</table>
</div><button type="button" class="btn_close" title="���̾� �ݱ�" data-popup="#popVehicleType" id="btnVehicleTypeClose"><span class="ir">�ݱ�</span></button></div>

<div class="layer_event" style="top: 100px; left: 233.5px; display: block;" id="popVehicle">
<p class="h_title">����ī ���� ������</p>
<div class="compare_table">
<table cellpadding="0" cellspacing="0" width="100%" summary="����ī�귣��,����,����,ž���ο�,���Ϲ�����,����������,���ӱ�Ÿ��,����Ÿ��,����Ÿ�,�����뿩��ݾȳ�">
<caption>����ī ������ �ȳ�</caption>
<colgroup>
<col width="13%">
<col width="29%">
<col width="29%">
<col width="29%">
</colgroup>
<thead>
<tr id="cBrandCode">
<th>����ī �귣��</th>
<th>����(ZE)</th><th>����(ZE)</th></tr>
</thead>
<tbody>
<tr id="cPictureURL">
<td class="bg">����</td>
<td><p class="rent_thumb"><span class="rent_ci"><img src="http://image1.hanatour.com/_images/rentercar/rentcar_ci_ZE.gif" width="59px" height="23px" alt="Hertz"><span class="ir">ZE</span></span><img src="https://hanatourrentacarapi.blob.core.windows.net/images/ZEKREDAR999.jpg" width="200px" height="126" alt="�����̹���" onerror="rentCommon.imgError(this, 'rentcar', false);"></p></td><td><p class="rent_thumb"><span class="rent_ci"><img src="http://image1.hanatour.com/_images/rentercar/rentcar_ci_ZE.gif" width="59px" height="23px" alt="Hertz"><span class="ir">ZE</span></span><img src="https://hanatourrentacarapi.blob.core.windows.net/images/ZEKRCDAR999.jpg" width="200px" height="126" alt="�����̹���" onerror="rentCommon.imgError(this, 'rentcar', false);"></p></td></tr>
<tr id="cVehicleType">
<td class="bg">��������</td>
<td>������(Economy)</td><td>������(Compact)</td></tr>
<tr id="cPassengerQuantity">
<td class="bg">ž���ο�</td>
<td>4��</td><td>5��</td></tr>
<tr id="cBaggageQuantity">
<tr id="cDriveType">
<td class="bg">���ӱ�Ÿ��</td>
<td>�ڵ�</td><td>�ڵ�</td></tr>
<tr id="cFuelType">
<td class="bg">����Ÿ��</td>
<td>����</td><td>����</td></tr>
<tr id="cRateDistance">
<td class="bg">����Ÿ�</td>
<td>������</td><td>������</td></tr>
<tr id="cReservation">
<td class="bg">���� �뿩 ���</td>
<td><strong class="rent_price"><span>KRW</span>&nbsp;53,999.55</strong><p class="tax"><b>��53,999</b> / ���� ȯ������ <br>�� �뿩�� ���� (��������)<br>��������</p><button class="btn_reservation"><span>�����ϱ�</span></button></td><td><strong class="rent_price"><span>KRW</span>&nbsp;62,999.64</strong><p class="tax"><b>��62,999</b> / ���� ȯ������ <br>�� �뿩�� ���� (��������)<br>��������</p><button class="btn_reservation"><span>�����ϱ�</span></button></td></tr>
</tbody>
</table>
</div><button type="button" class="btn_close" data-popup="#popVehicle" title="���̾� �ݱ�" id="btnPopupVehicleClose"><span class="ir">�ݱ�</span></button></div>
</div>
<div class="layer_event" style="top: 100px; left: 551.5px; display: none;" id="popVehicle">
<p class="h_title">����ī ���� ������</p>
<div class="compare_table">
<table cellpadding="0" cellspacing="0" width="100%" summary="����ī�귣��,����,����,ž���ο�,���Ϲ�����,����������,���ӱ�Ÿ��,����Ÿ��,����Ÿ�,�����뿩��ݾȳ�">
<caption>����ī ������ �ȳ�</caption>
<colgroup>
<col width="13%">
<col width="29%">
<col width="29%">
<col width="29%">
</colgroup>
<thead>
<tr id="cBrandCode">
<th>����ī �귣��</th>
<th>����(ZE)</th><th>����(ZE)</th></tr>
</thead>
<tbody>
<tr id="cPictureURL">
<td class="bg">����</td>
<td><p class="rent_thumb"><span class="rent_ci"><img src="http://image1.hanatour.com/_images/rentercar/rentcar_ci_ZE.gif" width="59px" height="23px" alt="Hertz"><span class="ir">ZE</span></span><img src="https://hanatourrentacarapi.blob.core.windows.net/images/ZEKREDAR999.jpg" width="200px" height="126" alt="�����̹���" onerror="rentCommon.imgError(this, 'rentcar', false);"></p></td><td><p class="rent_thumb"><span class="rent_ci"><img src="http://image1.hanatour.com/_images/rentercar/rentcar_ci_ZE.gif" width="59px" height="23px" alt="Hertz"><span class="ir">ZE</span></span><img src="https://hanatourrentacarapi.blob.core.windows.net/images/ZEKRCDAR999.jpg" width="200px" height="126" alt="�����̹���" onerror="rentCommon.imgError(this, 'rentcar', false);"></p></td></tr>
<tr id="cVehicleType">
<td class="bg">��������</td>
<td>������(Economy)</td><td>������(Compact)</td></tr>
<tr id="cPassengerQuantity">
<td class="bg">ž���ο�</td>
<td>4��</td><td>5��</td></tr>
<tr id="cBaggageQuantity">
<td class="bg">���Ϲ�����</td>
<td>2��</td><td>2��</td></tr>
<tr id="cDriveType">
<td class="bg">���ӱ�Ÿ��</td>
<td>�ڵ�</td><td>�ڵ�</td></tr>
<tr id="cFuelType">
<td class="bg">����Ÿ��</td>
<td>����</td><td>����</td></tr>
<tr id="cRateDistance">
<td class="bg">����Ÿ�</td>
<td>������</td><td>������</td></tr>
<tr id="cReservation">
<td class="bg">���� �뿩 ���</td>
<td><strong class="rent_price"><span>KRW</span>&nbsp;53,999.55</strong><p class="tax"><b>��53,999</b> / ���� ȯ������ <br>�� �뿩�� ���� (��������)<br>��������</p><button class="btn_reservation"><span>�����ϱ�</span></button></td><td><strong class="rent_price"><span>KRW</span>&nbsp;62,999.64</strong><p class="tax"><b>��62,999</b> / ���� ȯ������ <br>�� �뿩�� ���� (��������)<br>��������</p><button class="btn_reservation"><span>�����ϱ�</span></button></td></tr>
</tbody>
</table>
</div><button type="button" class="btn_close" data-popup="#popVehicle" title="���̾� �ݱ�" id="btnPopupVehicleClose"><span class="ir">�ݱ�</span></button></div>
<div id="ui-datepicker-div" class="ut-datepicker ui-widget ui-widget-content ui-helper-clearfix
	ui-corner-all ui-datepicker-multi-3 ui-datepicker-multi" style="position: absolute; top: 100px;
    width: 51em; left: 170px; z-index: 101; display: block; width:auto; height:auto; ">
    	<div class="ui-datepicker-group ui-datepicker-group-middle"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix"><div class="ui-datepicker-title"><span class="ui-datepicker-year">2017</span>��&nbsp;<span class="ui-datepicker-month">12��</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="��"><font color="red">��</font></span></th><th><span title="��">��</span></th><th><span title="ȭ">ȭ</span></th><th><span title="��">��</span></th><th><span title="��">��</span></th><th><span title="��">��</span></th><th class="ui-datepicker-week-end"><span title="��"><font color="blue">��</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">1</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">8</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">15</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">22</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">24</a></td><td class=" date-holiday0" title="ũ��������" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">26</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">29</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>
 		<div class="ui-datepicker-group ui-datepicker-group-last"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-right"><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click"><span class="ui-icon ui-icon-circle-triangle-e"></span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2018</span>��&nbsp;<span class="ui-datepicker-month">1��</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="��"><font color="red">��</font></span></th><th><span title="��">��</span></th><th><span title="ȭ">ȭ</span></th><th><span title="��">��</span></th><th><span title="��">��</span></th><th><span title="��">��</span></th><th class="ui-datepicker-week-end"><span title="��"><font color="blue">��</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" date-holiday0" title="����" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">1</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">2</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">5</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">6</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">8</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">9</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">12</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">13</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">15</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">16</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">19</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">20</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">22</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">23</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">26</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">27</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">29</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">30</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>  
    </div>
    <div id="ui-datepicker-div2" class="ut-datepicker ui-widget ui-widget-content ui-helper-clearfix
	ui-corner-all ui-datepicker-multi-3 ui-datepicker-multi" style="position: absolute; top: 300px;
    width: 51em; left: 170px; z-index: 101; display: block; width:auto; height:auto; ">
    	<div class="ui-datepicker-group ui-datepicker-group-middle"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix"><div class="ui-datepicker-title"><span class="ui-datepicker-year">2017</span>��&nbsp;<span class="ui-datepicker-month">12��</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="��"><font color="red">��</font></span></th><th><span title="��">��</span></th><th><span title="ȭ">ȭ</span></th><th><span title="��">��</span></th><th><span title="��">��</span></th><th><span title="��">��</span></th><th class="ui-datepicker-week-end"><span title="��"><font color="blue">��</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">1</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">8</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">15</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">22</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">24</a></td><td class=" date-holiday0" title="ũ��������" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">26</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">29</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="11" data-year="2017"><a class="ui-state-default2" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>
 		<div class="ui-datepicker-group ui-datepicker-group-last"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-right"><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click"><span class="ui-icon ui-icon-circle-triangle-e"></span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2018</span>��&nbsp;<span class="ui-datepicker-month">1��</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="��"><font color="red">��</font></span></th><th><span title="��">��</span></th><th><span title="ȭ">ȭ</span></th><th><span title="��">��</span></th><th><span title="��">��</span></th><th><span title="��">��</span></th><th class="ui-datepicker-week-end"><span title="��"><font color="blue">��</font></span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" date-holiday0" title="����" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">1</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">2</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">5</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">6</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">8</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">9</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">12</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">13</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">15</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">16</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">19</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">20</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">22</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">23</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">26</a></td><td class=" ui-datepicker-week-end date-saturday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">27</a></td></tr><tr><td class=" ui-datepicker-week-end date-sunday" data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">29</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">30</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2018"><a class="ui-state-default2" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>  
    </div>

    <div id="loginForm_inform_wrap">
   			<div id="loginForm_inform_box">
   				<div id="loginForm_inform_box1"><label id="member">�α���</label><label id="close_login"><img src="../image/close.gif"></label></div>
   				
   			</div>
   			<div id="loginForm_inform_member">
   			<div id="border_line"></div>
   				<div id="login_text_wrap">
   					<div id="login_text">���̵�� �α���</div>
   				</div>
   				<div id="loginForm_id_content">
   						<input type="text" id="login_id" name="id" placeholder="�ϳ����� ���̵�">
   						<div id="login_idDiv"></div>
   				</div>
   				<div id="loginForm_pwd_content">
   						<input type="password" id="login_pwd" name="pwd" placeholder="��й�ȣ">
   						<div id="login_pwdDiv"></div>
   					</div>
   				<div id="loginForm_accept_login">
   					<div id="accpet_login">
   						<label id="login">�α���</label>
   					</div>
   				</div>
   				<div id="loginForm_function_table">
   					<div id="function_table">
   						<ul>
							<li id="search_id"><h4>���̵� ã��</h4></li>
							<li id="search_pwd"><h4>��й�ȣ ã��</h4></li>
							<li id="go_writeForm"><h4>ȸ������</h4></li>
						</ul>
   					</div>
   				</div>
   			</div>
   		</div>



    
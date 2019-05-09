
var year;
var month;
var date;
var today = new Date();



function onload_fn(){
	calendar(today.getFullYear(),today.getMonth());//임시 값
}



function getValue(date){
	if($('#only_air_Depart_date_calendar').css('z-index')==100){	
		year=document.getElementById("select_year_A_D").innerHTML;
		month=document.getElementById("select_month_A_D").innerHTML;
	}
	if($('#only_air_Return_date_calendar').css('z-index')==100){
		year=document.getElementById("select_year_A_R").innerHTML;
		month=document.getElementById("select_month_A_R").innerHTML;
	}
	if($('#only_hotel_CheckIn_calendar').css('z-index')==100){	
		year= window.document.getElementById("select_year_H_CI").innerHTML;
		month= window.document.getElementById("select_month_H_CI").innerHTML;
	}
	if($('#only_hotel_CheckOut_calendar').css('z-index')==100){	
		year= window.document.getElementById("select_year_H_CO").innerHTML;
		month= window.document.getElementById("select_month_H_CO").innerHTML;
	}
	if($('#air_hotel_Depart_date_calendar').css('z-index')==100){	
		year= window.document.getElementById("select_year_AH_D").innerHTML;
		month= window.document.getElementById("select_month_AH_D").innerHTML;
	}	
	if($('#air_hotel_Return_date_calendar').css('z-index')==100){	
		year= window.document.getElementById("select_year_AH_R").innerHTML;
		month= window.document.getElementById("select_month_AH_R").innerHTML;
	}

	
	date= date.innerHTML;


	if($('#only_air_Depart_date_calendar').css('z-index')==100){
		$('#only_air_Depart_date_content > input[type=text]').val(year+'-'+month+'-'+date);
		$('#only_air_Depart_date_calendar').css('z-index','0');
		$('#only_air_Depart_date_calendar').hide();
	}
	if($('#only_air_Return_date_calendar').css('z-index')==100){
		$('#only_air_Return_date_content > input[type=text]').val(year+'-'+month+'-'+date);
		$('#only_air_Return_date_calendar').css('z-index','0');
		$('#only_air_Return_date_calendar').hide();
	}
	if($('#only_hotel_CheckIn_calendar').css('z-index')==100){	
		$('#only_hotel_CheckIn_content > input[type=text]').val(year+'-'+month+'-'+date);
		$('#only_hotel_CheckIn_calendar').css('z-index','0');
		$('#only_hotel_CheckIn_calendar').hide();
		$('#only_hotel_CheckOut_calendar > input[type=text]').val(year+'-'+month+'-'+date);
	}
	if($('#only_hotel_CheckOut_calendar').css('z-index')==100){	
		$('#only_hotel_CheckOut_content > input[type=text]').val(year+'-'+month+'-'+date);
		$('#only_hotel_CheckOut_calendar').css('z-index','0');
		$('#only_hotel_CheckOut_calendar').hide();
	}
	if($('#air_hotel_Depart_date_calendar').css('z-index')==100){	
		$('#air_hotel_Depart_date_content > input[type=text]').val(year+'-'+month+'-'+date);
		$('#air_hotel_Depart_date_calendar').css('z-index','0');
		$('#air_hotel_Depart_date_calendar').hide();
	}	
	if($('#air_hotel_Return_date_calendar').css('z-index')==100){	
		$('#air_hotel_Return_date_content > input[type=text]').val(year+'-'+month+'-'+date);
		$('#air_hotel_Return_date_calendar').css('z-index','0');
		$('#air_hotel_Return_date_calendar').hide();
	}

}



function calendar(year, month){
	var tags="<table width='100%' heigth='100%' rules='none' style='text-align:center;' onclick='cal();'>";
	tags+="<tr><th style='color:red;'>일</th><th>월</th><th> 화</th><th>수</th><th>목</th><th>금</th><th style='color:blue;'>토</th></tr><tr>";
	var date = new Date();
	date.setFullYear(year,month,1);

	var day = date.getDay();//1일의 요일

	for(var i =0; i<day;i++){
		tags+='<td></td>';
	}
	
    while(date.getMonth()==month){	
		if(date.getDate()!=1&&date.getDay()==0){
			tags+='</tr><tr>';
	    }


		if(date.getFullYear() < today.getFullYear()){ //얻어온 년도 < 오늘 년도
			
			if(date.getDay()==6){ //6:토요일
				tags+='<td style="background-color:rgb(230,230,230); color:blue; opacity:0.5;">'+date.getDate()+'</td>';
			}
			else if(date.getDay()==0){ //0: 일요일
				tags+='<td style="background-color:rgb(230,230,230); color:red; opacity:0.5;">'+date.getDate()+'</td>';
			}
			else{
	        	tags+='<td style="background-color:rgb(230,230,230); opacity:0.5;">'+date.getDate()+'</td>';
			}
			
		}
		
		else if(date.getFullYear()==today.getFullYear()){ //얻어온 년도 = 오늘 년도
			
			if(date.getMonth()<today.getMonth()){ //얻어온 월  < 오늘 월
				
				if(date.getDay()==6){
					tags+='<td style="background-color:rgb(230,230,230); color:blue; opacity:0.5;">'+date.getDate()+'</td>';
				}
				else if(date.getDay()==0){
					tags+='<td style="background-color:rgb(230,230,230); color:red; opacity:0.5;">'+date.getDate()+'</td>';
				}
				else{
	         		tags+='<td style="background-color:rgb(230,230,230); opacity:0.5;">'+date.getDate()+'</td>';
				}
				
			}
			else if(date.getMonth()==today.getMonth()){ //얻어온 월  = 오늘 월	
				
				if(date.getDate() < today.getDate()){ //얻어온 일 < 오늘 일
					if(date.getDay()==6){
						tags+='<td style="background-color:rgb(230,230,230); color:blue; opacity:0.5;">'+date.getDate()+'</td>';
					}
					else if(date.getDay()==0){
						tags+='<td style="background-color:rgb(230,230,230); color:red; opacity:0.5;">'+date.getDate()+'</td>';
					}
					else{
	         			tags+='<td style="background-color:rgb(230,230,230); opacity:0.5;">'+date.getDate()+'</td>';
					}
				}
				else{ //언어온 일 <= 오늘 일
					if(date.getDay()==6){
						tags+='<td style="background-color:rgb(230,230,230); color:blue; cursor:pointer;" onclick="getValue(this)">'+date.getDate()+'</td>';
					}
					else if(date.getDay()==0){
						tags+='<td style="background-color:rgb(230,230,230); color:red; cursor:pointer;" onclick="getValue(this)">'+date.getDate()+'</td>';
					}
					else{
	         			tags+='<td style="background-color:rgb(230,230,230); cursor:pointer;" onclick="getValue(this)">'+date.getDate()+'</td>';
					}
				}
				
			}
			else{ //얻어온 월 > 오늘 월
				
				if(date.getDay()==6){
					tags+='<td style="background-color:rgb(230,230,230); color:blue; cursor:pointer;" onclick="getValue(this)">'+date.getDate()+'</td>';
				}
				else if(date.getDay()==0){
					tags+='<td style="background-color:rgb(230,230,230); color:red; cursor:pointer;" onclick="getValue(this)">'+date.getDate()+'</td>';
				}
				else{
	         		tags+='<td style="background-color:rgb(230,230,230); cursor:pointer;" onclick="getValue(this)">'+date.getDate()+'</td>';
				}
				
			}
		}	
		
		else{ //얻어온 년도 > 오늘 년도
			
			if(date.getDay()==6){
				tags+='<td style="background-color:rgb(230,230,230); color:blue; cursor:pointer;" onclick="getValue(this)">'+date.getDate()+'</td>';
			}
			else if(date.getDay()==0){
				tags+='<td style="background-color:rgb(230,230,230); color:red; cursor:pointer;" onclick="getValue(this)">'+date.getDate()+'</td>';
			}
			else{
	         	tags+='<td style="background-color:rgb(230,230,230); cursor:pointer;" onclick="getValue(this)">'+date.getDate()+'</td>';
			}
		}
		    
		date.setDate(date.getDate()+1);
	}

	var days=date.getDay();

	if(days!=0){
		var last = 6-days+1;
		for(var i=0;i<last;i++){
			tags+='<td></td>';
		}
	}
    tags+='</tr></table>';



	if($('#only_air_Depart_date_calendar').css('z-index')==100){	
		var x=document.getElementById("calendar_A_D");
	}
	if($('#only_air_Return_date_calendar').css('z-index')==100){	
		var x=document.getElementById("calendar_A_R");
	}	
	if($('#only_hotel_CheckIn_calendar').css('z-index')==100){	
		var x=document.getElementById("calendar_H_CI");
	}	
	if($('#only_hotel_CheckOut_calendar').css('z-index')==100){	
		var x=document.getElementById("calendar_H_CO");
	}
	if($('#air_hotel_Depart_date_calendar').css('z-index')==100){	
		var x=document.getElementById("calendar_AH_D");
	}	
	if($('#air_hotel_Return_date_calendar').css('z-index')==100){	
		var x=document.getElementById("calendar_AH_R");
	}

	x.innerHTML=tags;
	
}




function before_month(){
	if($('#only_air_Depart_date_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_A_D");
		var month= window.document.getElementById("select_month_A_D");
	}
	if($('#only_air_Return_date_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_A_R");
		var month= window.document.getElementById("select_month_A_R");
	}	
	if($('#only_hotel_CheckIn_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_H_CI");
		var month= window.document.getElementById("select_month_H_CI");
	}	
	if($('#only_hotel_CheckOut_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_H_CO");
		var month= window.document.getElementById("select_month_H_CO");
	}
	if($('#air_hotel_Depart_date_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_AH_D");
		var month= window.document.getElementById("select_month_AH_D");
	}	
	if($('#air_hotel_Return_date_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_AH_R");
		var month= window.document.getElementById("select_month_AH_R");
	}


	if(month.innerHTML==1){
		month.innerHTML=12;
		year.innerHTML= parseInt(year.innerHTML)-1;
	}else{
		month.innerHTML=parseInt(month.innerHTML)-1;
	}

	calendar(year.innerHTML,parseInt(month.innerHTML)-1);
}



function after_month(){
	if($('#only_air_Depart_date_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_A_D");
		var month= window.document.getElementById("select_month_A_D");
	}
	if($('#only_air_Return_date_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_A_R");
		var month= window.document.getElementById("select_month_A_R");
	}	
	if($('#only_hotel_CheckIn_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_H_CI");
		var month= window.document.getElementById("select_month_H_CI");
	}	
	if($('#only_hotel_CheckOut_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_H_CO");
		var month= window.document.getElementById("select_month_H_CO");
	}
	if($('#air_hotel_Depart_date_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_AH_D");
		var month= window.document.getElementById("select_month_AH_D");
	}	
	if($('#air_hotel_Return_date_calendar').css('z-index')==100){	
		var year= window.document.getElementById("select_year_AH_R");
		var month= window.document.getElementById("select_month_AH_R");
	}


	if(month.innerHTML==12){
		month.innerHTML=1;
		year.innerHTML=parseInt(year.innerHTML)+1;
	}else{
		month.innerHTML=parseInt(month.innerHTML)+1;
	}
    calendar(year.innerHTML,parseInt(month.innerHTML)-1);

}




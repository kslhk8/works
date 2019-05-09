
<style>

#wrap01 h4 {}


.infoMessage {
	width:660px;
	position:relative;
	margin-top:15px;
	padding: 10px 15px 10px 10px;
	border:1px solid #CCC;
	background:#FBFBFB;
	}

/* 
.infoMessage h4 {
	font-size:12px;
	color:#E42885;
	}
	.infoMessage h4 span {font-size:11px; color:#777; font-weight:normal;}
.infoMessage ul {}
.infoMessage ul li {
	margin-top:5px;
	font-size:11px;
	color:#777;
	}
.infoMessage p.payBtn {position:absolute; top:20px; right:17px;}
.infoMessage ul.text01 {
	padding-top: 3px;
	}
	.infoMessage ul.text01 li {
		font-size: 120%;
		padding-left: 10px;
		background:url("/_images/icon/ico_gray_disc.gif") no-repeat left 4px;
		}
		.infoMessage ul.text01 li a:link,
		.infoMessage ul.text01 li a:visited { color: #333333; text-decoration: none; }
		.infoMessage ul.text01 li a:hover { text-decoration: underline; }
	.infoMessage ul.text02 li {
		font-size: 100%;
		padding-left: 10p66
		line-height: 120%;
		background:url("//image1.hanatour.com/2010/images/icon/bul_line.gif") no-repeat left 4px;
} */

</style>


<body>

<h3 class="h4Type9">
			<img src="http://image1.hanatour.com/2010/images/mypage/h_hana_minlege.gif" alt="하나투어닷컴 예약">
</h3>
		
		<div id="booking01">
			<ul class="comTab">
				<li>
					<img name="Bookingimg" id="Bookingimg" style="cursor: pointer;" 
						 onclick="javascript:goBookingList('A');" alt="예약내역" 
						 src="http://image1.hanatour.com/2010/images/mypage/tab_booking_breakdown_on.gif" />
				</li>
				<li>
					<img name="Cancelimg" id="Cancelimg" style="cursor: pointer;" 
						 onclick="javascript:goBookingList('C');" alt="취소내역" 
						 src="http://image1.hanatour.com/2010/images/mypage/tab_cancel_breakdown.gif" />
				</li>
			</ul>
			<div class="tableLap">
				<form name="frmMain" action="" method="POST">
					<table width="100%" class="tbDetailType5" rules="all" frame="void" cellspacing="0">
						<colgroup>
							<col width="16.5%">
							<col width="*">
							<col width="10%">
							<col width="5%">
							<col width="10%">
							<col width="11%">
							<col width="9%">
							<col width="9%">
						</colgroup>
						<thead>
							<tr>
								<th class="borderDDD">
						                    예약날짜 /<br>예약코드 / 결제
						                  </th>
								<th class="borderDDD">상품명</th>
								<th class="borderDDD">총 결제금액</th>
								<th class="borderDDD">인원</th>
								<th class="borderDDD">
								                    출발일/<br>귀국일
								                  </th>
								<th class="borderDDD">여행도우미</th>
								<th class="borderDDD">예약상태</th>
								<th class="borderDDD">상품평</th>
							</tr>
						</thead>
						<tr>
							<td height="50" align="center" colspan="8">예약내역이 없습니다.</td>
						</tr>
					</table>
					<input name="chk_pk_type" type="hidden" value="1" />
				</form>
			</div>
		</div> 
			
			<div class="estimate_write">
				<ul>
					<li>
            			하나투어닷컴 예약의 경우 <span>상품을 직접 예약한 고객</span>에게만 예약내역이 노출됩니다.<br><strong>상품평 작성을 원하는 동반 고객</strong>은 우측에 있는 '상품평 작성'버튼을 클릭해 주세요.
          			</li>
					<li>
        			    작성하신 글은 <a href=""> 마이페이지 &gt; 참여내역 &gt; 여행후기 </a>에서 확인 및 수정이 가능합니다.
          			</li>
				</ul><a href="javascript:goWrite();" class="btn_write"><span class="ir"></span></a></div>
			</div> 
	
	<h3 class="h3Type4">
		<img alt="대리점 예약" src="http://image1.hanatour.com/2010/images/mypage/h_center_booking.gif">
	</h3>
	
	

</body>
</html>
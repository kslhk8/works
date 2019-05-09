<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="../css/rentCar/rentCar3.css" />
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../js/rentCar/rentCar3.js"></script>
<script type="text/javascript">



$(document).ready(function(){
	$('#body').css('height','3000px');
	$('.btn_conform').click(function(){
		alert("hi");
		$('#rForm').submit();
	})
	
});

$(window).bind('beforeunload',function(){
	$('#body').css('height','3000px');
});
</script>

<div id="hanarent">
	<div id="renta_wrap">
<div id="centent">
<h2 class="h2_title">렌터카 결제</h2>
<div id="reservation_content">
<form method="POST" name="rForm" id="rForm" action="/TwoTour/rentCar/rentCar4.do"><input type="hidden" id="reservationData" name="reservationData" value="%7B%22AirConditionInd%22%3Atrue%2C%22BaggageQuantity%22%3A2%2C%22CO2EmissionQuantity%22%3A0%2C%22Category%22%3A1%2C%22Description%22%3Anull%2C%22DoorCount%22%3A%224-5%20Door%22%2C%22DriveType%22%3A%22Unspecified%22%2C%22FuelType%22%3A%22Unspecified%22%2C%22ModelCode%22%3A%22EDAR%22%2C%22ModelName%22%3A%22B%20KIA%20MORNING%20OR%20SIMILAR%22%2C%22PassengerQuantity%22%3A4%2C%22PictureURL%22%3A%22https%3A%2F%2Fhanatourrentacarapi.blob.core.windows.net%2Fimages%2FZEKREDAR999.jpg%22%2C%22RateID%22%3A%7B%22CorporateDiscountCode%22%3Anull%2C%22PromotionCode%22%3Anull%2C%22RateCode%22%3A%22AAS1%22%7D%2C%22Reference%22%3A%7B%22DateTime%22%3A%2211%2F23%2F2017%204%3A02%3A50%20AM%22%2C%22id%22%3A%22V4XQG9WL0Y21641-2301%22%2C%22type%22%3A16%7D%2C%22RentalRate%22%3A%5B%7B%22AdditionalCharges%22%3A0%2C%22BasePrice%22%3A49090.5%2C%22Coverage%22%3A%5B%7B%22Description%22%3A%22%EB%AF%B8%EA%B5%AD%20-%20%EC%9E%90%EC%B0%A8%20%EB%B3%B4%ED%97%98%20(%EC%B0%A8%EB%9F%89%EC%86%90%EC%8B%A4%20%EB%A9%B4%EC%B1%85%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%20(LDW%3A%20Loss%20Damage%20Waiver)%20%5Cr%5Cn%EC%9E%84%EC%B0%A8%EC%B0%A8%EB%9F%89%EC%97%90%20%EB%B0%9C%EC%83%9D%ED%95%9C%20%EC%86%90%EC%8B%A4%20%ED%98%B9%EC%9D%80%20%EC%86%90%EC%83%81%20(%EA%B3%BC%EC%8B%A4%EC%97%AC%EB%B6%80%EC%99%80%20%EC%83%81%EA%B4%80%EC%97%86%EC%9D%B4)%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%9E%84%EC%B0%A8%EC%9D%B8%EC%9D%98%20%EC%B1%85%EC%9E%84%EC%9D%B4%20%EB%A9%B4%EC%A0%9C%EB%90%A9%EB%8B%88%EB%8B%A4.%20%5Cr%5Cn%5Cr%5Cn%EC%BA%90%EB%82%98%EB%8B%A4%20-%20%EC%9E%90%EC%B0%A8%20%EB%B3%B4%ED%97%98%20(%EC%B0%A8%EB%9F%89%EC%86%90%EC%8B%A4%20%EB%A9%B4%EC%B1%85%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%20(LDW%3A%20Loss%20Damage%20Waiver)%20%20%5Cr%5Cn%EC%9E%84%EC%B0%A8%EC%B0%A8%EB%9F%89%EC%97%90%20%EB%B0%9C%EC%83%9D%ED%95%9C%20%EC%86%90%EC%8B%A4%20%ED%98%B9%EC%9D%80%20%EC%86%90%EC%83%81%20(%EA%B3%BC%EC%8B%A4%EC%97%AC%EB%B6%80%EC%99%80%20%EC%83%81%EA%B4%80%EC%97%86%EC%9D%B4)%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%9E%84%EC%B0%A8%EC%9D%B8%EC%9D%98%20%EC%B1%85%EC%9E%84%EC%9D%B4%20%EB%A9%B4%EC%A0%9C%EB%90%A9%EB%8B%88%EB%8B%A4.%20%5Cr%5Cn%EC%82%AC%EA%B3%A0%20%EC%8B%9C%20CAD%20500%20%EA%B9%8C%EC%A7%80%EC%9D%98%20%EA%B3%A0%EA%B0%9D%20%EC%B1%85%EC%9E%84%EA%B8%88%EC%95%A1%EC%9D%B4%20%EC%9E%88%EC%8A%B5%EB%8B%88%EB%8B%A4.%20(Whitehorse%20%EC%97%90%EC%84%9C%EB%8A%94%20CAD%201%2C500)%20%20%5Cr%5Cn%5Cr%5Cn%EB%89%B4%EC%A7%88%EB%9E%9C%EB%93%9C%20-%20%EC%9E%90%EC%B0%A8%20%EB%B3%B4%ED%97%98%20(%EC%B0%A8%EB%9F%89%EC%86%90%EC%8B%A4%20%EB%A9%B4%EC%B1%85%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%20(LDW%3A%20Loss%20Damage%20Waiver)%20%20%5Cr%5Cn%EC%9D%BC%EC%A0%95%20%ED%95%9C%EB%8F%84%20%EB%82%B4%EC%9D%98%20%EA%B3%A0%EA%B0%9D%EC%B1%85%EC%9E%84%20(Accident%20Damage%20Excess)%20%EC%9D%84%20%EB%A9%B4%EC%B1%85%ED%95%B4%20%EC%A3%BC%EB%8A%94%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%EC%9E%85%EB%8B%88%EB%8B%A4.%20%5Cr%5CnLDW%20%EC%97%90%20%EA%B0%80%EC%9E%85%EB%90%98%EC%96%B4%20%EC%9E%88%EB%8D%94%EB%9D%BC%EB%8F%84%20%EC%82%AC%EA%B3%A0%20%EC%8B%9C%20%EC%B0%A8%EB%9F%89%EC%97%90%20%EC%86%90%EC%83%81%EC%9D%B4%20%EB%B0%9C%EC%83%9D%ED%95%A0%20%EA%B2%BD%EC%9A%B0%20%EC%9E%84%EC%B0%A8%EC%9D%B8%EC%97%90%EA%B2%8C%20%EC%9D%BC%EC%A0%95%20%ED%95%9C%EB%8F%84%20%EB%82%B4%EC%9D%98%20%EA%B3%A0%EA%B0%9D%EC%B1%85%EC%9E%84%20%EA%B8%88%EC%95%A1%20(Accident%20Damage%20Excess)%EC%9D%B4%20%EC%A0%81%EC%9A%A9%EB%90%A9%EB%8B%88%EB%8B%A4.%22%2C%22IncludedInBasePrice%22%3Atrue%2C%22IncludedInTotalPrice%22%3Atrue%2C%22Type%22%3A24%2C%22TypeName%22%3A%22Loss%20damage%20waiver%22%2C%22UnitCharge%22%3A0%2C%22UnitName%22%3Anull%7D%2C%7B%22Description%22%3A%22%EC%9E%84%EC%B0%A8%EC%9E%84%20%EC%83%81%ED%95%B4%20%EB%B0%8F%20%ED%9C%B4%EB%8C%80%ED%92%88%20%EB%B6%84%EC%8B%A4%20%EB%B3%B4%ED%97%98%20(PI%3A%20Personal%20Insurance)%20%5Cr%5Cn%EC%9E%84%EC%B0%A8%20%EC%A4%91%EC%97%90%20%EB%B0%9C%EC%83%9D%ED%95%9C%20%EC%9E%84%EC%B0%A8%EC%9D%B8%20%EB%B0%8F%20%EB%8F%99%EC%8A%B9%EC%9E%90%EC%9D%98%20%EC%83%81%ED%95%B4%20%EB%B0%8F%20%ED%9C%B4%EB%8C%80%ED%92%88%20%EB%B6%84%EC%8B%A4%EC%97%90%20%EB%8C%80%ED%95%9C%20%EB%B3%B4%ED%97%98%EC%9E%85%EB%8B%88%EB%8B%A4.%22%2C%22IncludedInBasePrice%22%3Atrue%2C%22IncludedInTotalPrice%22%3Atrue%2C%22Type%22%3A38%2C%22TypeName%22%3A%22Personal%20property%20insurance%22%2C%22UnitCharge%22%3A0%2C%22UnitName%22%3Anull%7D%5D%2C%22CurrencyCode%22%3A%22KRW%22%2C%22Equipment%22%3A%5B%5D%2C%22Fee%22%3A%5B%5D%2C%22PaymentType%22%3Anull%2C%22RateDistance%22%3A%7B%22Description%22%3A%22%EB%B3%B8%20%EC%9E%84%EB%8C%80%EC%B0%A8%EB%9F%89%EC%9D%80%20%EC%9E%84%EC%B0%A8%EA%B8%B0%EA%B0%84%20%EB%8F%99%EC%95%88%20%EC%A3%BC%ED%96%89%EA%B1%B0%EB%A6%AC%20%EC%A0%9C%ED%95%9C%20%EC%97%86%EC%9D%B4%20%EC%9D%B4%EC%9A%A9%EA%B0%80%EB%8A%A5%ED%95%9C%20%EC%B0%A8%EB%9F%89%EC%9E%85%EB%8B%88%EB%8B%A4%22%2C%22ExtraQuantity%22%3A0%2C%22IncludedQuantity%22%3A0%2C%22PeriodUnitName%22%3Anull%2C%22UnitCharge%22%3A0%2C%22UnitName%22%3A%221%22%2C%22Unlimited%22%3Atrue%7D%2C%22Tax%22%3A%5B%7B%22Description%22%3A%22Tax%22%2C%22IncludedInBasePrice%22%3Afalse%2C%22IncludedInTotalPrice%22%3Atrue%2C%22Price%22%3A4909.05%2C%22Type%22%3A7%2C%22TypeName%22%3A%22Tax%22%7D%5D%2C%22Taxesandfees%22%3A4909.05%2C%22TotalPrice%22%3A53999.55%7D%5D%2C%22Size%22%3A3%2C%22TransmissionType%22%3Anull%2C%22Uid%22%3A3%2C%22BrandCode%22%3A%22ZE%22%2C%22BrandName%22%3A%22%ED%97%88%EC%B8%A0%22%2C%22ProviderCode%22%3A%22ZE%22%2C%22PickUpLocation%22%3A%7B%22Address%22%3A%7B%22AddressLine1%22%3A%22LVL%201%20EAST%20SIDE%2C2851%20USEO-DONG%22%2C%22AddressLine2%22%3A%22%22%2C%22CityName%22%3A%22INCHEON%22%2C%22CountryCode%22%3A%22KR%22%2C%22CountryName%22%3Anull%2C%22PostalCode%22%3A%2223010%22%2C%22StateCode%22%3A%22%22%2C%22StateName%22%3Anull%7D%2C%22Distance%22%3A637.87%2C%22Fax%22%3A%22%2B82%2032-882-5190%22%2C%22Latitude%22%3A37.447778%2C%22LocationCode%22%3A%22ICN%22%2C%22LocationName%22%3A%22INCHEON%20INTL%20APT%22%2C%22LocationType1%22%3A%2214%22%2C%22LocationType2%22%3A%221%22%2C%22Longitude%22%3A126.458083%2C%22Telephone%22%3A%22%2B82%2032-743-8000%22%7D%2C%22ReturnLocation%22%3A%7B%22Address%22%3A%7B%22AddressLine1%22%3A%22LVL%201%20EAST%20SIDE%2C2851%20USEO-DONG%22%2C%22AddressLine2%22%3A%22%22%2C%22CityName%22%3A%22INCHEON%22%2C%22CountryCode%22%3A%22KR%22%2C%22CountryName%22%3Anull%2C%22PostalCode%22%3A%2223010%22%2C%22StateCode%22%3A%22%22%2C%22StateName%22%3Anull%7D%2C%22Distance%22%3A637.87%2C%22Fax%22%3A%22%2B82%2032-882-5190%22%2C%22Latitude%22%3A37.447778%2C%22LocationCode%22%3A%22ICN%22%2C%22LocationName%22%3A%22INCHEON%20INTL%20APT%22%2C%22LocationType1%22%3A%2214%22%2C%22LocationType2%22%3A%221%22%2C%22Longitude%22%3A126.458083%2C%22Telephone%22%3A%22%2B82%2032-743-8000%22%7D%2C%22Message%22%3A%5B%7B%22Description%22%3A%22RATE%20MAY%20BE%20SUBJECT%20TO%20VERIFICATION%20OF%20ID%22%2C%22Type%22%3A%22792%22%7D%5D%2C%22TotalPrice%22%3A53999.55%2C%22Unlimited%22%3Atrue%7D"><input type="hidden" id="vehAvailRateRQData" name="vehAvailRateRQData" value="%7B%22Age%22%3A25%2C%22AssociateTag%22%3A%22HNT%22%2C%22CarType%22%3Anull%2C%22CompanyCode%22%3A%22HNT%22%2C%22CountryOfResidence%22%3A%22KR%22%2C%22Language%22%3A%22ko-KR%22%2C%22LocationType%22%3A%221%22%2C%22LoyaltyProgram%22%3Anull%2C%22PickUpDate%22%3A%222017-11-30%22%2C%22PickUpLocation%22%3A%226034828%22%2C%22PickUpTime%22%3A%2212%3A00%22%2C%22ProviderCode%22%3Anull%2C%22ReturnDate%22%3A%222017-12-01%22%2C%22ReturnLocation%22%3A%226034828%22%2C%22ReturnTime%22%3A%2212%3A00%22%2C%22SpecialEquip%22%3Anull%2C%22UserIP%22%3A%22210.92.47.5%22%7D"><input type="hidden" id="exchangeRateData" name="exchangeRateData" value="%5B%7B%22CURRENCY_CODE%22%3A%22USD%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%221109%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22GBP%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%221481%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22CAD%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22875%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22CHF%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%221132%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22HKD%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22143%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22SEK%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22135%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22AUD%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22846%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22DKK%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22178%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22NOK%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22137%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22SAR%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22303%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22KWD%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%223749%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22BHD%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%223003%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22AED%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22309%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22JPY%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%2210%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22THB%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%2235%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22SGD%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22825%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22INR%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%220%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22MYR%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22279%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22IDR%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%221%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22PKR%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%2211%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22BDT%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%2214%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22PHP%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%2224%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22CNY%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22174%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22EGP%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%220%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22MXN%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%2261%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22BRL%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22373%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22BND%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22841%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22NZD%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22764%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22TWD%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%2240%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22EUR%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%221314%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22HUF%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%225%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22RUB%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%2220%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22VND%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%221%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22TRY%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%22300%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22CZK%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%2255%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22ZAR%22%2C%22CURRENCY_DATE%22%3A%2220171123%22%2C%22CURRENCY_RATE%22%3A%2284%22%7D%2C%7B%22CURRENCY_CODE%22%3A%22KRW%22%2C%22CURRENCY_DATE%22%3A%2220080101%22%2C%22CURRENCY_RATE%22%3A%221%22%7D%5D"><input type="hidden" id="reSpecialEquips" name="reSpecialEquips" value=""><input type="hidden" id="k_name" name="k_name"><input type="hidden" name="inpMid" id="inpMid" value=""><input type="hidden" name="mkr_name" id="mkr_name" value=""><input type="hidden" name="ResSeq" id="ResSeq"><input type="hidden" name="ReferenceNo" id="ReferenceNo"><input type="hidden" name="ConfirmationNo" id="ConfirmationNo"><input type="hidden" name="amtPrice" id="amtPrice" value="53,999"><input type="hidden" name="modelCode" id="modelCode" value="EDAR">
<input type="hidden" name="seq" value="${rentCarDTO.seq}">
<input type="hidden" name="car_name" value="${rentCarDTO.car_name}">
<input type="hidden" name="total_price" value="${rentCarDTO.price}">
<input type="hidden" name="no_member" value="${no_member}">
<div class="my_choicecar">
<p class="thumb_car"><img src="../image/rentCar/${rentCarDTO.imageName}" width="269px" height="179px" alt="" id="imgRentCar"></p>
<div class="reser_car">
<div class="brand">
<p class="ci"><img src="http://image1.hanatour.com/_images/rentercar/rentcar_ci_ZE.gif" width="59px" height="23px" alt="ZE" id="imgBrand"></p>
<p class="brand_name"><strong id="ModelName">${rentCarDTO.car_name}</strong></p><span class="grade" id="VehicleSize">${rentCarDTO.car_type}</span><button class="btn_change" id="btnChange" onclick="javascript:history.go(-1); return false;">차량변경</button></div>
<div class="rent_price">
<ul class="option_list" id="OptionList"><li>주행무제한</li><li>보험포함</li><li>세금포함</li></ul>
<div class="total_price"><span class="txt">총 요금</span><strong class="t_price" id="TotalPrice"><strong>KRW</strong>&nbsp;${rentCarDTO.price}</strong><span class="tax" id="BasePrice"><b>￦${rentCarDTO.price}</b> / <span>당일환율기준</span><br>총 대여일 기준 (세금포함)</span></div>
</div>
</div>
</div>
<div class="reservation_carinfo">
<h4>
                대여차량 정보 <span class="desc">현지 사정에 따라 대여 당일 차량 및 옵션 변경이 될수 있습니다.</span></h4>
<div class="info_section table_t1">
<table cellpadding="0" cellspacing="0" width="100%" summary="탑승인원,수화물개수,에어컨유무,변속기타입,연료타입">
<caption>대여차량 옵션정보 안내</caption>
<colgroup>
<col width="20%">
<col width="20%">
<col width="20%">
<col width="20%">
<col width="20%">
</colgroup>
<thead>
<tr>
<th><span class="ico passenger">탑승인원</span></th>
<th><span class="ico bagage">수화물개수</span></th>
<th><span class="ico aircon">에어컨유무</span></th>
<th><span class="ico gearbox">변속기타입</span></th>
<th><span class="ico oil">연료타입</span></th>
</tr>
</thead>
<tbody id="OptionInfo"><tr><td>${rentCarDTO.occupancy}명</td><td>2개</td><td>있음</td><td>${rentCarDTO.transmission_type}</td><td>미정</td></tr></tbody>
</table>
</div>
<h4>대여/반납장소</h4>
<div class="info_section table_t2">
<table cellpadding="0" cellspacing="0" width="100%" summary="대여일시,반납일시 주소,전화,오픈시간 안내">
<caption>대여/반납장소</caption>
<colgroup>
<col width="50%">
<col width="50%">
</colgroup>
<thead>
<tr>
<th><b class="tit">대여일시</b><strong class="date" id="PickUpInfo">${rentTime} ${rentHour} ${rentMinute}</strong><span>(현지시각 기준)</span></th>
<th><b class="tit">반납일시</b><strong class="date" id="ReturnInfo">${returnTime} ${returnHour} ${returnMinute}</strong><span>(현지시각 기준)</span></th>
</tr>
</thead>
<tbody>
<tr>
<td id="pickupStation"><p class="rt_place">  <strong>${rentlocation}</strong></p><p class="rent_locationtype">공항(전체)</p><ul class="rent_place">    <li>        <b class="tit">주소</b><span>23010&nbsp;LVL 1 EAST SIDE,2851 USEO-DONG&nbsp;</span>    </li>    <li>        <b class="tit">전화</b>        <span>+82 32-743-8000 / 팩스:+82 32-882-5190</span>    </li></ul></td>
<td id="returnStation"><p class="rt_place">  <strong>${returnlocation}</strong></p><p class="rent_locationtype">공항(전체)</p><ul class="rent_place">    <li>        <b class="tit">주소</b><span>23010&nbsp;LVL 1 EAST SIDE,2851 USEO-DONG&nbsp;</span>    </li>    <li>        <b class="tit">전화</b>        <span>+82 32-743-8000 / 팩스:+82 32-882-5190</span>    </li></ul></td>
</tr>
</tbody>
</table>
</div>
<h4>여행약관</h4>
<div class="tterms contractTab">
<li class="on" id="liAgree1"><a href="javascript:;" onclick="" class="tts_tab tt_01"><span>여행상품 관련 약관</span></a><div class="tte_box">
<div class="tte_cont">
<div class="agree_contents board_t1" style="border: 0 none; height: 200px"><strong style="font-size: 14px; color: #000">제1장(총칙)</strong><br><br>
						제1조 (목적)<br>
						이 약관은 ㈜하나투어(이하 "회사"라 합니다)가 해외 렌터카업체를 대신하여 하나투어 홈페이지 (이하 “사이버 지점”이라 합니다)를 통해 제공하는 렌터카 관련 서비스(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리 의무 및 책임 사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
						제2조 (용어의 정의)<br><br>
						① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
							1. 사이버 지점이란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장으로서, 이용자가 온라인을 통해 서비스를 이용할 수 있는 회사의 인터넷 사이트를 말하며, 회사를 운영하는 사업자의 의미로도 사용합니다.<br>
							2. 이용자란 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
							3. 회원이라 함은 이 약관에 동의하고 회사에 제반 정보를 제공하여 회원등록을 한 자로서, 회사의 정보를 지속적으로 제공받으며, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>
							4. 비회원이라 함은 회원에 가입하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.<br>
						② 제1항 각호에서 정하는 것을 제외한 용어의 정의는 관련법령 및 기타 일반적인 상관례에 의합니다.<br><br>
						제3조(약관의 명시와 개정)<br><br>
						① 회사는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자 등록번호,연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 사이버 지점의 초기 서비스화면(전면)에 게시합니다.<br>
						② 회사는 약관의 규제등에 관한 법률, 전자거래기본법, 전자 서명법, 정보 통신망 이용촉진등에 관한 법률, 방문판매등에 관한 법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
						③ 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 사이버 지점의 초기화면 게시합니다.<br>
						④ 회사가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 회사가 "이용자가 상당한 기간 내에 변경 약관에 대한 동의 여부를 표명하지 아니 하는 때에는 변경약관의 적용을 받는 것으로 본다"는 취지의 통지를 하였음에도 이용고객이 동의 여부를 표명하지 아니한 경우 또는 부득이하게 그러한 통지를 할 수 없는 경우에는 개정 전에 체결된 계약에도 개정약관이 적용됩니다.<br>
						⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래 소비자보호지침 및 관계법령 또는 상 관례에 따릅니다.<br>
						제4조 (서비스의 제공 및 변경)<br><br>
						①회사는 다음과 같은 업무를 수행합니다.<br>
						1. 해외 렌터카 업체 서비스에 대한 정보의 제공<br>
							2. 해외 렌터카 차량 예약 및/또는 서비스 계약 체결<br>
						3. 기타 회사에서 제공하는 서비스<br>
						② 회사는 대여차량의 예약마감 또는 차량 사양의 변경 및 불가피한 여건이나 사정 등의 경우에는 장차 체결되는 계약에 의해 제공할 대여차량의 내용을 변경할 수 있습니다. 이 경우에는 변경된 대여차량과 용역의 내용 및 제공일자를 명시하여 현재의 대여차량과 용역의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다. 단, 회사는 불가피한 여건이나 사정이 있는 경우, 위 공지를 하지 않을 수 있습니다.<br>
						③ 회사가 이용자와 제공하기로 계약을 체결한 서비스의 내용을 대여차량의 예약마감 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 회사는 이로 인하여 이용자가 입은 손해에 대하여는 배상하지 아니합니다.<br><br>
						제5조 (서비스의 중단)<br><br>
						① 회사는 천재지변, 전쟁, 폭동, 내란, 법령의 제정 개폐, 공권력에 의한 명령 처분, 노동쟁의, 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스 제공을 일시적으로 중단할 수 있습니다.<br>
						② 회사는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상하지 아니합니다. 단, 회사에 고의 또는 중과실이 있는 경우에는 그러하지 아니합니다.<br><br><strong style="font-size: 14px; color: #000">제2장 대여예약</strong><br><br>
						제6조 (예약신청)<br><br>
						이용자는 이하의 방법에 의하여 차량대여 예약을 신청합니다.<br>
						 -사이버 지점 상에서 예약을 신청하는 방법<br>
							1. 성명, 주소, 전화번호(이동전화번호), 이메일주소 입력<br>
							2. 차량 대여일과 반납일을 입력<br>
							3. 차량의 인수/반납 장소 선택<br>
							4. 대여차량의 선택 및 대여 요금 확인<br>
							5. 이 약관에 동의한다는 표시(예, 마우스 클릭)<br>
							6. 예약사항 확인 또는 회사의 확인에 대한 동의<br><br>
						제7조 (예약의 성립)<br><br>
						① 회사는 제6조와 같은 예약신청에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다.<br>
							1. 신청 내용에 허위, 기재누락, 오기가 있는 경우<br>
							2. 렌터카 대여자격조건에 합당치 않은 경우&lt;대여자격&gt;<br>
							  - 해외 여행에 결격 사유가 없는 자, 해당 업체에서 규정한 차량 대여 연령에 해당 되는 자<br>
							3. 기타 차량대여 예약신청에 승낙하는 것이 대여차량 예약마감, 차량 사양의 변경 등 사유로 인하여 현저히 지장이 있다고
								판단하는 경우<br>
						② 렌터카 예약은, 사이버 지점 예약의 경우에는 렌터카 예약에 대하여 예약번호를 포함한 창의 형태로 이용자에게 도달한 시점에 성립한 것으로 봅니다.<br><br>

						제8조 (대금결제)<br>
						이용자는 사이버지점을 통해 예약을 완료한 후 현지에서 신용카드로 이용대금을 결제합니다. <br>
						결제절차는 아래와 같습니다. <br>예
						① 운전자 명의의 신용카드(해외사용가능 카드)로 차량 인수 시 신용카드를 Deposit하게 됩니다.<br>
						② 차량반납 시 Deposit한 신용카드로 차량이용 대금이 결제됩니다. (차량,옵션,보험비용 등)<br>
						③ 주행 중 발생한 주차비, 과태료 등은 차량반납일이 지난 시점에 청구될 수 있습니다.<br><br>
						제9조 (예약확인 통지 및 이용자의 예약 취소)<br><br>
						①회사는 이용자가 차량대여 예약을 완료한 경우 이용자에게 예약확인 통지를 합니다.<br>
						② 예약확인 통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 예약확인 통지를 받은 후 차량 인수 48시간 전까지 예약 취소를 요청할 수 있습니다.<br><br>
						제10조 (회사의 예약 취소 및 환불)<br><br>
						① 회사는 이용자가 차량예약완료 후, 차량의 이상 또는 전산상의 오류 등의 사유로 차량을 대여할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고, 사전에 차량 대여에 대한 대금을 받은 경우에는 대금을 받은 날부터 7일 이내에, 그렇지 않은 경우에는 그 사유발생일로부터 7일 이내에 계약해제 절차를 취합니다. 이 때 회사가 사전에 대금을 받은 경우에는 지급받은 대금과 지급받은 대금의 10%를 합한 금액을 환불합니다.<br>
						② 다음 각 호의 경우에는 회사는 대여된 차량일지라도 차량을 반납 받은 다음 1 영업일 이내에 이용자의 요구에 따라 즉시 환불, 반납 또는 교환 조치를 합니다. 다만 이용자의 요구 기한은 차량이 인도된 날로부터 차량 반납 예정일 이내로 합니다.<br>
							1. 예약된 차량이 이용자 예약 내용과 상이하거나 회사가 제공한 정보와 상이할 경우<br>
							2. 예약된 차량이 파손, 손상 되었을 경우. 단, 이용자의 책임 있는 사유로 차량이 훼손된 경우는 제외합니다.<br><br>
						제11조 (해외예약대행)<br><br>
						① 해외에서 차량을 대여하고자 하는 경우 예약시간 기준 최소 48시간 전에 예약하여야 합니다.<br>
						② 회사는 해외 차량 대여 예약만 대행할 뿐, 해외에서의 렌터카 이용에 관한 책임은 없습니다.<br>
							해외에서 제공하는 차량 및 기타 서비스는 각 해당 업체에서 제공합니다.<br>
						③ 해외에서의 차량예약 및 대여를 위해 필요한 최소한의 개인정보(성명, 연락처, 여권번호, 운전면허번호)가 계약의 이행에 필요한 업무를 수탁한 제휴업체에 제공됩니다.<br>
						④  해외 차량 대여 예약을 하는 경우에는 반드시 해외업체가 승인하는 신용카드로 대금을 결제하여야 합니다.<br><br><strong style="font-size: 14px; color: #000">제3장 이용자의 의무사항</strong><br><br>
						제12조 (개인정보보호) <br><br>
						① 회사는 관련법령이 정하는 바에 따라 이용자의 개인정보를 보호하기 위해 노력합니다. 이용자 개인정보의 보호 및 사용에 대해서는 관련법령 및 회사가 별도로 고지하는 개인정보처리방침이 적용됩니다.<br>
						② 회사는 이용자의 귀책사유로 인하여 노출된 이용자의 개인정보를 포함한 모든 정보에 대해서 일체의 책임을 지지 않습니다.<br>
						③ 이용자는 언제든지 회사가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구 할 수 있으며 회사는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 회사는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br><br>
						제13조 (회사의 의무) <br><br>
						① 회사는 법령과 이 약관이 금지하거나 선량한 풍속 기타 사회질서에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하는 데 최선을 다하여야 합니다.<br>
						② 회사는 이용자가 안전하게 서비스)를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br>
						③ 회사는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. 광고성 전자우편 수신을 원하지 않는 이용자에게는 더 이상 광고성 전자우편을 발송하지 않습니다.<br>
						제14조 (회원의 ID 및 Password)<br><br>
						① 사이버 지점을 이용하고자 하는 회원은 회사가 정하는 바에 따라 회원 ID 및 Password를 사이버 지점에 각각 등록하여야 합니다.<br>
						② 회원 ID와 Password에 관한 관리책임은 회원에게 있으며, 회원은 자신의 ID 및 Password를 제3자에게 알려주거나 이용하게 해서는 안됩니다.<br>
						③ 회원이 자신의 ID 또는 Password를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.<br>
						제15조 (이용자의 의무) <br><br>
						① 이용자는 관련법령, 이 약관에서 정한 사항, 기타 회사의 이용안내 및 주의사항으로 고지한 내용을 준수하여야 하며, 기타 회사의 정상적 업무를 방해하는 행위를 하여서는 안됩니다.<br>
						② 이용자는 가입신청 시 정직하고 성실하게 가입신청서를 회원정보를 작성해야 하며, 기재한 사항이 변경되었을 경우 사실에 맞게 수정해야 합니다. 만일 변경하지 않아 발생하게 되는 모든 문제에 대해서는 이용자가 책임을 부담하게 됩니다.<br>
						③ 이용자는 서비스를 이용하여 얻은 정보를 회사의 사전동의 없이 임의로 복사, 복제, 변경해서는 아니 되며, 영리목적으로 활용하여서도 안됩니다.<br>
						④ 이용자는 제1항부터 제3항까지의 행위 이외에도 다음의 행위를 하여서는 안됩니다.<br>
						  1. 신청 또는 변경 시 허위내용의 등록<br>
						  2. 사이버 지점 또는 회사의 영업점에 게시된 정보의 변경<br>
						  3. 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 사이버 지점 또는 회사의 영업점에 송신 또는 게시<br>
						  4. 회사 기타 제3자의 저작권 등 지식재산권에 대한 침해<br>
						  5. 회사 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
						  6. 타인의 명의 또는 정보 도용<br>
						  7. 외설 또는 폭력적인 메시지 화상 음성 기타 선량한 풍속 기타 사회질서에 반하는 정보를 사이버 지점 또는 회사의 영업점에 공개 또는 게시<br>
						  8. 사실관계를 왜곡하는 정보제공 행위 등 기타 회사가 부적절 하다고 판단하는 행위<br>
						⑤ 제4항 각 호의 정보 기타 회사가 부적절 하다고 판단한 정보가 사이버 지점 또는 회사의 영업점에 게시되거나 사이버지점과 링크 된 곳에 게시된 경우, 회사는 이용자 기타 정보의 게시를 행한 자의 승낙 없이 게재된 당해 정보를 삭제, 파기하거나 사이버지점에 확장된 링크를 절단할 수 있습니다. 단, 회사는 이러한 정보의 삭제, 파기, 링크의 절단 등을 할 의무를 지지 않습니다.<br><br><strong style="font-size: 14px; color: #000">제4장 기타</strong><br><br>
						제16조 (사이버 지점과 피연결 사이트 간의 관계)<br><br>
						① 사이버지점과 해외렌터카업체의 인터넷사이트가 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됩니다)방식 등으로 연결된 경우, 전자를 연결사이트라고 하고 후자를 피연결사이트라고 합니다.<br>
						② 사이버지점은 해외렌터카업체가 피연결사이트를 통해 독자적으로 제공하는 재화, 용역에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않습니다.<br><br>
						제26조 (저작권의 귀속 및 이용제한) <br><br>
						①  회사가 작성한 저작물에 대한 저작권 기타 지식재산권은 회사에 귀속합니다.<br>
						② 이용자는 회사를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br><br>
						제17조 (분쟁해결) <br><br>
						① 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리조직을 설치 운영합니다.<br>
						② 회사는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리 일정을 즉시 통보해 드립니다.<br><br>
						제18조 (재판권 및 준거법) <br><br>
						① 회사와 이용자간에 발생한 분쟁에 관한 소송은 회사의 본점이나 영업점 소재지 관할법원 또는 민사소송법에 의한 관할법원에 제기할 수 있습니다.<br>
						② 회사와 이용자간에 제기된 소송에는 대한민국 법을 적용합니다.<br><br>
						&lt;부칙&gt;<br><br>
						이 약관은 2015년 4월 1일부터 시행합니다.     
                      </div>
</div>
<p class="sel_agree"><input type="radio" name="agree_a" id="agree01" class="r_agree" onclick="moveAgreeNext(this, 2)"><label for="agree01" class="mrY">동의합니다</label><input type="radio" name="agree_a" id="noagree01" class="r_agree" onclick="moveAgreeNext(this, 2)"><label for="noagree01" class="mrY">동의하지 않습니다.</label></p>
</div>
</li>
<li id="liAgree2"><a href="javascript:;" onclick="" class="tts_tab tt_02"><span>개인정보 수집 및 이용안내</span></a><div class="tte_box">
<div class="tte_cont">
<iframe src="/TwoTour/rentCar/rentCarRule.jsp" style="width:690px; height: 260px; margin-top: 0px; padding: 10px; overflow:scroll;" frameborder="0" scrolling="auto"></iframe>
</div>
<p class="sel_agree"><input type="radio" name="agree_b" id="agree02" class="r_agree" onclick="moveAgreeNext(this, 3)"><label for="agree02" class="mrY">동의합니다</label><input type="radio" name="agree_b" id="noagree02" class="r_agree" onclick="moveAgreeNext(this, 3)"><label for="noagree02" class="mrY">동의하지 않습니다.</label></p>
</div>
</li>
<li id="liAgree3"><a href="javascript:;" onclick="" class="tts_tab tt_03"><span>개인정보 제 3자 제공 및 공유안내</span></a><div class="tte_box">
<div class="tte_cont">
<iframe src="/TwoTour/rentCar/rentCarRule2.jsp" style="overflow:scroll; width:690px; height: 260px; margin-top: 0px; padding: 10px;" frameborder="0" scrolling="auto"></iframe>
</div>
<p class="sel_agree"><input type="radio" name="agree_c" id="agree03" class="r_agree" onclick="moveAgreeNext(this, 4)"><label for="agree03" class="mrY">동의합니다</label><input type="radio" name="agree_c" id="noagree03" class="r_agree" onclick="moveAgreeNext(this, 4)"><label for="noagree03" class="mrY">동의하지 않습니다.</label></p>
</div>
</li>
<li id="liAgree4"><a href="javascript:;" onclick="" class="tts_tab tt_04"><span>개인정보 활용 동의 안내(선택)</span></a><div class="tte_box">
<div class="tte_cont">
<iframe src="/TwoTour/rentCar/rentCarRule3.jsp" style="overflow:scroll; width:690px; height: 260px; margin-top: 0px; padding: 10px;" frameborder="0" scrolling="auto"></iframe>
</div>
<p class="sel_agree"><input type="radio" name="agree_d" id="agree04" class="r_agree"><label for="agree04" class="mrY">동의합니다</label><input type="radio" name="agree_d" id="noagree04" class="r_agree"><label for="noagree04" class="mrY">동의하지 않습니다.</label></p>
</div>
</li>
</div>
<h4 id="topInfoSection">차량 임대 영업점 고객 안내 사항</h4>
<div class="info_section board_t1" style="height: 40px" id="dvInfoSection"><ul><li>※RATE MAY BE SUBJECT TO VERIFICATION OF ID</li></ul></div>
<div class="info_section rent_agree_section">
<div class="agree_info">
<div class="board_t1 m_right5" style="height: 100px" id="spDistance"><ul class="option_price"><li>운행제한사항 (거리제한여부)</li><li><span class="tit">운행거리제한여부</span>: 무제한</li><li>본 임대차량은 임차기간 동안 주행거리 제한 없이 이용가능한 차량입니다</li></ul></div>
<div class="info_section agree_box"><input type="checkbox" data-warn="#warn_chkNoticeAgree02" id="chkNoticeAgree02" name="chkNoticeAgree02" class="chk_chekbox" tabindex="22"><label for="chkNoticeAgree02" id="lblchkNoticeAgree02" tabindex="30" class="rent_check">확인 및 동의합니다.</label><p class="warning_txt" id="warn_chkNoticeAgree02" >약관에 동의해주세요</p>
</div>
</div>
<div class="agree_info">
<div class="board_t1 m_right5" style="height: 100px">
                    요금은 차량 임대 장소에서 신용카드로 결제를 진행하면 됩니다. 해외의 경우 여권, 국제운전자면허증, 신용카드가 필수 이며 영문명, 생년월일은 여권/국제운전자면허증에 기입된 것이 일치하여야 합니다.
                  </div>
<div class="info_section agree_box"><input type="checkbox" data-warn="#warn_chkNoticeAgree03" id="chkNoticeAgree03" name="chkNoticeAgree03" class="chk_chekbox" tabindex="22"><label for="chkNoticeAgree03" id="lblchkNoticeAgree03" tabindex="30" class="rent_check">확인 및 동의합니다.</label><p class="warning_txt" id="warn_chkNoticeAgree03" >약관에 동의해주세요</p>
</div>
</div>
<div class="agree_info">
<div class="board_t1 m_right5" style="height: 100px">
                    해당 변동사항에 대한 안내에 동의합니다.
                    요청차량은 현지 사정에 따라 유사한 차량으로 대체 될 수 있으며 생년월일(연령) 오류 또는 해당국가의 법령에 따라 필수 가입하여야 하는 보험, 차량장비 추가에 따라 현재 표시된 요금에서 추가금이 발생할 수 있습니다. 최종적인 계약 변동사항은 해당국가의 정책을 따릅니다.
                  </div>
<div class="info_section agree_box"><input type="checkbox" data-warn="#warn_chkNoticeAgree04" id="chkNoticeAgree04" name="chkNoticeAgree04" class="chk_chekbox" tabindex="22"><label for="chkNoticeAgree04" id="lblchkNoticeAgree04" tabindex="30" class="rent_check">확인 및 동의합니다.</label><p class="warning_txt" id="warn_chkNoticeAgree04" >약관에 동의해주세요</p>
</div>
</div>
</div>
<div class="all_agree_section"><input type="checkbox" id="chkAllAgree" name="chkAllAgree" class="chk_chekbox" tabindex="26"><label for="chkAllAgree" id="lblchkAllAgree" class="rent_check">전체 약관에 동의합니다.</label></div>
<h4>운전자 정보</h4>
<div class="info_section table_t3">
<table cellpadding="0" cellspacing="0" width="100%" summary="운전자 영문성명,운전자국적,법정생년월일,휴대폰번호,이메일">
<caption>운전자 정보 안내</caption>
<colgroup>
<col width="28%">
<col width="72%">
</colgroup>
<tbody>
<tr>
<th><span class="imt">*</span> 운전자 성명</th>
<td>
<div class="sel_input01 f_left m_right5" style="width: 150px" id="dvWarn_bkr_name_S"><input type="text" value="" placeholder="한글 성" data-warn="#warn_Name" id="bkr_name_S" name="name1" data-defaulttext="한글 성" data-intype="kor" tabindex="1" ></div>
<div class="sel_input01 f_left m_right5" style="width: 150px" id="dvWarn_bkr_name_G"><input type="text" value="" placeholder="한글 이름" data-warn="#warn_Name" id="bkr_name_G" name="name2" data-defaulttext="한글 이름" data-intype="kor" tabindex="2" ></div>
<div class="sel_input01 f_left m_right5" style="width: 150px;margin-top:10px;" id="dvWarn_SurName"><input type="text" value="" placeholder="영문 성" data-warn="#warn_Name" id="SurName" name="first_name" data-defaulttext="영문 성" data-intype="eng" tabindex="3" style="ime-mode:disabled"></div>
<div class="sel_input01 f_left m_right5" style="width: 150px;margin-top:10px;" id="dvWarn_GivenName"><input type="text" value="" placeholder="영문 이름" data-warn="#warn_Name" id="GivenName" name="last_name" data-defaulttext="영문 이름" data-intype="eng" tabindex="4" style="ime-mode:disabled"></div>
<p class="warning_txt2" id="warn_Name" style="display:none;"></p>
</td>
</tr>
<tr>
<th><span class="imt">*</span> 운전자 국적
                      </th>
<td id="country">대한민국(KR)</td>
</tr>
<tr>
<th><span class="imt">*</span> 법정생년월일
                      </th>
<td>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox100" id="sb595867432" style=" height:40px;">
		<select class="selbox100 has_sb" id="BirthDateYYYY" name="year" onchange="javascript:chkBirthDate();" style="display: block; height:30px;"><option value="" selected="true">선택</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option><option value="1909">1909</option><option value="1908">1908</option><option value="1907">1907</option><option value="1906">1906</option><option value="1905">1905</option><option value="1904">1904</option><option value="1903">1903</option><option value="1902">1902</option><option value="1901">1901</option></select>
	</div>
</div>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox100" id="sb595867432" style="height:40px;">
		<select class="selbox100 has_sb" id="BirthDateMM" name="month" onchange="javascript:chkBirthDate();" style="display: block; height:30px;"><option value="" selected="true">선택</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
	</div>
</div>
<div class="f_left m_right5">
	<div class="sb selectbox selbox100" id="sb595867432">
		<select class="selbox100 has_sb" id="BirthDateDD" name="day" onchange="javascript:chkBirthDate();" style="display: block; height:30px;"><option value="" selected="true">선택</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
	</div>
</div>	
<p class="warning_txt3" id="warn_age" style="display:none;"></p>
</td>
</tr>
<tr>
<th><span class="imt">*</span> 휴대폰번호
                      </th>
<td>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox220" id="sb43723933" style="width:206px; height:40px;">
		<select class="selbox220 has_sb" id="CountryAccessCode" name="CountryAccessCode" style="display: block; height:30px;"><option value="389">마케도니아 공화국(+389)</option><option value="233">가나(+233)</option><option value="241">가봉(+241)</option><option value="592">가이아나(+592)</option><option value="220">감비아(+220)</option><option value="590">과들루프(+590)</option><option value="502">과테말라(+502)</option><option value="1 671">괌(+1 671)</option><option value="1 473">그레나다(+1 473)</option><option value="995">조지아(+995)</option><option value="30">그리스(+30)</option><option value="299">그린란드(+299)</option><option value="224">기니(+224)</option><option value="245">기니 비사우(+245)</option><option value="264">나미비아(+264)</option><option value="674">나우루(+674)</option><option value="234">나이지리아(+234)</option><option value="211">남수단(+211)</option><option value="27">남아프리카 공화국(+27)</option><option value="31">네덜란드(+31)</option><option value="977">네팔(+977)</option><option value="47">노르웨이(+47)</option><option value="672">노퍽 섬(+672)</option><option value="64">뉴질랜드(+64)</option><option value="687">뉴 칼레도니아(+687)</option><option value="683">니우에(+683)</option><option value="227">니제르(+227)</option><option value="505">니카라과(+505)</option><option value="886">대만(+886)</option><option value="82" selected="">대한민국(+82)</option><option value="45">덴마크(+45)</option><option value="1 767">도미니카(+1 767)</option><option value="1 809">도미니카 공화국(+1 809)</option><option value="49">독일(+49)</option><option value="670">동 티모르(+670)</option><option value="856">라오스(+856)</option><option value="231">라이베리아(+231)</option><option value="371">라트비아(+371)</option><option value="7">러시아 연방(+7)</option><option value="961">레바논(+961)</option><option value="266">레소토(+266)</option><option value="40">루마니아(+40)</option><option value="352">룩셈부르크(+352)</option><option value="250">르완다(+250)</option><option value="218">리비아(+218)</option><option value="262">레위니옹(+262)</option><option value="370">리투아니아(+370)</option><option value="423">리히텐슈타인(+423)</option><option value="261">마다가스카르(+261)</option><option value="596">마르티니크(+596)</option><option value="692">마샬 군도(+692)</option><option value="262">마 요트(+262)</option><option value="853">마카오(+853)</option><option value="265">말라위(+265)</option><option value="60">말레이시아(+60)</option><option value="223">말리(+223)</option><option value="52">멕시코(+52)</option><option value="377">모나코(+377)</option><option value="212">모로코(+212)</option><option value="230">모리셔스(+230)</option><option value="222">모리타니(+222)</option><option value="258">모잠비크(+258)</option><option value="382">몬테네그로(+382)</option><option value="1 664">몬트세라트(+1 664)</option><option value="373">몰도바 공화국(+373)</option><option value="960">몰디브(+960)</option><option value="356">몰타(+356)</option><option value="976">몽골(+976)</option><option value="1">미국(+1)</option><option value="1 340">미국령 버진 아일랜드(+1 340)</option><option value="1 684">아메리칸 사모아(+1 684)</option><option value="95">미얀마(+95)</option><option value="691">미크로네시아 ( 연방 ..(+691)</option><option value="678">바누아투(+678)</option><option value="973">바레인(+973)</option><option value="1 246">바베이도스(+1 246)</option><option value="379">바티칸시국(+379)</option><option value="1 242">바하마(+1 242)</option><option value="880">방글라데시(+880)</option><option value="1 441">버뮤다(+1 441)</option><option value="229">베냉(+229)</option><option value="58">베네수엘라(+58)</option><option value="84">베트남(+84)</option><option value="32">벨기에(+32)</option><option value="375">벨라루스(+375)</option><option value="501">벨리즈(+501)</option><option value="599">보네르 섬, 신트외스..(+599)</option><option value="387">보스니아 헤르체고비..(+387)</option><option value="267">보츠와나(+267)</option><option value="591">볼리비아(+591)</option><option value="257">부룬디(+257)</option><option value="226">부르 키나 파소(+226)</option><option value="975">부탄(+975)</option><option value="1 670">북 마리아나 제도(+1 670)</option><option value="850">북한(+850)</option><option value="359">불가리아(+359)</option><option value="55">브라질(+55)</option><option value="673">브루나이(+673)</option><option value="685">사모아(+685)</option><option value="966">사우디 아라비아(+966)</option><option value="378">산 마리노(+378)</option><option value="239">상투메프린시페(+239)</option><option value="590">생마르탱(+590)</option><option value="590">생바르텔레미(+590)</option><option value="221">세네갈(+221)</option><option value="381">세르비아(+381)</option><option value="248">세이셸(+248)</option><option value="1 758">세인트 루시아(+1 758)</option><option value="1 784">세인트 빈센트 그레나..(+1 784)</option><option value="1 869">세인트 키츠 네비스(+1 869)</option><option value="508">생피에르 미클롱(+508)</option><option value="290">세인트 헬레나(+290)</option><option value="252">소말리아(+252)</option><option value="677">솔로몬 제도(+677)</option><option value="249">수단(+249)</option><option value="597">수리남(+597)</option><option value="94">스리랑카(+94)</option><option value="268">스와질란드(+268)</option><option value="46">스웨덴(+46)</option><option value="41">스위스(+41)</option><option value="34">스페인(+34)</option><option value="421">슬로바키아(+421)</option><option value="386">슬로베니아(+386)</option><option value="963">시리아(+963)</option><option value="232">시에라 리온(+232)</option><option value="1 721">신트마르턴(+1 721)</option><option value="65">싱가포르(+65)</option><option value="971">아랍 에미리트(+971)</option><option value="297">아루바(+297)</option><option value="374">아르메니아(+374)</option><option value="54">아르헨티나(+54)</option><option value="354">아이슬란드(+354)</option><option value="509">아이티(+509)</option><option value="353">아일랜드(+353)</option><option value="994">아제르바이잔(+994)</option><option value="93">아프가니스탄(+93)</option><option value="376">안도라(+376)</option><option value="355">알바니아(+355)</option><option value="213">알제리(+213)</option><option value="244">앙골라(+244)</option><option value="1 268">앤티가바부다(+1 268)</option><option value="1 264">앵귈라(+1 264)</option><option value="291">에리트레아(+291)</option><option value="372">에스토니아(+372)</option><option value="593">에콰도르(+593)</option><option value="251">에티오피아(+251)</option><option value="503">엘살바도르(+503)</option><option value="44">영국(+44)</option><option value="1 284">영국령 버진 아일랜드(+1 284)</option><option value="246">디에고 가르시아(+246)</option><option value="967">예멘(+967)</option><option value="968">오만(+968)</option><option value="43">오스트리아(+43)</option><option value="504">온두라스(+504)</option><option value="962">요르단(+962)</option><option value="256">우간다(+256)</option><option value="598">우루과이(+598)</option><option value="998">우즈베키스탄(+998)</option><option value="380">우크라이나(+380)</option><option value="681">월리스 푸 투나(+681)</option><option value="964">이라크(+964)</option><option value="98">이란(+98)</option><option value="972">이스라엘(+972)</option><option value="20">이집트(+20)</option><option value="39">이탈리아(+39)</option><option value="91">인도(+91)</option><option value="62">인도네시아(+62)</option><option value="81">일본(+81)</option><option value="1 876">자메이카(+1 876)</option><option value="260">잠비아(+260)</option><option value="240">적도기니(+240)</option><option value="86">중국(+86)</option><option value="236">중앙 아프리카 공화국(+236)</option><option value="253">지부티(+253)</option><option value="350">지브롤터(+350)</option><option value="263">짐바브웨(+263)</option><option value="235">차드(+235)</option><option value="420">체코(+420)</option><option value="56">칠레(+56)</option><option value="237">카메룬(+237)</option><option value="238">카보 베르데(+238)</option><option value="7">카자흐스탄(+7)</option><option value="974">카타르(+974)</option><option value="855">캄보디아(+855)</option><option value="1">캐나다(+1)</option><option value="254">케냐(+254)</option><option value="1 345">케이맨 제도(+1 345)</option><option value="269">코모로(+269)</option><option value="506">코스타리카(+506)</option><option value="225">코트 디부 아르(+225)</option><option value="57">콜롬비아(+57)</option><option value="242">콩고(+242)</option><option value="243">콩고 민주 공화국(+243)</option><option value="599">퀴라소(+599)</option><option value="53">쿠바(+53)</option><option value="965">쿠웨이트(+965)</option><option value="682">쿡 제도(+682)</option><option value="385">크로아티아(+385)</option><option value="996">키르기스스탄(+996)</option><option value="686">키리바시(+686)</option><option value="357">키프로스(+357)</option><option value="992">타지키스탄(+992)</option><option value="255">탄자니아(+255)</option><option value="66">태국(+66)</option><option value="1 649">터크 스 케이커스 제..(+1 649)</option><option value="90">터키(+90)</option><option value="228">토고(+228)</option><option value="690">토켈 라우(+690)</option><option value="676">통가(+676)</option><option value="993">투르크 메니스탄(+993)</option><option value="688">투발루(+688)</option><option value="216">튀니지(+216)</option><option value="1 868">트리니다드 토바고(+1 868)</option><option value="507">파나마(+507)</option><option value="595">파라과이(+595)</option><option value="92">파키스탄(+92)</option><option value="675">파푸아 뉴기니(+675)</option><option value="680">팔라우(+680)</option><option value="970">팔레스타인(+970)</option><option value="298">페로 제도(+298)</option><option value="51">페루(+51)</option><option value="351">포르투갈(+351)</option><option value="500">포클랜드 제도 (말비..(+500)</option><option value="48">폴란드(+48)</option><option value="1 787">푸에르토리코(+1 787)</option><option value="33">프랑스(+33)</option><option value="594">프랑스령 기아나(+594)</option><option value="689">프랑스령 폴리네시아(+689)</option><option value="679">피지(+679)</option><option value="358">핀란드(+358)</option><option value="63">필리핀(+63)</option><option value="36">헝가리(+36)</option><option value="61">호주(+61)</option><option value="852">홍콩(+852)</option><option value="247">어센션 섬(+247)</option></select>
	</div>
</div>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox100" id="sb976148577" style="width:103px; height:40px;">
		<select class="selbox100 has_sb" id="AreaCityCode" name="phone" style="display: block; height:30px;"><option value="010" selected="true">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option></select>
	</div>
	
</div>
<div class="sel_input01 f_left m_right5" style="width: 50px" id="dvWarn_PhoneNumber1"><input type="text" data-warn="#warn_phone" id="phoneNum" name="phoneNum" tabindex="10"></div>
<div class="sel_input01 f_left m_right5" style="width: 50px" id="dvWarn_PhoneNumber2"><input type="text" data-warn="#warn_phone" id="phoneNum1" name="phoneNum1" tabindex="11"><input type="hidden" name="PhoneUseType" id="PhoneUseType" value="1"></div>
<p class="warning_txt4" id="warn_phone" style="display:none;"></p>
</td>
</tr>
<tr>
<th><span class="imt">*</span> 이메일
                      </th>
<td>
<div class="sel_input01 f_left m_right5" style="width: 150px" id="dvWarn_txtEmail1"><input type="text" data-warn="#warn_email" id="txtEmail1" name="pay_email" tabindex="12"></div>
<div class="f_left m_right5" style="padding-top: 7px">@</div>
<div class="sel_input01 f_left m_right5" style="width: 150px" id="dvWarn_txtEmail2"><input type="text" data-warn="#warn_email" id="txtEmail2" name="pay_email1" readonly="true"></div>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox115" style="width:101px; height:40px;">
		<select id="selEmail2" name="selEmail2" onchange="javascript:EmailChange(this)" class="selbox115 has_sb" style="display: block; height:30px;"><option value="">선택</option>
<option value="daum.net">daum.net</option>
<option value="naver.com">naver.com</option>
<option value="nate.com">nate.com</option>
<option value="hanmail.net">hanmail.net</option>30
<option value="yahoo.co.kr">yahoo.co.kr</option>
<option value="hotmail.com">hotmail.com</option>
<option value="hanmir.com">hanmir.com</option>
<option value="paran.com">paran.com</option>
<option value="empal.com">empal.com</option>
<option value="netian.com">netian.com</option>
<option value="korea.com">korea.com</option>
<option value="freechal.com">freechal.com</option>
<option value="gmail.com">gmail.com</option>
<option value="textEmail">직접입력</option></select>
	</div>
</div>
<p class="warning_txt5" id="warn_email" style="display:none;">이메일을 입력해주세요</p>
</td>
</tr>
</tbody>
</table>
<div class="notice_tip">
<ul>
<li>※ 운전자 나이가 만 25세 미만일 경우 차량 및 보험 추가 비용이 발생하니 차량 대여 비용을 확인하세요.</li>
<li>※ 여권 영문이름과 동일하지 않을 경우 대여가 불가능 하니, 여권 영문이름과 동일한 정보 입력을 해주세요.</li>
<li>※ 현지에서 예약한 차량 결제 시, 여권 검사를 하니 대여점 방문 시 반드시 여권을 지참해주세요.</li>
<li>※ 운전자 국적은 초기 검색 시 필수 체크 항목으로 예약 단계에서 변경 불가합니다. </li>
</ul>
</div>
</div>
<h4>보험</h4>
<div class="info_section table_t4">
<table cellpadding="0" cellspacing="0" width="100%" summary="보험명,금액,요금 포함여부,예상합계">
<caption>차량보험 안내</caption>
<colgroup>
<col width="50%">
<col width="25%">
<col width="25%">
</colgroup>
<thead>
<tr>
<th>보험명</th>
<th>금액</th>
<th>요금 포함여부</th>
</tr>
</thead>
<tbody id="Coverage"><tr><td class="bg">Loss damage waiver</td><td>-</td><td> 포함</td></tr><tr>  <td colspan="3"><div class="caution_notice">미국 - 자차 보험 (차량손실 면책 프로그램 (LDW: Loss Damage Waiver) 
임차차량에 발생한 손실 혹은 손상 (과실여부와 상관없이)에 대한 임차인의 책임이 면제됩니다. 

캐나다 - 자차 보험 (차량손실 면책 프로그램 (LDW: Loss Damage Waiver)  
임차차량에 발생한 손실 혹은 손상 (과실여부와 상관없이)에 대한 임차인의 책임이 면제됩니다. 
사고 시 CAD 500 까지의 고객 책임금액이 있습니다. (Whitehorse 에서는 CAD 1,500)  

뉴질랜드 - 자차 보험 (차량손실 면책 프로그램 (LDW: Loss Damage Waiver)  
일정 한도 내의 고객책임 (Accident Damage Excess) 을 면책해 주는 프로그램입니다. 
LDW 에 가입되어 있더라도 사고 시 차량에 손상이 발생할 경우 임차인에게 일정 한도 내의 고객책임 금액 (Accident Damage Excess)이 적용됩니다.</div></td></tr><tr><td class="bg">Personal property insurance</td><td>-</td><td> 포함</td></tr><tr>  <td colspan="3"><div class="caution_notice">임차임 상해 및 휴대품 분실 보험 (PI: Personal Insurance) 
임차 중에 발생한 임차인 및 동승자의 상해 및 휴대품 분실에 대한 보험입니다.</div></td></tr></tbody>
</table>
<div class="notice_tip">
<ul>
<li>※ 불포함 보험은 현장에서 추가 할 수 있습니다. (비용 추가 발생)</li>
<li>※ 이용지역에 따라서 보험 포함 조건이 달라질 수 있습니다.</li>
<li>※ 운전자 인원에 따라서 보험금액이 추가 될 수 있습니다. (운전자 추가는 현지에서만 가능)</li>
</ul>
</div>
</div>
<h4>선택옵션</h4>
<div class="info_section table_t4">
<table cellpadding="0" cellspacing="0" width="100%" summary="추가장비명,금액,수량,요금포함여부,예상합계">
<caption>차량 선택옵션 안내</caption>
<colgroup>
<col width="40%">
<col width="20%">
<col width="20%">
<col width="20%">
</colgroup>
<thead>
<tr>
<th>추가장비명</th>
<th>금액</th>
<th>수량</th>
<th>요금포함여부</th>
</tr>
</thead>
<tbody id="Equipment"><tr>  <td colspan="4"><div class="caution_notice">추가장비 불포함</div></td></tr></tbody>
</table>
<div class="notice_tip">
<ul>
<li>※ 불포함 항목은 대여 시 현장에 장비를 보유한 경우 추가 할 수 있습니다. (비용 추가 발생)</li>
<li>※ 차량 대여시 현지 사정에 따라 고객님이 요청한 옵션이 반영되지 않을 수 있습니다.</li>
</ul>
</div>
</div>
<h4>
                항공편 도착 정보 입력 <span class="desc">항공편을 입력하시면 항공기 연착 시 예약이 취소되지 않습니다.</span></h4>
<div class="info_section table_t3">
<table cellpadding="0" cellspacing="0" width="100%" summary="제휴사 마일리지 적립">
<caption>제휴 마일리지 적립안내</caption>
<colgroup>
<col width="20%">
<col width="80%">
</colgroup>
<tbody>
<tr>
<th>항공사/편명</th>
<td>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox220" id="sb397063181" style="width:206px; height:40px;">
		<select class="selbox220 has_sb" id="airCompanyCode" name="airCompanyCode" onchange="javascript:AirChange(this)" style="display: block; height:30px;"><option value="" selecetd="true">선택</option><option value="KL">KLM네덜란드항공(KL)</option><option value="JJ">TAM 브라질항공(JJ)</option><option value="KE">대한항공(KE)</option><option value="DL">델타항공(DL)</option><option value="SU">러시아항공(SU)</option><option value="RY">로얄캐리비안크루즈(RY)</option><option value="5J">세부퍼시픽에어(5J)</option><option value="SQ">싱가폴항공(SQ)</option><option value="HP">아메리칸웨스트항공(HP)</option><option value="AA">아메리칸항공(AA)</option><option value="OZ">아시아나항공(OZ)</option><option value="EK">에미레이트항공(EK)</option><option value="BR">에바항공(BR)</option><option value="NZ">에어뉴질랜드(NZ)</option><option value="BX">에어부산(BX)</option><option value="XJ">에어아시아 타이(XJ)</option><option value="AC">에어캐나다(AC)</option><option value="AF">에어프랑스(AF)</option><option value="2P">에어필리핀(2P)</option><option value="BA">영국항공(BA)</option><option value="UA">유나이티드항공(UA)</option><option value="ZE">이스타항공(ZE)</option><option value="JL">일본항공(JL)</option><option value="NH">전일본공수(NH)</option><option value="7C">제주항공(7C)</option><option value="CA">중국국제항공(CA)</option><option value="CZ">중국남방항공(CZ)</option><option value="MU">중국동방항공(MU)</option><option value="CI">중화항공(CI)</option><option value="LJ">진에어(LJ)</option><option value="OK">체코항공(OK)</option><option value="CR">카멜리아(CR)</option><option value="CX">캐세이패시픽(CX)</option><option value="QF">콴타스항공(QF)</option><option value="TG">타이항공(TG)</option><option value="TK">터키항공(TK)</option><option value="TW">티웨이항공(TW)</option><option value="MM">피치항공(MM)</option><option value="AY">핀에어(AY)</option><option value="PR">필리핀항공(PR)</option><option value="HA">하와이안항공(HA)</option><option value="UO">홍콩익스프레스(UO)</option><option value="HX">홍콩항공(HX)</option><option value="00">직접입력</option></select>
	</div>
</div>
<div class="sel_input01 f_left m_right5" style="width: 70px"><input type="text" id="OperatingCompanyCode" name="OperatingCompanyCode" readonly="true" maxlength="2" tabindex="18"></div>
<div class="sel_input01 f_left m_right5" style="width: 150px"><input type="text" id="ArrivalInfo_Number" name="ArrivalInfo_Number" maxlength="4" tabindex="19"></div>
</td>
</tr>
</tbody>
</table>
</div>
<h4>요청사항 입력(영문)</h4>
<div class="info_section board_t1" style="overflow-y: visible; height: 66px; padding: 10px 20px">
                별도 추가 요청사항이 있으시다면, 아래 예약 요청사항에 기재해 주시기 바랍니다.<br>
                단, 이러한 요청 사항은 하나투어에서 확정하여 드릴 수 없으며 현지 업체의 판단에 따라 처리 여부가 결정 됩니다
                <textarea id="SpecialRequestPref" name="SpecialRequestPref" style="height: 20px;width:670px;ime-mode:disabled" maxlength="100" tabindex="20" data-intype="eng"></textarea></div>
</div>
</form>
</div>
<div id="reservation_desc" style="top: 0px;">
<h3>결제요약</h3>
<div class="desc_section">
<div class="rent_price">
<h4>차량 대여 비용</h4>
<ul class="option_price" id="RentalPrice"><li><b class="tit">차량비용</b><strong>KRW&nbsp${cost}</strong></li><li><b class="tit">세금 &amp; 서비스</b><strong>KRW&nbsp;${tax}</strong></li><li><b class="tit">보험(Loss damage waiver)</b><strong>-</strong></li><li><b class="tit">보험(Personal property in..)</b><strong>-</strong></li></ul>
<div class="sum_price">
<div class="total"><b class="txt">총요금</b><strong id="RentalTotalPrice"><span>KRW</span>&nbsp;${rentCarDTO.price}</strong></div>
<div class="exchange" id="ExchangePrice"><b>￦${rentCarDTO.price}</b> / 당일환율기준</div>
</div>
<ul class="option_info" id="RateDistance"><li>운행제한사항 (거리제한여부)</li><li><span class="tit">운행거리제한여부</span>: 무제한</li></ul>
<div class="btn_area"><button class="btn_reservation" id="btnReservation"><span>결제하기</span></button></div>
</div>
</div>
</div>
</div>
</div>


</div>
<div class="rentcar_layer" id="rentLayer" style="width: 500px; height: 326px; top: 2388.5px; left: 424.5px;">
<p class="h_title" id="layerTitle">결제완료</p>
<div class="layer_cont"><span class="bg_ico confirm" id="layerIcoCss"></span><strong class="layer_ment" id="layerMent">해당 내용으로 결제완료 하시겠습니까?</strong><div class="notice_section">
<p class="txt_notice" id="layerNotice">- 현지에서 결제하는 후불제 상품으로 해외에서 사용할 수 있는<br>운전자 명의의 신용카드로만 결제 가능합니다.<br>- 렌터카 예약을 진행하는 업체 및 현지 법령에 따라 필수 가입하여야 하는 <br>보험, 선택옵션 요금포함, 세금으로 예약 완료 시 현재 표시된 요금에서<br> 추가금이 발생할 수 있습니다.</p>
<div class="btn_area"><button class="btn_conform" id="btnReservConfirm">확인</button><button class="btn_cancel" id="btnClose">취소</button></div>
</div>
</div><button type="button" class="btn_close" title="레이어 닫기" id="btnCloseLayer"><span class="ir">닫기</span></button></div>

<div id="mask_loader" style="width: 2000px; height: 4098px; opacity: 0.6; display: block;"></div>




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
<h2 class="h2_title">����ī ����</h2>
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
<p class="brand_name"><strong id="ModelName">${rentCarDTO.car_name}</strong></p><span class="grade" id="VehicleSize">${rentCarDTO.car_type}</span><button class="btn_change" id="btnChange" onclick="javascript:history.go(-1); return false;">��������</button></div>
<div class="rent_price">
<ul class="option_list" id="OptionList"><li>���๫����</li><li>��������</li><li>��������</li></ul>
<div class="total_price"><span class="txt">�� ���</span><strong class="t_price" id="TotalPrice"><strong>KRW</strong>&nbsp;${rentCarDTO.price}</strong><span class="tax" id="BasePrice"><b>��${rentCarDTO.price}</b> / <span>����ȯ������</span><br>�� �뿩�� ���� (��������)</span></div>
</div>
</div>
</div>
<div class="reservation_carinfo">
<h4>
                �뿩���� ���� <span class="desc">���� ������ ���� �뿩 ���� ���� �� �ɼ� ������ �ɼ� �ֽ��ϴ�.</span></h4>
<div class="info_section table_t1">
<table cellpadding="0" cellspacing="0" width="100%" summary="ž���ο�,��ȭ������,����������,���ӱ�Ÿ��,����Ÿ��">
<caption>�뿩���� �ɼ����� �ȳ�</caption>
<colgroup>
<col width="20%">
<col width="20%">
<col width="20%">
<col width="20%">
<col width="20%">
</colgroup>
<thead>
<tr>
<th><span class="ico passenger">ž���ο�</span></th>
<th><span class="ico bagage">��ȭ������</span></th>
<th><span class="ico aircon">����������</span></th>
<th><span class="ico gearbox">���ӱ�Ÿ��</span></th>
<th><span class="ico oil">����Ÿ��</span></th>
</tr>
</thead>
<tbody id="OptionInfo"><tr><td>${rentCarDTO.occupancy}��</td><td>2��</td><td>����</td><td>${rentCarDTO.transmission_type}</td><td>����</td></tr></tbody>
</table>
</div>
<h4>�뿩/�ݳ����</h4>
<div class="info_section table_t2">
<table cellpadding="0" cellspacing="0" width="100%" summary="�뿩�Ͻ�,�ݳ��Ͻ� �ּ�,��ȭ,���½ð� �ȳ�">
<caption>�뿩/�ݳ����</caption>
<colgroup>
<col width="50%">
<col width="50%">
</colgroup>
<thead>
<tr>
<th><b class="tit">�뿩�Ͻ�</b><strong class="date" id="PickUpInfo">${rentTime} ${rentHour} ${rentMinute}</strong><span>(�����ð� ����)</span></th>
<th><b class="tit">�ݳ��Ͻ�</b><strong class="date" id="ReturnInfo">${returnTime} ${returnHour} ${returnMinute}</strong><span>(�����ð� ����)</span></th>
</tr>
</thead>
<tbody>
<tr>
<td id="pickupStation"><p class="rt_place">  <strong>${rentlocation}</strong></p><p class="rent_locationtype">����(��ü)</p><ul class="rent_place">    <li>        <b class="tit">�ּ�</b><span>23010&nbsp;LVL 1 EAST SIDE,2851 USEO-DONG&nbsp;</span>    </li>    <li>        <b class="tit">��ȭ</b>        <span>+82 32-743-8000 / �ѽ�:+82 32-882-5190</span>    </li></ul></td>
<td id="returnStation"><p class="rt_place">  <strong>${returnlocation}</strong></p><p class="rent_locationtype">����(��ü)</p><ul class="rent_place">    <li>        <b class="tit">�ּ�</b><span>23010&nbsp;LVL 1 EAST SIDE,2851 USEO-DONG&nbsp;</span>    </li>    <li>        <b class="tit">��ȭ</b>        <span>+82 32-743-8000 / �ѽ�:+82 32-882-5190</span>    </li></ul></td>
</tr>
</tbody>
</table>
</div>
<h4>������</h4>
<div class="tterms contractTab">
<li class="on" id="liAgree1"><a href="javascript:;" onclick="" class="tts_tab tt_01"><span>�����ǰ ���� ���</span></a><div class="tte_box">
<div class="tte_cont">
<div class="agree_contents board_t1" style="border: 0 none; height: 200px"><strong style="font-size: 14px; color: #000">��1��(��Ģ)</strong><br><br>
						��1�� (����)<br>
						�� ����� ���ϳ�����(���� "ȸ��"�� �մϴ�)�� �ؿ� ����ī��ü�� ����Ͽ� �ϳ����� Ȩ������ (���� �����̹� �������̶� �մϴ�)�� ���� �����ϴ� ����ī ���� ����(���� "����"�� �մϴ�)�� �̿��Կ� �־� ȸ��� �̿����� �Ǹ� �ǹ� �� å�� ����, ��Ÿ �ʿ��� ������ �������� �������� �մϴ�.<br>
						��2�� (����� ����)<br><br>
						�� �� ������� ����ϴ� ����� ���Ǵ� ������ �����ϴ�.<br>
							1. ���̹� �����̶� ȸ�簡 ��ȭ �Ǵ� �뿪�� �̿��ڿ��� �����ϱ� ���Ͽ� ��ǻ�� �� ������ż��� �̿��Ͽ� ��ȭ �Ǵ� �뿪�� �ŷ��� �� �ֵ��� ������ ������ ���������μ�, �̿��ڰ� �¶����� ���� ���񽺸� �̿��� �� �ִ� ȸ���� ���ͳ� ����Ʈ�� ���ϸ�, ȸ�縦 ��ϴ� ������� �ǹ̷ε� ����մϴ�.<br>
							2. �̿��ڶ� �� ����� ���� ȸ�簡 �����ϴ� ���񽺸� �޴� ȸ�� �� ��ȸ���� ���մϴ�.<br>
							3. ȸ���̶� ���� �� ����� �����ϰ� ȸ�翡 ���� ������ �����Ͽ� ȸ������� �� �ڷμ�, ȸ���� ������ ���������� ����������, ȸ�簡 �����ϴ� ���񽺸� ��������� �̿��� �� �ִ� �ڸ� ���մϴ�.<br>
							4. ��ȸ���̶� ���� ȸ���� �������� �ʰ� ȸ�簡 �����ϴ� ���񽺸� �̿��ϴ� �ڸ� ���մϴ�.<br>
						�� ��1�� ��ȣ���� ���ϴ� ���� ������ ����� ���Ǵ� ���ù��� �� ��Ÿ �Ϲ����� ����ʿ� ���մϴ�.<br><br>
						��3��(����� ��ÿ� ����)<br><br>
						�� ȸ��� �� ����� ����� ��ȣ, ������ ������, ��ǥ���� ����, ����� ��Ϲ�ȣ,����ó(��ȭ, �ѽ�, ���ڿ��� �ּ� ��) ���� �̿��ڰ� �� �� �ֵ��� ���̹� ������ �ʱ� ����ȭ��(����)�� �Խ��մϴ�.<br>
						�� ȸ��� ����� ����� ���� ����, ���ڰŷ��⺻��, ���� �����, ���� ��Ÿ� �̿������ ���� ����, �湮�Ǹŵ ���� ����, �Һ��ں�ȣ�� �� ���ù��� �������� �ʴ� �������� �� ����� ������ �� �ֽ��ϴ�.<br>
						�� ȸ�簡 ����� ������ ��쿡�� �������� �� ���������� ����Ͽ� �������� �Բ� ���̹� ������ �ʱ�ȭ�� �Խ��մϴ�.<br>
						�� ȸ�簡 ����� ������ ��쿡�� �� ��������� �� �������� ���Ŀ� ü��Ǵ� ��࿡�� ����ǰ� �� ������ �̹� ü��� ��࿡ ���ؼ��� ���� ���� ��������� �״�� ����˴ϴ�. �ٸ� ȸ�簡 "�̿��ڰ� ����� �Ⱓ ���� ���� ����� ���� ���� ���θ� ǥ������ �ƴ� �ϴ� ������ �������� ������ �޴� ������ ����"�� ������ ������ �Ͽ������� �̿���� ���� ���θ� ǥ������ �ƴ��� ��� �Ǵ� �ε����ϰ� �׷��� ������ �� �� ���� ��쿡�� ���� ���� ü��� ��࿡�� ��������� ����˴ϴ�.<br>
						�� �� ������� ������ �ƴ��� ���װ� �� ����� �ؼ��� ���Ͽ��� ���ΰ� ������ ���ڰŷ� �Һ��ں�ȣ��ħ �� ������� �Ǵ� �� ���ʿ� �����ϴ�.<br>
						��4�� (������ ���� �� ����)<br><br>
						��ȸ��� ������ ���� ������ �����մϴ�.<br>
						1. �ؿ� ����ī ��ü ���񽺿� ���� ������ ����<br>
							2. �ؿ� ����ī ���� ���� ��/�Ǵ� ���� ��� ü��<br>
						3. ��Ÿ ȸ�翡�� �����ϴ� ����<br>
						�� ȸ��� �뿩������ ���ึ�� �Ǵ� ���� ����� ���� �� �Ұ����� �����̳� ���� ���� ��쿡�� ���� ü��Ǵ� ��࿡ ���� ������ �뿩������ ������ ������ �� �ֽ��ϴ�. �� ��쿡�� ����� �뿩������ �뿪�� ���� �� �������ڸ� ����Ͽ� ������ �뿩������ �뿪�� ������ �Խ��� ���� �� �������� ���� 7�Ϻ��� �����մϴ�. ��, ȸ��� �Ұ����� �����̳� ������ �ִ� ���, �� ������ ���� ���� �� �ֽ��ϴ�.<br>
						�� ȸ�簡 �̿��ڿ� �����ϱ�� ����� ü���� ������ ������ �뿩������ ���ึ�� �Ǵ� ����� ����� ���� ���� ������ ������ ��쿡�� ȸ��� �̷� ���Ͽ� �̿��ڰ� ���� ���ؿ� ���Ͽ��� ������� �ƴ��մϴ�.<br><br>
						��5�� (������ �ߴ�)<br><br>
						�� ȸ��� õ������, ����, ����, ����, ������ ���� ����, ���Ƿ¿� ���� ��� ó��, �뵿����, ��ǻ�� �� ������ż����� ��������, ��ü �� ����, ����� ���� ���� ������ �߻��� ��쿡�� ���� ������ �Ͻ������� �ߴ��� �� �ֽ��ϴ�.<br>
						�� ȸ��� ��1���� ������ ������ ������ �Ͻ������� �ߴܵ����� ���Ͽ� �̿��� �Ǵ� ��3�ڰ� ���� ���ؿ� ���Ͽ� ������� �ƴ��մϴ�. ��, ȸ�翡 ���� �Ǵ� �߰����� �ִ� ��쿡�� �׷����� �ƴ��մϴ�.<br><br><strong style="font-size: 14px; color: #000">��2�� �뿩����</strong><br><br>
						��6�� (�����û)<br><br>
						�̿��ڴ� ������ ����� ���Ͽ� �����뿩 ������ ��û�մϴ�.<br>
						 -���̹� ���� �󿡼� ������ ��û�ϴ� ���<br>
							1. ����, �ּ�, ��ȭ��ȣ(�̵���ȭ��ȣ), �̸����ּ� �Է�<br>
							2. ���� �뿩�ϰ� �ݳ����� �Է�<br>
							3. ������ �μ�/�ݳ� ��� ����<br>
							4. �뿩������ ���� �� �뿩 ��� Ȯ��<br>
							5. �� ����� �����Ѵٴ� ǥ��(��, ���콺 Ŭ��)<br>
							6. ������� Ȯ�� �Ǵ� ȸ���� Ȯ�ο� ���� ����<br><br>
						��7�� (������ ����)<br><br>
						�� ȸ��� ��6���� ���� �����û�� ���Ͽ� ���� �� ȣ�� �ش����� �ʴ� �� �³��մϴ�.<br>
							1. ��û ���뿡 ����, ���紩��, ���Ⱑ �ִ� ���<br>
							2. ����ī �뿩�ڰ����ǿ� �մ�ġ ���� ���&lt;�뿩�ڰ�&gt;<br>
							  - �ؿ� ���࿡ ��� ������ ���� ��, �ش� ��ü���� ������ ���� �뿩 ���ɿ� �ش� �Ǵ� ��<br>
							3. ��Ÿ �����뿩 �����û�� �³��ϴ� ���� �뿩���� ���ึ��, ���� ����� ���� �� ������ ���Ͽ� ������ ������ �ִٰ�
								�Ǵ��ϴ� ���<br>
						�� ����ī ������, ���̹� ���� ������ ��쿡�� ����ī ���࿡ ���Ͽ� �����ȣ�� ������ â�� ���·� �̿��ڿ��� ������ ������ ������ ������ ���ϴ�.<br><br>

						��8�� (��ݰ���)<br>
						�̿��ڴ� ���̹������� ���� ������ �Ϸ��� �� �������� �ſ�ī��� �̿����� �����մϴ�. <br>
						���������� �Ʒ��� �����ϴ�. <br>��
						�� ������ ������ �ſ�ī��(�ؿܻ�밡�� ī��)�� ���� �μ� �� �ſ�ī�带 Deposit�ϰ� �˴ϴ�.<br>
						�� �����ݳ� �� Deposit�� �ſ�ī��� �����̿� ����� �����˴ϴ�. (����,�ɼ�,������ ��)<br>
						�� ���� �� �߻��� ������, ���·� ���� �����ݳ����� ���� ������ û���� �� �ֽ��ϴ�.<br><br>
						��9�� (����Ȯ�� ���� �� �̿����� ���� ���)<br><br>
						��ȸ��� �̿��ڰ� �����뿩 ������ �Ϸ��� ��� �̿��ڿ��� ����Ȯ�� ������ �մϴ�.<br>
						�� ����Ȯ�� ������ ���� �̿��ڴ� �ǻ�ǥ���� ����ġ ���� �ִ� ��쿡�� ����Ȯ�� ������ ���� �� ���� �μ� 48�ð� ������ ���� ��Ҹ� ��û�� �� �ֽ��ϴ�.<br><br>
						��10�� (ȸ���� ���� ��� �� ȯ��)<br><br>
						�� ȸ��� �̿��ڰ� ��������Ϸ� ��, ������ �̻� �Ǵ� ������� ���� ���� ������ ������ �뿩�� �� ���� ������ ��ü ���� �� ������ �̿��ڿ��� �����ϰ�, ������ ���� �뿩�� ���� ����� ���� ��쿡�� ����� ���� ������ 7�� �̳���, �׷��� ���� ��쿡�� �� �����߻��Ϸκ��� 7�� �̳��� ������� ������ ���մϴ�. �� �� ȸ�簡 ������ ����� ���� ��쿡�� ���޹��� ��ݰ� ���޹��� ����� 10%�� ���� �ݾ��� ȯ���մϴ�.<br>
						�� ���� �� ȣ�� ��쿡�� ȸ��� �뿩�� ���������� ������ �ݳ� ���� ���� 1 ������ �̳��� �̿����� �䱸�� ���� ��� ȯ��, �ݳ� �Ǵ� ��ȯ ��ġ�� �մϴ�. �ٸ� �̿����� �䱸 ������ ������ �ε��� ���κ��� ���� �ݳ� ������ �̳��� �մϴ�.<br>
							1. ����� ������ �̿��� ���� ����� �����ϰų� ȸ�簡 ������ ������ ������ ���<br>
							2. ����� ������ �ļ�, �ջ� �Ǿ��� ���. ��, �̿����� å�� �ִ� ������ ������ �Ѽյ� ���� �����մϴ�.<br><br>
						��11�� (�ؿܿ������)<br><br>
						�� �ؿܿ��� ������ �뿩�ϰ��� �ϴ� ��� ����ð� ���� �ּ� 48�ð� ���� �����Ͽ��� �մϴ�.<br>
						�� ȸ��� �ؿ� ���� �뿩 ���ุ ������ ��, �ؿܿ����� ����ī �̿뿡 ���� å���� �����ϴ�.<br>
							�ؿܿ��� �����ϴ� ���� �� ��Ÿ ���񽺴� �� �ش� ��ü���� �����մϴ�.<br>
						�� �ؿܿ����� �������� �� �뿩�� ���� �ʿ��� �ּ����� ��������(����, ����ó, ���ǹ�ȣ, ���������ȣ)�� ����� ���࿡ �ʿ��� ������ ��Ź�� ���޾�ü�� �����˴ϴ�.<br>
						��  �ؿ� ���� �뿩 ������ �ϴ� ��쿡�� �ݵ�� �ؿܾ�ü�� �����ϴ� �ſ�ī��� ����� �����Ͽ��� �մϴ�.<br><br><strong style="font-size: 14px; color: #000">��3�� �̿����� �ǹ�����</strong><br><br>
						��12�� (����������ȣ) <br><br>
						�� ȸ��� ���ù����� ���ϴ� �ٿ� ���� �̿����� ���������� ��ȣ�ϱ� ���� ����մϴ�. �̿��� ���������� ��ȣ �� ��뿡 ���ؼ��� ���ù��� �� ȸ�簡 ������ �����ϴ� ��������ó����ħ�� ����˴ϴ�.<br>
						�� ȸ��� �̿����� ��å������ ���Ͽ� ����� �̿����� ���������� ������ ��� ������ ���ؼ� ��ü�� å���� ���� �ʽ��ϴ�.<br>
						�� �̿��ڴ� �������� ȸ�簡 ������ �ִ� �ڽ��� ���������� ���� ���� �� ���������� �䱸 �� �� ������ ȸ��� �̿� ���� ��ü ���� �ʿ��� ��ġ�� ���� �ǹ��� ���ϴ�. �̿��ڰ� ������ ������ �䱸�� ��쿡�� ȸ��� �� ������ ������ ������ ���� ���������� �̿����� �ʽ��ϴ�.<br><br>
						��13�� (ȸ���� �ǹ�) <br><br>
						�� ȸ��� ���ɰ� �� ����� �����ϰų� ������ ǳ�� ��Ÿ ��ȸ������ ���ϴ� ������ ���� ������ �� ����� ���ϴ� �ٿ� ���� �������̰�, ���������� ���񽺸� �����ϴ� �� �ּ��� ���Ͽ��� �մϴ�.<br>
						�� ȸ��� �̿��ڰ� �����ϰ� ����)�� �̿��� �� �ֵ��� �̿����� ��������(�ſ����� ����)��ȣ�� ���� ���� �ý����� ���߾�� �մϴ�.<br>
						�� ȸ��� �̿��ڰ� ������ �ʴ� ���������� ���� ���ڿ����� �߼����� �ʽ��ϴ�. ���� ���ڿ��� ������ ������ �ʴ� �̿��ڿ��Դ� �� �̻� ���� ���ڿ����� �߼����� �ʽ��ϴ�.<br>
						��14�� (ȸ���� ID �� Password)<br><br>
						�� ���̹� ������ �̿��ϰ��� �ϴ� ȸ���� ȸ�簡 ���ϴ� �ٿ� ���� ȸ�� ID �� Password�� ���̹� ������ ���� ����Ͽ��� �մϴ�.<br>
						�� ȸ�� ID�� Password�� ���� ����å���� ȸ������ ������, ȸ���� �ڽ��� ID �� Password�� ��3�ڿ��� �˷��ְų� �̿��ϰ� �ؼ��� �ȵ˴ϴ�.<br>
						�� ȸ���� �ڽ��� ID �Ǵ� Password�� ���� ���ϰų� ��3�ڰ� ����ϰ� ������ ������ ��쿡�� ��� ȸ�翡 �뺸�ϰ� ȸ���� �ȳ��� �ִ� ��쿡�� �׿� ����� �մϴ�.<br>
						��15�� (�̿����� �ǹ�) <br><br>
						�� �̿��ڴ� ���ù���, �� ������� ���� ����, ��Ÿ ȸ���� �̿�ȳ� �� ���ǻ������� ������ ������ �ؼ��Ͽ��� �ϸ�, ��Ÿ ȸ���� ������ ������ �����ϴ� ������ �Ͽ����� �ȵ˴ϴ�.<br>
						�� �̿��ڴ� ���Խ�û �� �����ϰ� �����ϰ� ���Խ�û���� ȸ�������� �ۼ��ؾ� �ϸ�, ������ ������ ����Ǿ��� ��� ��ǿ� �°� �����ؾ� �մϴ�. ���� �������� �ʾ� �߻��ϰ� �Ǵ� ��� ������ ���ؼ��� �̿��ڰ� å���� �δ��ϰ� �˴ϴ�.<br>
						�� �̿��ڴ� ���񽺸� �̿��Ͽ� ���� ������ ȸ���� �������� ���� ���Ƿ� ����, ����, �����ؼ��� �ƴ� �Ǹ�, ������������ Ȱ���Ͽ����� �ȵ˴ϴ�.<br>
						�� �̿��ڴ� ��1�׺��� ��3�ױ����� ���� �̿ܿ��� ������ ������ �Ͽ����� �ȵ˴ϴ�.<br>
						  1. ��û �Ǵ� ���� �� ���������� ���<br>
						  2. ���̹� ���� �Ǵ� ȸ���� �������� �Խõ� ������ ����<br>
						  3. ȸ�簡 ���� ���� �̿��� ����(��ǻ�� ���α׷� ��)�� ���̹� ���� �Ǵ� ȸ���� �������� �۽� �Ǵ� �Խ�<br>
						  4. ȸ�� ��Ÿ ��3���� ���۱� �� �������ǿ� ���� ħ��<br>
						  5. ȸ�� ��Ÿ ��3���� ���� �ջ��Ű�ų� ������ �����ϴ� ����<br>
						  6. Ÿ���� ���� �Ǵ� ���� ����<br>
						  7. �ܼ� �Ǵ� �������� �޽��� ȭ�� ���� ��Ÿ ������ ǳ�� ��Ÿ ��ȸ������ ���ϴ� ������ ���̹� ���� �Ǵ� ȸ���� �������� ���� �Ǵ� �Խ�<br>
						  8. ��ǰ��踦 �ְ��ϴ� �������� ���� �� ��Ÿ ȸ�簡 ������ �ϴٰ� �Ǵ��ϴ� ����<br>
						�� ��4�� �� ȣ�� ���� ��Ÿ ȸ�簡 ������ �ϴٰ� �Ǵ��� ������ ���̹� ���� �Ǵ� ȸ���� �������� �Խõǰų� ���̹������� ��ũ �� ���� �Խõ� ���, ȸ��� �̿��� ��Ÿ ������ �Խø� ���� ���� �³� ���� ����� ���� ������ ����, �ı��ϰų� ���̹������� Ȯ��� ��ũ�� ������ �� �ֽ��ϴ�. ��, ȸ��� �̷��� ������ ����, �ı�, ��ũ�� ���� ���� �� �ǹ��� ���� �ʽ��ϴ�.<br><br><strong style="font-size: 14px; color: #000">��4�� ��Ÿ</strong><br><br>
						��16�� (���̹� ������ �ǿ��� ����Ʈ ���� ����)<br><br>
						�� ���̹������� �ؿܷ���ī��ü�� ���ͳݻ���Ʈ�� ������ ��ũ(��: ������ ��ũ�� ��󿡴� ����, �׸� �� ��ȭ�� ���� ���Ե˴ϴ�)��� ������ ����� ���, ���ڸ� �������Ʈ��� �ϰ� ���ڸ� �ǿ������Ʈ��� �մϴ�.<br>
						�� ���̹������� �ؿܷ���ī��ü�� �ǿ������Ʈ�� ���� ���������� �����ϴ� ��ȭ, �뿪�� ���Ͽ� �̿��ڿ� ���ϴ� �ŷ��� ���ؼ� ����å���� ���� �ʽ��ϴ�.<br><br>
						��26�� (���۱��� �ͼ� �� �̿�����) <br><br>
						��  ȸ�簡 �ۼ��� ���۹��� ���� ���۱� ��Ÿ ���������� ȸ�翡 �ͼ��մϴ�.<br>
						�� �̿��ڴ� ȸ�縦 �̿������ν� ���� ������ ȸ���� ���� �³� ���� ����, �۽�, ����, ����, ��� ��Ÿ ����� ���Ͽ� ������������ �̿��ϰų� ��3�ڿ��� �̿��ϰ� �Ͽ����� �ȵ˴ϴ�.<br><br>
						��17�� (�����ذ�) <br><br>
						�� ȸ��� �̿��ڰ� �����ϴ� ������ �ǰ��̳� �Ҹ��� �ݿ��ϰ� �� ���ظ� ����ó���ϱ� ���Ͽ� ���غ���ó�������� ��ġ ��մϴ�.<br>
						�� ȸ��� �̿��ڷκ��� ����Ǵ� �Ҹ����� �� �ǰ��� �켱������ �� ������ ó���մϴ�. �ٸ�, �ż��� ó���� ����� ��쿡�� �̿��ڿ��� �� ������ ó�� ������ ��� �뺸�� �帳�ϴ�.<br><br>
						��18�� (���Ǳ� �� �ذŹ�) <br><br>
						�� ȸ��� �̿��ڰ��� �߻��� ���￡ ���� �Ҽ��� ȸ���� �����̳� ������ ������ ���ҹ��� �Ǵ� �λ�Ҽ۹��� ���� ���ҹ����� ������ �� �ֽ��ϴ�.<br>
						�� ȸ��� �̿��ڰ��� ����� �Ҽۿ��� ���ѹα� ���� �����մϴ�.<br><br>
						&lt;��Ģ&gt;<br><br>
						�� ����� 2015�� 4�� 1�Ϻ��� �����մϴ�.     
                      </div>
</div>
<p class="sel_agree"><input type="radio" name="agree_a" id="agree01" class="r_agree" onclick="moveAgreeNext(this, 2)"><label for="agree01" class="mrY">�����մϴ�</label><input type="radio" name="agree_a" id="noagree01" class="r_agree" onclick="moveAgreeNext(this, 2)"><label for="noagree01" class="mrY">�������� �ʽ��ϴ�.</label></p>
</div>
</li>
<li id="liAgree2"><a href="javascript:;" onclick="" class="tts_tab tt_02"><span>�������� ���� �� �̿�ȳ�</span></a><div class="tte_box">
<div class="tte_cont">
<iframe src="/TwoTour/rentCar/rentCarRule.jsp" style="width:690px; height: 260px; margin-top: 0px; padding: 10px; overflow:scroll;" frameborder="0" scrolling="auto"></iframe>
</div>
<p class="sel_agree"><input type="radio" name="agree_b" id="agree02" class="r_agree" onclick="moveAgreeNext(this, 3)"><label for="agree02" class="mrY">�����մϴ�</label><input type="radio" name="agree_b" id="noagree02" class="r_agree" onclick="moveAgreeNext(this, 3)"><label for="noagree02" class="mrY">�������� �ʽ��ϴ�.</label></p>
</div>
</li>
<li id="liAgree3"><a href="javascript:;" onclick="" class="tts_tab tt_03"><span>�������� �� 3�� ���� �� �����ȳ�</span></a><div class="tte_box">
<div class="tte_cont">
<iframe src="/TwoTour/rentCar/rentCarRule2.jsp" style="overflow:scroll; width:690px; height: 260px; margin-top: 0px; padding: 10px;" frameborder="0" scrolling="auto"></iframe>
</div>
<p class="sel_agree"><input type="radio" name="agree_c" id="agree03" class="r_agree" onclick="moveAgreeNext(this, 4)"><label for="agree03" class="mrY">�����մϴ�</label><input type="radio" name="agree_c" id="noagree03" class="r_agree" onclick="moveAgreeNext(this, 4)"><label for="noagree03" class="mrY">�������� �ʽ��ϴ�.</label></p>
</div>
</li>
<li id="liAgree4"><a href="javascript:;" onclick="" class="tts_tab tt_04"><span>�������� Ȱ�� ���� �ȳ�(����)</span></a><div class="tte_box">
<div class="tte_cont">
<iframe src="/TwoTour/rentCar/rentCarRule3.jsp" style="overflow:scroll; width:690px; height: 260px; margin-top: 0px; padding: 10px;" frameborder="0" scrolling="auto"></iframe>
</div>
<p class="sel_agree"><input type="radio" name="agree_d" id="agree04" class="r_agree"><label for="agree04" class="mrY">�����մϴ�</label><input type="radio" name="agree_d" id="noagree04" class="r_agree"><label for="noagree04" class="mrY">�������� �ʽ��ϴ�.</label></p>
</div>
</li>
</div>
<h4 id="topInfoSection">���� �Ӵ� ������ �� �ȳ� ����</h4>
<div class="info_section board_t1" style="height: 40px" id="dvInfoSection"><ul><li>��RATE MAY BE SUBJECT TO VERIFICATION OF ID</li></ul></div>
<div class="info_section rent_agree_section">
<div class="agree_info">
<div class="board_t1 m_right5" style="height: 100px" id="spDistance"><ul class="option_price"><li>�������ѻ��� (�Ÿ����ѿ���)</li><li><span class="tit">����Ÿ����ѿ���</span>: ������</li><li>�� �Ӵ������� �����Ⱓ ���� ����Ÿ� ���� ���� �̿밡���� �����Դϴ�</li></ul></div>
<div class="info_section agree_box"><input type="checkbox" data-warn="#warn_chkNoticeAgree02" id="chkNoticeAgree02" name="chkNoticeAgree02" class="chk_chekbox" tabindex="22"><label for="chkNoticeAgree02" id="lblchkNoticeAgree02" tabindex="30" class="rent_check">Ȯ�� �� �����մϴ�.</label><p class="warning_txt" id="warn_chkNoticeAgree02" >����� �������ּ���</p>
</div>
</div>
<div class="agree_info">
<div class="board_t1 m_right5" style="height: 100px">
                    ����� ���� �Ӵ� ��ҿ��� �ſ�ī��� ������ �����ϸ� �˴ϴ�. �ؿ��� ��� ����, ���������ڸ�����, �ſ�ī�尡 �ʼ� �̸� ������, ��������� ����/���������ڸ������� ���Ե� ���� ��ġ�Ͽ��� �մϴ�.
                  </div>
<div class="info_section agree_box"><input type="checkbox" data-warn="#warn_chkNoticeAgree03" id="chkNoticeAgree03" name="chkNoticeAgree03" class="chk_chekbox" tabindex="22"><label for="chkNoticeAgree03" id="lblchkNoticeAgree03" tabindex="30" class="rent_check">Ȯ�� �� �����մϴ�.</label><p class="warning_txt" id="warn_chkNoticeAgree03" >����� �������ּ���</p>
</div>
</div>
<div class="agree_info">
<div class="board_t1 m_right5" style="height: 100px">
                    �ش� �������׿� ���� �ȳ��� �����մϴ�.
                    ��û������ ���� ������ ���� ������ �������� ��ü �� �� ������ �������(����) ���� �Ǵ� �ش籹���� ���ɿ� ���� �ʼ� �����Ͽ��� �ϴ� ����, ������� �߰��� ���� ���� ǥ�õ� ��ݿ��� �߰����� �߻��� �� �ֽ��ϴ�. �������� ��� ���������� �ش籹���� ��å�� �����ϴ�.
                  </div>
<div class="info_section agree_box"><input type="checkbox" data-warn="#warn_chkNoticeAgree04" id="chkNoticeAgree04" name="chkNoticeAgree04" class="chk_chekbox" tabindex="22"><label for="chkNoticeAgree04" id="lblchkNoticeAgree04" tabindex="30" class="rent_check">Ȯ�� �� �����մϴ�.</label><p class="warning_txt" id="warn_chkNoticeAgree04" >����� �������ּ���</p>
</div>
</div>
</div>
<div class="all_agree_section"><input type="checkbox" id="chkAllAgree" name="chkAllAgree" class="chk_chekbox" tabindex="26"><label for="chkAllAgree" id="lblchkAllAgree" class="rent_check">��ü ����� �����մϴ�.</label></div>
<h4>������ ����</h4>
<div class="info_section table_t3">
<table cellpadding="0" cellspacing="0" width="100%" summary="������ ��������,�����ڱ���,�����������,�޴�����ȣ,�̸���">
<caption>������ ���� �ȳ�</caption>
<colgroup>
<col width="28%">
<col width="72%">
</colgroup>
<tbody>
<tr>
<th><span class="imt">*</span> ������ ����</th>
<td>
<div class="sel_input01 f_left m_right5" style="width: 150px" id="dvWarn_bkr_name_S"><input type="text" value="" placeholder="�ѱ� ��" data-warn="#warn_Name" id="bkr_name_S" name="name1" data-defaulttext="�ѱ� ��" data-intype="kor" tabindex="1" ></div>
<div class="sel_input01 f_left m_right5" style="width: 150px" id="dvWarn_bkr_name_G"><input type="text" value="" placeholder="�ѱ� �̸�" data-warn="#warn_Name" id="bkr_name_G" name="name2" data-defaulttext="�ѱ� �̸�" data-intype="kor" tabindex="2" ></div>
<div class="sel_input01 f_left m_right5" style="width: 150px;margin-top:10px;" id="dvWarn_SurName"><input type="text" value="" placeholder="���� ��" data-warn="#warn_Name" id="SurName" name="first_name" data-defaulttext="���� ��" data-intype="eng" tabindex="3" style="ime-mode:disabled"></div>
<div class="sel_input01 f_left m_right5" style="width: 150px;margin-top:10px;" id="dvWarn_GivenName"><input type="text" value="" placeholder="���� �̸�" data-warn="#warn_Name" id="GivenName" name="last_name" data-defaulttext="���� �̸�" data-intype="eng" tabindex="4" style="ime-mode:disabled"></div>
<p class="warning_txt2" id="warn_Name" style="display:none;"></p>
</td>
</tr>
<tr>
<th><span class="imt">*</span> ������ ����
                      </th>
<td id="country">���ѹα�(KR)</td>
</tr>
<tr>
<th><span class="imt">*</span> �����������
                      </th>
<td>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox100" id="sb595867432" style=" height:40px;">
		<select class="selbox100 has_sb" id="BirthDateYYYY" name="year" onchange="javascript:chkBirthDate();" style="display: block; height:30px;"><option value="" selected="true">����</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option><option value="1909">1909</option><option value="1908">1908</option><option value="1907">1907</option><option value="1906">1906</option><option value="1905">1905</option><option value="1904">1904</option><option value="1903">1903</option><option value="1902">1902</option><option value="1901">1901</option></select>
	</div>
</div>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox100" id="sb595867432" style="height:40px;">
		<select class="selbox100 has_sb" id="BirthDateMM" name="month" onchange="javascript:chkBirthDate();" style="display: block; height:30px;"><option value="" selected="true">����</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
	</div>
</div>
<div class="f_left m_right5">
	<div class="sb selectbox selbox100" id="sb595867432">
		<select class="selbox100 has_sb" id="BirthDateDD" name="day" onchange="javascript:chkBirthDate();" style="display: block; height:30px;"><option value="" selected="true">����</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
	</div>
</div>	
<p class="warning_txt3" id="warn_age" style="display:none;"></p>
</td>
</tr>
<tr>
<th><span class="imt">*</span> �޴�����ȣ
                      </th>
<td>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox220" id="sb43723933" style="width:206px; height:40px;">
		<select class="selbox220 has_sb" id="CountryAccessCode" name="CountryAccessCode" style="display: block; height:30px;"><option value="389">���ɵ��Ͼ� ��ȭ��(+389)</option><option value="233">����(+233)</option><option value="241">����(+241)</option><option value="592">���̾Ƴ�(+592)</option><option value="220">�����(+220)</option><option value="590">�������(+590)</option><option value="502">���׸���(+502)</option><option value="1 671">��(+1 671)</option><option value="1 473">�׷�����(+1 473)</option><option value="995">������(+995)</option><option value="30">�׸���(+30)</option><option value="299">�׸�����(+299)</option><option value="224">���(+224)</option><option value="245">��� ����(+245)</option><option value="264">���̺��(+264)</option><option value="674">�����(+674)</option><option value="234">����������(+234)</option><option value="211">������(+211)</option><option value="27">��������ī ��ȭ��(+27)</option><option value="31">�״�����(+31)</option><option value="977">����(+977)</option><option value="47">�븣����(+47)</option><option value="672">���� ��(+672)</option><option value="64">��������(+64)</option><option value="687">�� Į�����Ͼ�(+687)</option><option value="683">�Ͽ쿡(+683)</option><option value="227">������(+227)</option><option value="505">��ī���(+505)</option><option value="886">�븸(+886)</option><option value="82" selected="">���ѹα�(+82)</option><option value="45">����ũ(+45)</option><option value="1 767">���̴�ī(+1 767)</option><option value="1 809">���̴�ī ��ȭ��(+1 809)</option><option value="49">����(+49)</option><option value="670">�� Ƽ��(+670)</option><option value="856">�����(+856)</option><option value="231">���̺�����(+231)</option><option value="371">��Ʈ���(+371)</option><option value="7">���þ� ����(+7)</option><option value="961">���ٳ�(+961)</option><option value="266">������(+266)</option><option value="40">�縶�Ͼ�(+40)</option><option value="352">����θ�ũ(+352)</option><option value="250">���ϴ�(+250)</option><option value="218">�����(+218)</option><option value="262">�����Ͽ�(+262)</option><option value="370">�����ƴϾ�(+370)</option><option value="423">�����ٽ�Ÿ��(+423)</option><option value="261">���ٰ���ī��(+261)</option><option value="596">����Ƽ��ũ(+596)</option><option value="692">���� ����(+692)</option><option value="262">�� ��Ʈ(+262)</option><option value="853">��ī��(+853)</option><option value="265">������(+265)</option><option value="60">�����̽þ�(+60)</option><option value="223">����(+223)</option><option value="52">�߽���(+52)</option><option value="377">����(+377)</option><option value="212">�����(+212)</option><option value="230">�𸮼Ž�(+230)</option><option value="222">��Ÿ��(+222)</option><option value="258">�����ũ(+258)</option><option value="382">���׳ױ׷�(+382)</option><option value="1 664">��Ʈ����Ʈ(+1 664)</option><option value="373">������ ��ȭ��(+373)</option><option value="960">�����(+960)</option><option value="356">��Ÿ(+356)</option><option value="976">����(+976)</option><option value="1">�̱�(+1)</option><option value="1 340">�̱��� ���� ���Ϸ���(+1 340)</option><option value="1 684">�Ƹ޸�ĭ ����(+1 684)</option><option value="95">�̾Ḷ(+95)</option><option value="691">��ũ�γ׽þ� ( ���� ..(+691)</option><option value="678">�ٴ�����(+678)</option><option value="973">�ٷ���(+973)</option><option value="1 246">�ٺ��̵���(+1 246)</option><option value="379">��Ƽĭ�ñ�(+379)</option><option value="1 242">���ϸ�(+1 242)</option><option value="880">��۶󵥽�(+880)</option><option value="1 441">���´�(+1 441)</option><option value="229">����(+229)</option><option value="58">���׼�����(+58)</option><option value="84">��Ʈ��(+84)</option><option value="32">���⿡(+32)</option><option value="375">����罺(+375)</option><option value="501">������(+501)</option><option value="599">���׸� ��, ��Ʈ�ܽ�..(+599)</option><option value="387">�����Ͼ� �츣ü���..(+387)</option><option value="267">�����ͳ�(+267)</option><option value="591">�������(+591)</option><option value="257">�η��(+257)</option><option value="226">�θ� Ű�� �ļ�(+226)</option><option value="975">��ź(+975)</option><option value="1 670">�� �����Ƴ� ����(+1 670)</option><option value="850">����(+850)</option><option value="359">�Ұ�����(+359)</option><option value="55">�����(+55)</option><option value="673">��糪��(+673)</option><option value="685">����(+685)</option><option value="966">���� �ƶ���(+966)</option><option value="378">�� ������(+378)</option><option value="239">��������������(+239)</option><option value="590">��������(+590)</option><option value="590">���ٸ��ڷ���(+590)</option><option value="221">���װ�(+221)</option><option value="381">�������(+381)</option><option value="248">���̼�(+248)</option><option value="1 758">����Ʈ ��þ�(+1 758)</option><option value="1 784">����Ʈ ��Ʈ �׷���..(+1 784)</option><option value="1 869">����Ʈ Ű�� �׺�(+1 869)</option><option value="508">���ǿ��� ��Ŭ��(+508)</option><option value="290">����Ʈ �ﷹ��(+290)</option><option value="252">�Ҹ�����(+252)</option><option value="677">�ַθ� ����(+677)</option><option value="249">����(+249)</option><option value="597">������(+597)</option><option value="94">������ī(+94)</option><option value="268">����������(+268)</option><option value="46">������(+46)</option><option value="41">������(+41)</option><option value="34">������(+34)</option><option value="421">���ι�Ű��(+421)</option><option value="386">���κ��Ͼ�(+386)</option><option value="963">�ø���(+963)</option><option value="232">�ÿ��� ����(+232)</option><option value="1 721">��Ʈ������(+1 721)</option><option value="65">�̰�����(+65)</option><option value="971">�ƶ� ���̸�Ʈ(+971)</option><option value="297">�Ʒ��(+297)</option><option value="374">�Ƹ��޴Ͼ�(+374)</option><option value="54">�Ƹ���Ƽ��(+54)</option><option value="354">���̽�����(+354)</option><option value="509">����Ƽ(+509)</option><option value="353">���Ϸ���(+353)</option><option value="994">������������(+994)</option><option value="93">�������Ͻ�ź(+93)</option><option value="376">�ȵ���(+376)</option><option value="355">�˹ٴϾ�(+355)</option><option value="213">������(+213)</option><option value="244">�Ӱ��(+244)</option><option value="1 268">��Ƽ���ٺδ�(+1 268)</option><option value="1 264">�ޱж�(+1 264)</option><option value="291">����Ʈ����(+291)</option><option value="372">������Ͼ�(+372)</option><option value="593">���⵵��(+593)</option><option value="251">��Ƽ���Ǿ�(+251)</option><option value="503">����ٵ���(+503)</option><option value="44">����(+44)</option><option value="1 284">������ ���� ���Ϸ���(+1 284)</option><option value="246">�𿡰� �����þ�(+246)</option><option value="967">����(+967)</option><option value="968">����(+968)</option><option value="43">����Ʈ����(+43)</option><option value="504">�µζ�(+504)</option><option value="962">�丣��(+962)</option><option value="256">�찣��(+256)</option><option value="598">������(+598)</option><option value="998">���Ű��ź(+998)</option><option value="380">��ũ���̳�(+380)</option><option value="681">������ Ǫ ����(+681)</option><option value="964">�̶�ũ(+964)</option><option value="98">�̶�(+98)</option><option value="972">�̽���(+972)</option><option value="20">����Ʈ(+20)</option><option value="39">��Ż����(+39)</option><option value="91">�ε�(+91)</option><option value="62">�ε��׽þ�(+62)</option><option value="81">�Ϻ�(+81)</option><option value="1 876">�ڸ���ī(+1 876)</option><option value="260">����(+260)</option><option value="240">�������(+240)</option><option value="86">�߱�(+86)</option><option value="236">�߾� ������ī ��ȭ��(+236)</option><option value="253">����Ƽ(+253)</option><option value="350">�������(+350)</option><option value="263">���ٺ��(+263)</option><option value="235">����(+235)</option><option value="420">ü��(+420)</option><option value="56">ĥ��(+56)</option><option value="237">ī�޷�(+237)</option><option value="238">ī�� ������(+238)</option><option value="7">ī���彺ź(+7)</option><option value="974">īŸ��(+974)</option><option value="855">į�����(+855)</option><option value="1">ĳ����(+1)</option><option value="254">�ɳ�(+254)</option><option value="1 345">���̸� ����(+1 345)</option><option value="269">�ڸ��(+269)</option><option value="506">�ڽ�Ÿ��ī(+506)</option><option value="225">��Ʈ ��� �Ƹ�(+225)</option><option value="57">�ݷҺ��(+57)</option><option value="242">���(+242)</option><option value="243">��� ���� ��ȭ��(+243)</option><option value="599">�����(+599)</option><option value="53">���(+53)</option><option value="965">�����Ʈ(+965)</option><option value="682">�� ����(+682)</option><option value="385">ũ�ξ�Ƽ��(+385)</option><option value="996">Ű���⽺��ź(+996)</option><option value="686">Ű���ٽ�(+686)</option><option value="357">Ű���ν�(+357)</option><option value="992">Ÿ��Ű��ź(+992)</option><option value="255">ź�ڴϾ�(+255)</option><option value="66">�±�(+66)</option><option value="1 649">��ũ �� ����Ŀ�� ��..(+1 649)</option><option value="90">��Ű(+90)</option><option value="228">���(+228)</option><option value="690">���� ���(+690)</option><option value="676">�밡(+676)</option><option value="993">����ũ �޴Ͻ�ź(+993)</option><option value="688">���߷�(+688)</option><option value="216">Ƣ����(+216)</option><option value="1 868">Ʈ���ϴٵ� ��ٰ�(+1 868)</option><option value="507">�ĳ���(+507)</option><option value="595">�Ķ����(+595)</option><option value="92">��Ű��ź(+92)</option><option value="675">��Ǫ�� �����(+675)</option><option value="680">�ȶ��(+680)</option><option value="970">�ȷ���Ÿ��(+970)</option><option value="298">��� ����(+298)</option><option value="51">���(+51)</option><option value="351">��������(+351)</option><option value="500">��Ŭ���� ���� (����..(+500)</option><option value="48">������(+48)</option><option value="1 787">Ǫ�����丮��(+1 787)</option><option value="33">������(+33)</option><option value="594">�������� ��Ƴ�(+594)</option><option value="689">�������� �����׽þ�(+689)</option><option value="679">����(+679)</option><option value="358">�ɶ���(+358)</option><option value="63">�ʸ���(+63)</option><option value="36">�밡��(+36)</option><option value="61">ȣ��(+61)</option><option value="852">ȫ��(+852)</option><option value="247">��� ��(+247)</option></select>
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
<th><span class="imt">*</span> �̸���
                      </th>
<td>
<div class="sel_input01 f_left m_right5" style="width: 150px" id="dvWarn_txtEmail1"><input type="text" data-warn="#warn_email" id="txtEmail1" name="pay_email" tabindex="12"></div>
<div class="f_left m_right5" style="padding-top: 7px">@</div>
<div class="sel_input01 f_left m_right5" style="width: 150px" id="dvWarn_txtEmail2"><input type="text" data-warn="#warn_email" id="txtEmail2" name="pay_email1" readonly="true"></div>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox115" style="width:101px; height:40px;">
		<select id="selEmail2" name="selEmail2" onchange="javascript:EmailChange(this)" class="selbox115 has_sb" style="display: block; height:30px;"><option value="">����</option>
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
<option value="textEmail">�����Է�</option></select>
	</div>
</div>
<p class="warning_txt5" id="warn_email" style="display:none;">�̸����� �Է����ּ���</p>
</td>
</tr>
</tbody>
</table>
<div class="notice_tip">
<ul>
<li>�� ������ ���̰� �� 25�� �̸��� ��� ���� �� ���� �߰� ����� �߻��ϴ� ���� �뿩 ����� Ȯ���ϼ���.</li>
<li>�� ���� �����̸��� �������� ���� ��� �뿩�� �Ұ��� �ϴ�, ���� �����̸��� ������ ���� �Է��� ���ּ���.</li>
<li>�� �������� ������ ���� ���� ��, ���� �˻縦 �ϴ� �뿩�� �湮 �� �ݵ�� ������ �������ּ���.</li>
<li>�� ������ ������ �ʱ� �˻� �� �ʼ� üũ �׸����� ���� �ܰ迡�� ���� �Ұ��մϴ�. </li>
</ul>
</div>
</div>
<h4>����</h4>
<div class="info_section table_t4">
<table cellpadding="0" cellspacing="0" width="100%" summary="�����,�ݾ�,��� ���Կ���,�����հ�">
<caption>�������� �ȳ�</caption>
<colgroup>
<col width="50%">
<col width="25%">
<col width="25%">
</colgroup>
<thead>
<tr>
<th>�����</th>
<th>�ݾ�</th>
<th>��� ���Կ���</th>
</tr>
</thead>
<tbody id="Coverage"><tr><td class="bg">Loss damage waiver</td><td>-</td><td> ����</td></tr><tr>  <td colspan="3"><div class="caution_notice">�̱� - ���� ���� (�����ս� ��å ���α׷� (LDW: Loss Damage Waiver) 
���������� �߻��� �ս� Ȥ�� �ջ� (���ǿ��ο� �������)�� ���� �������� å���� �����˴ϴ�. 

ĳ���� - ���� ���� (�����ս� ��å ���α׷� (LDW: Loss Damage Waiver)  
���������� �߻��� �ս� Ȥ�� �ջ� (���ǿ��ο� �������)�� ���� �������� å���� �����˴ϴ�. 
��� �� CAD 500 ������ �� å�ӱݾ��� �ֽ��ϴ�. (Whitehorse ������ CAD 1,500)  

�������� - ���� ���� (�����ս� ��å ���α׷� (LDW: Loss Damage Waiver)  
���� �ѵ� ���� ��å�� (Accident Damage Excess) �� ��å�� �ִ� ���α׷��Դϴ�. 
LDW �� ���ԵǾ� �ִ��� ��� �� ������ �ջ��� �߻��� ��� �����ο��� ���� �ѵ� ���� ��å�� �ݾ� (Accident Damage Excess)�� ����˴ϴ�.</div></td></tr><tr><td class="bg">Personal property insurance</td><td>-</td><td> ����</td></tr><tr>  <td colspan="3"><div class="caution_notice">������ ���� �� �޴�ǰ �н� ���� (PI: Personal Insurance) 
���� �߿� �߻��� ������ �� �������� ���� �� �޴�ǰ �нǿ� ���� �����Դϴ�.</div></td></tr></tbody>
</table>
<div class="notice_tip">
<ul>
<li>�� ������ ������ ���忡�� �߰� �� �� �ֽ��ϴ�. (��� �߰� �߻�)</li>
<li>�� �̿������� ���� ���� ���� ������ �޶��� �� �ֽ��ϴ�.</li>
<li>�� ������ �ο��� ���� ����ݾ��� �߰� �� �� �ֽ��ϴ�. (������ �߰��� ���������� ����)</li>
</ul>
</div>
</div>
<h4>���ÿɼ�</h4>
<div class="info_section table_t4">
<table cellpadding="0" cellspacing="0" width="100%" summary="�߰�����,�ݾ�,����,������Կ���,�����հ�">
<caption>���� ���ÿɼ� �ȳ�</caption>
<colgroup>
<col width="40%">
<col width="20%">
<col width="20%">
<col width="20%">
</colgroup>
<thead>
<tr>
<th>�߰�����</th>
<th>�ݾ�</th>
<th>����</th>
<th>������Կ���</th>
</tr>
</thead>
<tbody id="Equipment"><tr>  <td colspan="4"><div class="caution_notice">�߰���� ������</div></td></tr></tbody>
</table>
<div class="notice_tip">
<ul>
<li>�� ������ �׸��� �뿩 �� ���忡 ��� ������ ��� �߰� �� �� �ֽ��ϴ�. (��� �߰� �߻�)</li>
<li>�� ���� �뿩�� ���� ������ ���� ������ ��û�� �ɼ��� �ݿ����� ���� �� �ֽ��ϴ�.</li>
</ul>
</div>
</div>
<h4>
                �װ��� ���� ���� �Է� <span class="desc">�װ����� �Է��Ͻø� �װ��� ���� �� ������ ��ҵ��� �ʽ��ϴ�.</span></h4>
<div class="info_section table_t3">
<table cellpadding="0" cellspacing="0" width="100%" summary="���޻� ���ϸ��� ����">
<caption>���� ���ϸ��� �����ȳ�</caption>
<colgroup>
<col width="20%">
<col width="80%">
</colgroup>
<tbody>
<tr>
<th>�װ���/���</th>
<td>
<div class="f_left m_right5" style="height:auto;">
	<div class="sb selectbox selbox220" id="sb397063181" style="width:206px; height:40px;">
		<select class="selbox220 has_sb" id="airCompanyCode" name="airCompanyCode" onchange="javascript:AirChange(this)" style="display: block; height:30px;"><option value="" selecetd="true">����</option><option value="KL">KLM�״������װ�(KL)</option><option value="JJ">TAM ������װ�(JJ)</option><option value="KE">�����װ�(KE)</option><option value="DL">��Ÿ�װ�(DL)</option><option value="SU">���þ��װ�(SU)</option><option value="RY">�ξ�ĳ�����ũ����(RY)</option><option value="5J">�����۽��ȿ���(5J)</option><option value="SQ">�̰����װ�(SQ)</option><option value="HP">�Ƹ޸�ĭ����Ʈ�װ�(HP)</option><option value="AA">�Ƹ޸�ĭ�װ�(AA)</option><option value="OZ">�ƽþƳ��װ�(OZ)</option><option value="EK">���̷���Ʈ�װ�(EK)</option><option value="BR">�����װ�(BR)</option><option value="NZ">���������(NZ)</option><option value="BX">����λ�(BX)</option><option value="XJ">����ƽþ� Ÿ��(XJ)</option><option value="AC">����ĳ����(AC)</option><option value="AF">����������(AF)</option><option value="2P">�����ʸ���(2P)</option><option value="BA">�����װ�(BA)</option><option value="UA">������Ƽ���װ�(UA)</option><option value="ZE">�̽�Ÿ�װ�(ZE)</option><option value="JL">�Ϻ��װ�(JL)</option><option value="NH">���Ϻ�����(NH)</option><option value="7C">�����װ�(7C)</option><option value="CA">�߱������װ�(CA)</option><option value="CZ">�߱������װ�(CZ)</option><option value="MU">�߱������װ�(MU)</option><option value="CI">��ȭ�װ�(CI)</option><option value="LJ">������(LJ)</option><option value="OK">ü���װ�(OK)</option><option value="CR">ī�Ḯ��(CR)</option><option value="CX">ĳ�����н���(CX)</option><option value="QF">��Ÿ���װ�(QF)</option><option value="TG">Ÿ���װ�(TG)</option><option value="TK">��Ű�װ�(TK)</option><option value="TW">Ƽ�����װ�(TW)</option><option value="MM">��ġ�װ�(MM)</option><option value="AY">�ɿ���(AY)</option><option value="PR">�ʸ����װ�(PR)</option><option value="HA">�Ͽ��̾��װ�(HA)</option><option value="UO">ȫ���ͽ�������(UO)</option><option value="HX">ȫ���װ�(HX)</option><option value="00">�����Է�</option></select>
	</div>
</div>
<div class="sel_input01 f_left m_right5" style="width: 70px"><input type="text" id="OperatingCompanyCode" name="OperatingCompanyCode" readonly="true" maxlength="2" tabindex="18"></div>
<div class="sel_input01 f_left m_right5" style="width: 150px"><input type="text" id="ArrivalInfo_Number" name="ArrivalInfo_Number" maxlength="4" tabindex="19"></div>
</td>
</tr>
</tbody>
</table>
</div>
<h4>��û���� �Է�(����)</h4>
<div class="info_section board_t1" style="overflow-y: visible; height: 66px; padding: 10px 20px">
                ���� �߰� ��û������ �����ôٸ�, �Ʒ� ���� ��û���׿� ������ �ֽñ� �ٶ��ϴ�.<br>
                ��, �̷��� ��û ������ �ϳ������ Ȯ���Ͽ� �帱 �� ������ ���� ��ü�� �Ǵܿ� ���� ó�� ���ΰ� ���� �˴ϴ�
                <textarea id="SpecialRequestPref" name="SpecialRequestPref" style="height: 20px;width:670px;ime-mode:disabled" maxlength="100" tabindex="20" data-intype="eng"></textarea></div>
</div>
</form>
</div>
<div id="reservation_desc" style="top: 0px;">
<h3>�������</h3>
<div class="desc_section">
<div class="rent_price">
<h4>���� �뿩 ���</h4>
<ul class="option_price" id="RentalPrice"><li><b class="tit">�������</b><strong>KRW&nbsp${cost}</strong></li><li><b class="tit">���� &amp; ����</b><strong>KRW&nbsp;${tax}</strong></li><li><b class="tit">����(Loss damage waiver)</b><strong>-</strong></li><li><b class="tit">����(Personal property in..)</b><strong>-</strong></li></ul>
<div class="sum_price">
<div class="total"><b class="txt">�ѿ��</b><strong id="RentalTotalPrice"><span>KRW</span>&nbsp;${rentCarDTO.price}</strong></div>
<div class="exchange" id="ExchangePrice"><b>��${rentCarDTO.price}</b> / ����ȯ������</div>
</div>
<ul class="option_info" id="RateDistance"><li>�������ѻ��� (�Ÿ����ѿ���)</li><li><span class="tit">����Ÿ����ѿ���</span>: ������</li></ul>
<div class="btn_area"><button class="btn_reservation" id="btnReservation"><span>�����ϱ�</span></button></div>
</div>
</div>
</div>
</div>
</div>


</div>
<div class="rentcar_layer" id="rentLayer" style="width: 500px; height: 326px; top: 2388.5px; left: 424.5px;">
<p class="h_title" id="layerTitle">�����Ϸ�</p>
<div class="layer_cont"><span class="bg_ico confirm" id="layerIcoCss"></span><strong class="layer_ment" id="layerMent">�ش� �������� �����Ϸ� �Ͻðڽ��ϱ�?</strong><div class="notice_section">
<p class="txt_notice" id="layerNotice">- �������� �����ϴ� �ĺ��� ��ǰ���� �ؿܿ��� ����� �� �ִ�<br>������ ������ �ſ�ī��θ� ���� �����մϴ�.<br>- ����ī ������ �����ϴ� ��ü �� ���� ���ɿ� ���� �ʼ� �����Ͽ��� �ϴ� <br>����, ���ÿɼ� �������, �������� ���� �Ϸ� �� ���� ǥ�õ� ��ݿ���<br> �߰����� �߻��� �� �ֽ��ϴ�.</p>
<div class="btn_area"><button class="btn_conform" id="btnReservConfirm">Ȯ��</button><button class="btn_cancel" id="btnClose">���</button></div>
</div>
</div><button type="button" class="btn_close" title="���̾� �ݱ�" id="btnCloseLayer"><span class="ir">�ݱ�</span></button></div>

<div id="mask_loader" style="width: 2000px; height: 4098px; opacity: 0.6; display: block;"></div>




package administrator.dao;

import java.util.List;
import java.util.Map;


import hotel.bean.HotelDTO;
import payInform.bean.PayInformDTO;
import productFree.bean.AirplaneDTO;
import recentViewProduct.bean.RecentViewProductDTO;
import reservationInform.bean.ReservationInformDTO;
import trip.bean.TripDTO;

public interface AdministratorDAO {
	public void insertPackageSubmit(TripDTO tripDTO);

	public List<TripDTO> getPackageParent();

	public void insertPackageDetailSubmit(TripDTO tripDTO);

	public void insertAirplaneSubmit(AirplaneDTO airplaneDTO);

	public void insertHotelSubmit(HotelDTO hotelDTO);

	public List<TripDTO> allPackageList();

	public List<TripDTO> pastPackageList(Map<String, Integer> map);

	public List<RecentViewProductDTO> getRecentViewProductList();

	public void deleteRecentViewProduct(int seq);

	public List<TripDTO> notPastPackageList(Map<String, Integer> map);

	public List<ReservationInformDTO> getReservationList();

	public void deleteReservationProduct(String reservation_number);

	public List<PayInformDTO> getPaymentList();

	public List<PayInformDTO> getCancelPaymentList();

	public List<PayInformDTO> getWholeList();

}

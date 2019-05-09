package payInform.dao;

import java.util.List;
import java.util.Map;

import payInform.bean.PayInformDTO;
import reservationInform.bean.ReservationInformDTO;
import travelerInform.bean.TravelerInformDTO;

public interface PayInformDAO {

	void insertPayInform(PayInformDTO payDTO);

	String getPayNumber(String pay_name);
	
	List<PayInformDTO> getPayInformList(String id);

	  List<PayInformDTO> getPayCancelList(String id);

	void modifyPayCompleteInsert(ReservationInformDTO reservationDTO);

	PayInformDTO getNoPayInform(Map<String, String> map);

	PayInformDTO getPayByNumber(String pay_number);

	PayInformDTO getPayCancel(String pay_number);

	void cancelPaymentComplete(String num);

	PayInformDTO getLastPayInform();

	List<TravelerInformDTO> getTravelerInform(String num);

	List<PayInformDTO> getRentPayInformList(String id);

	List<PayInformDTO> getRentPayCancelList(String id);

	List<PayInformDTO> getAirPayInformList(String id);

	List<PayInformDTO> getAirPayCancelList(String id);

	void insertHotelPayCompletel(PayInformDTO payInformDTO);

	 List<PayInformDTO> getPayInformListHotel(String id);

	void cancelHotelPayment(String pay_number);

	List<PayInformDTO> getPayCancelListHotel(String id);
	      
	
}

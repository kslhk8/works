package reservationInform.dao;

import java.util.List;
import java.util.Map;

import reservationInform.bean.ReservationInformDTO;

public interface ReservationInformDAO {

	void insertReservaionInform(ReservationInformDTO reservationInformDTO);
	public ReservationInformDTO getReservationInform(String name);
	String getReservationNumber(String reservation_name);
	List<ReservationInformDTO> getReservationInformList(String id);
	List<ReservationInformDTO> getReservationCancelList(String id);
	ReservationInformDTO getReservationByNumber(String num);
	void updateTotalMember(Map map);
	void removePayed(String reservation_number);
	void cancelReservation(String reservation_number);
	ReservationInformDTO getNoResevationInform(Map<String, String> map);
	ReservationInformDTO getNoReservationCancle(String reservation_number);
	
	
	
}

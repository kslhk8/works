package travelerInform.dao;

import java.util.List;

import travelerInform.bean.TravelerInformDTO;

public interface TravelerInformDAO {

	void insertTraveler(TravelerInformDTO travelerInformDTO);
	List<TravelerInformDTO> getTravelerInform(String reservation_number);
	void modifyTraveler(TravelerInformDTO travelerInformDTO);
	void updateToPayNum(String reservation_number);
	String getReservedMember(String pay_number);
}

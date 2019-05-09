package rentCar.dao;

import java.util.List;
import java.util.Map;

import rentCar.bean.RentCarDTO;

public interface RentCarDAO {

	

	public int getTotalA(String rentlocation);

	public List<RentCarDTO> rentCarList(int startNum, int endNum, String rentlocation);

	public List<RentCarDTO> rentCarLocation(String rentlocation);

	public List<RentCarDTO> rentCarListOccupancy(int occupancy, String rentlocation);

	public RentCarDTO rentCarReservation(int seq);

	public void updateRentCar(int seq);
	
	public List<RentCarDTO> rentCarRadioChecked(Map<String, String> map);

	public List<RentCarDTO> rentCarRadioTotal(String rentlocation);

	public int eurocarTotal(String rentlocation);

	public int herlzTotal(String rentlocation);

	public int mediumTotal(String rentlocation);

	public int smallTotal(String rentlocation);

	public int autoTotal(String rentlocation);

	public int fiveTotal(String rentlocation);

	public int manualTotal(String rentlocation);

	public int fourTotal(String rentlocation);

	public void returnRentCar(int rent_code);
}

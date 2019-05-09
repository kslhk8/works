package hotel.dao;

import java.util.List;
import java.util.Map;

import hotel.bean.HotelDTO;

public interface HotelDAO {
	public List<HotelDTO> getHotel(Map<String,String> map);

	public int getHotelTotalA(Map<String,String> map);

	public HotelDTO getHotelInform(String hotel_name);
}

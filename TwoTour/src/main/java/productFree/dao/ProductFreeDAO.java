package productFree.dao;

import java.util.List;
import java.util.Map;

import productFree.bean.AirplaneDTO;

public interface ProductFreeDAO {

	List<AirplaneDTO> getAirplaneSchedule(Map<String, Object> map);

	List<AirplaneDTO> getAirplaneScheduleUni(Map<String, Object> map);

	List<AirplaneDTO> getAirplaneScheduleReTurn(Map<String, Object> map);

	AirplaneDTO getOneAirplaneSchedule(Map<String, Object> map);

	AirplaneDTO getDepart_airplane(String depart_code, String depart_date);

	AirplaneDTO getArrive_airplane(String arrive_code, String arrive_date);


}

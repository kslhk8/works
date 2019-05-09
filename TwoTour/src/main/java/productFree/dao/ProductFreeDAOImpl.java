package productFree.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import productFree.bean.AirplaneDTO;

@Component("productFreeDAO")
@Transactional
public class ProductFreeDAOImpl implements ProductFreeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<AirplaneDTO> getAirplaneSchedule(Map<String, Object> map) {
		List<AirplaneDTO> airplaneList = sqlSession.selectList("productFreeSQL.getAirplaneSchedule", map);
		return airplaneList;
	}


	@Override
	public List<AirplaneDTO> getAirplaneScheduleUni(Map<String, Object> map) {
		List<AirplaneDTO> airplaneList = sqlSession.selectList("productFreeSQL.getAirplaneScheduleUni", map);
		return airplaneList;
	}


	@Override
	public List<AirplaneDTO> getAirplaneScheduleReTurn(Map<String, Object> map) {
		List<AirplaneDTO> airplaneList = sqlSession.selectList("productFreeSQL.getAirplaneScheduleReTurn", map);
		return airplaneList;
	}
	@Override
	public AirplaneDTO getOneAirplaneSchedule(Map<String, Object> map) {
		AirplaneDTO airplaneDTO = sqlSession.selectOne("productFreeSQL.getOneAirplaneSchedule", map);
		return airplaneDTO;
	}


	@Override
	public AirplaneDTO getDepart_airplane(String depart_code, String depart_date) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("depart_code", depart_code);
		map.put("depart_date", depart_date);
		return sqlSession.selectOne("productFreeSQL.getDepart_airplane",map);
	}

	@Override
	public AirplaneDTO getArrive_airplane(String arrive_code, String arrive_date) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("arrive_code", arrive_code);
		map.put("arrive_date", arrive_date);
		return sqlSession.selectOne("productFreeSQL.getArrive_airplane",map);
	}

}

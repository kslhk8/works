package hotel.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import hotel.bean.HotelDTO;


@Transactional
@Component("hotelDAO")
public class HotelDAOMybatis implements HotelDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<HotelDTO> getHotel(Map<String,String> map) {
		return sqlSession.selectList("hotelSQL.getHotel", map);
	}
	@Override
	public int getHotelTotalA(Map<String,String> map) {
		return  sqlSession.selectOne("hotelSQL.getHotelTotalA", map);
	}
	@Override
	public HotelDTO getHotelInform(String hotel_name) {
		return sqlSession.selectOne("hotelSQL.getHotelInform",hotel_name);
	}
}

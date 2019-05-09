package reservationInform.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import reservationInform.bean.ReservationInformDTO;

@Component("reservationInformDAO")
public class ReservationInformDAOMybatis implements ReservationInformDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insertReservaionInform(ReservationInformDTO reservationInformDTO) {
		sqlSession.insert("reservationInformSQL.insertReservaionInform",reservationInformDTO);
	}

	@Override
	public ReservationInformDTO getReservationInform(String name) {
		return sqlSession.selectOne("reservationInformSQL.getReservationInform",name);
	}

	@Override
	public String getReservationNumber(String reservation_name) {
		Map<String,String> map = new HashMap<String,String>();
	
		return sqlSession.selectOne("reservationInformSQL.getReservationNumber",reservation_name);
	}

	@Override
	public List<ReservationInformDTO> getReservationInformList(String id) {
		return sqlSession.selectList("reservationInformSQL.getReservationInformList",id);
	}
	@Override
	public List<ReservationInformDTO> getReservationCancelList(String id) {
		 return sqlSession.selectList("reservationInformSQL.getReservationCancelList",id);
	}

	@Override
	public ReservationInformDTO getReservationByNumber(String num) {
		 return sqlSession.selectOne("reservationInformSQL.getReservationByNumber",num);
	}

	@Override
	public void updateTotalMember(Map map) {
		 sqlSession.update("reservationInformSQL.updateTotalMember",map);
	}

	@Override
	public void removePayed(String reservation_number) {
		sqlSession.delete("reservationInformSQL.removePayed",reservation_number);
		
	}

	@Override
	public void cancelReservation(String reservation_number) {
		 sqlSession.update("reservationInformSQL.cancelReservation",reservation_number);
	}

	@Override
	public ReservationInformDTO getNoResevationInform(Map<String, String> map) {
		return sqlSession.selectOne("reservationInformSQL.getNoResevationInform",map);
	}

	@Override
	public ReservationInformDTO getNoReservationCancle(String reservation_number) {
		return sqlSession.selectOne("reservationInformSQL.getNoReservationCancle",reservation_number);
	}

	

	
}

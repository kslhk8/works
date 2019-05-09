package travelerInform.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import travelerInform.bean.TravelerInformDTO;

@Component("travelerInformDAO")
public class TravelerInformDAOMybatis implements TravelerInformDAO {
	@Autowired
	SqlSession sqlSession;


	@Override
	public void insertTraveler(TravelerInformDTO travelerInformDTO) {
		sqlSession.insert("travelerInformSQL.insertTraveler",travelerInformDTO);
	}


	@Override
	public List<TravelerInformDTO> getTravelerInform(String reservation_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("travelerInformSQL.getTravelerInform",reservation_number);
	}
	
	@Override
	public void modifyTraveler(TravelerInformDTO travelerInformDTO) {
		sqlSession.update("travelerInformSQL.modifyTraveler", travelerInformDTO);	
	}


	@Override
	public void updateToPayNum(String reservation_number) {
		sqlSession.update("travelerInformSQL.updateToPayNum", reservation_number);	
		
	}


	@Override
	public String getReservedMember(String pay_number) {
		return sqlSession.selectOne("travelerInformSQL.getReservedMember",pay_number);
		}
}

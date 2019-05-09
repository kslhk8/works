package safetyInform.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import safetyInform.bean.SafetyInformDTO;

@Transactional
@Component("safetyInformDAO")
public class SafetyInformDAOMybatis implements SafetyInformDAO {
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public SafetyInformDTO getSafetyInform(String arrive_city) {
		return sqlSession.selectOne("safetyInformSQL.getSafetyInform",arrive_city);
	}
}

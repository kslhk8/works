package maincityInform.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import maincityInform.bean.MaincityInformDTO;

@Component("maincityInformDAO")
public class MaincityInformDAOMybatis implements MaincityInformDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public MaincityInformDTO getMaincityInform(String arrive_city) {
		return sqlSession.selectOne("maincityInformSQL.getMaincityInform",arrive_city);
	}
}

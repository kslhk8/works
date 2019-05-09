package clause.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import clause.bean.ClauseDTO;

@Transactional
@Component("clauseDAO")
public class ClauseDAOMybatis implements ClauseDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ClauseDTO getClause(String arrive_city) {
		return sqlSession.selectOne("clauseSQL.getClause", arrive_city);
	}
}

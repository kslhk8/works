package tripPlan.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import tripPlan.bean.TripPlanDTO;

@Component("tripPlanDAO")
public class TripPlanDAOMybatis implements TripPlanDAO {
	@Autowired
	SqlSession sqlSession;
	@Override
	public TripPlanDTO getTripPlan(String arrive_city) {
		return sqlSession.selectOne("tripPlanSQL.getTripPlan",arrive_city);
	}

}

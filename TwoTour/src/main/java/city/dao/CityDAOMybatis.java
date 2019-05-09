package city.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import city.bean.CityDTO;

@Transactional
@Component("cityDAO")
public class CityDAOMybatis implements CityDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CityDTO> overseaPackageArriveCitySearch(String arrive_city){		
		List<CityDTO> list = sqlSession.selectList("citySQL.overseaPackageArriveCitySearch", arrive_city);
		return list;
	}
}

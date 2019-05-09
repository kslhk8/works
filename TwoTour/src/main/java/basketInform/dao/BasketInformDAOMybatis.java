package basketInform.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import basketInform.bean.BasketInformDTO;

@Component("basketInformDAO")
public class BasketInformDAOMybatis implements BasketInformDAO {
	@Autowired
	SqlSession sqlSession;
	@Override
	public void insertBasketInform(Map<String, String> map) {
		sqlSession.insert("basketInformSQL.insertBasketInform",map);
		
	}
	@Override
	public List<BasketInformDTO> getBasketInformList(String id) {
		return sqlSession.selectList("basketInformSQL.getBasketInformList",id);
	}
	@Override
	public void deleteBasketList(int basket_seq) {
		sqlSession.update("basketInformSQL.deleteBasketList",basket_seq);
	}

}

package basketInform.dao;

import java.util.List;
import java.util.Map;

import basketInform.bean.BasketInformDTO;

public interface BasketInformDAO {


	void insertBasketInform(Map<String, String> map);

	List<BasketInformDTO> getBasketInformList(String id);

	void deleteBasketList(int basket_seq);
}

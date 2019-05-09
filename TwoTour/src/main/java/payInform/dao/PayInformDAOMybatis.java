package payInform.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import payInform.bean.PayInformDTO;
import reservationInform.bean.ReservationInformDTO;
import travelerInform.bean.TravelerInformDTO;

@Component("payInform")
public class PayInformDAOMybatis implements PayInformDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insertPayInform(PayInformDTO payDTO) {
		sqlSession.insert("payInformSQL.insertPayInform",payDTO);
		
	}

	@Override
	public String getPayNumber(String pay_name) {
	
		return sqlSession.selectOne("payInformSQL.getPayNumber",pay_name);
	}
	
	@Override
	public List<PayInformDTO> getPayInformList(String id) {
	
	   return sqlSession.selectList("payInformSQL.getPayInformList",id);		
	}

	@Override
	public List<PayInformDTO> getPayCancelList(String id) {
		return sqlSession.selectList("payInformSQL.getPayCancelList",id);	
	}

	@Override
	public void modifyPayCompleteInsert(ReservationInformDTO reservationDTO) {
		 sqlSession.insert("payInformSQL.modifyPayCompleteInsert",reservationDTO);
		
	}

	@Override
	public PayInformDTO getNoPayInform(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payInformSQL.getNoPayInform",map);
	}

	@Override
	public PayInformDTO getPayByNumber(String pay_number) {
		return sqlSession.selectOne("payInformSQL.getPayByNumber",pay_number);
	}

	@Override
	public PayInformDTO getPayCancel(String pay_number) {
		return sqlSession.selectOne("payInformSQL.getPayCancel",pay_number);
	}
	@Override
	public void cancelPaymentComplete(String num) {
		sqlSession.update("payInformSQL.cancelPaymentComplete", num);
		
	}

	@Override
	public PayInformDTO getLastPayInform() {
		return sqlSession.selectOne("payInformSQL.getLastPayInform");
	}

	@Override
	public List<TravelerInformDTO> getTravelerInform(String num) {
		return sqlSession.selectList("payInformSQL.getTravelerInform",num);
	}

	@Override
	public List<PayInformDTO> getRentPayInformList(String id) {
		return sqlSession.selectList("payInformSQL.getRentPayInformList",id);
	}

	@Override
	public List<PayInformDTO> getRentPayCancelList(String id) {
		return sqlSession.selectList("payInformSQL.getRentPayCancelList",id);

	}

	@Override
	public List<PayInformDTO> getAirPayInformList(String id) {
		return sqlSession.selectList("payInformSQL.getAirPayInformList",id);
	}

	@Override
	public List<PayInformDTO> getAirPayCancelList(String id) {
		return sqlSession.selectList("payInformSQL.getAirPayCancelList",id);

	}
	 @Override
	   public void insertHotelPayCompletel(PayInformDTO payInformDTO) {
	      sqlSession.update("payInformSQL.insertHotelPayCompletel", payInformDTO);
	   }

	   @Override
	   public List<PayInformDTO>  getPayInformListHotel(String id) {
	       return sqlSession.selectList("payInformSQL.getPayInformListHotel",id);   
	   }

	   @Override
	   public void cancelHotelPayment(String pay_number) {
	      sqlSession.update("payInformSQL.cancelHotelPayment", pay_number);
	   }

	   @Override
	   public List<PayInformDTO> getPayCancelListHotel(String id) {
	      return sqlSession.selectList("payInformSQL.getPayCancelListHotel",id);   
	   }
	

	
}

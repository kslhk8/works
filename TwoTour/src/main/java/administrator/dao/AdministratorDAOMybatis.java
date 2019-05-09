package administrator.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import hotel.bean.HotelDTO;
import payInform.bean.PayInformDTO;
import productFree.bean.AirplaneDTO;
import recentViewProduct.bean.RecentViewProductDTO;
import reservationInform.bean.ReservationInformDTO;
import trip.bean.TripDTO;

@Transactional
@Component
public class AdministratorDAOMybatis implements AdministratorDAO {
	@Autowired
	SqlSession sqlSession;
	
	//패키지등록
	@Override
	public void insertPackageSubmit(TripDTO tripDTO) {
		sqlSession.insert("administratorSQL.insertPackageSubmit",tripDTO);
	}
	
	
	//상세패키지등록
	@Override
	public List<TripDTO> getPackageParent(){
		return sqlSession.selectList("administratorSQL.getPackageParent");
	}
	
	@Override
	public void insertPackageDetailSubmit(TripDTO tripDTO) {
		sqlSession.insert("administratorSQL.insertPackageDetailSubmit",tripDTO);
	}
	
	
	//항공등록
	@Override
	public void insertAirplaneSubmit(AirplaneDTO airplaneDTO) {
		sqlSession.insert("administratorSQL.insertAirplaneSubmit",airplaneDTO);
	}
	
	
	//호텔등록
	@Override
	public void insertHotelSubmit(HotelDTO hotelDTO) {
		sqlSession.insert("administratorSQL.insertHotelSubmit",hotelDTO);
	}
	
	
	//패키지관리
	@Override
	public List<TripDTO> allPackageList(){
		return sqlSession.selectList("administratorSQL.allPackageList");
	}
	
	//지난패키지
	@Override
	public List<TripDTO> pastPackageList(Map<String, Integer> map){
		return sqlSession.selectList("administratorSQL.pastPackageList",map);
	}
	
	//지나지않은패키지
	@Override
	public List<TripDTO> notPastPackageList(Map<String, Integer> map){
		return sqlSession.selectList("administratorSQL.notPastPackageList",map);
	}
	
	
	
	//최근본상품
	@Override
	public List<RecentViewProductDTO> getRecentViewProductList(){
		return sqlSession.selectList("administratorSQL.getRecentViewProductList");
	}
	
	//최근본상품 지우기
	@Override
	public void deleteRecentViewProduct(int seq) {
		sqlSession.delete("administratorSQL.deleteRecentViewProduct", seq);
	}
	
	//예약목록 보기
	@Override
	public List<ReservationInformDTO> getReservationList(){
		return sqlSession.selectList("administratorSQL.getReservationList");
		
	}
	
	//예약목록 취소
	@Override
	public void deleteReservationProduct(String reservation_number) {
		sqlSession.update("administratorSQL.deleteReservationProduct", reservation_number);
	}
	
	
	//결제/결제취소 모든 데이터
	@Override
	public List<PayInformDTO> getWholeList(){
		return sqlSession.selectList("administratorSQL.getWholeList");
	}
	
	//결제
	@Override
	public List<PayInformDTO> getPaymentList(){
		return sqlSession.selectList("administratorSQL.getPaymentList");
	}
	
	//결제취소
	@Override
	public List<PayInformDTO> getCancelPaymentList(){
		return sqlSession.selectList("administratorSQL.getCancelPaymentList");
	}
	

}

package rentCar.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import rentCar.bean.RentCarDTO;

@Transactional
@Component
public class RentCarDAOMybatis extends NamedParameterJdbcDaoSupport implements RentCarDAO {
	@Autowired
	private SqlSession sqlSession;
	@Autowired 
	public void setDS(DataSource dataSource){//xml에서 DAO가 잡고있던 datasource를 여기서 메소드로 대신 잡음. 
		setDataSource(dataSource);
		
	}
	@Override
	public List<RentCarDTO> rentCarList(int startNum, int endNum,String rentlocation) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("rentlocation", rentlocation);
		
		List<RentCarDTO> list = sqlSession.selectList("rentCarSQL.rentCarList",map);
		return list;
	}
	
	
	@Override
	public int getTotalA(String rentlocation) {
		int totalA=0;
		totalA = sqlSession.selectOne("rentCarSQL.getTotalA",rentlocation);
		return totalA;
	}
	@Override
	public List<RentCarDTO> rentCarLocation(String rentlocation) {
		List<RentCarDTO> list = sqlSession.selectList("rentCarSQL.rentCarLocation",rentlocation);
		return list;
		
	}
	@Override
	public List<RentCarDTO> rentCarListOccupancy(int occupancy, String rentlocation) {
		System.out.println(occupancy);
		System.out.println(rentlocation);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("occupancy", occupancy);
		map.put("rentlocation", rentlocation);
		List<RentCarDTO> list = sqlSession.selectList("rentCarSQL.rentCarListOccupancy",map);
		return list;
		
	}
	@Override
	public RentCarDTO rentCarReservation(int seq) {
		RentCarDTO rentCarDTO = sqlSession.selectOne("rentCarSQL.rentCarReservation",seq);
		return rentCarDTO;
	}
	@Override
	public void updateRentCar(int seq) {
		sqlSession.update("rentCarSQL.updateRentCar",seq);
		
	}
	@Override
	public List<RentCarDTO> rentCarRadioChecked(Map<String, String> map) {
		List<RentCarDTO> list = sqlSession.selectList("rentCarSQL.rentCarRadioChecked",map);
		return list;
	}
	@Override
	public List<RentCarDTO> rentCarRadioTotal(String rentlocation) {
		List<RentCarDTO> list = sqlSession.selectList("rentCarSQL.rentCarRadioTotal",rentlocation);
		return list;
	}
	@Override
	public int eurocarTotal(String rentlocation) {
		int eurocarTotal=0;
		eurocarTotal = sqlSession.selectOne("rentCarSQL.eurocarTotal",rentlocation);
		return eurocarTotal;
	}
	@Override
	public int herlzTotal(String rentlocation) {
		int herlzTotal=0;
		herlzTotal = sqlSession.selectOne("rentCarSQL.herlzTotal",rentlocation);
		return herlzTotal;
	}
	@Override
	public int mediumTotal(String rentlocation) {
		int mediumTotal=0;
		mediumTotal = sqlSession.selectOne("rentCarSQL.mediumTotal",rentlocation);
		return mediumTotal;
	}
	@Override
	public int smallTotal(String rentlocation) {
		int smallTotal=0;
		smallTotal = sqlSession.selectOne("rentCarSQL.smallTotal",rentlocation);
		return smallTotal;
	}
	@Override
	public int autoTotal(String rentlocation) {
		int autoTotal=0;
		autoTotal = sqlSession.selectOne("rentCarSQL.autoTotal",rentlocation);
		return autoTotal;
	}
	@Override
	public int fiveTotal(String rentlocation) {
		int fiveTotal=0;
		fiveTotal = sqlSession.selectOne("rentCarSQL.fiveTotal",rentlocation);
		return fiveTotal;
	}
	@Override
	public int manualTotal(String rentlocation) {
		int manualTotal=0;
		manualTotal = sqlSession.selectOne("rentCarSQL.manualTotal",rentlocation);
		return manualTotal;
	}
	@Override
	public int fourTotal(String rentlocation) {
		int fourTotal=0;
		fourTotal = sqlSession.selectOne("rentCarSQL.fourTotal",rentlocation);
		return fourTotal;
	}
	@Override
	public void returnRentCar(int rent_code) {
		sqlSession.update("rentCarSQL.returnRentCar",rent_code);
		
	}
	
	
	
	
	
	
}

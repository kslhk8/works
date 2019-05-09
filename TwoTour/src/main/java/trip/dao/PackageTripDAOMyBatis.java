package trip.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import trip.bean.PackageTripDTO;
import trip.bean.TripDTO;
@Component("PackageTripDAO")
public class PackageTripDAOMyBatis implements PackageTripDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<PackageTripDTO> getImage(String arrive_city) {
		return sqlSession.selectList("packageTripSQL.getImage",arrive_city);
	}
	@Override
	public List<TripDTO> getPackage(Map<String, String> map) {
			System.out.println("map_size: "+map.size());
			
			List<TripDTO> list = null;
			
			if(map.size()==5){
				//System.out.println("All");
				
				list = sqlSession.selectList("packageTripSQL.packageListAll", map);
			}
			else if(map.size()==6){
				
				if(map.get("grade")==null) {
					
					//System.out.println("OneWeek");
					
					if(map.get("week").equals("week")) {
						//System.out.println("week");
						list = sqlSession.selectList("packageTripSQL.packageListOneWeek_week", map);
					}
					else {
						//System.out.println("weekend");
						list = sqlSession.selectList("packageTripSQL.packageListOneWeek_weekend", map);
					}
				}
				else {
					//System.out.println("OneGrade");
					list = sqlSession.selectList("packageTripSQL.packageListOneGrade", map);
				}
			}
			else if(map.size()==7){
				if(map.get("grade2")!=null) {
					//System.out.println("twoGrade");
					
					list = sqlSession.selectList("packageTripSQL.packageListTwoGrade", map);
				}
				else {
					//System.out.println("OneWeekOneGrade");
					
					if(map.get("week").equals("week")) {
						System.out.println("week");
						list = sqlSession.selectList("packageTripSQL.packageListOneWeekOneGrade_week", map);
					}
					else {
						System.out.println("weekend");
						list = sqlSession.selectList("packageTripSQL.packageListOneWeekOneGrade_weekend", map);
					}
					
					
					//list = sqlSession.selectList("tripSQL.packageListOneWeekOneGrade", map);
				}
			}
			else if(map.size()==8){
				System.out.println("OneweekTwoGrade");
				//System.out.println(map.get("depart_date"));
				//System.out.println(map.get("week"));
				
				if(map.get("week").equals("week")) {
					//System.out.println("week");
					list = sqlSession.selectList("packageTripSQL.packageListOneWeekTwoGrade_week", map);
				}
				else {
					//System.out.println("weekend");
					
					//System.out.println("arrive_city: "+map.get("arrive_city"));
					//System.out.println("depart_city: "+map.get("depart_city"));
					//System.out.println("depart_date: "+map.get("depart_date"));
					//System.out.println("grade: "+map.get("grade"));
					//System.out.println("grade2: "+map.get("grade2"));
					
					
					
					list = sqlSession.selectList("packageTripSQL.packageListOneWeekTwoGrade_weekend", map);
				}
				
				//list = sqlSession.selectList("tripSQL.packageListOneweekTwoGrade", map);
			}
			
			return list;
		}
		

	@Override
	public List<TripDTO> getProduct(String arrive_city) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getPackageTotalA(Map<String, String> map) {
		System.out.println("map_size: "+map.size());
		int pg=0;
		
		if(map.size()==5){
			//System.out.println("All");
			
			pg = sqlSession.selectOne("packageTripSQL.packagePgAll", map);
		}
		else if(map.size()==6){
			
			if(map.get("grade")==null) {
				
				//System.out.println("OneWeek");
				
				if(map.get("week").equals("week")) {
					//System.out.println("week");
					pg = sqlSession.selectOne("packageTripSQL.packagePgOneWeek_week", map);
				}
				else {
					//System.out.println("weekend");
					pg = sqlSession.selectOne("packageTripSQL.packagePgOneWeek_weekend", map);
				}
			}
			else {
				//System.out.println("OneGrade");
				pg = sqlSession.selectOne("packageTripSQL.packagePgOneGrade", map);
			}
		}
		else if(map.size()==7){
			if(map.get("grade2")!=null) {
				//System.out.println("twoGrade");
				
				pg = sqlSession.selectOne("packageTripSQL.packagePgTwoGrade", map);
			}
			else {
				//System.out.println("OneWeekOneGrade");
				
				if(map.get("week").equals("week")) {
					System.out.println("week");
					pg = sqlSession.selectOne("packageTripSQL.packagePgOneWeekOneGrade_week", map);
				}
				else {
					System.out.println("weekend");
					pg = sqlSession.selectOne("packageTripSQL.packagePgOneWeekOneGrade_weekend", map);
				}
				
				
				//list = sqlSession.selectList("tripSQL.packageListOneWeekOneGrade", map);
			}
		}
		else if(map.size()==8){
			System.out.println("OneweekTwoGrade");
			//System.out.println(map.get("depart_date"));
			//System.out.println(map.get("week"));
			
			if(map.get("week").equals("week")) {
				//System.out.println("week");
				pg = sqlSession.selectOne("packageTripSQL.packagePgOneWeekTwoGrade_week", map);
			}
			else {
				//System.out.println("weekend");
				
				//System.out.println("arrive_city: "+map.get("arrive_city"));
				//System.out.println("depart_city: "+map.get("depart_city"));
				//System.out.println("depart_date: "+map.get("depart_date"));
				//System.out.println("grade: "+map.get("grade"));
				//System.out.println("grade2: "+map.get("grade2"));
				
				
				
				pg = sqlSession.selectOne("packageTripSQL.packagePgOneWeekTwoGrade_weekend", map);
			}
			
			//list = sqlSession.selectList("tripSQL.packageListOneweekTwoGrade", map);
		}
		
		
		return pg;
	}
	@Override
	public List<TripDTO> getPackageLow(Map<String, String> map) {
		System.out.println("map_size: "+map.size());
		
		List<TripDTO> list = null;
		
		if(map.size()==5){
			//System.out.println("All");
			
			list = sqlSession.selectList("packageTripSQL.packageListAll_low", map);
		}
		else if(map.size()==6){
			
			if(map.get("grade")==null) {
				
				//System.out.println("OneWeek");
				
				if(map.get("week").equals("week")) {
					//System.out.println("week");
					list = sqlSession.selectList("packageTripSQL.packageListOneWeek_week_low", map);
				}
				else {
					//System.out.println("weekend");
					list = sqlSession.selectList("packageTripSQL.packageListOneWeek_weekend_low", map);
				}
			}
			else {
				//System.out.println("OneGrade");
				list = sqlSession.selectList("packageTripSQL.packageListOneGrade_low", map);
			}
		}
		else if(map.size()==7){
			if(map.get("grade2")!=null) {
				//System.out.println("twoGrade");
				
				list = sqlSession.selectList("packageTripSQL.packageListTwoGrade_low", map);
			}
			else {
				//System.out.println("OneWeekOneGrade");
				
				if(map.get("week").equals("week")) {
					System.out.println("week");
					list = sqlSession.selectList("packageTripSQL.packageListOneWeekOneGrade_week_low", map);
				}
				else {
					System.out.println("weekend");
					list = sqlSession.selectList("packageTripSQL.packageListOneWeekOneGrade_weekend_low", map);
				}
				
				
				//list = sqlSession.selectList("tripSQL.packageListOneWeekOneGrade", map);
			}
		}
		else if(map.size()==8){
			System.out.println("OneweekTwoGrade");
			//System.out.println(map.get("depart_date"));
			//System.out.println(map.get("week"));
			
			if(map.get("week").equals("week")) {
				//System.out.println("week");
				list = sqlSession.selectList("packageTripSQL.packageListOneWeekTwoGrade_week_low", map);
			}
			else {
				//System.out.println("weekend");
				
				//System.out.println("arrive_city: "+map.get("arrive_city"));
				//System.out.println("depart_city: "+map.get("depart_city"));
				//System.out.println("depart_date: "+map.get("depart_date"));
				//System.out.println("grade: "+map.get("grade"));
				//System.out.println("grade2: "+map.get("grade2"));
				
				
				
				list = sqlSession.selectList("packageTripSQL.packageListOneWeekTwoGrade_weekend_low", map);
			}
			
			//list = sqlSession.selectList("tripSQL.packageListOneweekTwoGrade", map);
		}
		
		return list;
	}
	@Override
	public TripDTO getParentPackage(int seq) {
		return sqlSession.selectOne("packageTripSQL.getParentPackage",seq);
	}
	
	@Override
	public List<TripDTO> getProductList(Map<String, String> map) {	
		List<TripDTO> list = null;
		//System.out.println("getProductList");
		
		if(map.size()==4){
			//System.out.println("All");	
			list = sqlSession.selectList("packageTripSQL.productListAll", map);
		}
		else if(map.size()==5){
			
			if(map.get("grade")==null) {	
				//System.out.println("OneWeek");
				
				if(map.get("week").equals("week")) {
					//System.out.println("week");
					list = sqlSession.selectList("packageTripSQL.productListOneWeek_week", map);
				}
				else {
					//System.out.println("weekend");
					list = sqlSession.selectList("packageTripSQL.productListOneWeek_weekend", map);
				}
			}
			else {
				//System.out.println("OneGrade");
				list = sqlSession.selectList("packageTripSQL.productListOneGrade", map);
			}
		}
		else if(map.size()==6){
			if(map.get("grade2")!=null) {
				//System.out.println("twoGrade");
				
				list = sqlSession.selectList("packageTripSQL.productListTwoGrade", map);
			}
			else {
				//System.out.println("OneWeekOneGrade");
				
				if(map.get("week").equals("week")) {
					System.out.println("week");
					list = sqlSession.selectList("packageTripSQL.productListOneWeekOneGrade_week", map);
				}
				else {
					System.out.println("weekend");
					list = sqlSession.selectList("packageTripSQL.productListOneWeekOneGrade_weekend", map);
				}
				
				
				//list = sqlSession.selectList("tripSQL.packageListOneWeekOneGrade", map);
			}
		}
		else if(map.size()==7){
			//System.out.println("OneweekTwoGrade");
			//System.out.println(map.get("depart_date"));
			//System.out.println(map.get("week"));
			
			if(map.get("week").equals("week")) {
				//System.out.println("week");
				list = sqlSession.selectList("packageTripSQL.productListOneWeekTwoGrade_week", map);
			}
			else {
				//System.out.println("weekend");
				
				//System.out.println("arrive_city: "+map.get("arrive_city"));
				//System.out.println("depart_city: "+map.get("depart_city"));
				//System.out.println("depart_date: "+map.get("depart_date"));
				//System.out.println("grade: "+map.get("grade"));
				//System.out.println("grade2: "+map.get("grade2"));
				
				
				
				list = sqlSession.selectList("packageTripSQL.productListOneWeekTwoGrade_weekend", map);
			}
			
			//list = sqlSession.selectList("tripSQL.packageListOneweekTwoGrade", map);
		}
		
		return list;
	}
	
	@Override
	public int getProductTotalA(Map<String, String> map) {
		//System.out.println("getProjectList_map_size22: "+map.size());
		int pg=0;
		
		if(map.size()==4){
			//System.out.println("All");
			
			pg = sqlSession.selectOne("packageTripSQL.productPgAll", map);
			
			//System.out.println("pg: "+pg);
		}
		else if(map.size()==5){
			
			if(map.get("grade")==null) {
				
				//System.out.println("OneWeek");
				
				if(map.get("week").equals("week")) {
					//System.out.println("week");
					pg = sqlSession.selectOne("packageTripSQL.productPgOneWeek_week", map);
				}
				else {
					//System.out.println("weekend");
					pg = sqlSession.selectOne("packageTripSQL.productPgOneWeek_weekend", map);
				}
			}
			else {
				//System.out.println("OneGrade");
				pg = sqlSession.selectOne("packageTripSQL.productPgOneGrade", map);
			}
		}
		else if(map.size()==6){
			if(map.get("grade2")!=null) {
				//System.out.println("twoGrade");
				
				pg = sqlSession.selectOne("packageTripSQL.productPgTwoGrade", map);
			}
			else {
				//System.out.println("OneWeekOneGrade");
				
				if(map.get("week").equals("week")) {
					//System.out.println("week");
					pg = sqlSession.selectOne("packageTripSQL.productPgOneWeekOneGrade_week", map);
				}
				else {
					//System.out.println("weekend");
					pg = sqlSession.selectOne("packageTripSQL.productPgOneWeekOneGrade_weekend", map);
				}
				
				
				//list = sqlSession.selectList("tripSQL.packageListOneWeekOneGrade", map);
			}
		}
		else if(map.size()==7){
			//System.out.println("OneweekTwoGrade");
			//System.out.println(map.get("depart_date"));
			//System.out.println(map.get("week"));
			
			if(map.get("week").equals("week")) {
				//System.out.println("week");
				pg = sqlSession.selectOne("packageTripSQL.productPgOneWeekTwoGrade_week", map);
			}
			else {
				//System.out.println("weekend");
				
				//System.out.println("arrive_city: "+map.get("arrive_city"));
				//System.out.println("depart_city: "+map.get("depart_city"));
				//System.out.println("depart_date: "+map.get("depart_date"));
				//System.out.println("grade: "+map.get("grade"));
				//System.out.println("grade2: "+map.get("grade2"));
				
				
				
				pg = sqlSession.selectOne("packageTripSQL.productPgOneWeekTwoGrade_weekend", map);
			}
			
			//list = sqlSession.selectList("tripSQL.packageListOneweekTwoGrade", map);
		}
		
		
		return pg;
	}
	
	@Override
	public void insertRecentProductViewed(Map<String, Object> map) {
		sqlSession.insert("packageTripSQL.insertRecentProductViewed",map);
	}
	
	@Override
	public List<TripDTO> selectRecentProductViewed(){
		return sqlSession.selectList("packageTripSQL.selectRecentProductViewed");
	}
	@Override
	public void updateReservationNumber(int son_seq, int size) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("son_seq", son_seq);
		map.put("size", size);
		
		sqlSession.update("packageTripSQL.updateReservationNumber",map);
	}
	
	@Override
	public TripDTO getTripInformByCode(String package_code) {
		return sqlSession.selectOne("packageTripSQL.getTripInformByCode", package_code);
	}
	
	
	@Override
	public void reduceReservedMember(Map<String, Integer> map) {
		sqlSession.update("packageTripSQL.reduceReservedMember", map);
		
	}
	@Override
	public int getSon_seq(String package_code) {
		return sqlSession.selectOne("packageTripSQL.getSon_seq",package_code);
	}
}

	


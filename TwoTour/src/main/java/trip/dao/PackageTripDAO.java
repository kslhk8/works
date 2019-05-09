package trip.dao;

import java.util.List;
import java.util.Map;

import trip.bean.PackageTripDTO;
import trip.bean.TripDTO;

public interface PackageTripDAO {

	List<PackageTripDTO> getImage(String arrive_city);

	List<TripDTO> getPackage(Map<String, String> map);
	
	List<TripDTO> getProduct(String arrive_city);

	int getPackageTotalA(Map<String, String> map);

	List<TripDTO> getPackageLow(Map<String, String> map);

	TripDTO getParentPackage(int seq);
	
	public List<TripDTO> getProductList(Map<String, String> map);
	public int getProductTotalA(Map<String, String> map);

	public void insertRecentProductViewed(Map<String, Object> map);
	
	public List<TripDTO> selectRecentProductViewed();

	void updateReservationNumber(int son_seq, int size);
	
	TripDTO getTripInformByCode(String package_code);

	void reduceReservedMember(Map<String, Integer> map);

	int getSon_seq(String package_code);
}

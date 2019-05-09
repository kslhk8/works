package city.dao;

import java.util.List;

import city.bean.CityDTO;

public interface CityDAO {

	public List<CityDTO> overseaPackageArriveCitySearch(String arrive_city);

}

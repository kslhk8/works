package tripPlan.dao;

import tripPlan.bean.TripPlanDTO;

public interface TripPlanDAO {

	TripPlanDTO getTripPlan(String arrive_city);

}

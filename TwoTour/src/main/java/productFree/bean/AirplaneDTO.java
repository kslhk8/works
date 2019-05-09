package productFree.bean;

import lombok.Data;

@Data
public class AirplaneDTO {
	private String airplane_name;
	private String airplane_code;
	private String imagename;
	private String depart_city;
	private String depart_date;
	private String depart_time;
	private String depart_day;
	private String arrive_city;
	private String arrive_date;
	private String arrive_time;
	private String arrive_day;
	private String totalTime;
	private int adult_cost;
	private int child_cost;
	private int baby_cost;
	private int groupnum;
	private int lev;
	private int rt_groupnum;
	private int rt_lev;
	
}

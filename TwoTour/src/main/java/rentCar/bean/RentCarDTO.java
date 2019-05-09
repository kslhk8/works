package rentCar.bean;

import lombok.Data;

@Data
public class RentCarDTO {
	private int seq;
	private String city;
	private String location;
	private String car_name;
	private String car_type;
	private int occupancy;
	private int price;
	private String imageName;
	private String transmission_type;
	private String rented;
}

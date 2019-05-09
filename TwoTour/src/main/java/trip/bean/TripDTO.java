package trip.bean;

import java.text.DecimalFormat;

import org.springframework.stereotype.Component;

import lombok.Data;
@Component
@Data
public class TripDTO {
	DecimalFormat df = new DecimalFormat("#,###");
	int seq;
	String package_code;
	String package_name;
	String grade;
	String day;
	int nights;
	String week; 
	String content;
	String imageName; 
	String imageName1; 
	String imageName2;
	String depart_city;
	String arrive_city;
	String depart_code;
	String arrive_code;
	String depart_date;
	String arrive_date;
	String hotel_name;
	int adult_price;
	int teen_price;
	int baby_price;
	int pseq;
	int total_member;
	int reservation_member;
	String airplane_name;
	String depart_apTime;
	String arrive_apTime;
	int fuel_fee;
	String singleroom_fee;
}

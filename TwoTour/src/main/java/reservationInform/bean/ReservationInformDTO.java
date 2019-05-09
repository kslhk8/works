package reservationInform.bean;

import org.springframework.stereotype.Component;

import lombok.Data;
@Component
@Data
public class ReservationInformDTO {
	
	String reservation_name;
	String reservation_number;
	String reservation_email ;
	String reservation_email1;
	String hotel_name;
	String airplane_name;
	String package_name;
	String location;
	int total_price;
	String arrive_time;
	String depart_time;
	String package_code;
	String airplane_code;
	int total_member;
	String logtime;
	String status;
	String hotel_code;
	String tell;
	String rentcar_code;
	
}

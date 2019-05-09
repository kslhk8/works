package hotel.bean;

import lombok.Data;

@Data
public class HotelDTO {
	String hotel_name;
	String imageName;
	String  city;
	String  call;
	String homepage;
	String location;
	String checkIn;
	String checkOut;
	String content;
	int floor;
	int totalMem;
	String hotel_eng_name;
	String price;
	String rank;
}

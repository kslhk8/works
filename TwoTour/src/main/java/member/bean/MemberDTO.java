package member.bean;

import org.springframework.stereotype.Component;

import lombok.Data;
@Component
@Data
public class MemberDTO {
	String name;
	String id;
	String pwd;
	int gender;
	String foreigner;
	String email;	
	String email1;
	String year;
	String month;
	String day; 
	int reservation_num;
	String point;
}

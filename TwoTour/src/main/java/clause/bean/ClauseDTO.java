package clause.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ClauseDTO {
	private String arrive_city;
	private String passport_visa;
	private String emergency_contact;
	
}

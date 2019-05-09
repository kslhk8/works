package safetyInform.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class SafetyInformDTO {
	private String arrive_city;
	private String embassy_address;
	private String embassy_contact;
	private String embassy_fax;
	private String embassy_email;
	private String embassy_homepage;
	private String embassy_emergency_contact;
	private String embassy_open_hours;
	private String local_contact;
	private String local_contact_hospital;
}

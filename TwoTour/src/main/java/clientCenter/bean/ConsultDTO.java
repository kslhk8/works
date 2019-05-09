package clientCenter.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class ConsultDTO {

	private int seq_consult;
	private String consult_type1;
	private String consult_type2;
	private String consult_type3;
	private String id;
	private String reservation_num;
	private String subject;
	private String content;

	private int pseq;
	private int ref;
	private int lev;
	private int step;
	private int reply;
	private int hit;
	private Date logtime;
}

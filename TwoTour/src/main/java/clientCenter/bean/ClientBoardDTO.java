package clientCenter.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class ClientBoardDTO {

  	private int seq_cb;
	private String clientboard_type1;
	private String clientboard_type2;
	private String clientboard_type3;
	private String id;
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

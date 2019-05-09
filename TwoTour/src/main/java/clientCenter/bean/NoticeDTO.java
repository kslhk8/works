package clientCenter.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeDTO {
	private int seq_notice;
	private String subject;
	private String writer;
	private Date logtime;
	private String content;
	private int hit;
}

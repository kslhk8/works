package clientCenter.bean;

import lombok.Data;

@Data
public class FaqDTO {
	private int seq_faq;
	private String summaryname;
	private String type;
	private String subject;
	private String content;
}

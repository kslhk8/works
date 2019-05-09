package basketInform.bean;

import lombok.Data;

@Data
public class BasketInformDTO {
	String id;
	String product_name;
	String depart_date;
	String adult_price;
	String teen_price;
	String baby_price;
	String search;
	int seq;
}

package recentViewProduct.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class RecentViewProductDTO {
	private int seq;
	private String package_name;
	private String hotel_name;
	private int adult_price;
	private String imageName;
	private Date insertDate;
}

package com.aka.app.payment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	
	private Long payment_num;
	private Long product_num;
	private Long member_id;
	private String order_id;
	private Long amount;
	private String payment_key;
	private String order_name;
	private String requested_at;
	private String approved_at;
}

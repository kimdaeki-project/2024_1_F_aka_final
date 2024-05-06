package com.aka.app.payment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	
	//결제 번호
	private Long payment_num;
	//상품 번호
	private Long product_num;
	//사원 번호
	private Long member_id;
	//주문 번호
	private String order_id;
	//가격
	private Long amount;
	//페이먼트 키
	private String payment_key;
	//주문 이름(상품 이름)
	private String order_name;
	//결제 시작 날짜
	private String requested_at;
	//결제 승인 날짜
	private String approved_at;
	//결제 국가
	private String country;
	//결제 화폐
	private String currency;
	//결제 방식
	private String method;
	//수수료
	private Long vat;
	//구매자 이름
	private String customer_name;
	//구매자 핸드폰 번호
	private String customer_phone;
	//구매자 이메일
	private String customer_email;
}

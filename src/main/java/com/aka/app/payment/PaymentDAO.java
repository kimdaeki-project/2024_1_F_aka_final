package com.aka.app.payment;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentDAO {

	public int createPayment(PaymentVO paymentVO)throws Exception;
}

package com.aka.app.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.util.Pager;

@Mapper
public interface PaymentDAO {

	public List<PaymentVO> getPaymentList(Pager pager)throws Exception;
	
	public int createPayment(PaymentVO paymentVO)throws Exception;
	
	public Long getTotalCount(Pager pager)throws Exception;
}

package com.aka.app.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aka.app.util.Pager;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	//결제 목록
	public List<PaymentVO> getPaymentList(Pager pager) throws Exception{
		pager.makeIndex();
		pager.makeNum(paymentDAO.getTotalCount(pager));
		return paymentDAO.getPaymentList(pager);
	}
	//결제 생성
	public int createPayment (PaymentVO paymentVO) throws Exception {
		return paymentDAO.createPayment(paymentVO);
	}
}

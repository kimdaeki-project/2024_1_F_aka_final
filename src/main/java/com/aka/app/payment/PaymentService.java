package com.aka.app.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	public int createPayment (PaymentVO paymentVO) throws Exception {
		return paymentDAO.createPayment(paymentVO);
	}
}

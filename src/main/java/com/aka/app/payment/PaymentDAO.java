package com.aka.app.payment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.board.BoardVO;
import com.aka.app.util.Pager;

@Mapper
public interface PaymentDAO {
	
	//총 매출
	public List<Map<String,Object>> totalSales()throws Exception;
	//결제 목록
	public List<PaymentVO> getPaymentList(Pager pager)throws Exception;
	//결제 목록 추가
	public int createPayment(PaymentVO paymentVO)throws Exception;
	//결제 목록 페이징 총갯수
	public Long getTotalCount(Pager pager)throws Exception;
	//나의 결제 목록
	public List<PaymentVO> getMyPaymentList(PaymentVO paymentVO)throws Exception;
}

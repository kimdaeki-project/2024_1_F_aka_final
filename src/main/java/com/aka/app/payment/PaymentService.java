package com.aka.app.payment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Service;

import com.aka.app.member.MemberVO;
import com.aka.app.util.Pager;

import jakarta.servlet.http.HttpSession;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	//총 매출
	public List<Map<String,Object>> totalSales() throws Exception {
		return paymentDAO.totalSales();
	}
	
	//나의 결제 목록
	public List<PaymentVO>getMyPaymentList(PaymentVO paymentVO,HttpSession session)throws Exception{
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");  //세션에서 스프링 시큐리티 컨택스트 홀더 꺼내기
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;	   //홀더에서 컨텍스트 꺼내기
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal(); //컨택스트에서 유저 객체 꺼내기
		paymentVO.setMember_id(memberVO.getMember_id());
		return paymentDAO.getMyPaymentList(paymentVO);
	}
	
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

package com.aka.app.equipment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Service;

import com.aka.app.member.MemberVO;
import com.aka.app.util.Pager;

import jakarta.servlet.http.HttpSession;

@Service
public class EquipmentService {
	
	@Autowired
	private EquipmentDAO equipmentDAO;
	
	public int deleteEquipment(EquipmentVO equipmentVO) throws Exception {
		return equipmentDAO.deleteEquipment(equipmentVO);
	}
	
	public int updateEquipment (EquipmentVO equipmentVO) throws Exception {
		return equipmentDAO.updateEquipment(equipmentVO);
	}
	
	public int createEquiment (EquipmentVO equipmentVO,HttpSession session) throws Exception {
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");  //세션에서 스프링 시큐리티 컨택스트 홀더 꺼내기
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;	   //홀더에서 컨텍스트 꺼내기
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal(); //컨택스트에서 유저 객체 꺼내기
		equipmentVO.setMember_id(memberVO.getMember_id());
		return equipmentDAO.createEquiment(equipmentVO);
	}
	
	public EquipmentVO getEquimentDetail (EquipmentVO equipmentVO) throws Exception {
		return equipmentDAO.getEquimentDetail(equipmentVO);
	}
	
	public List<EquipmentVO> getEquimentList (Pager pager) throws Exception {
		pager.makeIndex();
		pager.makeNum(equipmentDAO.getTotalCount(pager));
		return  equipmentDAO.getEquimentList(pager);
	}
}

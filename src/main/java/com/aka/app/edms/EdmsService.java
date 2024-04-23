package com.aka.app.edms;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EdmsService {
	
	
	@Autowired
	private EdmsDAO edmsDAO;
	
	
	public int createEdms(EdmsVO edmsVO, Integer[] appAr) throws Exception {
		
		System.out.println("service 16    "+ appAr.length);
		//매개변수 int 1=저장 2=임시저장
		int result = SaveEDMS(edmsVO, appAr, 1);

		return result;
		
	}
	
	
		
	
	 
	//결재저장

	
	//매개변수 int 1=저장 2=임시저장
	public int SaveEDMS(EdmsVO edmsVO, Integer[] appAr, int c) throws Exception{
				
		
		int result;
		
		//전자문서 저장
		if(c == 1) {			
			result = edmsDAO.createEdms(edmsVO);			
		}
		if(c == 2) {
			
		}
		
		int i = 0;		
		int count = appAr.length-1;
		List<Map<String, Object>> list = new ArrayList<>();
		System.out.println(count);
		//결재선 저장
		while (count>=0) {
			
			System.out.println(appAr[count]);
			Map<String, Object> member = new HashMap<String, Object>();
			member.put("MEMBER_ID", appAr[count]);
			member.put("APPROVAL_RANK", i);
			member.put("EDMS_NO", edmsVO.getEdmsNo());
			count--;
			i++;
			list.add(member);
			System.out.println("service 57" + member);
		}
		
		System.out.println("service 47       "   +list);
		
		if(c==1 ) {
			
			result = edmsDAO.createApproval(list);
			
		}
							
		return 1;
								
	}
	
	
	
	
	//직원목록 불러오기
	public List<Map<String, String>> getMemberList()throws Exception{
		
				
		return edmsDAO.getMemberList(); 
		
	}
	
//	public List<ChartVO> getDeptList() throws Exception{
//		
//		return edmsDAO.getDeptList();
//	}
	
	
	
	// 차트 불러오기
	//부서
	public List<Map<String, Object>> getDeptChart() throws Exception{
		
		return edmsDAO.getDeptChart();
	}
	
	//사원
	public List<Map<String, Object>> getMemberChart() throws Exception{
		
		return edmsDAO.getMemberChart();
	}
}

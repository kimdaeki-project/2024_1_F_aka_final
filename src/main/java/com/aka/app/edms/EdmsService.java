package com.aka.app.edms;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EdmsService {
	
	
	@Autowired
	private EdmsDAO edmsDAO;
	
	
	public int createEdms(EdmsVO edmsVO, Integer[] appAr) throws Exception {
		
		System.out.println("service 16    "+ edmsVO);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		//전자문서 저장
		map.put("edmsVO", edmsVO);
				
		int count = appAr.length-1;
		boolean check = true;
		
		LinkedList<Integer> ar = new LinkedList<Integer>();
		
		//결재선 저장
		while (check) {
			
			System.out.println(appAr[count]);
			
			ar.add(Integer.parseInt(appAr[count].toString()));
			count--;
			
			map.put("MEMBER_ID", ar);
			if(count<0) {
				
				check = false;
				
			}
		}
		
		System.out.println("service 47       "   +map);
				
		
		
		
//		return edmsDAO.createEdms(edmsVO);
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

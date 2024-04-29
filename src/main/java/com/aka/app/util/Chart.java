package com.aka.app.util;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.aka.app.edms.EdmsService;

@Component
public class Chart {
	
	
	@Autowired
	private EdmsService edmsService;
	
	
	
	
	
	
	public List<Map<String, Object>> createChart(int s) throws Exception{		
		
		List<Map<String, Object>> result = new ArrayList<>();
		if(s==0 && s==1) {		
		 
			result =edmsService.getDeptChart();
			for(Map<String, Object> a : result) {			 
			
			 a.replace("parent", "0", "#");
//			 a.put("type", "dept");
			
		 }
		}
		
		if(s==1) {
			
			List<Map<String, Object>>  temp = edmsService.getMemberChart();
			
			
		}
		
		 System.out.println("apichart"+result);
		
		 
		return result;		
		
		
	}
	
	
	public  Map<String, String> titles(String choose){
		
		
		
		Map<String, String> titles = new HashMap<>();
		//결재진행목록
		
		if(choose.equals("pro")) {
			
			titles.put("theme", "결재진행목록");
			titles.put("no1","번호");
			titles.put("no2", "제목");
			titles.put("no3","내용");
			titles.put("no4", "생성일");
			titles.put("no5", "결재상태");			
		}
		if(choose.equals("temp")) {
			
			titles.put("theme", "임시저장목록");
			titles.put("no1","번호");
			titles.put("no2", "제목");
			titles.put("no3","내용");
			titles.put("no4", "생성일");
			titles.put("no5", "결재상태");			
		}		
		if(choose.equals("done")) {
			
			titles.put("theme", "결재완료");
			titles.put("no1","번호");
			titles.put("no2", "제목");
			titles.put("no3","내용");
			titles.put("no4", "결재일");
			titles.put("no5", "결재상태");		
			
		}		
		if(choose.equals("recive")) {
			
			titles.put("theme", "수신 결재");
			titles.put("no1","번호");
			titles.put("no2", "제목");
			titles.put("no3","내용");
			titles.put("no4", "결재일");
			titles.put("no5", "결재상태");		
			
		}		
		if(choose.equals("approved")) {
			
			titles.put("theme", "결재 내역");
			titles.put("no1","번호");
			titles.put("no2", "제목");
			titles.put("no3","내용");
			titles.put("no4", "결재일");
			titles.put("no5", "결재상태");		
			
		}
		
		return titles;				
	}
	
	

}

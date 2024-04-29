package com.aka.app.weather;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import com.aka.app.board.BoardService;
import com.aka.app.member.MemberService;
import com.aka.app.util.Pager;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import reactor.core.publisher.Mono;
@Controller
@RequestMapping("/weather/*")
public class WeatherController {

	
	@Autowired
	private MemberService memberService;
	@Value("${weather.encoding.key}")
	private String servicekey;
	@Autowired
	private BoardService boardService;
	
		//WebClient 사용
		@ResponseBody
		@GetMapping("/wc")
		public Map<String,Object> weatherApiWc(Model model,Pager pager) throws Exception {
			//현재 시간 구하기 
			Date today = new Date();
			SimpleDateFormat dataformat = new SimpleDateFormat("yyyyMMdd-HH,mm");
			String date = dataformat.format(today);
			String [] ar = date.split("-");
			String baseDate = ar[0];
			String baseTime = ar[1];
			String[] br = baseTime.split(",");
			String baseTimes;
			int num = Integer.parseInt(br[0]);  //시간
			int sum = Integer.parseInt(br[1]);	//분
			if(sum<46)num--;					//api 45분부터 응답제공 45분 미만일시 이전 시간 데이터 받아오기
			if(num<10)baseTimes = "0"+num+"00";		// 1000 이전 9시일시 0900 0붙여주기	
			else baseTimes = ""+num+"00";	
			//공공데이터포털에서 제공해주는 api 에서는 service key 가 다른 인코딩으로인해 값이 달라짐 DefaultUriBuilderFactory 이용해서 
			//인코딩 모드 EncodingMode.VALUES_ONLY 로변경 
			DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst");
			factory.setEncodingMode(EncodingMode.VALUES_ONLY);
			WebClient webClient =  WebClient.builder()  //기본 설정
					.uriBuilderFactory(factory)
					.baseUrl("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst")
					.build();
			Mono<String> response  = webClient.get()
					.uri(UriBuilder ->UriBuilder
					.queryParam("serviceKey",servicekey)//파라미터 설정
					.queryParam("numOfRows", 10)
					.queryParam("pageNo", "1")
					.queryParam("dataType", "JSON")
					.queryParam("base_date", baseDate)
					.queryParam("base_time", baseTimes)   
					.queryParam("nx", "58")
					.queryParam("ny", "125")
					.build())
					.retrieve()
					.bodyToMono(String.class);			//리턴 타입
			String result = response.block();
			String status ="";
			String temp ="" ;
			 	ObjectMapper objectMapper = new ObjectMapper();
			 	Map<String,Object>map = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {});
			 	Map<String,Object>map2 ;
			 					  map = (Map<String, Object>) ((Map<String, Object>) ((Map<String, Object>) map.get("response")).get("body")).get("items");
			 	List<Object> list = (List<Object>) map.get("item");
			 					  for(Object a:list) {
			 						  if(a.toString().contains("T1H")) {			//온도 구하기
			 							  map = (Map<String, Object>) a;
			 							 temp  = map.get("obsrValue").toString();		 							  
			 						  }else if(a.toString().contains("PTY")) {		//날씨상태 구하기
			 							  map2 = (Map<String, Object>) a;
			 							 status = map2.get("obsrValue").toString();
			 						  }	  
			 					  }
		        String region = "현재 날씨  /  금천구";
		        Map<String,Object> resultMap = new HashMap<>();
		        resultMap.put("region",region);
		        resultMap.put("status",status);
		        resultMap.put("temp",temp+"°");
		        return resultMap;							//비동기 제이슨리턴
		}
		
}


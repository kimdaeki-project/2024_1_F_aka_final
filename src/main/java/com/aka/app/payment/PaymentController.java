package com.aka.app.payment;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aka.app.member.MemberVO;
import com.aka.app.product.ProductDAO;
import com.aka.app.product.ProductService;
import com.aka.app.product.ProductVO;
import com.aka.app.util.Pager;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	@Value("${payments.secret.key}")
	private String secretkey;
	@Value("${payments.client.key}")
	private String clientkey;
	@Autowired
	private ProductService productService;
	@Autowired
	private PaymentService paymentService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    
    //총 매출
    @ResponseBody
    @GetMapping("total")
    public List<Map<String,Object>> totalSales(Model model) throws Exception {
    	List<Map<String,Object>> total = paymentService.totalSales();
    	return total;
    }
    
    //나의 결제 목록
    @GetMapping("mylist")
    public String getMyPaymentList(PaymentVO paymentVO,HttpSession session,Model model)throws Exception {
    	List<PaymentVO>list = paymentService.getMyPaymentList(paymentVO, session);
    	model.addAttribute("list",list);
    	return "payment/mylist";
    }
    
    //목록 페이지
    @GetMapping("list") 
    public void getPaymentList(Model model,Pager pager) throws Exception {
    	List<PaymentVO> list = paymentService.getPaymentList(pager);
    	model.addAttribute("list",list);
    	model.addAttribute("pager",pager);
    }
    
    //결제 컨펌
    @PostMapping("confirm")
    public ResponseEntity<JSONObject> confirmPayment(@RequestBody String jsonBody,HttpSession session) throws Exception {
        JSONParser parser = new JSONParser();
        String orderId;
        String amount;
        String paymentKey ;
        String product_num;
        try {
            // 클라이언트에서 받은 JSON 요청 바디.
            JSONObject requestData = (JSONObject) parser.parse(jsonBody);
            paymentKey = (String) requestData.get("paymentKey"); //페이먼트 키
            orderId = (String) requestData.get("orderId");     //주문번호
            amount = (String) requestData.get("amount");  	   //금액
            product_num = (String) requestData.get("product_num");  //상품번호
        } catch (ParseException e) {
            throw new RuntimeException(e);
        };
        JSONObject obj = new JSONObject();
        obj.put("orderId", orderId);
        obj.put("amount", amount);
        obj.put("paymentKey", paymentKey);
        String widgetSecretKey = secretkey;
        Base64.Encoder encoder = Base64.getEncoder();
        byte[] encodedBytes = encoder.encode((widgetSecretKey + ":").getBytes(StandardCharsets.UTF_8));
        String authorizations = "Basic " + new String(encodedBytes);
        URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Authorization", authorizations);
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);        
        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(obj.toString().getBytes("UTF-8"));
        int code = connection.getResponseCode();
        boolean isSuccess = code == 200;    //200 성공 
        InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();
        Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8); 	
        JSONObject	jsonObject = (JSONObject) parser.parse(reader);
       
        Object sessionObj = session.getAttribute("SPRING_SECURITY_CONTEXT");  //세션에서 스프링 시큐리티 컨택스트 홀더 꺼내기
		SecurityContextImpl contextImpl = (SecurityContextImpl)sessionObj;	   //홀더에서 컨텍스트 꺼내기
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		PaymentVO paymentVO = new PaymentVO();
		paymentVO.setProduct_num((Long.parseLong(product_num)));				//상품번호
		paymentVO.setMember_id(memberVO.getMember_id());						//사원번호
		paymentVO.setOrder_id((String)jsonObject.get("orderId"));				//주문번호
		paymentVO.setAmount((Long)jsonObject.get("totalAmount"));				//총결제 금액
		paymentVO.setPayment_key((String)jsonObject.get("paymentKey"));			//페이먼트키
		paymentVO.setOrder_name((String)jsonObject.get("orderName"));			//주문 이름
		paymentVO.setRequested_at((String)jsonObject.get("requestedAt"));		//결제 시작 날짜:시간
		paymentVO.setApproved_at((String)jsonObject.get("approvedAt"));			//결제 승인 날짜시간
		paymentVO.setCountry((String)jsonObject.get("country"));				//결제한 국가 ISO-3166의 두 자리 국가 토드 형식
		paymentVO.setCurrency((String)jsonObject.get("currency"));				//결제시 사용된 화폐
		paymentVO.setMethod((String)jsonObject.get("method"));					//결제수단 예시=카드,가상계좌,간편결제,휴대폰,계좌이체,문화상품권,도서상품권,게임문화상품권
		paymentVO.setVat((Long)jsonObject.get("vat"));							//부가세
		paymentVO.setCustomer_name(memberVO.getUsername());
		paymentVO.setCustomer_phone(memberVO.getPhone());
		paymentVO.setCustomer_email(memberVO.getEmail());
		paymentService.createPayment(paymentVO);
		
        responseStream.close();
        return ResponseEntity.status(code).body(jsonObject);
    }
    //사용자 결제 완료 후 이동 페이지
    @GetMapping("success")
    public String paymentRequest(HttpServletRequest request, Model model,ProductVO productVO) throws Exception {
    	model.addAttribute("memberid",productVO.getMember_id());
    	model.addAttribute("productnum",productVO.getProduct_num());
        return "payment/success";
    }

    //결제 페이지
    @GetMapping("checkout")
    public String index(HttpServletRequest request, Model model,ProductVO productVO,HttpSession session) throws Exception {	
    	productVO  =  productService.getProductDetail(productVO);
    	Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");  //세션에서 스프링 시큐리티 컨택스트 홀더 꺼내기
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;	   //홀더에서 컨텍스트 꺼내기
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal(); //컨택스트에서 유저 객체 꺼내기
		productVO.setMember_id(memberVO.getMember_id());
    	model.addAttribute("amount",productVO.getProduct_price()); 
    	model.addAttribute("odrdeid","TEST_order1234abc-"+System.currentTimeMillis());
    	model.addAttribute("orderName",productVO.getProduct_name());
    	model.addAttribute("customerkey",memberVO.getCustomer_key());
    	model.addAttribute("clientkey",clientkey);
    	model.addAttribute("customerEmail",memberVO.getEmail());
    	model.addAttribute("customerName",memberVO.getName());
    	model.addAttribute("customerMobilePhone",memberVO.getPhone());
    	model.addAttribute("memberid",memberVO.getMember_id());
    	model.addAttribute("productnum",productVO.getProduct_num());
        return "payment/checkout";
    }

    //에러 페이지
    @GetMapping("fail")
    public String failPayment(HttpServletRequest request, Model model) throws Exception {
        String failCode = request.getParameter("code");
        String failMessage = request.getParameter("message");
        return "payment/fail";
    }
}
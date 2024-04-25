package com.aka.app.product;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aka.app.member.MemberVO;
import com.aka.app.util.FileManager;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private FileManager fileManager;
	@Value("${app.upload.product}")
	private String uploadPath;
	
	
	public int deleteProduct(ProductVO productVO) throws Exception {
		return productDAO.deleteProduct(productVO);
	}
	
	public int updateProduct(ProductVO productVO,MultipartFile attach) throws Exception {
		if(!attach.isEmpty()) {
			String fileName = fileManager.fileSave(uploadPath, attach);
			productVO.setProduct_photos(fileName);
		}
		int result = productDAO.updateProduct(productVO);
		return result;
	}
	
	public ProductVO getProductDetail (ProductVO productVO) throws Exception {
		return productDAO.getProductDetail(productVO);
	}
	
	public int createProduct (ProductVO productVO,MultipartFile attach,HttpSession session) throws Exception {
		if(attach.isEmpty()) {
			Random random = new Random();
				productVO.setProduct_photos("/assets/img/elements/"+random.nextInt(7)+".jpg");
		}else {
			String fileName = fileManager.fileSave(uploadPath, attach);
			productVO.setProduct_photos(fileName);
		}	
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");  //세션에서 스프링 시큐리티 컨택스트 홀더 꺼내기
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;	   //홀더에서 컨텍스트 꺼내기
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal(); //컨택스트에서 유저 객체 꺼내기
		productVO.setMember_id(memberVO.getMember_id());
		return productDAO.createProduct(productVO);
	}
	
	public List<ProductVO> getProductList (ProductVO productVO) throws Exception {
		return  productDAO.getProductList(productVO);
	}
	
	public Long getProductCount() throws Exception {
		return productDAO.getProductCount();
	}
}

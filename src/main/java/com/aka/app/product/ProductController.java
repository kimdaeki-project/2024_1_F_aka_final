package com.aka.app.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aka.app.util.FileManager;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;;
	
	//상품 삭제
	@PostMapping("delete")
	public String deleteProduct (ProductVO productVO,Model model) throws Exception {
		int result;
		String msg = "상품 삭제 실패";
		if(productVO != null) {
			productService.deleteProduct(productVO);
			msg = "상품 삭제 성공";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("path","/product/list");
		return "commons/result";
	}
	
	//상품 수정 페이지
	@GetMapping("update")
	public ModelAndView updateProduct (ProductVO productVO,ModelAndView mv) throws Exception {
		productVO = productService.getProductDetail(productVO);
		mv.addObject("vo",productVO);
		mv.setViewName("product/update");
		return mv;
	}
	
	//상품 수정
	@PostMapping("update")
	public String updateProduct (ProductVO productVO,Model model,MultipartFile attach) throws Exception {
		int result;
		String msg = "상품 수정 실패";
		result = productService.updateProduct(productVO,attach);
		if(result==1) {
			msg = "상품 수정 성공";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("path","/product/list");
		return "commons/result";
	}
	
	//상품 상세 페이지
	@GetMapping("detail")
	public void getProductDetail(ProductVO productVO,Model model) throws Exception {
		productVO = productService.getProductDetail(productVO);
		model.addAttribute("vo",productVO);
	}
	
	//상품 생성 페이지
	@GetMapping("create")
	public void createProduct (@ModelAttribute ProductVO productVO) throws Exception {
	}
	
	//상품 생성
	@PostMapping("create")
	public String createProduct (@Valid ProductVO productVO,BindingResult bindingResult,Model model,HttpSession session,MultipartFile[] attach) throws Exception {
		int result=0;
		String msg = "상품 추가 실패";
		if(bindingResult.hasErrors()) {  //폼 검증 실패시
			return "product/create"; 
		}
		result = productService.createProduct(productVO,productVO.getFiles(),session);
		if(result==1) msg="상품 추가 성공";
		model.addAttribute("msg",msg);
		model.addAttribute("path","/product/list");
		return "commons/result";
	}
	
	//결제 목록
	@GetMapping("list")
	public void getProductList (ProductVO productVO,Model model) throws Exception {
		List<ProductVO> list = productService.getProductList(productVO);
		model.addAttribute("list",list);	
	}
	
	
}

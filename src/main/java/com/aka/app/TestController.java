package com.aka.app;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.aka.app.board.BoardService;
import com.aka.app.board.BoardVO;
import com.aka.app.member.MemberVO;
import com.aka.app.product.ProductService;
import com.aka.app.product.ProductVO;
import com.aka.app.util.Pager;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private ProductService productService;
	
	@GetMapping("/")
	public String test(Pager pager,ProductVO productVO,Model model, HttpSession session) throws Exception {
		List<BoardVO>listt = boardService.getBoardList(pager);
		List<ProductVO> list = productService.getProductList(productVO);
		Long pCount = productService.getProductCount();
		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl securityContextImpl = (SecurityContextImpl)obj;
		session.setAttribute("sessionMember", securityContextImpl.getAuthentication().getPrincipal());
		
		model.addAttribute("list",listt);
		model.addAttribute("plist",list);
		model.addAttribute("pCount",pCount);
		return "temp/sample";
	}

}

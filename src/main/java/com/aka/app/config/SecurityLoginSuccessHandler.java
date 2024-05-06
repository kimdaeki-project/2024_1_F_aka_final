package com.aka.app.config;

import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.aka.app.member.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SecurityLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("로그인 성공");
		MemberVO memberVO = (MemberVO)authentication.getPrincipal();		// MemberVO
		log.info("authentication : {}",authentication.getPrincipal());
		// 로그인 성공 후 이동할 경로 설정
		
		//수강생이면 상품리스트로 이동
		if(memberVO.getDepartment_id()==5L) {
			response.sendRedirect("/product/list"); 
			return;
		}		 	
		//수강생이 아니면 메인으로 이동
		response.sendRedirect("/");
	}
}
package com.aka.app.config;

import java.io.IOException;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
public class CustomAccessDeniedHandler implements AccessDeniedHandler{

	
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        String requestUri = request.getRequestURI();
		
		  if (requestUri.contains("/canlendar**")){ 
			  request.setAttribute("msg","권한이 없는 사용자입니다."); 
			  request.setAttribute("nextPage", "/");
			  request.getRequestDispatcher("/error").forward(request, response); 
		  } 
		  else {
			  response.sendError(HttpServletResponse.SC_UNAUTHORIZED); 
		  }
		 
    }
    
}

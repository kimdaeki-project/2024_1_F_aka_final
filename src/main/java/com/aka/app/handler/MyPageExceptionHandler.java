package com.aka.app.handler;

import java.sql.SQLException;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;


@ControllerAdvice
public class MyPageExceptionHandler {

		
		@ExceptionHandler(Exception.class)
		public ModelAndView getException() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("errors/error");
			return mv;
		}
		
		@ExceptionHandler(SQLException.class)
		public ModelAndView getSQLException() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("errors/error");
			return mv;
		}
		
		@ExceptionHandler(NullPointerException.class)
		public ModelAndView getNullPointerException() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("errors/error");
			return mv;
		}
		
		@ExceptionHandler(NoHandlerFoundException.class)
		public String frontException(){
			return "errors/error";
		}
		
		@ExceptionHandler(RuntimeException.class)
		public String frontError()throws Exception{
			return "errors/error";
		}
	 
}

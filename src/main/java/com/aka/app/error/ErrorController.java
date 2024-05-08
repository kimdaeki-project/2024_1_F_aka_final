package com.aka.app.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
	
	@GetMapping("/error/redirect")
	public String error() {
		return "commons/result";
	}
}

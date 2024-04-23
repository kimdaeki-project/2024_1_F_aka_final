package com.aka.app.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileMapping implements WebMvcConfigurer {
	
	@Value("${app.url.path}")  // 외부 요청 경로
	private String urlPath;
	@Value("${app.upload.base}") 
	private String filePath;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler(urlPath)
				.addResourceLocations(filePath);
	}

	
	
}

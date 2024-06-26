package com.aka.app.config;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.aka.app.member.MemberService;

import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableWebSecurity
@Slf4j
public class SecurityConfig {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SecurityLoginSuccessHandler loginSuccessHandler;
	
	@Autowired
	private SecurityLoginFailureHandler loginFailureHandler;

//	@Autowired
//	private CustomAccessDeniedHandler accessDeniedHandler;
	
	
	@Bean
	WebSecurityCustomizer webSecurityCustomizer() throws Exception{
		return web -> web
						.ignoring()
						.requestMatchers("/asserts/**")
						.requestMatchers("/fonts/**")
						.requestMatchers("/js/**")
						.requestMatchers("/libs/**")
						.requestMatchers("/scss/**")
						.requestMatchers("/tasks/**")
						.requestMatchers("/error");
		
	}
	
	@Bean
	SecurityFilterChain filterChain (HttpSecurity security) throws Exception {
		
		log.info("security config");
		security
				//CSRF 추가
				.csrf(
						(csrf) -> 
							csrf.disable()
				)
				.authorizeHttpRequests(
						(authorizeRequests)->
											authorizeRequests
											.requestMatchers("/", "/member/mypage","/board/**","/product/**","/payment/checkout","/payment/success","/payment/fail").authenticated()
											.requestMatchers("/calendar/**", "/edms/**").hasAnyRole("CEO","HR","EMPLOYEE")
											.requestMatchers("/department/**","/student/**","/equipment/**","/payment/list").hasAnyRole("HR")
											.anyRequest().permitAll()
											)
	
				.exceptionHandling((exceptionConfig)->
					exceptionConfig.accessDeniedHandler(accessDeniedHandler())
				)
				.formLogin(
						(login)->
								login	
								.loginPage("/member/login")
								.successHandler(loginSuccessHandler)
								.usernameParameter("user_id")
//								.defaultSuccessUrl("/")			
								.failureHandler(loginFailureHandler)
								
								.permitAll()

						)// 로그인 끝부분
						.logout(
							(logout)->
									logout
										.logoutRequestMatcher(new AntPathRequestMatcher("/member/logout"))
										.logoutSuccessUrl("/member/login")
										.invalidateHttpSession(true) // 로그아웃 성공시 session만료
										.deleteCookies("JSESSIONID", "remember-me")
										.permitAll()
						)// 로그아웃 끝 부분
						.rememberMe(
								(rememberMe ->
									rememberMe
										//.rememberMeCookieName("user_id")
										.rememberMeParameter("remember-me")
										.key("rememberKey")
										.userDetailsService(memberService)										
										.authenticationSuccessHandler(loginSuccessHandler)
										.tokenValiditySeconds(600)					// 초단위
								)		
						)// rememberMe 끝부분
						.sessionManagement(
							(sessionManagement)->
								sessionManagement								
									.maximumSessions(1)
									.maxSessionsPreventsLogin(true)		// true 이면 같은아이디로 로그인되어있으면 로그인을 거부/ false 로그인된 사용자 세션 만료
									.expiredUrl("/expired")
						)//sessionManagement 끝
						.oauth2Login(
								(oauth2Login) -> 
								oauth2Login.userInfoEndpoint(
										(ue) -> ue.userService(memberService)
							)
						);//oauth2Login 끝
				
						
						
		return security.build();
	}

	@Bean
	public AccessDeniedHandler accessDeniedHandler() {
		log.info("accessDeniedHandler");
		return (request, response, e) -> {
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
			request.setAttribute("msg","권한이 없는 사용자입니다."); 
			request.setAttribute("path", "/");
			request.getRequestDispatcher("/error/redirect").forward(request, response);
		};
	}

}
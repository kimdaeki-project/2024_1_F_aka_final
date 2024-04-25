package com.aka.app.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import com.aka.app.schedule.ScheduleVO;

import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
//@Transactional(rollbackFor = Exception.class)
public class MemberService extends DefaultOAuth2UserService implements UserDetailsService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	// mypage수정
	public int updateMyinfo(MemberVO memberVO) throws Exception{
		// 변경할 password 암호화
		/* memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword())); */
		int result = memberDAO.updateMyinfo(memberVO);
		log.info("3 : {} , 4 : {}, {}",memberVO.getEmail(), memberVO.getPhone(),result);
		
		return result;
	}
	
	public int createCheck(ScheduleVO scheduleVO) throws Exception{
		memberDAO.createCheck(scheduleVO);
		return 1;
	}
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		log.info("userRequest === {}",userRequest);
		ClientRegistration c = userRequest.getClientRegistration();
		
		log.info("ClientRegistration === {}", c);
		
		OAuth2User user = super.loadUser(userRequest);
		log.info("user === {}",user);
		log.info("===> {}", user.getAttributes());
		log.info("===> {}", user.getAuthorities());
		log.info("===> {}", user.getAttribute("properties").toString());
		
		if(c.getClientName().equals("Kakao")) {
			user = this.kakao(user);
		}
		
		return super.loadUser(userRequest);
	}
	
	private OAuth2User kakao(OAuth2User oAuth2User) {
		Map<String, Object> map = oAuth2User.getAttribute("properties");
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(oAuth2User.getName());
		log.info("oAuth2User == {} == ",oAuth2User.toString());
		log.info("oAuth2User, Map == {} == ",map.toString());
		RoleVO roleVO = new RoleVO();
		roleVO.setName("NORMAL");
		
		memberVO.setRole_id(1L);
		return memberVO;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUser_id(username);
		
		log.info("로그인~ : {}",username);
		
		try {
			memberVO = memberDAO.getDetail(memberVO);
			log.info("=={}==",memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberVO;
	}
	
	public int add(MemberVO memberVO)throws Exception{
		log.info("회원가입~");
		// pw -> 암호화
		log.info(memberVO.getPassword());
		
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		memberVO.setCustomer_key("TEST_customer1234abc-"+System.currentTimeMillis());
		int result = memberDAO.add(memberVO);
		
		// 회원 권한 정보
		//role 
		return result; 
	}
	
	// 비번일치/ id중복여부
	public boolean checkMember(MemberVO memberVO, BindingResult bindingResult) throws Exception{
		boolean check = false;
		
		// check가 true 면 error
		// check가 false 면 error  x
		
		check = bindingResult.hasErrors();
		log.info("회원가입 검증");
		log.info("==={}",memberVO.getPassword());
		log.info("{}===",memberVO.getPasswordCheck());
		// 비번검증
		if(!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			check = true;
			// message 등록
			bindingResult.rejectValue("passwordCheck", "memberVO.password.equals");
		}
		
		//id 중복
		MemberVO result = memberDAO.getDetail(memberVO);
		if(result != null) {
			check = true;
			// message 등록
			bindingResult.rejectValue("username", "memberVO.username.equals");
		}
		//
		return check;
	}
	
	// 임시 비밀번호 생성 메서드
	public String createPassword() throws Exception{
		String temporaryPw = (int)(Math.random()*1000000)+"";
		log.info("======================random num : "+temporaryPw);
		return temporaryPw;
	}
	
	// 비밀번호 UPDATE 및 전송 메서드 실행
	public int updateMail(MemberVO memberVO) throws Exception{
//		memberVO.getEmail(), 바꿔줄 비밀번호
		
		log.info("update member ====== {}",memberVO.toString());
		int result = 0;
		if(memberDAO.getFindUser(memberVO) > 0) {
			String pw = createPassword();
			memberVO.setPassword(passwordEncoder.encode(pw));
			result = memberDAO.updatePw(memberVO);			
			sendMail(memberVO.getEmail(), pw);
		}		
		return result;
	}
	
	// mail을 보내줄 메서드 (메일 수신자, 변경한 비밀번호)
	private void sendMail(String to, String password) {
		MimeMessage mime = javaMailSender.createMimeMessage();
		try {
			MimeMessageHelper mimeHelper = new MimeMessageHelper(mime, true, "UTF-8");
			// 메일받는사람
			mimeHelper.setTo(to);
			// 메일제목
			mimeHelper.setSubject("A.K.A 임시비밀번호");
			
			// 메일본문
			mimeHelper.setText(
					"<hr>"
					+"<h3>비밀번호 : "+password+"</h3>"
					+"<p>로그인 후 비밀번호를 변경해주세요</p>"
					+"<hr>"
					,true);
			javaMailSender.send(mime);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("실패");
		}
	}
}





















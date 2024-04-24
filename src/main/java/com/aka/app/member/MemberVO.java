package com.aka.app.member;

import java.sql.Date;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class MemberVO implements UserDetails, OAuth2User{
	
	private Long member_id;
	private Long department_id;
	private String email;
	private Date hire_date;
	private Date retire_date;
	private String phone;
	private String address;
	@NotEmpty(message = "이름을 입력해 주세요")
	private String user_id;
	@NotNull(message = "비밀번호를 입력해 주세요")
	private String password;
	private String passwordCheck;
	@NotBlank(message = "아이디를 입력해 주세요")
	private String username;
	private Long role_id;
	private String customer_key;
	private String profil;
	private String profil_ori;
	private Long position_id;
	
	// security
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public Map<String, Object> getAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}


}



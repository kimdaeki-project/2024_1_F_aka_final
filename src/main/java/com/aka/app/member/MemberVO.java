package com.aka.app.member;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.aka.app.calendar.CalendarVO;
import com.aka.app.department.DepartmentVO;
import com.aka.app.member.groups.MemberUpdateGroup;

import jakarta.validation.constraints.Email;
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
	@Email(groups= {MemberUpdateGroup.class})
	private String email;
	private Date hire_date;
	private Date retire_date;
	@NotNull(groups= {MemberUpdateGroup.class})
	private String phone;
	private String address;
	private String detail_address;
	private String postCode;
	@NotNull(groups= {MemberUpdateGroup.class}, message="아이디는 6자이상 12자이하입니다.")
	private String user_id;
	@NotNull(groups= {MemberUpdateGroup.class}, message="비밀번호는 8자 이상 12자 이하이며, 영문, 숫자, 특수문자를 포함해야 합니다.")
	private String password;
	private String passwordCheck;
	@NotNull
	private String username;
	private Long role_id;
	private String customer_key;
	private String profil;
	private String profil_ori;
	private Long position_id;
	
	private RoleVO roleVO;
	private DepartmentVO departmentVO;
	
	private List<CalendarVO> calendarVOs;
	
	// security
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		
		  GrantedAuthority g = new SimpleGrantedAuthority(roleVO.getName());
		  authorities.add(g);
		 
				
		return authorities;
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



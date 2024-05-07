package com.aka.app.calendar;

import java.sql.Date;
import java.time.LocalDateTime;

import com.aka.app.department.DepartmentVO;
import com.aka.app.member.MemberVO;
import com.aka.app.member.RoleVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CalendarVO {
	
	private Long calendar_id;
	private LocalDateTime start_date;
	private LocalDateTime end_date;
	private String title;
	private String content;
	private Date update_date;
	private int target_object;
	private Long member_id;

}

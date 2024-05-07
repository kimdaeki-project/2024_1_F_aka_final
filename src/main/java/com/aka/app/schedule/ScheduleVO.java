package com.aka.app.schedule;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleVO {
	
	private Long schedule_id;
	private Long member_id;
	private LocalDateTime start_date;
	private LocalDateTime end_date;
	private Date date;
	
}

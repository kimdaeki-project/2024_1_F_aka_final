package com.aka.app.schedule;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleVO {
	
	private Long schedule_id;
	private Long member_id;
	private Date start_date;
	private Date end_date;
	private Date date;
	
}

package com.aka.app.calendar;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CalendarVO {
	
	private Long calendar_id;
	private Date start_date;
	private Date end_date;
	private String title;
	private String content;
	private Date update_date;
	private String target_object;
	private Long member_id;
	
}

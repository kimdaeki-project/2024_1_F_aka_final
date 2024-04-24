package com.aka.app.department;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class DepartmentVO {

	private Long department_id; 
	private Long department_super_id;
	private String department_name;
	private Long sortorder;
	
}

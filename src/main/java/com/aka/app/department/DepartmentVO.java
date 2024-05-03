package com.aka.app.department;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DepartmentVO {
	
	//부서 아이디
	private Long department_id; 
	//상위 부서 아이디
	private Long department_super_id;
	//부서 이름
	private String department_name;
	//부서 정렬 번호
	private Long sortorder;
}

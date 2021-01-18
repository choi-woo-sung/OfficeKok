package kr.or.ddit.vo;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class EmpWrapper extends User {
	private EmpVO emp;
	
	public EmpWrapper(EmpVO emp) {
		super(emp.getEmpmail(), emp.getEmppw(), Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER")));
		this.emp = emp;
	}
	
	public EmpVO getEmp() {
		return emp;
	}
}
package kr.or.ddit.commons.service;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.manager.emp.dao.IEmpDAO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.EmpWrapper;

@Service
public class AuthenticateServiceImpl implements UserDetailsService {

	@Inject
	private IEmpDAO dao;
	
//	@Override
//	public Object authenticate(EmpVO emp) {
//		EmpVO savedEmp = dao.selectLoginEmp(emp.getEmpmail());
//		
//		Object result = null;
//		if(savedEmp == null || "Y".equals(savedEmp.getEmpdel())) {
//			result = ServiceResult.NOTEXIST;
//		}else {
//			String inputPass = SecurityUtils.encryptSha512(emp.getEmppw());
//			String savedPass = savedEmp.getEmppw();
//			
//			System.out.println(inputPass);
//			System.out.println(savedPass);
//			
//			if(savedPass.equals(inputPass)) {
//				result = savedEmp;
//			}else {
//				result = ServiceResult.INVALIDPASSWORD;
//			}
//		}
//		System.out.println(result);
//		return result;
//	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmpVO savedEmp = dao.selectLoginEmp(username);
		EmpWrapper empWrapper = new EmpWrapper(savedEmp);
		return empWrapper;
	}
}
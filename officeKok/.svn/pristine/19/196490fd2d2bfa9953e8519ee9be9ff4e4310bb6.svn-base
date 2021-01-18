package kr.or.ddit.commons.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.service.IAuthenticateService;

/**
 * @author 안승원
 * @since 2020. 10. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 22.      안승원       최초작성
 * 2020. 11. 03.      정재은       내용수정
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
//@Controller
//@RequestMapping("/login")
public class LoginController {
	
//	@Inject
	private IAuthenticateService service;
	
//	@PostMapping
	public String postLogin(
			@RequestParam(required=true) String empno, 
			@RequestParam(required=true) String emppw, 
			@RequestParam(required=false) String saveId, 
			HttpServletRequest req, 
			HttpServletResponse resp, 
			HttpSession session) throws IOException {
		
		String goPage = null;
//		String message = null;
//		
//		if(session == null || session.isNew()) {
//			resp.sendError(400, "현재 요청이 최초 요청일 수 없습니다.");
//			return null;
//		}
//		
//		Object result = service.authenticate(EmpVO.builder().empmail(empmail).emppw(emppw).build());
//		System.out.println(result);
//		
//		if(result instanceof EmpVO) {
//			goPage = "main/main";
//			session.setAttribute("emp", result);
//			
//			// 아이디 저장
//			int maxAge = 0;
//			if("save".equals(saveId)) {
//				maxAge = 60 * 60 * 24 * 7; // 7일
//			}
//			
//			Cookie idCookie = 
//					CookieUtils.createCookie("idCookie", empmail, TextType.PATH, req.getContextPath(), maxAge);
//			resp.addCookie(idCookie);
//			
//		}else {
//			goPage = "index";
//			
//			if(ServiceResult.NOTEXIST == result) {
//				message = empmail + "에 해당하는 구성원이 없습니다.";
//			}else if(ServiceResult.INVALIDPASSWORD == result) {
//				message = "비밀번호가 틀렸습니다. 다시 입력해주세요.";
//			}
//			session.setAttribute("message", message);
//		}
		return goPage;
	}
}

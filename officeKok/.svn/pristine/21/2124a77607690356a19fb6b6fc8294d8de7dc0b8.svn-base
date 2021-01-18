package kr.or.ddit.commons.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 정재은
 * @since 2020. 11. 03.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 03.      정재은       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/logout")
public class LogoutController {
	
	@PostMapping
	public String logout(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {
		
		session = req.getSession(false);
		if(session == null || session.isNew()) {
			resp.sendError(400);
			return null;
		}else {
			session.invalidate();
			return "index";
		}
		
	}
}

package kr.or.ddit.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 안승원
 * @since 2020. 10. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 27.      안승원       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/mgr")
public class MailMgrController {

	@GetMapping
	public String get() {
		return "mgr/mailAccountMgr";
	}
}

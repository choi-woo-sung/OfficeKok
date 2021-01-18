package kr.or.ddit.commons.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.vo.EmpWrapper;

@Controller
public class IndexController {

	@GetMapping("/index.do")
	public String view() {
		String goPage = "index";
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof EmpWrapper) {
			goPage = "redirect:/main";
		}
		return goPage;
	}
}

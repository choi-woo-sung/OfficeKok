package kr.or.ddit.chat.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.EmpWrapper;

@Controller
@RequestMapping(value = "/chat/chatview")
public class ChatViewController {
	
//	@GetMapping
//	@PreAuthorize("isAuthenticated()")
//	public ModelAndView chat(ModelAndView mv) {
//		mv.setViewName("chat/webSocketClient");
//
//		// 사용자 정보 출력 (세션) //
//
//	EmpVO empvo = ((EmpWrapper) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getEmp();
//
//		System.out.println("사용자 이름 : " + empvo.getEmpnm());
//
//		System.out.println("일반적인 채팅");
//
//		mv.addObject("empnm", empvo.getEmpnm());
//		return mv;
//
//	}
	
	
	@GetMapping("{what}")
	@PreAuthorize("isAuthenticated()")
	public String view(
			@PathVariable(name = "what", required = true) int chatno, Model model) {
		
		EmpVO empvo = ((EmpWrapper) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getEmp();

		System.out.println("사용자 이름 : " + empvo.getEmpnm());

		System.out.println("일반적인 채팅");

		model.addAttribute("emp", empvo);
		model.addAttribute("chatno", chatno);
		model.addAttribute("chatno", chatno);
		
		return "nonetiles/webSocketClient";
	}
	
	
	
	
	
}

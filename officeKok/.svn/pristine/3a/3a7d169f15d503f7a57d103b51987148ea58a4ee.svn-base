package kr.or.ddit.calendar.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.calendar.service.ICalendarService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CalendarDetailVO;
import kr.or.ddit.vo.CalendarVO;

/**
 * @author 정재은
 * @since 2020. 11 12.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 12.      정재은       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/cal/calUpdate")
public class CalUpdateController {

	@Inject
	ICalendarService service;
	
//	@ModelAttribute
//	public String currentAction() {
//		return "/cal/calRegistForm";
//	}
	
	@GetMapping
	public String updateForm(/*@ModelAttribute("calDetail") CalendarDetailVO calendarDetailVO,*/ 
			@RequestParam(name="what", required=true) int schedetailno, Model model) {
		
		CalendarDetailVO calDetail = service.retrieveCal(schedetailno);
		model.addAttribute("calDetail", calDetail);
		System.out.println("calDetail : " + calDetail);
		
		return "cal/calRegistForm";
	}
	
	@PostMapping
	public String update(
			@Validated(UpdateGroup.class) @ModelAttribute("cal") CalendarVO calendarVO, 
			@Validated(UpdateGroup.class) @ModelAttribute("calDetail") CalendarDetailVO calendarDetailVO,
			Errors errors, Model model) {
		
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		
		if(valid) {
			ServiceResult result = service.modifyCal(calendarVO);
			
			switch (result) {
				case OK : 
					goPage = "redirect:/cal/calFormView?what=" + calendarDetailVO.getSchedetailno();
					break;
				default : 
					message = "서버 문제로 수정이 완료되지 않았습니다. 잠시 후 다시 시도해 주세요.";
					goPage = "cal/calRegistForm";
					break;
			}
		}else {
			goPage = "cal/calRegistForm";
		}
		
		model.addAttribute("message", message);
		
		return goPage;
	}
	
}

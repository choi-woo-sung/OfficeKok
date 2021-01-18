package kr.or.ddit.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.calendar.service.ICalendarService;
import kr.or.ddit.organization.service.IOrganizationService;
import kr.or.ddit.vo.CalendarDetailVO;
import kr.or.ddit.vo.DeptVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.OrganizationVO;

/**
 * @author 안승원
 * @since 2020. 10. 23.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 23.      안승원       최초작성
 * 2020. 11. 04.      정재은       내용추가
 * Copyright (c) 2020 by DDIT All right reserved
 *      </pre>
 */
@Controller
@RequestMapping
public class CalReadController {

	private ICalendarService service;

	@Inject
	public void setService(ICalendarService service) {
		this.service = service;
	}
	
	@GetMapping("/cal")
	@PreAuthorize("isAuthenticated()")
	public String calList(@AuthenticationPrincipal(expression = "emp") EmpVO empVO, Model model) {
		System.out.println("현재 로그인한 유저 정보 : " + empVO.toString());
		
		List<EmpVO> calList = service.retrieveCalList(empVO.getEmpno());
		model.addAttribute("cal", calList);
		
		System.out.println("cal : " + calList);

		return "cal/calFormList";
	}

	@GetMapping("/cal/calFormList")
	@ResponseBody
	public CalendarDetailVO calView(@RequestParam(name = "schedetailno", required = true) Integer schedetailno,
			Model model) {

		CalendarDetailVO calView = service.retrieveCal(schedetailno);
		model.addAttribute("calFormView", calView);
//		String goPage = "cal/calFormList";
//		
		System.out.println("calFormView : " + calView);

		return calView;
	}

	@GetMapping("/cal/{what}")
	public String calFormView(@PathVariable(name = "what") int schedetailno, Model model) {
		CalendarDetailVO calFormView = service.retrieveCal(schedetailno);
		model.addAttribute("calDetail", calFormView);

		return "cal/calFormView";
	}
}

package kr.or.ddit.manager.emp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.manager.emp.service.IEmpService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

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
 * 2020. 10. 29.	    정재은	    내용추가
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/emp/retrieve")
public class EmpReadController {
	
	private IEmpService service;

	@Inject
	public void setService(IEmpService service) {
		this.service = service;
	}
	
	@RequestMapping(value="mgr/empView", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public EmpVO view(
			@RequestParam(required=true) int who, Model model) {
		EmpVO emp = service.retrieveEmp(who);
		model.addAttribute(emp);
		
		return emp;
	}
	
	@GetMapping
	public String list(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage, 
			@RequestParam(required=false) String searchWord, 
			@RequestParam(required=false) String searchType, 
			Model model) {
		
		SearchVO searchVO = new SearchVO(searchWord, searchType);
		PagingVO<EmpVO> pagingVO = new PagingVO<>(2, 3);
		pagingVO.setSearchVO(searchVO);
		
		int totalRecord = service.retrieveEmpCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setCurrentPage(currentPage);
		
		List<EmpVO> empList = service.retrieveEmpList(pagingVO);
		pagingVO.setData(empList);
		model.addAttribute("pagingVO", pagingVO);
		
		return "mgr/empList";
	}

	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<EmpVO> listForAjax(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage, 
			@RequestParam(required=false) String searchWord, 
			@RequestParam(required=false) String searchType, 
			Model model) {
		
		list(currentPage, searchWord, searchType, model);
		PagingVO<EmpVO> pagingVO = (PagingVO<EmpVO>) model.asMap().get("pagingVO");
		
		return pagingVO;
	}
}

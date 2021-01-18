package kr.or.ddit.approval.draft.controller;

import java.util.List;

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

import kr.or.ddit.approval.appr.service.IApprovalDocService;
import kr.or.ddit.approval.appr.service.IApprovalStepService;
import kr.or.ddit.vo.ApprovalDocVO;
import kr.or.ddit.vo.ApprovalStepVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PagingVO;

/**
 * @author 안승원
 * @since 2020. 10. 23.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 23.      안승원       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/approval/work/apprTemp")
public class ApprTempController {
	
	@Inject
	private IApprovalDocService apprDocService;
	@Inject
	private IApprovalStepService apprStepService;
	
	@GetMapping
	@PreAuthorize("isAuthenticated()")
	public String getTempList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "pageCount", required = false, defaultValue = "10") int screenSize, 
			@RequestParam(name = "docformnm", required = false) String docformnm,
			@RequestParam(name = "apprdocsubject", required = false) String apprdocsubject,
			@RequestParam(name = "start", required = false) String start, 
			@RequestParam(name = "end", required = false) String  end,
			@RequestParam(name = "service", required = true, defaultValue = "temp") String service,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			Model model) {
		
		getTempListJSON(currentPage, screenSize, docformnm, apprdocsubject, start, end, service, emp, model);
		return "approval/tempList";
	}
	
	@PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public PagingVO<ApprovalDocVO> getTempListJSON(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "pageCount", required = false, defaultValue = "10") int screenSize, 
			@RequestParam(name = "docformnm", required = false) String docformnm,
			@RequestParam(name = "apprdocsubject", required = false) String apprdocsubject,
			@RequestParam(name = "start", required = false) String start, 
			@RequestParam(name = "end", required = false) String  end,
			@RequestParam(name = "service", required = true) String service,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			Model model) {
		
		ApprovalDocVO searchDetail = new ApprovalDocVO();
		
		searchDetail.setDocformnm(docformnm);
		searchDetail.setApprdocsubject(apprdocsubject);
		searchDetail.setStart(start);
		searchDetail.setEnd(end);
		searchDetail.setDraftno(emp.getEmpno());
		
		PagingVO<ApprovalDocVO> paging = new PagingVO<>();
		
		paging.setSearchDetail(searchDetail);
		
		paging.setEmpno(emp.getEmpno());
		
		int totalRecord = apprDocService.getApprTempCnt(paging);
		paging.setScreenSize(screenSize);
		paging.setTotalRecord(totalRecord); // totalPage
		paging.setCurrentPage(currentPage);
		
		List<ApprovalDocVO> apprTempList = apprDocService.getApprTempList(paging);
		paging.setData(apprTempList);
		paging.setService(service);
		
		model.addAttribute("paging", paging);
		
		return paging;
	}
	
	@GetMapping("{what}")
	@PreAuthorize("isAuthenticated()")
	public String getMyRequestDoc(@PathVariable(name = "what", required = true) String apprdocno,
			@RequestParam(name = "service", required = true, defaultValue = "temp") String service,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			Model model) {
		
		ApprovalDocVO approval = apprDocService.getApprovalDoc(apprdocno);
		approval.setService(service);
		List<ApprovalStepVO> apprStepList = apprStepService.getApprovalStepList(approval.getApprdocno());
		
		model.addAttribute("approval", approval);
		model.addAttribute("apprStepList", apprStepList);
		
		return "approval/approvaldoc";
	}
}
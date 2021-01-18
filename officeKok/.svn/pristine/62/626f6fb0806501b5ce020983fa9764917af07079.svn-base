package kr.or.ddit.approval.doc.controller;

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
import kr.or.ddit.approval.appr.service.IApprovalHistoryService;
import kr.or.ddit.approval.appr.service.IApprovalStepService;
import kr.or.ddit.approval.dept.dao.IApprovalReceiveDAO;
import kr.or.ddit.approval.doc.service.IApprovalReferenceService;
import kr.or.ddit.vo.ApprovalDocVO;
import kr.or.ddit.vo.ApprovalHistoryVO;
import kr.or.ddit.vo.ApprovalRecipientVO;
import kr.or.ddit.vo.ApprovalStepVO;
import kr.or.ddit.vo.DocRefVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PagingVO;

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
 * Copyright (c) 2020 by DDIT All right reserved
 *      </pre>
 */
@Controller
@RequestMapping("/approval/work/apprReject")
public class ApprRejectController {
	@Inject
	private IApprovalDocService apprDocService;
	@Inject
	private IApprovalStepService apprStepService;
	@Inject
	private IApprovalHistoryService apprHistoryService;
	@Inject
	private IApprovalReferenceService apprReferenceService;
	@Inject
	private IApprovalReceiveDAO apprRecipientDAO;

	@GetMapping
	@PreAuthorize("isAuthenticated()")
	public String getRejectList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "pageCount", required = false, defaultValue = "5") int screenSize,
			@RequestParam(name = "empnm", required = false) String empnm,
			@RequestParam(name = "docformnm", required = false) String docformnm,
			@RequestParam(name = "apprdocsubject", required = false) String apprdocsubject,
			@RequestParam(name = "start", required = false) String start,
			@RequestParam(name = "end", required = false) String end,
			@RequestParam(name = "service", required = true, defaultValue = "reject") String service,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp, Model model) {
		getRejectListJSON(currentPage, screenSize, empnm, docformnm, apprdocsubject, start, end, service, emp, model);
		return "approval/rejectList";
	}

	@PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public PagingVO<ApprovalDocVO> getRejectListJSON(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "pageCount", required = false, defaultValue = "5") int screenSize,
			@RequestParam(name = "empnm", required = false) String empnm,
			@RequestParam(name = "docformnm", required = false) String docformnm,
			@RequestParam(name = "apprdocsubject", required = false) String apprdocsubject,
			@RequestParam(name = "start", required = false) String start,
			@RequestParam(name = "end", required = false) String end,
			@RequestParam(name = "service", required = true) String service,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp, Model model) {

		ApprovalDocVO searchDetail = new ApprovalDocVO();
		searchDetail.setEmpnm(empnm);
		searchDetail.setDocformnm(docformnm);
		searchDetail.setApprdocsubject(apprdocsubject);
		searchDetail.setStart(start);
		searchDetail.setEnd(end);

		PagingVO<ApprovalDocVO> paging = new PagingVO<>();
		paging.setSearchDetail(searchDetail);
		paging.setEmpno(emp.getEmpno());

		int totalRecord = apprDocService.getApprRejectCnt(paging);
		paging.setScreenSize(screenSize);
		paging.setTotalRecord(totalRecord); // totalPage
		paging.setCurrentPage(currentPage);

		List<ApprovalDocVO> rejectList = apprDocService.getApprRejectList(paging);
		paging.setData(rejectList);
		paging.setService(service);

		model.addAttribute("paging", paging);

		return paging;
	}

	@GetMapping("{what}")
	@PreAuthorize("isAuthenticated()")
	public String getRejectDoc(@PathVariable(name = "what", required = true) String apprdocno,
			@RequestParam(name = "service", required = true, defaultValue = "reject") String service,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp, Model model) {

		ApprovalDocVO approval = apprDocService.getApprovalDoc(apprdocno);
		approval.setService(service);
		List<ApprovalStepVO> apprStepList = apprStepService.getApprovalStepList(approval.getApprdocno());
		List<ApprovalHistoryVO> apprHistoryList = apprHistoryService.getApprHistoryList(approval.getApprdocno());
		List<DocRefVO> apprDocRefList = apprReferenceService.getDocRefList(approval.getApprdocno());
		ApprovalRecipientVO recipient = apprRecipientDAO.selectRecipient(approval.getApprdocno());
		model.addAttribute("approval", approval);
		model.addAttribute("apprStepList", apprStepList);
		model.addAttribute("apprHistoryList", apprHistoryList);
		model.addAttribute("apprDocRefList", apprDocRefList);
		if (recipient != null) {
			model.addAttribute("recipient", recipient);
		}
		return "approval/approvaldoc";
	}
}

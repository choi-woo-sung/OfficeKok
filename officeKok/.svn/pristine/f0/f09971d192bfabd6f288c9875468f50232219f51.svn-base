package kr.or.ddit.approval.draft.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.approval.appr.service.IApprovalDocService;
import kr.or.ddit.approval.draft.service.IDocFormService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.ApprovalDocVO;
import kr.or.ddit.vo.DocFormVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

@Controller
@RequestMapping("/approval/work/apprWorkForm")
public class ApprWorkFormCotroller {

	@Inject
	private IDocFormService docFormService;
	@Inject
	private IApprovalDocService apprDocService;

	@PostMapping("draft")
	public String draft(@Validated(InsertGroup.class) @ModelAttribute(name = "draft") ApprovalDocVO approval,
						Errors errors,
						Model model) {
		String goPage = null;
		String message = null;
		
		boolean valid = !errors.hasErrors();

		if (valid) {
			ServiceResult result = apprDocService.registApprovalDoc(approval);

			switch (result) {
			case FAILED:
				goPage = "approval/apprForm";
				message = "서버 문제로 등록이 완료되지 않았습니다 잠시 후 다시 시도해주세요.";
				break;
			default:
				goPage = "redirect:/approval/work/apprMyRequest";
			}
			
		} else {
			goPage = "approval/apprForm";
		}

		model.addAttribute("message", message);

		return goPage;
	}

	@GetMapping
	public String getFormList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "searchType", required = false) String searchType,
			@RequestParam(name = "searchWord", required = false) String searchWord,
			@RequestParam(name = "pageCount", required = false, defaultValue = "10") int screenSize,
			@RequestParam(name = "service", required = true, defaultValue = "docform") String service,
			Model model) {
		getFormListJSON(currentPage, searchType, searchWord, screenSize, service, model);
		return "approval/formList";
	}

	@PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<DocFormVO> getFormListJSON(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "searchType", required = false) String searchType,
			@RequestParam(name = "searchWord", required = false) String searchWord,
			@RequestParam(name = "pageCount", required = false, defaultValue = "10") int screenSize, 
			@RequestParam(name = "service", required = true) String service,
			Model model) {
		
		SearchVO searchVO = new SearchVO(searchWord, searchType);
		
		PagingVO<DocFormVO> paging = new PagingVO<>();

		paging.setSearchVO(searchVO);

		int totalRecord = docFormService.getDocFormCnt(paging);
		paging.setScreenSize(screenSize);
		paging.setTotalRecord(totalRecord); // totalPage
		paging.setCurrentPage(currentPage);

		List<DocFormVO> docFormList = docFormService.getDocFormList(paging);
		paging.setData(docFormList);
		paging.setService(service);

		model.addAttribute("paging", paging);
		
		return paging;
	}

	@GetMapping("{what}")
	@PreAuthorize("isAuthenticated()")
	public String getApprForm(@PathVariable(name = "what", required = true) String docformno, 
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			Model model) throws Exception {

		Date today = new Date();

		DocFormVO docform = docFormService.getDocForm(docformno);
		
		emp.setDeptnm(getDeptnm(emp.getDeptnm()));
		
		model.addAttribute("today", today);
		model.addAttribute("draftEmp", emp);
		model.addAttribute("docform", docform);

		return "approval/apprForm";
	}
	
	/**
	 * 부서 이름 팀 단위로 잘라주는 메서드
	 * @param deptnm
	 * @return
	 */
	public String getDeptnm(String deptnm) {
		String[] dept = deptnm.split(" ");
		int idx = 0;
		if (dept.length > 0) {
			idx = dept.length - 1;
		}
		deptnm = dept[idx];
		return deptnm;
	}
}
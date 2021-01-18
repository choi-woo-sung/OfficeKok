package kr.or.ddit.note.controller;

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

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.note.service.INoteSendService;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

/**
 * @author 안승원
 * @since 2020. 10. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 26.      안승원       최초작성
 * 2020. 11. 18.      정재은       내용수정
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping
public class NoteSendController {
	
	private INoteSendService service;
	
	@Inject
	public void setService(INoteSendService service) {
		this.service = service;
	}
	
	/*@PostMapping("/note/trash")
	public String noteSendTrashGo(
			@Validated(UpdateGroup.class) @ModelAttribute("note") NoteVO noteVO,
			Errors errors, Model model) {
		
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		
		String delChk = noteVO.getNotedel();
		if(delChk == null) {
			delChk = "Y";
			noteVO.setNotedel(delChk);
		}
		
		if(valid) {
//		3. 통과
//		4. 통과한 경우, 로직을 이용한 등록
			ServiceResult result = service.modifyTrashNote(noteVO);
			switch (result) {
			case FAILED:
				goPage = "note/send";
				message = "서버 문제로 수정이 완료되지 않았습니다 잠시 후 다시 시도해주세요.";
				break;
			default:
//				PostRedirectGet pattern
				goPage = "redirect:/note/trash";
				break;
			}
		}else {
//		   불통
			goPage = "note/send";
		}
//		  등록 이후의 경우의 수에 대한 처리
		model.addAttribute("message", message);
		model.addAttribute("note", noteVO);
		
		System.out.println("noteTrash : " + noteVO);
		
		return goPage;
	}*/
	
	@GetMapping("/note/sendView/{what}")
	@PreAuthorize("isAuthenticated()")
	public String sendNoteView(
			@PathVariable(name="what", required=true) int what, 
			@AuthenticationPrincipal(expression = "emp") EmpVO emp, Model model) {
		
		NoteVO noteVO = new NoteVO();
		
		noteVO.setNoteno(what);
		noteVO.setEmpno(emp.getEmpno());
		
		NoteVO note = service.retrieveSendNote(noteVO);
		model.addAttribute("note", note);
		
		return "note/noteSendView";
	}

	@GetMapping(value="/note/send", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public PagingVO<NoteVO> sendNoteListJSON(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(name = "pageCount", required = false, defaultValue = "5") int screenSize,
			@RequestParam(required=false) String searchWord, 
			@RequestParam(required=false) String searchType, 
			@RequestParam(name = "pagecount", required = false, defaultValue = "5") int pageCount,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			Model model) {
		
		sendNoteList(currentPage, screenSize, searchWord, searchType, pageCount, emp, model);
		PagingVO<NoteVO> pagingVO = (PagingVO<NoteVO>) model.asMap().get("pagingVO");
		
		return pagingVO;
	}
	
	@GetMapping("/note/send")
	@PreAuthorize("isAuthenticated()")
	public String sendNoteList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(name = "pageCount", required = false, defaultValue = "5") int screenSize,
			@RequestParam(required=false) String searchWord, 
			@RequestParam(required=false) String searchType, 
			@RequestParam(name = "pagecount", required = false, defaultValue = "5") int pageCount,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			Model model) {
		
		SearchVO searchVO = new SearchVO(searchWord, searchType);
		
		NoteVO note = new NoteVO();
		note.setNotereceive(emp.getEmpno());
		
		PagingVO<NoteVO> pagingVO = new PagingVO<>();
		pagingVO.setSearchVO(searchVO);
		pagingVO.setEmpno(note.getNotereceive());
		
		System.out.println("note : " + note);
		
		int totalRecord = service.retrieveSendNoteCount(pagingVO);
		pagingVO.setScreenSize(screenSize);
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setCurrentPage(currentPage);
		
		List<NoteVO> sendNoteList = service.retrieveSendNoteList(pagingVO);
		pagingVO.setData(sendNoteList);
		model.addAttribute("pagingVO", pagingVO);
		
		System.out.println("pagingVO : " + pagingVO);
		
		return "note/noteSend";
	}
}

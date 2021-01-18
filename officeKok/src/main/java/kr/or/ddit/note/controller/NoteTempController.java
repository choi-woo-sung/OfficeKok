package kr.or.ddit.note.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.note.service.INoteTempService;
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
 * 2020. 11. 26.      정재은       내용수정
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping
public class NoteTempController {
	
	private INoteTempService service;
	
	@Inject
	public void setService(INoteTempService service) {
		this.service = service;
	}
	
	@GetMapping("/note/tempView/{what}")
	@PreAuthorize("isAuthenticated()")
	public String sendNoteView(
			@PathVariable(name="what", required=true) int what, 
			@AuthenticationPrincipal(expression = "emp") EmpVO emp, Model model) {
		
		NoteVO noteVO = new NoteVO();
		
		noteVO.setNoteno(what);
		noteVO.setEmpno(emp.getEmpno());
		
		NoteVO note = service.retrieveTempNote(noteVO);
		model.addAttribute("note", note);
		
		return "note/noteTempView";
	}
	
	@GetMapping(value="/note/temp", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public PagingVO<NoteVO> tempNoteListJSON(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(name = "pageCount", required = false, defaultValue = "5") int screenSize,
			@RequestParam(required=false) String searchWord, 
			@RequestParam(required=false) String searchType, 
			@RequestParam(name = "pagecount", required = false, defaultValue = "5") int pageCount,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			Model model) {
		
		tempNoteList(currentPage, screenSize, searchWord, searchType, pageCount, emp, model);
		PagingVO<NoteVO> pagingVO = (PagingVO<NoteVO>) model.asMap().get("pagingVO");
		
		return pagingVO;
	}
	
	@GetMapping("/note/temp")
	@PreAuthorize("isAuthenticated()")
	public String tempNoteList(
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
		
		int totalRecord = service.retrieveTempNoteCount(pagingVO);
		pagingVO.setScreenSize(screenSize);
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setCurrentPage(currentPage);
		
		List<NoteVO> sendNoteList = service.retrieveTempNoteList(pagingVO);
		pagingVO.setData(sendNoteList);
		model.addAttribute("pagingVO", pagingVO);
		
		System.out.println("pagingVO : " + pagingVO);
		
		return "note/noteTemp";
	}
}

package kr.or.ddit.note.controller;

import java.util.Date;
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

import kr.or.ddit.note.service.INoteTrashService;
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
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping
public class NoteTrashController {
	
	private INoteTrashService service;
	
	@Inject
	public void setService(INoteTrashService service) {
		this.service = service;
	}
	
	@GetMapping("/note/trashView/{what}")
	@PreAuthorize("isAuthenticated()")
	public String trashNoteView(
			@PathVariable(name="what", required=true) int what, 
			@AuthenticationPrincipal(expression = "emp") EmpVO emp, Model model) {
		
		NoteVO noteVO = new NoteVO();
		
		noteVO.setNoteno(what);
		noteVO.setEmpno(emp.getEmpno());
		
		NoteVO note = service.retrieveTrashNote(noteVO);
		model.addAttribute("note", note);
		
		return "note/noteTrashView";
	}
	@GetMapping(value="/note/trash", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public PagingVO<NoteVO> noteTrashListAJAX(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(name = "pageCount", required = false, defaultValue = "5") int screenSize,
			@RequestParam(required=false) String searchWord, 
			@RequestParam(required=false) String searchType, 
			@RequestParam(name = "pagecount", required = false, defaultValue = "5") int pageCount,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			Model model) {
		
		noteTrashList(currentPage, screenSize, searchWord, searchType, pageCount, emp, model);
		PagingVO<NoteVO> pagingVO = (PagingVO<NoteVO>) model.asMap().get("pagingVO");
		
		return pagingVO;
	}
	
	@GetMapping("/note/trash")
	public String noteTrashList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(name = "pageCount", required = false, defaultValue = "5") int screenSize,
			@RequestParam(required=false) String searchWord, 
			@RequestParam(required=false) String searchType, 
			@RequestParam(name = "pagecount", required = false, defaultValue = "5") int pageCount,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			Model model) {
		
		SearchVO searchVO = new SearchVO(searchWord, searchType);
		
		NoteVO note = new NoteVO();
		Date today = new Date();
		
		note.setNotereceive(emp.getEmpno());
		note.setNotedeldate(today.toString());
		
		PagingVO<NoteVO> pagingVO = new PagingVO<>();
		pagingVO.setSearchVO(searchVO);
		pagingVO.setEmpno(note.getNotereceive());
		
		System.out.println("note : " + note);
		
		int totalRecord = service.retrieveTrashNoteCount(pagingVO);
		pagingVO.setScreenSize(screenSize);
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setCurrentPage(currentPage);
		
		List<NoteVO> sendNoteList = service.retrieveTrashNoteList(pagingVO);
		pagingVO.setData(sendNoteList);
		model.addAttribute("pagingVO", pagingVO);
		
		System.out.println("pagingVO : " + pagingVO);
		System.out.println("data : " + pagingVO.getData());
		
		return "note/noteTrash";
	}
}

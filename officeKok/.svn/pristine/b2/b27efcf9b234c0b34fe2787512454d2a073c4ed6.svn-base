package kr.or.ddit.note.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.note.service.INoteRegistService;
import kr.or.ddit.organization.service.IOrganizationService;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.DeptVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.OrganizationVO;

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
 * 2020. 11. 26.      정재은       내용추가
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/note/form")
public class NoteRegistController {
	
	private IOrganizationService organizationService;
	private INoteRegistService noteService;
	
	@Inject
	public void setNoteService(INoteRegistService noteService) {
		this.noteService = noteService;
	}
	
	@Inject
	public void setOrganizationService(IOrganizationService organizationService) {
		this.organizationService = organizationService;
	}
	
	@PostMapping("/note/temp")
	public String noteTrashGo(
			@Validated(UpdateGroup.class) @ModelAttribute("note") NoteVO noteVO,
			Errors errors, Model model) {
		
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		
		String saveChk = noteVO.getNotedel();
		if(saveChk == null) {
			saveChk = "N";
			noteVO.setNotedel(saveChk);
		}
		
		if(valid) {
//		3. 통과
//		4. 통과한 경우, 로직을 이용한 등록
			ServiceResult result = noteService.modifyTemp(noteVO);
			switch (result) {
			case FAILED:
				goPage = "note/temp";
				message = "서버 문제로 수정이 완료되지 않았습니다 잠시 후 다시 시도해주세요.";
				break;
			default:
//				PostRedirectGet pattern
				goPage = "redirect:/note/form";
				break;
			}
		}else {
//		   불통
			goPage = "note/temp";
		}
		
//		  등록 이후의 경우의 수에 대한 처리
		model.addAttribute("message", message);
		model.addAttribute("note", noteVO);
		
		System.out.println("noteTrash : " + noteVO);
		
		return goPage;
	}
	
	@PostMapping(value="/noteFormTree", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public List<Map<String, Object>> getNoteTreeFormJSON(@AuthenticationPrincipal(expression="emp") EmpVO emp) 
			throws Exception {
		
		List<DeptVO> dept = organizationService.selectDept();
		List<OrganizationVO> deptEmp = organizationService.selectOrganization();

		List<Map<String, Object>> data = new ArrayList<>();
		
		for(int i = 0; i < dept.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			Map<String, Object> stateMap = new HashMap<>();
			stateMap.put("disabled", true);
			stateMap.put("opened", true);
			
			if(dept.get(i).getRedeptno() == null) {
				map.put("id", dept.get(i).getDeptno());
				map.put("parent", "#");
				map.put("text", dept.get(i).getDeptnm());
				map.put("icon", "fas fa-building");
				map.put("state", stateMap);
				data.add(map);
				
			}else if(dept.get(i).getRedeptno() == 1) {
				map.put("id", dept.get(i).getDeptno());
				map.put("parent", dept.get(i).getRedeptno());
				map.put("text", dept.get(i).getDeptnm());
				map.put("icon", "fas fa-address-book");
				map.put("state", stateMap);
				data.add(map);
			}else {
				map.put("id", dept.get(i).getDeptno());
				map.put("parent", dept.get(i).getRedeptno());
				map.put("text", dept.get(i).getDeptnm());
				map.put("icon", "fas fa-address-book");
				data.add(map);
			}
		}
		
		for(int i = 0; i < deptEmp.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			if(deptEmp.get(i).getCnt() >= 1 && deptEmp.get(i).getEmpno() != null) {
				map.put("id", deptEmp.get(i).getEmpno());
				map.put("parent", deptEmp.get(i).getDeptno());
				map.put("text", deptEmp.get(i).getEmpnm() + " " + deptEmp.get(i).getRanknm());
				map.put("icon", "fas fa-user");
				data.add(map);
			}
		}
		
		return data;
	}
	
	@PostMapping
	@PreAuthorize("isAuthenticated()")
	public String insertNote(
			@Validated(InsertGroup.class)
			@ModelAttribute("note") NoteVO noteVO, BindingResult errors, @AuthenticationPrincipal(expression="emp")EmpVO emp, 
			Model model
			) {
		noteVO.setNotesend(emp.getEmpno());
		noteVO.setNotereceive(noteVO.getEmpno());
		System.out.println("noteVO : " + noteVO);
		
		String urgentChk = noteVO.getNoteurgent();
		if(urgentChk == null) {
			urgentChk = "N";
			noteVO.setNoteurgent(urgentChk);
		}else if(urgentChk == "Y") {
			noteVO.setNoteurgent(urgentChk);
		}
		
//		String readChk = noteVO.getNoteread();
//		if(readChk == null) {
//			urgentChk = "N";
//		}
		
//		String saveChk = noteVO.getNotesave();
//		if(saveChk == null) {
//			saveChk = "Y";
//		}
		
		boolean valid = !errors.hasErrors();

		String goPage = null;
		String message = null;

		if (valid) {
			ServiceResult result = noteService.createNote(noteVO);
			switch (result) {
			case FAILED:
				goPage = "note/noteForm";
				message = "서버 문제로 등록이 완료되지 않았습니다. 잠시 후 다시 시도해 주세요.";
				break;

			default:
				goPage = "redirect:/note/send";
			}
		} else {
			goPage = "note/noteForm";
		}

		model.addAttribute("message", message);
		
		return goPage;
	}
	
//	@PostMapping("/note/replyForm")
//	public String noteReply(
//			@ModelAttribute("note") NoteVO note, @AuthenticationPrincipal(expression="emp")EmpVO emp,
//			Model model
//			) {
//		model.addAttribute("note", note);
//		System.err.println(note);
//		
//		return "note/noteForm";
//	}
	
	@GetMapping
	public String get() {
		return "note/noteForm";
	}
}

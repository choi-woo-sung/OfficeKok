package kr.or.ddit.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.chat.service.IChatAttendService;
import kr.or.ddit.manager.emp.service.IEmpService;
import kr.or.ddit.organization.service.IOrganizationService;
import kr.or.ddit.vo.ChatAttendVO;
import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.SearchVO;

/**
 * @author 안승원
 * @since 2020. 10. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 27.      안승원       최초작성
 * 2020. 11. 09.      최우성            작성
 * Copyright (c) 2020 by DDIT All right reserved
 *      </pre>
 */
@Controller
@RequestMapping("/chat")
public class ChatListController {
	
	private String deptCode = "/detpno";
	private String empCode = "/empno";
	
	private IEmpService empService;
	private IOrganizationService organizationService;
	

	@Inject
	public void setService(IEmpService service) {
		this.empService = service;
	}

	@Inject
	public void setOrganizationService(IOrganizationService organizationService) {
		this.organizationService = organizationService;
	}
	
	@Inject
	private IChatAttendService chatAttendService;

	@GetMapping
	@PreAuthorize("isAuthenticated()")
	public String chatlist(
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false, defaultValue = "1") String searchType,
			@RequestParam(name = "searchvalue", required = false) String searchval, Model model, HttpSession session) {

		model.addAttribute("chatlist", list(emp, searchWord, searchType, searchval, session));

		return "nonetiles/chatList";
	}

	@GetMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public Object list(
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			@RequestParam(name = "searchWord", required = false) String searchWord,
			@RequestParam(name = "searchType", required = false, defaultValue = "1") String searchType,
			@RequestParam(name = "searchvalue", required = false, defaultValue = "1") String searchval,
			HttpSession session) {

		
//		====검색
		SearchVO searchVO = new SearchVO(searchWord, searchType);
//		========

		if (searchval == null || searchval.equals("1")) {
			emp.setSearchVO(searchVO);
			List<EmpVO> chatList = empService.selectChatEmpList(emp);
			return chatList;
		} else if (searchval.equals("2")) {
			ChatAttendVO chatattendvo = new ChatAttendVO();
			chatattendvo.setEmpno(emp.getEmpno());
			chatattendvo.setSearchVO(searchVO);
			List<ChatAttendVO> chatList = chatAttendService.selectAttendList(chatattendvo);
			return chatList;
		} else if (searchval.equals("3")) {
			
		}
		
		return null;
	}
	
	
	
	@PostMapping(value = "chatcreate", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public void getApprTreeJSON(@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			Model model, @RequestBody List<Map<String, Object>> list) {

		System.out.println(list.toString());
		ChatRoomVO chatRoomVO = new ChatRoomVO();
		ChatAttendVO chatAttendVO = new ChatAttendVO();
		String chatnm =  (String) list.get(0).get("chatnm");
		chatRoomVO.setChatrmbuilder(emp.getEmpno());
		chatRoomVO.setChatrmnm(chatnm);
		int chatrmno = chatAttendService.insertChatRm(chatRoomVO);
		chatAttendVO.setEmpno(emp.getEmpno());
		chatAttendService.insertChatAttendList(chatAttendVO);
		
		//여기서 내꺼 추가하고
		
		for(int i=1; i<list.size(); i++) {
			chatAttendVO.setEmpno(Integer.parseInt( (String) list.get(i).get("empno")));
			chatAttendService.insertChatAttendList(chatAttendVO);
		}
		
		
		
		
	}
	
	
	
	
	
	
	

}

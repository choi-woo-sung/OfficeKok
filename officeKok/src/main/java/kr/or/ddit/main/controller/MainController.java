package kr.or.ddit.main.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.calendar.service.ICalendarService;
import kr.or.ddit.main.service.IMainService;
import kr.or.ddit.note.service.INoteReceiveService;
import kr.or.ddit.vo.ApprovalDocVO;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.CalendarDetailVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.PostVO;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Inject
	private IMainService service;
	
	@Inject
	private IBoardService boardService;
	
	@Inject
	private INoteReceiveService notereceiveservice;
	
	@Inject
	private ICalendarService calendarService;
	
	@GetMapping
	@PreAuthorize("isAuthenticated()")
	public ModelAndView view(@AuthenticationPrincipal(expression = "emp") EmpVO empVO ,HttpSession session) {
		int empno = empVO.getEmpno();
		AttendanceVO attendance = service.selectMainWorkTime(empno);
		List<ApprovalDocVO> apprTodoList = service.getMainApprTodoList(empno);
		List<NoteVO> note = service.selectUnreadCount(empno);
		// 우성이 꺼입니당.
		PostVO postdept = boardService.selectPostdept(empVO.getDeptno());
		List<PostVO> noticeboard = boardService.mainPost(11);
		List<PostVO> totalboard = boardService.mainPost(10);
		
		ModelAndView mv = new ModelAndView();
		if (postdept != null) {
			List<PostVO> deptboard = boardService.mainPost(postdept.getBoardno());
			mv.addObject("deptboard", deptboard);
		}
		
		List<EmpVO> calList = calendarService.retrieveCalSubjectList(empno);
		
		System.out.println(session.getId());
		//
		mv.addObject("attendance", attendance);
		mv.addObject("apprTodoCnt", apprTodoList.size());
		mv.addObject("apprTodoList", apprTodoList);
		mv.addObject("noticeboard", noticeboard);
		mv.addObject("totalboard", totalboard);
		mv.addObject("noteUnreadCount", note.size());
		mv.addObject("calList", calList);
		mv.setViewName("main/main");
		return mv;
	}
	
	
	@GetMapping( value= "note",  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	public Map<String, String> helloWorld(
			@AuthenticationPrincipal(expression = "emp") EmpVO emp) {
		String notedata = notereceiveservice.micNote(emp.getEmpno());
		Map<String, String> resultMap = new HashMap<>();
		resultMap.put("res", notedata);
		return resultMap;
	}
	
	
//	@GetMapping( value= "mail",  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@PreAuthorize("isAuthenticated()")
//	@ResponseBody
//	public Map<String, String> helloWorld2(
//			@AuthenticationPrincipal(expression = "emp") EmpVO emp) {
//		String notedata = notereceiveservice.micNote(emp.getEmpno());
//		Map<String, String> resultMap = new HashMap<>();
//		resultMap.put("res", notedata);
//		return resultMap;
//	}
}

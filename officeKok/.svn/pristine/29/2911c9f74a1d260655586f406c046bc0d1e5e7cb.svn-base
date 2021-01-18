package kr.or.ddit.board.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.board.service.IReplyService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;

@RestController
@RequestMapping(value = "/reply", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class ReplyController {
	@Inject
	IReplyService service;

	

	@PostMapping(value = "replyInsert.do")
	@PreAuthorize("isAuthenticated()")
	public Map<String, Object> insert(
			@AuthenticationPrincipal(expression = "emp") EmpVO empvo,
			@ModelAttribute(name = "reply") ReplyVO reply,
			HttpSession session) {
		System.out.println(reply.toString());
		reply.setReplywriter(empvo.getEmpno());
		ServiceResult result = service.createReply(reply);
		Map<String, Object> resultMap = Collections.singletonMap("result", result);
		return resultMap;
	}

	@PostMapping(value = "replyUpdate.do")
	public Map<String, Object> update(@ModelAttribute(name = "reply") ReplyVO reply) {
		ServiceResult result = service.modifyReply(reply);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		if (ServiceResult.INVALIDPASSWORD.equals(result)) {
			resultMap.put("message", "비밀번호 오류");
		}
		return resultMap;
	}

	@PostMapping(value = "replyDelete.do")
	@PreAuthorize("isAuthenticated()")
	public Map<String, Object> delete(
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			@ModelAttribute(name = "reply") ReplyVO reply,
			HttpSession session) {
		
		System.out.println(reply.toString());
		reply.setReplywriter(emp.getEmpno());
		ServiceResult result = service.removeReply(reply);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		if (ServiceResult.INVALIDPASSWORD.equals(result)) {
			resultMap.put("message", "비밀번호 오류");
		}
		return resultMap;
	}

	@GetMapping(value = "replyList.do")
	public PagingVO<ReplyVO> list(@RequestParam(name = "what", required = true) int postno,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, HttpSession session) {
//		====검색, 특정글의 댓글만 조회
		ReplyVO searchDetail = new ReplyVO();
		System.out.println(postno);
		searchDetail.setPostno(postno);
		PagingVO<ReplyVO> pagingVO = new PagingVO<>(5, 5);
		pagingVO.setSearchDetail(searchDetail);
//		========
		int totalRecord = service.readReplyCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord); // totalPage
		pagingVO.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage

		List<ReplyVO> ReplyList = service.readReplyList(pagingVO);
		pagingVO.setData(ReplyList);

		return pagingVO;
	}
}

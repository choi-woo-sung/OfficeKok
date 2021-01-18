package kr.or.ddit.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.PostVO;
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
 * Copyright (c) 2020 by DDIT All right reserved
 *      </pre>
 */
@Controller
@RequestMapping("/board/deptRead")
public class DeptReadController {
	@Inject
	IBoardService service;

	@GetMapping("{what}")
	@PreAuthorize("isAuthenticated()")
	public String view(@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			@PathVariable(name = "what", required = true) int postno, Model model) {
		PostVO board = service.readBoard(postno);
		model.addAttribute("emp", emp);
		model.addAttribute("board", board);
		model.addAttribute("what", postno);
		return "board/boardView";
	}

	@GetMapping
	@PreAuthorize("isAuthenticated()")
	public String list(@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "searchType", required = false) String searchType,
			@RequestParam(name = "searchWord", required = false) String searchWord,
			@RequestParam(name = "pagecount", required = false, defaultValue = "10") int pagecount, Model model,
			HttpSession session) {
		model.addAttribute("pagingVO", list(emp, currentPage, searchType, searchWord, pagecount));

		PostVO postvo = service.selectPostdept(emp.getDeptno());

		session.setAttribute("boardno", postvo.getBoardno());
		model.addAttribute("deptnm", postvo.getDeptnm());
		return "board/bodeptList";
	}

	@GetMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	public PagingVO<PostVO> list(@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "searchWord", required = false) String searchWord,
			@RequestParam(name = "searchType", required = false) String searchType,
			@RequestParam(name = "pagecount", required = false, defaultValue = "10") int pagecount

	) {
//		====검색
		SearchVO searchVO = new SearchVO(searchWord, searchType);
		PagingVO<PostVO> pagingVO = new PagingVO<>();
		pagingVO.setSearchVO(searchVO);
//		========
		PostVO postvo = service.selectPostdept(emp.getDeptno());
		pagingVO.setBoardno(postvo.getBoardno());
		pagingVO.setScreenSize(10);
		int totalRecord = service.readPostCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord); // totalPage
		pagingVO.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage

		List<PostVO> boardList = service.readPostList(pagingVO);
		pagingVO.setData(boardList);

		return pagingVO;
	}
}

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
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 27.      안승원       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/board/noticeRead")
public class NoticeReadController {
	@Inject
	IBoardService service;
	
	
	@GetMapping("{what}")
	@PreAuthorize("isAuthenticated()")
	public String view(
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			@PathVariable(name = "what", required = true) int postno, Model model) {
		//Pathvariable을 통해 상세 페이지로 이동한다.
		//what을 postno의 parameter로 받아서 조회  
		PostVO board = service.readBoard(postno);
//		System.out.println(board.getAttatchList().toString());
		//결과 값의 관라지 이름과 공지사항을 변환시켜줌.
		board.setEmpnm("관리자");
		board.setDeptnm("공지사항");
		model.addAttribute("board", board);
		model.addAttribute("emp", emp);
		model.addAttribute("what", postno);
		return "board/boardView";
	}
	@GetMapping
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "searchType", required = false) String searchType,
			@RequestParam(name = "searchWord", required = false) String searchWord, 
			@RequestParam(name = "pagecount", required = false, defaultValue = "10") int pagecount,
			Model model,HttpSession session) {
		// 동기처리를 하기위한것이므로, 아래의 메소드를 자시 재사용하여 동기처리함.
		model.addAttribute("pagingVO", list(currentPage, searchType, searchWord, pagecount));
		session.setAttribute("boardno", 11);
		return "board/bonoticeList";
	}

	@GetMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<PostVO> list(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "searchWord", required = false) String searchWord,
			@RequestParam(name = "searchType", required = false) String searchType,
			@RequestParam(name = "pagecount", required = false, defaultValue = "10") int pagecount
) {
//		검색하는 코드로 searchWord에는 단어가 들어가있고 searchType에는 유형이 들어가있음.
		SearchVO searchVO = new SearchVO(searchWord, searchType);
		PagingVO<PostVO> pagingVO = new PagingVO<>();
		pagingVO.setSearchVO(searchVO);
//		========
		pagingVO.setBoardno(11);
		int totalRecord = service.readPostCount(pagingVO);
		//페이징처리를 담당하는 부분으로 ScreenSize는 가져올 목록 개수를 currentPage는 현재 페이지를 , TotalRecord는 전부를 말함.
		pagingVO.setScreenSize(pagecount);
		pagingVO.setTotalRecord(totalRecord); // totalPage
		pagingVO.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage

		List<PostVO> boardList = service.readPostList(pagingVO);
		pagingVO.setData(boardList);

		return pagingVO;
	}
}

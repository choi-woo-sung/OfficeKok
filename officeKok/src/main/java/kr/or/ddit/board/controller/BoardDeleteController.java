package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PostVO;

@Controller
public class BoardDeleteController {
	@Inject
	IBoardService service;

	@PostMapping(value = "/board/boardDelete.do")
	public String delete(@Validated(DeleteGroup.class) @ModelAttribute PostVO postvo, Errors errors, HttpSession session,
			HttpServletResponse resp, HttpSession Session) throws IOException {
		boolean valid = !errors.hasErrors();
		if (!valid) {
			resp.sendError(400);
			return null;
		}
		ServiceResult result = service.removeBoard(postvo);

		// -게시판분류-
		int boardno = (int) Session.getAttribute("boardno");
		postvo.setBoardno(boardno);
		//

		String goPage = null;
		switch (result) {
		case FAILED:
			if(boardno==10) {
				
				goPage = "redirect:/board/totalRead/"+postvo.getPostno();
			}else if(boardno==11) {
				goPage = "redirect:/board/noticeRead"+postvo.getPostno();
			}else {
				
			}
			session.setAttribute("message", "서버 오류");
			break;
			
		default:
	if(boardno==10) {
				
			goPage = "redirect:/board/totalRead/";
			}else if(boardno==11) {
			goPage = "redirect:/board/noticeRead";
			}else {
				
			}

		}
		return goPage;
	}
}

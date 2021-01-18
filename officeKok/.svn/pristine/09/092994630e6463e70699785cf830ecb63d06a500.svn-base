package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.apache.http.protocol.HTTP;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PostVO;

@Controller
public class BoardInsertController {
	@Inject
	IBoardService service;
	
	@GetMapping("/board/boardInsert.do")
	public String doGet(){
		return "board/boardForm";
	}
	
	@PostMapping(value="/board/boardInsert.do")
	@PreAuthorize("isAuthenticated()")
	public String doPost(
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			@Validated(InsertGroup.class) @ModelAttribute PostVO postvo, Errors errors, Model model
			, HttpSession Session) throws ServletException, IOException {
		
		boolean valid = !errors.hasErrors();
		
		String goPage = null;
		String message = null;
		if(valid) {
//		3. 통과
//		4. 통과한 경우, 로직을 이용한 등록
			
			// -작성자-
			int empno = emp.getEmpno();
			postvo.setPostwriter(empno);
			// -게시판분류-
			int boardno =(int) Session.getAttribute("boardno");
			postvo.setBoardno(boardno);
			// -이게 첨부파일 작동-
			postvo.setPost_no(postvo.getPostno());
			//
			
			ServiceResult result = service.createBoard(postvo);
			switch (result) {
			case FAILED:
				goPage = "board/boardForm";
				message = "서버 문제로 등록이 완료되지 않았습니다 잠시 후 다시 시도해주세요.";
				break;

			default:
//				PostRedirectGet pattern
				
				if(boardno==10) {
					
					goPage = "redirect:/board/totalRead";
				}else if(boardno==11) {
					goPage = "redirect:/board/noticeRead";
				}else {
					
				}
					
				break;
			}
			
		}else {
//		   불통
			goPage = "board/boardForm";
		}
//		  등록 이후의 경우의 수에 대한 처리
		model.addAttribute("message", message);
		return goPage;				
	}
}

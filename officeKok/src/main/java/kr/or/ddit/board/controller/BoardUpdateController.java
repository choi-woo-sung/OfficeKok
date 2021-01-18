package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PostVO;

@Controller
public class BoardUpdateController {
	@Inject
	IBoardService service;
	
	@GetMapping("/board/boardUpdate.do")
	public String doGet(
			@RequestParam(name="what", required=true) int postno,
			Model model){
		PostVO board = service.readBoard(postno);
		model.addAttribute("postvo", board);
		return "board/boardForm";
	}
	
//	@PostMapping(value="/board/boardUpdate.do")
//	public String doPost(@Validated(UpdateGroup.class) @ModelAttribute BoardVO board, Errors errors, Model model) throws ServletException, IOException {
//		// 검증 전에 Board_img 결정
//		model.addAttribute("command", "update");
//		boolean valid = !errors.hasErrors();
//		
//		String goPage = null;
//		String message = null;
//		if(valid) {
////		3. 통과
////		4. 통과한 경우, 로직을 이용한 등록
//			ServiceResult result = service.modifyBoard(board);
//			switch (result) {
//			case INVALIDPASSWORD:
//				goPage = "board/boardForm";
//				message = "비밀번호 오류, 확인 후 다시 시도해주세요.";
//				break;
//			case FAILED:
//				goPage = "board/boardForm";
//				message = "서버 문제로 등록이 완료되지 않았습니다 잠시 후 다시 시도해주세요.";
//				break;
//
//			default:
////				PostRedirectGet pattern
//				goPage = "redirect:/board/boardView.do?what="+board.getBo_no();
//				break;
//			}
//			
//		}else {
////		   불통
//			goPage = "board/boardForm";
//		}
////		  등록 이후의 경우의 수에 대한 처리
//		model.addAttribute("message", message);
//		return goPage;				
//	}
}

package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.PostAttVO;

@Controller
public class DownloadController {
	@Inject
	IBoardService service;
	
	@RequestMapping("/board/download.do")
	public String download(
			@RequestParam(name="what", required=true) int postattno, 
			Model model) throws IOException, ServletException{
		PostAttVO attatch = service.download(postattno);
		model.addAttribute("attatch", attatch);
		return "downloadView";
	}
}












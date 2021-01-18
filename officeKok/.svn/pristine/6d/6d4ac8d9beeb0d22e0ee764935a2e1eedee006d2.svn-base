package kr.or.ddit.addrBook.read.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/addrBook/detail")
public class AddrBkDetailController {
	
	@GetMapping
	public String get(@RequestParam(name = "what", required = true) int addrBkNo) {
		return "addrBook/addrBookDetail";
	}
}

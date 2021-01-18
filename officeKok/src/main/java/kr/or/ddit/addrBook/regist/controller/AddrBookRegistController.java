package kr.or.ddit.addrBook.regist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/addrBook/regist")
public class AddrBookRegistController {
	
	@GetMapping
	public String get() {
		return "addrBook/addrBookRegist";
	}
}

package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class ChatVO {
	@NotBlank
	@Size(max = 22)
	private Integer chatno;
	@Size(max = 22)
	private Integer chatrmno;
	@NotBlank
	@Size(max = 4000)
	private String chathtml;
	@NotBlank
	@Size(max = 7)
	private String chatsavedate;
	
	
}

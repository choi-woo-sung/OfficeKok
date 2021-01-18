package kr.or.ddit.vo;

import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailBoxVO {
	private Integer mailboxno;
	@Size(max = 22)
	private Integer emailaccinfono;
	@Size(max = 20)
	private String mailboxnm;
}

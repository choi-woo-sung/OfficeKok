package kr.or.ddit.vo;

import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApprovalRecieveDocVO {
	private Integer recdocno;
	@Size(max = 22)
	private Integer chargerno;
	@Size(max = 22)
	private Integer recipientno;
	@Size(max = 1)
	private String receivedocreadchk;
	@Size(max = 7)
	private String receivedocdate;
	@Size(max = 22)
	private Integer receivedocstate;
}
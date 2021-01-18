package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"replyno", "postno"})
public class ReplyVO {
	private Integer replyno;
	private Integer rereplyno;
	private Integer replywriter;
	private Integer postno;
	@NotBlank
	@Size(max = 255)
	private String replycontent;
	@NotBlank
	@Size(max = 7)
	private String replydate;
	
	//이름 조회용
	private String empnm;
	
	private String deptnm;
	
	private Integer empno; // 사번
}

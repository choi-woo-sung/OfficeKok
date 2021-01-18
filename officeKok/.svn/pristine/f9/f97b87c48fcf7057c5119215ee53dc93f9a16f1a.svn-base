package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DocRefVO {
	
	private Integer rn;
	private Integer empno;
	@NotBlank
	@Size(max = 40)
	private String refdocno;
	@Size(max = 1)
	private String readchk;
	
	private ApprovalDocVO apprdoc;
	
	private String empnm;
	private String deptnm;
	private String docformnm;
}

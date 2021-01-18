package kr.or.ddit.vo;

import java.util.List;

import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApprovalLineVO {

	private Integer apprlineno;
	private Integer empno;
	@Size(max = 255)
	private String apprlinenm;
	private String saveyn;
	
	private Integer apprstepno;
	
	private List<ApprovalStepVO> apprStepList;
}

package kr.or.ddit.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DeptVO implements Serializable {

	@NotBlank
	@Size(max = 22)
	private Integer deptno;
	@Size(max = 22)
	private Integer redeptno;
	@NotBlank
	@Size(max = 50)
	private String deptnm;
	@NotBlank
	@Size(max = 255)
	private String deptadd1;
	@NotBlank
	@Size(max = 255)
	private String deptadd2;
	@NotBlank
	@Size(max = 30)
	private String deptzip;
	@NotBlank
	@Size(max = 30)
	private String deptrepno;
	@NotBlank
	@Size(max = 30)
	private String deptfax;
	@Size(max = 255)
	private String deptexpl;
}

package kr.or.ddit.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class OrganizationVO implements Serializable {
	public Integer cnt;
	public String LVL_01;
	public String LVL_02;
	public String LVL_03;
	
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
	@NotBlank
	@Size(max = 22)
	private Integer empno;
	@Size(max = 22)
	private Integer mgrno;
	@Size(max = 22)
	private Integer rankno;
	@NotBlank
	@Size(max = 22)
	private Integer occno;
	@NotBlank
	@Size(max = 40)
	private String empmail;
	@NotBlank
	@Size(max = 40)
	private String emppw;
	@NotBlank
	@Size(max = 13)
	private String empregno;
	@NotBlank
	@Size(max = 30)
	private String emphp;
	@NotBlank
	@Size(max = 50)
	private String empnm;
	@NotBlank
	@Size(max = 255)
	private String empadd1;
	@NotBlank
	@Size(max = 255)
	private String empadd2;
	@NotBlank
	@Size(max = 30)
	private String empzip;
	@NotBlank
	@Size(max = 1)
	private String empgen;
	@NotBlank
	@Size(max = 7)
	private String enterdate;
	@Size(max = 7)
	private String leavedate;
	@NotBlank
	@Size(max = 255)
	private String ranknm;
	@Size(max = 255)
	private String rankexpl;
}

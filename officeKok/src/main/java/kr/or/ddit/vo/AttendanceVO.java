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
public class AttendanceVO implements Serializable {
	@Size(max = 5)
	private String yearly;
	@NotBlank
	@Size(max = 2)
	private String monthly;
	@NotBlank
	@Size(max = 2)
	private String daily;
	@NotBlank
	@Size(max = 22)
	private Integer tastatusno;
	@Size(max = 22)
	private Integer tasddateno;
	@Size(max = 22)
	private Integer empno;
	@Size(max = 20)
	private String goworktime;
	@Size(max = 20)
	private String afterworktime;
	@Size(max = 22)
	private Integer holyworktime;
	@Size(max = 22)
	private Integer plusworktime;
	@Size(max = 22)
	private Integer worktime;

	private Integer workhours;

	private Integer plushours;

	@NotBlank
	@Size(max = 22)
	private Integer refreshno;
	@Size(max = 22)
	private Integer amrefresh;
	@Size(max = 22)
	private Integer pmrefresh;
	@Size(max = 22)
	private Integer refresh;
	@Size(max = 255)
	private String refreshreason;
	
	private String refreshName;
}

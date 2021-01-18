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
public class PersonalDriveVO implements Serializable {
	@NotBlank
	@Size(max = 22)
	private Integer driveno;
	@Size(max = 22)
	private Integer empno;
	@NotBlank
	@Size(max = 255)
	private String empfolnm;
	@Size(max = 500)
	private String empfolroute;
	@Size(max = 7)
	private String createdate;

	private String dateinfo;
	private String type;
	private String id;

	private String data_empfolnm;
	private String data_empfolroute;
	private String data_id;
	private String data_dateInfo;
	private String data_type;

	@NotBlank
	@Size(max = 22)
	private Integer empfileno;
	@Size(max = 40)
	private String empfilemime;
	@Size(max = 50)
	private String empfilenm;
	@NotBlank
	@Size(max = 255)
	private String fileroute;
	@Size(max = 255)
	private long empfilesize;
	@Size(max = 1)
	private String delchk;

}

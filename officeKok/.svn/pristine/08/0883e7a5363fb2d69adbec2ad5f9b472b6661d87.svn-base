package kr.or.ddit.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmailAccInfoVO implements Serializable {
	private Integer emailaccinfono;
	@Size(max = 22)
	private Integer empno;
	private long emailaccinfodate;
	@Size(max = 1)
	private String emailnoticechk;
	@NotBlank
	@Size(max = 1)
	private String synchchk;
	@Size(max = 2)
	private String synch;
	@Size(max = 500)
	private String refresh_token;
	@Size(max = 500)
	private String access_token;
	@Size(max = 22)
	private long expires_in;

	private String empmail;
}

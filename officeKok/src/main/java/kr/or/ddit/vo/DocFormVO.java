package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DocFormVO {

	private String rn;
	@NotBlank
	@Size(max = 40)
	private String docformno;
	@Size(max = 255)
	private String doctype;
	@Size(max = 255)
	private String docformnm;
	@Size(max = 255)
	private String docformroute;
	@Size(max = 4000)
	private String docformhtml;
}

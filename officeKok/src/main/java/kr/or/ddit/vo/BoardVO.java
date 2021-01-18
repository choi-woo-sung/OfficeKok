package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardVO {
	private Integer boardno;
	private Integer bodeptno;
	@NotBlank
	@Size(max = 255)
	private String boardcate;
	@Size(max = 255)
	private String boardexpl;
}

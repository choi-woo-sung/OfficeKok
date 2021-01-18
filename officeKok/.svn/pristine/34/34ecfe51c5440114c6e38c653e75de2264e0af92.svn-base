package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import kr.or.ddit.validate.UpdateGroup;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CalendarDetailVO implements Serializable {
	@NotBlank(groups=UpdateGroup.class)
	@Size(max = 22, groups=UpdateGroup.class)
	private Integer schedetailno; // 일정상세번호
	@NotBlank(groups=UpdateGroup.class)
	@Size(max = 22, groups=UpdateGroup.class)
	private Integer scheno; // 일정번호
	@NotBlank
	@Size(max = 255)
	private String schedetailnm; // 일정명
	@NotBlank
	@Size(max = 255)
	private String schedetailtype; // 구분
	@NotBlank
	@Size(max = 20)
	private String startdate; // 시작일
	@NotBlank
	@Size(max = 20)
	private String enddate; // 종료일
	@Size(max = 255)
	private String schedetailplace; // 장소
	@Size(max = 4000)
	private String schedetailcontent; // 내용
//	@NotBlank
	@Size(max = 1)
	private String openchk; // 공개여부
	private String modifydate; // 수정일자
	
	private String empnm;
	private String ranknm;
	
	private List<CalendarAttVO> calendarAttList;
}

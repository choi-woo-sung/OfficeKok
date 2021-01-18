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
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CalendarVO implements Serializable {

	@NotBlank(groups=UpdateGroup.class)
	@Size(max=22, groups=UpdateGroup.class)
	private Integer scheduleno; // 일정번호
	private Integer empno; // 사번
	private String scheduledate; // 날짜
	
	private String schedetailnm;
	private String startdate;
	private String enddate;
	private Integer schedetailno;
	private String schedetailtype;
	
	private String empnm;
	private String ranknm;

	private CalendarDetailVO calendarAllVO;
	
	private List<CalendarAttVO> calendarAttList;
}

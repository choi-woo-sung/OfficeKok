package kr.or.ddit.calendar.dao;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.CalendarAttVO;
import kr.or.ddit.vo.CalendarDetailVO;

@Repository
public interface ICalendarAttDAO {
	
	public int insertAtt(CalendarDetailVO calendarDetailVO);
	
	public CalendarAttVO selectAtt(int scheattno);
	
	public int deleteAtt(CalendarDetailVO calendarDetailVO);
}

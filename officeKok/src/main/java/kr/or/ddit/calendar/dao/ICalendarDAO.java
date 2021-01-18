package kr.or.ddit.calendar.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.deser.std.DateDeserializers.CalendarDeserializer;

import kr.or.ddit.vo.CalendarDetailVO;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.EmpVO;

/**
 * @author 정재은
 * @since 2020. 11. 04.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 04.      정재은       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface ICalendarDAO {
	
	/**
	 * 일정 목록 조회
	 * @param calendarVO
	 * @return
	 */
	public List<EmpVO> selectCalList(int empno);
	
	/**
	 * 일정 상세 조회
	 * @param calendarDetailVO
	 * @return
	 */
	public CalendarDetailVO selectCal(int schedetailno);
	
	/**
	 * 일정 등록
	 * @param calendarVO
	 * @return
	 */
	public int insertCal(CalendarVO calendarVO);
	
	/**
	 * 상세 일정 등록
	 * @param calendarVO
	 * @return
	 */
	public int insertCalDetail(CalendarDetailVO calendarDetailVO);

	/**
	 * 일정 수정
	 * @param calendarVO
	 * @return
	 */
	public int updateCal(CalendarVO calendarVO);
	
	/**
	 * 상세 일정 수정
	 * @param calendarDetailVO
	 * @return
	 */
	public int updateCalDetail(CalendarDetailVO calendarDetailVO);
	
	/**
	 * 메인 일정 목록 조회
	 * @param calendarVO
	 * @return
	 */
	public List<EmpVO> selectCalSubjectList(int empno);
}

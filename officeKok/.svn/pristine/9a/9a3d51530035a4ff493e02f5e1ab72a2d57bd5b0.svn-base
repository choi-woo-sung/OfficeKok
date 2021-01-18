package kr.or.ddit.calendar.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CalendarDetailVO;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.EmpVO;

public interface ICalendarService {

	/**
	 * 일정 목록 조회
	 * @param calendarVO
	 * @return
	 */
	public List<EmpVO> retrieveCalList(int empno);
	
	/**
	 * 일정 상세 조회
	 * @param calendarDetailVO
	 * @return
	 */
	public CalendarDetailVO retrieveCal(Integer schedetailno);
	
	/**
	 * 일정 등록
	 * @param calendarVO
	 * @return
	 */
	public ServiceResult createCal(CalendarVO calendarVO);
	
	/**
	 * 상세 일정 등록
	 * @param calendarVO
	 * @return
	 */
	public ServiceResult createCalDetail(CalendarDetailVO calendarDetailVO);
	
	/**
	 * 일정 수정
	 * @param calendarVO
	 * @return
	 */
	public ServiceResult modifyCal(CalendarVO calendarVO);
	
	/**
	 * 상세 일정 수정
	 * @param calendarDetailVO
	 * @return
	 */
	public ServiceResult modifyCalDetail(CalendarDetailVO calendarDetailVO);
	
	/**
	 * 메인 일정 목록 조회
	 * @param calendarVO
	 * @return
	 */
	public List<EmpVO> retrieveCalSubjectList(int empno);
}

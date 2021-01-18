package kr.or.ddit.attendance.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.CominfoVO;

/**
 * @author 이지윤
 * @since 2020. 11. 05.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 05.      이지윤       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IAttendanceDAO {
	
	/**
	 * 기준일자 조회
	 * @param vo
	 * @return
	 */
	public int selectDateno(AttendanceVO vo);
	
	/**
	 * 일일근태 조회
	 * @param vo
	 * @return
	 */
	public AttendanceVO selectOnedayAttendance(AttendanceVO vo);
	
	/**
	 * 출근시간 삽입
	 * @param vo
	 * @return
	 */
	public int insertTime(AttendanceVO vo);
	
	/**
	 * 퇴근시간, 근무시간, 연장근로시간 갱신, 수정
	 * @param vo
	 * @return
	 */
	public int updateTime(AttendanceVO vo);
	
	/**
	 * 회사 정보 조회(출근기준시, 퇴근기준시 조회)
	 * @return
	 */
	public CominfoVO selectCominfo();
	
	/**
	 * 연도별 연차,휴가 합계 조회
	 * @return
	 */
	public AttendanceVO selectAnnualRefresh(int empno);
	
	/**
	 * 근무시간, 연장근무시간, 휴일근무시간 조회
	 * @param vo
	 * @return
	 */
	public AttendanceVO selectWorkTime(AttendanceVO vo);
		
	/**
	 * 연차,휴가 내역 상세조회
	 * @param empno
	 * @return
	 */
	public List<AttendanceVO> selectRefreshDetail(int empno);
	
	/**
	 * 주간 근무시간 조회
	 * @return
	 */
	public int selectWeekTime(int empno);
}

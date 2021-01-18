package kr.or.ddit.main.service;

import java.util.List;

import kr.or.ddit.vo.ApprovalDocVO;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

/**
 * @author 이지윤
 * @since 2020. 11. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 16.      이지윤       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
public interface IMainService {

	/**
	 * 메인화면 출근시간, 퇴근시간 조회
	 * @param empno
	 * @return
	 */
	public AttendanceVO selectMainWorkTime(int empno);
	
	/**
	 * 메인화면 결재 대기 문서 조회
	 * @param apprdocno
	 * @return
	 */
	public List<ApprovalDocVO> getMainApprTodoList(int empno);
	
	/**
	 * 확인하지 않은 쪽지 개수
	 * @param pagingVO
	 * @return
	 */
	public List<NoteVO> selectUnreadCount(int empno);
}

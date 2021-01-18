package kr.or.ddit.manager.emp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PagingVO;

/**
 * @author 정재은
 * @since 2020. 10. 29.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 29.      정재은       최초작성
 * 2020. 11. 09.      최우성             수정
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IEmpDAO {
	
	/**
	 * 검색 조건에 맞는 구성원 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectEmpCount(PagingVO<EmpVO> pagingVO);
	
	/**
	 * 구성원 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<EmpVO> selectEmpList(PagingVO<EmpVO> pagingVO);
	
	/**
	 * 구성원 상세 조회
	 * @param empVO
	 * @return
	 */
	public EmpVO selectEmp(int empno);
	
	/**
	 * 로그인
	 * @param empmail
	 * @return
	 */
	public EmpVO selectLoginEmp(String empmail);
	
	/**
	 * 채팅리스트 사람 조회
	 * @param empno
	 * @return
	 */
	public List<EmpVO> selectChatEmpList(EmpVO empvo);
	
	/**
	 * 구성원 수정
	 * @param EmpVO
	 * @return
	 */
	public int updateEmp(EmpVO empvo);
}

package kr.or.ddit.manager.emp.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PagingVO;

public interface IEmpService {

	/**
	 * 검색 조건에 맞는 구성원 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int retrieveEmpCount(PagingVO<EmpVO> pagingVO);
	
	/**
	 * 구성원 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<EmpVO> retrieveEmpList(PagingVO<EmpVO> pagingVO);
	
	/**
	 * 구성원 상세 조회
	 * @param empVO
	 * @return
	 */
	public EmpVO retrieveEmp(int empno);
	
	public List<EmpVO> selectChatEmpList(EmpVO empvo);
	
	/**
	 * 구성원 수정
	 * @param empVO
	 * @return
	 */
	public ServiceResult modifyEmp(EmpVO empvo);
	
}

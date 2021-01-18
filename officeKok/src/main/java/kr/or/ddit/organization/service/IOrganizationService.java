package kr.or.ddit.organization.service;

import java.util.List;

import kr.or.ddit.vo.DeptVO;
import kr.or.ddit.vo.OrganizationVO;
import kr.or.ddit.vo.SearchVO;

/**
 * @author 이지윤
 * @since 2020. 10. 29.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 29.      이지윤       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
public interface IOrganizationService {
	/**
	 * 상위 부서 정보 조회
	 * @return
	 */
	public List<DeptVO> selectUpperDept();
	
	/**
	 * 조직도 정보 조회
	 * @return
	 */
	public List<OrganizationVO> selectOrganization();
	
	/**
	 * 부서 테이블에 Deptno의 가장 큰 숫자 정보 조회
	 * @return
	 */
	public int selectDeptnoMax();
	
	/**
	 * 부서 테이블 조회
	 * @return
	 */
	public List<DeptVO> selectDept();
	
	/**
	 * 최상위 루트 조회
	 * @return
	 */
	public OrganizationVO selectRoot();
	
}

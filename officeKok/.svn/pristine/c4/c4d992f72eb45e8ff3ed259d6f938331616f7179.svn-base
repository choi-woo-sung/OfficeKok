package kr.or.ddit.organization.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.organization.dao.IOrganizationDAO;
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
@Service
public class OrganizationServiceImpl implements IOrganizationService {
	@Inject
	private IOrganizationDAO dao;
	
	@Override
	public List<DeptVO> selectUpperDept() {
		return dao.selectUpperDept();
	}

	@Override
	public List<OrganizationVO> selectOrganization() {
		return dao.selectOrganization();
	}

	@Override
	public int selectDeptnoMax() {
		return dao.selectDeptnoMax();
	}

	@Override
	public List<DeptVO> selectDept() {
		return dao.selectDept();
	}

	@Override
	public OrganizationVO selectRoot() {
		return dao.selectRoot();
	}

}

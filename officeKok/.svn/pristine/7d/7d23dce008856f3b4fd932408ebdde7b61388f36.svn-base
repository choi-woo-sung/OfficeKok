package kr.or.ddit.manager.emp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.CustomException;
import kr.or.ddit.manager.emp.dao.IEmpDAO;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class EmpServiceImpl implements IEmpService {

	@Inject
	private IEmpDAO empDao;
	
	@Override
	public int retrieveEmpCount(PagingVO<EmpVO> pagingVO) {
		return empDao.selectEmpCount(pagingVO);
	}

	@Override
	public List<EmpVO> retrieveEmpList(PagingVO<EmpVO> pagingVO) {
		return empDao.selectEmpList(pagingVO);
	}

	@Override
	public EmpVO retrieveEmp(int empno) {
		EmpVO savedEmp = empDao.selectEmp(empno);
		if(savedEmp == null)
			throw new CustomException(empno + "은 존재하지 않는 사번입니다.");
		return savedEmp;
	}

	@Override
	public List<EmpVO> selectChatEmpList(EmpVO empvo) {
		return empDao.selectChatEmpList(empvo);
	}

	@Override
	public ServiceResult modifyEmp(EmpVO empvo) {
		int modifyDetail = empDao.updateEmp(empvo);
		ServiceResult result = ServiceResult.FAILED;
		if(modifyDetail > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}



}

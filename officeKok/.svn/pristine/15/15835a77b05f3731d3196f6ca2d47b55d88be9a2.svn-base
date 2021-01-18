package kr.or.ddit.approval.appr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.approval.appr.dao.IApprovalLineDAO;
import kr.or.ddit.approval.appr.dao.IApprovalStepDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ApprovalLineVO;
import kr.or.ddit.vo.ApprovalStepVO;

@Service
public class ApprovalLineServiceImpl implements IApprovalLineService {
	
	private IApprovalLineDAO apprLineDAO;
	private IApprovalStepDAO apprStepDAO;
	
	@Inject
	public void setApprLineDAO(IApprovalLineDAO apprLineDAO) {
		this.apprLineDAO = apprLineDAO;
	}
	
	@Inject
	public void setApprStepDAO(IApprovalStepDAO apprStepDAO) {
		this.apprStepDAO = apprStepDAO;
	}
	
	@Transactional
	@Override
	public ServiceResult registApprovalLine(ApprovalLineVO apprline) {
		ServiceResult result = ServiceResult.FAILED;
		int rowCnt = apprLineDAO.insertApprovalLine(apprline);
		if (rowCnt > 0) {
			for (ApprovalStepVO apprstep : apprline.getApprStepList()) {
				apprstep.setApprlineno(apprline.getApprlineno());
			}
			apprStepDAO.insertApprovalStep(apprline);
			
			result = ServiceResult.OK;
		}
		return result;
	}
	
	@Override
	public List<ApprovalLineVO> getApprovalLine(int apprlineno) {
		return apprLineDAO.selectApprovalLine(apprlineno);
	}
	
	@Override
	public List<ApprovalLineVO> getApprovalLineList(int empno) {
		return apprLineDAO.selectApprovalLineList(empno);
	}

	@Override
	public ServiceResult modifyApprovalLine(ApprovalLineVO apprline) {
		return null;
	}

	@Transactional
	@Override
	public ServiceResult removeApprovalLine(int apprlineno) {
		int rowCnt = apprStepDAO.deleteApprovalStepByLineNo(apprlineno);
		
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			apprLineDAO.deleteApprovalLine(apprlineno);
			
			result = ServiceResult.OK;
		}
		return result;
	}
}
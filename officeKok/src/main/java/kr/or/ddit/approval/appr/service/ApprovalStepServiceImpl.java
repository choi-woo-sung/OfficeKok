package kr.or.ddit.approval.appr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.approval.appr.dao.IApprovalStepDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ApprovalStepVO;

@Service
public class ApprovalStepServiceImpl implements IApprovalStepService {

	private IApprovalStepDAO apprStepDAO;
	
	@Inject
	public void setApprStepDAO(IApprovalStepDAO apprStepDAO) {
		this.apprStepDAO = apprStepDAO;
	}
	
	@Override
	public List<ApprovalStepVO> getApprovalStepList(String apprdocno) {
		return apprStepDAO.selectApprovalStepList(apprdocno);
	}
	
	@Override
	public int getLastStep(String apprdocno) {
		return apprStepDAO.selectLastStep(apprdocno);
	}

	@Override
	public ServiceResult modifyApprovalStep(ApprovalStepVO apprstep) {
		return null;
	}

	@Override
	public ServiceResult removeApprovalStepByLineNo(int apprlineno) {
		return null;
	}

	@Override
	public ServiceResult removeApprovalStepByStepNo(int apprstepno) {
		return null;
	}
}
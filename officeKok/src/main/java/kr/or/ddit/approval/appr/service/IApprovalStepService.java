package kr.or.ddit.approval.appr.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ApprovalStepVO;

public interface IApprovalStepService {
	public List<ApprovalStepVO> getApprovalStepList(String apprdocno);
	
	public int getLastStep(String apprdocno);
	
	public ServiceResult modifyApprovalStep(ApprovalStepVO apprline);
	
	public ServiceResult removeApprovalStepByLineNo(int apprlineno);
	
	public ServiceResult removeApprovalStepByStepNo(int apprstepno);
}
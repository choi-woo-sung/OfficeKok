package kr.or.ddit.approval.appr.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ApprovalLineVO;

public interface IApprovalLineService {
	
	public ServiceResult registApprovalLine(ApprovalLineVO apprline);
	
	public List<ApprovalLineVO> getApprovalLine(int apprlineno);
	
	public List<ApprovalLineVO> getApprovalLineList(int empno);
	
	public ServiceResult modifyApprovalLine(ApprovalLineVO apprline);
	
	public ServiceResult removeApprovalLine(int apprlineno);
}
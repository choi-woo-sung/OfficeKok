package kr.or.ddit.approval.appr.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ApprovalLineVO;
import kr.or.ddit.vo.ApprovalStepVO;

@Repository
public interface IApprovalStepDAO {
	public int insertApprovalStep(ApprovalLineVO apprline);
	
	public List<ApprovalStepVO> selectApprovalStepList(String apprdocno);
	
	public int selectFirstStep(String apprdocno);
	
	public int selectLastStep(String apprdocno);
	
	public int updateApprovalStep(ApprovalStepVO apprstep);
	
	public int deleteApprovalStepByLineNo(int apprlineno);
	
	public int deleteApprovalStepByStepNo(int apprstepno);
}
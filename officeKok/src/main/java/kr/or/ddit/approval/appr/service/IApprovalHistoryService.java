package kr.or.ddit.approval.appr.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ApprovalHistoryVO;

public interface IApprovalHistoryService {
	public ServiceResult registApprHistory(ApprovalHistoryVO approvalHistory);
	
	public int getApprHistoryCnt(String apprdocno);
	
	public List<ApprovalHistoryVO> getApprHistoryList(String apprdocno);
}
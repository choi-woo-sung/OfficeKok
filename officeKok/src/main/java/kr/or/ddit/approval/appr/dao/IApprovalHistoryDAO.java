package kr.or.ddit.approval.appr.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ApprovalHistoryVO;

@Repository
public interface IApprovalHistoryDAO {
	public int insertApprovalHistory(ApprovalHistoryVO approvalHistory);
	
	public int selectApprHistoryCnt(String apprdocno);
	
	public List<ApprovalHistoryVO> selectApprHistoryList(String apprdocno);
}
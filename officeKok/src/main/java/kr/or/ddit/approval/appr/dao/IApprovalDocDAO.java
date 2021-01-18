package kr.or.ddit.approval.appr.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ApprovalDocVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface IApprovalDocDAO {
	public int insertApprovalDoc(ApprovalDocVO approvalDoc);
	
	public int selectApprDraftCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> selectApprDraftList(PagingVO<ApprovalDocVO> paging);
	
	public int selectApprTempCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> selectApprTempList(PagingVO<ApprovalDocVO> paging);
	
	public int selectApprTodoCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> selectApprTodoList(PagingVO<ApprovalDocVO> paging);
	
	public int selectApprProcCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> selectApprProcList(PagingVO<ApprovalDocVO> paging);
	
	public int selectApprCompleteCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> selectApprCompleteList(PagingVO<ApprovalDocVO> paging);
	
	public int selectApprRejectCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> selectApprRejectList(PagingVO<ApprovalDocVO> paging);
	
	public ApprovalDocVO selectApprovalDoc(String apprdocno);
	
	public int updateApprovalDocState(ApprovalDocVO approval);
}
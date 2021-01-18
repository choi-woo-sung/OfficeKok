package kr.or.ddit.approval.appr.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ApprovalDocVO;
import kr.or.ddit.vo.PagingVO;

public interface IApprovalDocService {
	
	public ServiceResult registApprovalDoc(ApprovalDocVO approvalDoc);
	
	public int getApprDraftCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> getApprDraftList(PagingVO<ApprovalDocVO> paging);
	
	public int getApprTempCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> getApprTempList(PagingVO<ApprovalDocVO> paging);
	
	public int getApprTodoCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> getApprTodoList(PagingVO<ApprovalDocVO> paging);
	
	public int getApprProcCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> getApprProcList(PagingVO<ApprovalDocVO> paging);
	
	public int getApprCompleteCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> getApprCompleteList(PagingVO<ApprovalDocVO> paging);
	
	public int getApprRejectCnt(PagingVO<ApprovalDocVO> paging);
	
	public List<ApprovalDocVO> getApprRejectList(PagingVO<ApprovalDocVO> paging);
	
	public ApprovalDocVO getApprovalDoc(String apprdocno);
	
	public ServiceResult modifyApprovalDocState(ApprovalDocVO approval);
}

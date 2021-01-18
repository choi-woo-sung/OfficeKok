package kr.or.ddit.approval.doc.service;

import java.util.List;

import kr.or.ddit.vo.DocRefVO;
import kr.or.ddit.vo.PagingVO;

public interface IApprovalReferenceService {
	public List<DocRefVO> getDocRefList(String apprdocno);
	
	public int getReferenceCnt(PagingVO<DocRefVO> paging);
	
	public List<DocRefVO> getReferenceList(PagingVO<DocRefVO> paging);
}

package kr.or.ddit.approval.doc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.approval.doc.dao.IApprovalReferenceDAO;
import kr.or.ddit.vo.DocRefVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class ApprovalReferenceServiceImpl implements IApprovalReferenceService {

	private IApprovalReferenceDAO apprReferenceDAO;
	
	@Inject
	public void setApprReferenceDAO(IApprovalReferenceDAO apprReferenceDAO) {
		this.apprReferenceDAO = apprReferenceDAO;
	}
	
	@Override
	public List<DocRefVO> getDocRefList(String apprdocno) {
		return apprReferenceDAO.selectDocRefList(apprdocno);
	}

	@Override
	public int getReferenceCnt(PagingVO<DocRefVO> paging) {
		return apprReferenceDAO.selectReferenceCnt(paging);
	}

	@Override
	public List<DocRefVO> getReferenceList(PagingVO<DocRefVO> paging) {
		return apprReferenceDAO.selectReferenceList(paging);
	}
}
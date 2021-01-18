package kr.or.ddit.approval.doc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.DocRefVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface IApprovalReferenceDAO {
	public int insertApprReference(List<DocRefVO> docrefList);
	
	public List<DocRefVO> selectDocRefList(String apprdocno);
	
	public int selectReferenceCnt(PagingVO<DocRefVO> paging);
	
	public List<DocRefVO> selectReferenceList(PagingVO<DocRefVO> paging);
}
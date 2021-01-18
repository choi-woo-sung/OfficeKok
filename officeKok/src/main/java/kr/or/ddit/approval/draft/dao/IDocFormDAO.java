package kr.or.ddit.approval.draft.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.DocFormVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface IDocFormDAO {
	
	public DocFormVO selectDockForm(String docformno);
	
	public int selectDocFormCnt(PagingVO<DocFormVO> paging);
	
	public List<DocFormVO> selectDocFormList(PagingVO<DocFormVO> paging);
}
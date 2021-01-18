package kr.or.ddit.approval.draft.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.approval.draft.dao.IDocFormDAO;
import kr.or.ddit.vo.DocFormVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class DocFormServiceImpl implements IDocFormService {

	private IDocFormDAO docFormDAO;
	
	@Inject
	public void setDocFormDAO(IDocFormDAO docFormDAO) {
		this.docFormDAO = docFormDAO;
	}
	
	@Override
	public DocFormVO getDocForm(String docformno) {
		DocFormVO docForm = docFormDAO.selectDockForm(docformno);
		if (docForm == null) {
			throw new RuntimeException(docformno + "는 존재하지 않음");
		}
		return docForm;
	}
	
	@Override
	public int getDocFormCnt(PagingVO<DocFormVO> paging) {
		return docFormDAO.selectDocFormCnt(paging);
	}

	@Override
	public List<DocFormVO> getDocFormList(PagingVO<DocFormVO> paging) {
		return docFormDAO.selectDocFormList(paging);
	}
}
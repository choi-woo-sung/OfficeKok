package kr.or.ddit.approval.appr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.approval.appr.dao.IApprovalTypeDAO;
import kr.or.ddit.vo.ApprovalTypeVO;

@Service
public class ApprovalTypeServiceImpl implements IApprovalTypeService {

	private IApprovalTypeDAO approvalTypeDAO;
	
	@Inject
	public void setApprovalTypeDAO(IApprovalTypeDAO approvalTypeDAO) {
		this.approvalTypeDAO = approvalTypeDAO;
	}
	
	@Override
	public List<ApprovalTypeVO> getApprovalTypeList() {
		return approvalTypeDAO.selectApprTypeList();
	}
}
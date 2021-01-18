package kr.or.ddit.approval.appr.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.approval.appr.dao.IApprovalAttDAO;
import kr.or.ddit.approval.appr.dao.IApprovalDocDAO;
import kr.or.ddit.approval.appr.dao.IApprovalHistoryDAO;
import kr.or.ddit.approval.appr.dao.IApprovalStepDAO;
import kr.or.ddit.approval.dept.dao.IApprovalReceiveDAO;
import kr.or.ddit.approval.doc.dao.IApprovalReferenceDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.CustomException;
import kr.or.ddit.vo.ApprovalAttVO;
import kr.or.ddit.vo.ApprovalChargerVO;
import kr.or.ddit.vo.ApprovalDocVO;
import kr.or.ddit.vo.ApprovalHistoryVO;
import kr.or.ddit.vo.ApprovalRecieveDocVO;
import kr.or.ddit.vo.ApprovalRecipientVO;
import kr.or.ddit.vo.DocRefVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class ApprovalDocServiceImpl implements IApprovalDocService {
	
	@Inject
	private IApprovalDocDAO approvalDocDAO;
	@Inject
	private IApprovalAttDAO approvalAttDAO;
	@Inject
	private IApprovalStepDAO approvalStepDAO;
	@Inject
	private IApprovalHistoryDAO approvalHisDAO;
	@Inject
	private IApprovalReferenceDAO approvalRefDAO;
	@Inject
	private IApprovalReceiveDAO approvalReceiveDAO;

	@Value("#{appInfo.attatchPath}")
	File saveFolder;
	
	@PostConstruct
	public void init() {
		System.out.println(saveFolder.getAbsolutePath());
		
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
	}
	
	@Transactional
	@Override
	public ServiceResult registApprovalDoc(ApprovalDocVO approvalDoc) {
		int insertResult = approvalDocDAO.insertApprovalDoc(approvalDoc);
		String service = approvalDoc.getService();
		
		ServiceResult result = ServiceResult.FAILED;
		if (insertResult > 0) {
			if (!"temp".equals(service)) {
				int apprstepno = approvalStepDAO.selectFirstStep(approvalDoc.getApprdocno());
				
				ApprovalHistoryVO draftHistory = new ApprovalHistoryVO();
				
				draftHistory.setApprdocno(approvalDoc.getApprdocno());
				draftHistory.setApprhisstate(1);
				draftHistory.setApprstepno(apprstepno);
				
				approvalHisDAO.insertApprovalHistory(draftHistory);
				
				String references = approvalDoc.getReferences();
				if (!(references == null) && !"".equals(references)) {
					List<DocRefVO> referenceList = new ArrayList<>();
					String[] referenceArray = references.split("/");
					for (String reference : referenceArray) {
						DocRefVO docref = new DocRefVO(); 
						Integer empno = Integer.parseInt(reference);
						docref.setEmpno(empno);
						docref.setRefdocno(approvalDoc.getApprdocno());
						referenceList.add(docref);
					}
					approvalRefDAO.insertApprReference(referenceList);
				}
				Integer deptno = approvalDoc.getDeptno();
				if (deptno != null && deptno != 0) {
					ApprovalRecipientVO recipient = new ApprovalRecipientVO();
					recipient.setDeptno(deptno);
					recipient.setApprdocno(approvalDoc.getApprdocno());
					
					approvalReceiveDAO.insertRecipient(recipient);
					
					Integer chargerempno = approvalDoc.getChargerempno();
					ApprovalChargerVO charger = new ApprovalChargerVO();
					charger.setChargerempno(chargerempno);
					
					approvalReceiveDAO.insertCharger(charger);
					
					ApprovalRecieveDocVO receiveDoc = new ApprovalRecieveDocVO();
					receiveDoc.setRecipientno(recipient.getRecipientno());
					receiveDoc.setChargerno(charger.getChargerno());
					
					approvalReceiveDAO.insertApprReceiveDoc(receiveDoc);
				}
			}
			try {
				processAttatchFiles(approvalDoc);
			} catch (IOException e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public int getApprDraftCnt(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprDraftCnt(paging);
	}

	@Override
	public List<ApprovalDocVO> getApprDraftList(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprDraftList(paging);
	}

	@Override
	public int getApprTempCnt(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprTempCnt(paging);
	}

	@Override
	public List<ApprovalDocVO> getApprTempList(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprTempList(paging);
	}

	@Override
	public int getApprTodoCnt(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprTodoCnt(paging);
	}

	@Override
	public List<ApprovalDocVO> getApprTodoList(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprTodoList(paging);
	}

	@Override
	public int getApprProcCnt(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprProcCnt(paging);
	}

	@Override
	public List<ApprovalDocVO> getApprProcList(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprProcList(paging);
	}

	@Override
	public int getApprCompleteCnt(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprCompleteCnt(paging);
	}

	@Override
	public List<ApprovalDocVO> getApprCompleteList(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprCompleteList(paging);
	}
	
	@Override
	public int getApprRejectCnt(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprRejectCnt(paging);
	}

	@Override
	public List<ApprovalDocVO> getApprRejectList(PagingVO<ApprovalDocVO> paging) {
		return approvalDocDAO.selectApprRejectList(paging);
	}

	@Override
	public ApprovalDocVO getApprovalDoc(String apprdocno) {
		ApprovalDocVO approval = approvalDocDAO.selectApprovalDoc(apprdocno);
		if (approval == null) {
			throw new CustomException(apprdocno + "은 존재하지 않는 문서입니다.");
		}
		return approval;
	}

	public boolean processAttatchFiles(ApprovalDocVO approvalDoc) throws IOException {
		List<ApprovalAttVO> attatchList = approvalDoc.getApprAttList();
		if (attatchList == null || attatchList.size() == 0) {
			return true;
		}
		int rowCnt = approvalAttDAO.insertApprovalAtt(approvalDoc);
		if (rowCnt > 0) {
			for (ApprovalAttVO attatch : attatchList) {
				attatch.saveFile(saveFolder);
			}
		}
		return rowCnt > 0;
	}

	@Override
	public ServiceResult modifyApprovalDocState(ApprovalDocVO approval) {
		ServiceResult result = ServiceResult.FAILED;
		int updateResult = approvalDocDAO.updateApprovalDocState(approval);
		if (updateResult > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}
}
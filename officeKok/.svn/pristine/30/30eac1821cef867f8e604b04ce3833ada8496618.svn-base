package kr.or.ddit.approval.appr.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.approval.appr.dao.IApprovalAttDAO;
import kr.or.ddit.approval.appr.dao.IApprovalDocDAO;
import kr.or.ddit.approval.appr.dao.IApprovalHistoryDAO;
import kr.or.ddit.approval.appr.dao.IApprovalStepDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ApprovalDocVO;
import kr.or.ddit.vo.ApprovalHisAttVO;
import kr.or.ddit.vo.ApprovalHistoryVO;

@Service
public class ApprovalHistoryServiceImpl implements IApprovalHistoryService {
	
	private IApprovalDocDAO approvalDocDAO;
	private IApprovalHistoryDAO apprHistoryDAO;
	private IApprovalStepDAO apprStepDAO;
	private IApprovalAttDAO apprAttDAO;
	
	@Value("#{appInfo.attatchPath}")
	File saveFolder;
	
	@Inject
	public void setApprHistoryDAO(IApprovalHistoryDAO apprHistoryDAO) {
		this.apprHistoryDAO = apprHistoryDAO;
	}
	
	@Inject
	public void setApprAttDAO(IApprovalAttDAO apprAttDAO) {
		this.apprAttDAO = apprAttDAO;
	}
	
	@Inject
	public void setApprovalDocDAO(IApprovalDocDAO approvalDocDAO) {
		this.approvalDocDAO = approvalDocDAO;
	}
	
	@Inject
	public void setApprStepDAO(IApprovalStepDAO apprStepDAO) {
		this.apprStepDAO = apprStepDAO;
	}

	@Transactional
	@Override
	public ServiceResult registApprHistory(ApprovalHistoryVO approvalHistory) {
		int insertResult = apprHistoryDAO.insertApprovalHistory(approvalHistory);
		
		ServiceResult result = ServiceResult.FAILED;
		if (insertResult > 0) {
			ApprovalDocVO apprdoc = approvalDocDAO.selectApprovalDoc(approvalHistory.getApprdocno());
			if (approvalHistory.getApprhisstate() == 3) {
				apprdoc.setApprdocstate(4);
				approvalDocDAO.updateApprovalDocState(apprdoc);
			} else if(approvalHistory.getApprhisstate() == 2 && 
					approvalHistory.getApprstepprior() == apprStepDAO.selectLastStep(approvalHistory.getApprdocno())) {
				apprdoc.setApprdocstate(3);
				approvalDocDAO.updateApprovalDocState(apprdoc);
			}
			System.out.println(approvalHistory.getApprHisAtt().size());
//			apprAttDAO.insertApprovalHisAtt(approvalHistory);
//			try {
////				processAttatchFiles(approvalHistory);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			result = ServiceResult.OK;
		}
		return result;
	}
	
	@Override
	public int getApprHistoryCnt(String apprdocno) {
		return apprHistoryDAO.selectApprHistoryCnt(apprdocno);
	}

	@Override
	public List<ApprovalHistoryVO> getApprHistoryList(String apprdocno) {
		return apprHistoryDAO.selectApprHistoryList(apprdocno);
	}
	
//	public boolean processAttatchFiles(ApprovalHistoryVO apprHistory) throws IOException {
//		List<ApprovalHisAttVO> attatchList = apprHistory.getApprHisAtt();
//		if (attatchList == null || attatchList.size() == 0) {
//			return true;
//		}
////		int rowCnt = apprAttDAO.insertApprovalHisAtt(apprHistory);
//		if (rowCnt > 0) {
//			for (ApprovalHisAttVO attatch : attatchList) {
//				attatch.saveFile(saveFolder);
//			}
//		}
//		return rowCnt > 0;
//	}
}
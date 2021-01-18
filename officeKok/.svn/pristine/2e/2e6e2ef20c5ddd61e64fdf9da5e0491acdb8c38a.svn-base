package kr.or.ddit.approval.dept.dao;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ApprovalChargerVO;
import kr.or.ddit.vo.ApprovalRecieveDocVO;
import kr.or.ddit.vo.ApprovalRecipientVO;

@Repository
public interface IApprovalReceiveDAO {
	public int insertRecipient(ApprovalRecipientVO recipient);
	
	public int insertApprReceiveDoc(ApprovalRecieveDocVO receiveDoc);
	
	public int insertCharger(ApprovalChargerVO charger);
	
	public ApprovalRecipientVO selectRecipient(String apprdocno);
}

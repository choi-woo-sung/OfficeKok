package kr.or.ddit.mail.mailinfo.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mail.mailinfo.dao.IEmailAccInfoDAO;
import kr.or.ddit.vo.EmailAccInfoVO;

@Service
public class EmailAccInfoServiceImpl implements IEmailAccInfoService {

	private IEmailAccInfoDAO emailAccInfoDAO;
	
	@Inject
	public void setEmailAccInfoDAO(IEmailAccInfoDAO emailAccInfoDAO) {
		this.emailAccInfoDAO = emailAccInfoDAO;
	}
	
	@Override
	public ServiceResult registEmailAccInfo(EmailAccInfoVO emailAccInfo) {
		ServiceResult result = ServiceResult.FAILED;
		EmailAccInfoVO duplicateChk = emailAccInfoDAO.selectEmailAccInfo(emailAccInfo.getEmpno());
		if (duplicateChk != null) {
			result = ServiceResult.PKDUPLICATED;
		} else {
			int rowCnt = emailAccInfoDAO.insertEmailAccInfo(emailAccInfo);
			if (rowCnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}

	@Override
	public EmailAccInfoVO getEmailAccInfo(int empno) {
		EmailAccInfoVO emailAccInfo = null;
		emailAccInfo = emailAccInfoDAO.selectEmailAccInfo(empno); 
		return emailAccInfo;
	}
}
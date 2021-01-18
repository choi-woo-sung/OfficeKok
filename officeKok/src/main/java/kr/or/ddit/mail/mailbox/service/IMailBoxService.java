package kr.or.ddit.mail.mailbox.service;

import java.util.Map;

import kr.or.ddit.enumpkg.ServiceResult;

public interface IMailBoxService {
	public ServiceResult registMailBox(Map<String, Object> folderMap);
}
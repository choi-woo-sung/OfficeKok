package kr.or.ddit.mail.mailbox.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mail.mailbox.dao.IMailBoxDAO;
import kr.or.ddit.vo.EmailAccInfoVO;
import kr.or.ddit.vo.MailBoxVO;
import kr.or.ddit.vo.MailVO;

@Service
public class MailBoxServiceImpl implements IMailBoxService {

	@Inject
	private IMailBoxDAO mailBoxDAO;

	@Transactional
	@Override
	public ServiceResult registMailBox(Map<String, Object> folderMap) {
		ServiceResult result = ServiceResult.FAILED;

		Folder[] folders = (Folder[]) folderMap.get("folders");
		EmailAccInfoVO authEmailAccInfo = (EmailAccInfoVO) folderMap.get("authEmailAccInfo");

		List<MailBoxVO> mailBoxList = new ArrayList<>();
		List<MailVO> mailList = new ArrayList<>();
		
		try {

			Integer mailboxno = mailBoxDAO.selectMailBoxNo();
			for (Folder folder : folders) {
				if ("[Gmail]".equals(folder.getName()) || "INBOX".equals(folder.getName())
						|| "중요".equals(folder.getName())) {
					continue;
				}
				folder.open(Folder.READ_ONLY);
				
				

				MailBoxVO mailBox = setMailBox(mailboxno, authEmailAccInfo, folder);
				mailBoxList.add(mailBox);

				mailboxno += 1;

				System.out.println("메시지 갯수 : " + folder.getMessageCount());
				System.out.println("폴더 이름 : " + folder.getName());
				System.out.println("폴더 타입 : " + folder.getType());

				int messageCnt = folder.getMessageCount();
				
				Message[] messages = folder.getMessages();
				
				if (messageCnt > 0) {
//					Message[] messages = folder.getMessages();
					for (Message msg : messages) {
						String content = "";
						if ("Multipart".contains(msg.getContent().toString())) {
							Multipart multiPart = (Multipart) msg.getContent();
							int multiPartCnt = multiPart.getCount();
							
//							multiPart.getBodyPart(i);

							if (multiPartCnt > 0) {
								for (int i = 0; i < multiPart.getCount(); i++) {
									MimeBodyPart bodyPart = (MimeBodyPart) multiPart.getBodyPart(i);
									if ("text/html".contains(bodyPart.getContentType())
											|| "text/plain".contains(bodyPart.getContentType())) {
										content = bodyPart.getContent().toString();
									} else {
//										bodyPart.saveFile();
									}
								}
							}
						}

						System.out.println("메일 제목 : " + msg.getSubject());
					}
				}
			}

//			int rowCnt = mailBoxDAO.insertMailBox(mailBoxList);
//			if (rowCnt > 0) {
//				List<MailBoxVO> mailBoxs = mailBoxDAO.selectMailBoxList(authEmailAccInfo.getEmailaccinfono());
//
//				for (MailBoxVO mailBox : mailBoxs) {
//					try {
//						for (Folder folder : folders) {
//							if (!folder.getName().equals(mailBox.getMailboxnm())) {
//								continue;
//							}
//							folder.open(Folder.READ_ONLY);
//
//							Message[] messages = folder.getMessages();
//							if (messages != null) {
//								for (Message msg : messages) {
//									String content = "";
//									if ("Multipart".contains(msg.getContent().toString())) {
//										Multipart multiPart = (Multipart) msg.getContent();
//										int multiPartCnt = multiPart.getCount();
//
//										if (multiPartCnt > 0) {
//											for (int i = 0; i < multiPart.getCount(); i++) {
//												MimeBodyPart bodyPart = (MimeBodyPart) multiPart.getBodyPart(i);
//												if ("text/html".contains(bodyPart.getContentType())
//														|| "text/plain".contains(bodyPart.getContentType())) {
//													content = bodyPart.getContent().toString();
//												}
//											}
//										}
//									}
//
//									System.out.println("메일 제목 : " + msg.getSubject());
//								}
//							}
//						}
//					} catch (MessagingException e) {
//						e.printStackTrace();
//					}
////				}
//
//				result = ServiceResult.OK;
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public MailBoxVO setMailBox(Integer mailboxno, EmailAccInfoVO authEmailAccInfo, Folder folder) {
		MailBoxVO mailBox = new MailBoxVO();
		mailBox.setMailboxno(mailboxno);
		mailBox.setEmailaccinfono(authEmailAccInfo.getEmailaccinfono());
		mailBox.setMailboxnm(folder.getName());
		return mailBox;
	}

	public List<MailVO> setMailList(Folder[] folders, MailBoxVO mailBox) throws IOException {
		List<MailVO> mailList = new ArrayList<>();

		return mailList;
	}
}
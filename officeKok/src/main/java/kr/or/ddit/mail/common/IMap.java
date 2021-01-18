package kr.or.ddit.mail.common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.MimeBodyPart;

import kr.or.ddit.vo.EmailAccInfoVO;
import kr.or.ddit.vo.MailVO;

public class IMap {
	private String protocol = "imap";
	private String inbox = "INBOX";
	
	private Store store;
	private Folder folder;
	
	public void connect(EmailAccInfoVO authEmailAccInfo) {
		Properties props = new Properties();
		props.put("mail.imap.ssl.enable", "true");
		props.put("mail.imap.auth.mechanisms", "XOAUTH2");
		Session session = Session.getInstance(props);

		try {
			store = session.getStore(protocol);
			store.connect("imap.gmail.com", authEmailAccInfo.getEmpmail(), authEmailAccInfo.getAccess_token());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void saveMail(EmailAccInfoVO authEmailAccInfo) {
		Properties props = new Properties();
		props.put("mail.imap.ssl.enable", "true");
		props.put("mail.imap.auth.mechanisms", "XOAUTH2");
		Session session = Session.getInstance(props);
		
		try {
			Store store = session.getStore("imap");
			
			store.connect("imap.gmail.com", authEmailAccInfo.getEmpmail(), authEmailAccInfo.getAccess_token());
			
			Folder folder = store.getFolder("INBOX");
			folder.open(Folder.READ_ONLY);
			
			List<MailVO> mailList = new ArrayList<>();
			
			Message[] messages = folder.getMessages();
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
			
			for (Message msg : messages) {
				MailVO mail = new MailVO();
				String sentDate = sdf.format(msg.getSentDate());
				String receivedDate = sdf.format(msg.getReceivedDate());
				String content = "";
				if (msg.getContent().toString().contains("Multipart")) {
					Multipart multiPart = (Multipart) msg.getContent();
					for (int i = 0;  i < multiPart.getCount(); i ++) {
						MimeBodyPart mimeBodyPart = (MimeBodyPart) multiPart.getBodyPart(i);
						if (mimeBodyPart.getContentType().contains("text/html") || mimeBodyPart.getContentType().contains("text/plain")) {
							content = mimeBodyPart.getContent().toString();
						}
					}
				}
				
				
				
			}
			
			for (Message msg : messages) {
				System.out.println("메일 제목 : " + msg.getSubject());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
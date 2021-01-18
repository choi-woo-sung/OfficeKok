package kr.or.ddit.mail.read.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Folder;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mail.mailinfo.service.IEmailAccInfoService;
import kr.or.ddit.vo.EmailAccInfoVO;
import kr.or.ddit.vo.EmpVO;

/**
 * @author 안승원
 * @since 2020. 10. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 26.      안승원       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/mail/receive")
public class MailReceiveController {
	private String url = "https://www.googleapis.com/oauth2/v4/token";
	private String redirect_uri = "http://localhost/officeKok/mail/receive/token";
	private String client_id = "194180887465-ctas4fs561j9d2kuok9fg98ttjtcte1c.apps.googleusercontent.com";
	private String client_secret = "2-_mBCrlkXt6rJEsEODlMoNy";
	private String grant_type = "authorization_code";
	
	private IEmailAccInfoService emailAccInfoService;
	
	@Inject
	public void setEmailAccInfoService(IEmailAccInfoService emailAccInfoService) {
		this.emailAccInfoService = emailAccInfoService;
	}
	
	@GetMapping("/token")
	@PreAuthorize("isAuthenticated()")
	public String getOAuthToken(@RequestParam(name = "code") String code,
				@AuthenticationPrincipal(expression = "emp") EmpVO emp,
				ModelAndView mnv) {
		EmailAccInfoVO emailAccInfo = emailAccInfoService.getEmailAccInfo(emp.getEmpno());
		if (emailAccInfo == null) {

			Map<String, String> params = new HashMap<String, String>();
			params.put("redirect_uri", redirect_uri);
			params.put("client_id", client_id);
			params.put("client_secret", client_secret);
			params.put("grant_type", grant_type);
			params.put("code", code);

			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<HashMap> response = restTemplate.postForEntity(url, params, HashMap.class );
//			mnv.addObject("url", url);
//			mnv.addObject("redirect_uri", redirect_uri);
//			mnv.addObject("client_id", client_id);
//			mnv.addObject("client_secret", client_secret);
//			mnv.addObject("grant_type", grant_type);
//			mnv.addObject("code", code);
//			mnv.setViewName("mail/tokenForm");
			Map<String, Object> resultMap = response.getBody();
			return null;
			
		} else {
//			mnv.setViewName("redirect:/mail/receive");
		}
		return null;
	}
	
	@PostMapping("/regist")
	@ResponseBody
	public ModelAndView registOAuthToken(@ModelAttribute(name = "emailAccInfo") EmailAccInfoVO emailAccInfo, 
									@AuthenticationPrincipal(expression = "emp") EmpVO emp, ModelAndView mnv) throws MessagingException, IOException {
		emailAccInfo.setEmpno(emp.getEmpno());
		
		System.out.println(emailAccInfo.toString());
		
		ServiceResult result = emailAccInfoService.registEmailAccInfo(emailAccInfo);
		
		switch (result) {
		case FAILED:
			mnv.setViewName("redirect:/main");
			break;
		default:
			mnv.setViewName("redirect:/mail/receive");
			break;
		}
		return mnv;
	}
	
	@GetMapping
	@PreAuthorize("isAuthenticated()")
	public ModelAndView getMailList(@AuthenticationPrincipal(expression = "emp") EmpVO emp) {
		EmailAccInfoVO emailAccInfo = emailAccInfoService.getEmailAccInfo(emp.getEmpno());
		ModelAndView mnv = getFolders(emailAccInfo);
		return mnv;
	}
	
	public ModelAndView getFolders(EmailAccInfoVO emailAccInfo) {
		Properties props = new Properties();
		props.put("mail.imap.ssl.enable", "true");
		props.put("mail.imap.auth.mechanisms", "XOAUTH2");
		Session session = Session.getInstance(props);
		
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("mail/receiveMailList");
		try {
		
			Store store = session.getStore("imap");
			
			store.connect("imap.gmail.com", emailAccInfo.getEmpmail(), emailAccInfo.getAccess_token());
			
			Folder[] foldrs = store.getDefaultFolder().list("*");
			
//			Folder[] folders = store.getDefaultFolder().list("*");
////			Folder folder = store.getFolder("[Gmail]");
//			
//			for (Folder folder : folders) {
//				System.out.println("folder 이름" + folder.getName());
//				if ("[Gmail]".equals(folder.getName())) {
//					continue;
//				}
//				folder.open(Folder.READ_ONLY);
//				System.out.println("메시지 갯수 : " + folder.getMessageCount());
//				Message[] messages = folder.getMessages();
//				if (messages != null) {
//					for (Message msg : messages) {
//						System.out.println("메일 제목 : " + msg.getSubject());
//					}
//				}
//			}
//			folder.open(Folder.READ_ONLY);
			
//			Message[] messages = folder.getMessages();
//			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
//			
//			for (Message msg : messages) {
//				String sentDate = sdf.format(msg.getSentDate());
//				String content = "";
//				if (msg.getContent().toString().contains("Multipart")) {
//					Multipart multiPart = (Multipart) msg.getContent();
//					for (int i = 0;  i < multiPart.getCount(); i ++) {
//						MimeBodyPart mimeBodyPart = (MimeBodyPart) multiPart.getBodyPart(i);
//						if (mimeBodyPart.getContentType().contains("text/html")) {
//							content = mimeBodyPart.getContent().toString();
//						}
//					}
//				}
//			}
			
//			for (Message msg : messages) {
//				System.out.println("메일 제목 : " + msg.getSubject());
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mnv;
	}
}
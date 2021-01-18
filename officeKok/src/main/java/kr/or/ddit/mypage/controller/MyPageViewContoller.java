package kr.or.ddit.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.MimeBodyPart;
import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mail.mailbox.service.IMailBoxService;
import kr.or.ddit.mail.mailinfo.service.IEmailAccInfoService;
import kr.or.ddit.manager.emp.service.IEmpService;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.EmailAccInfoVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.EmpWrapper;
import kr.or.ddit.vo.MailVO;

/**
 * @author 안승원
 * @since 2020. 10. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 27.      안승원       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 *      </pre>
 */
@Controller
@RequestMapping("/mypage")
public class MyPageViewContoller {
	private String url = "https://www.googleapis.com/oauth2/v4/token";
	private String redirect_uri = "http://localhost/officeKok/mypage/token";
	private String client_id = "194180887465-ctas4fs561j9d2kuok9fg98ttjtcte1c.apps.googleusercontent.com";
	private String client_secret = "2-_mBCrlkXt6rJEsEODlMoNy";
	private String grant_type = "authorization_code";
	
	private String protocol = "imap";
	private String inbox = "INBOX";
	
	@Value("#{appInfo.attatchPath}")
	File saveFolder;

	private Store store;
	private Folder folder;
	private Message[] msgs;
	
	@Inject
	private IEmpService empservice;
	@Inject
	private IEmailAccInfoService emailAccInfoService;
	@Inject
	private IMailBoxService mailBoxService;
	
	
	
	@GetMapping
	public String get(@AuthenticationPrincipal(expression = "emp") EmpVO emp, Model model) {
		EmpVO empvo = empservice.retrieveEmp(emp.getEmpno());
		model.addAttribute("emp", empvo);
		return "mypage/myPageView";
	}

	@PostMapping
	public String doPost(@AuthenticationPrincipal(expression = "emp") EmpVO authemp,
			@Validated(UpdateGroup.class) @ModelAttribute EmpVO emp, Errors errors, Model model)
			throws ServletException, IOException {
		emp.toString();

		emp.setEmppw(emp.getEmppw2() + "{" + emp.getEmpmail() + "}");

		authemp.setEmppw(emp.getEmppw());
		authemp.setEmphp(emp.getEmphp());
		authemp.setEmpadd1(emp.getEmpadd1());
		authemp.setEmpadd2(emp.getEmpadd2());
		authemp.setEmpzip(emp.getEmpzip());
		authemp.setEmpmail(emp.getEmpmail());
		authemp.setpro_imagefile(emp.getPro_imagefile());
		authemp.setProimgfile(emp.getProimgfile());

		EmpWrapper empWrapper = new EmpWrapper(authemp);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		Authentication auth2 = new Authentication() {

			@Override
			public String getName() {
				return auth.getName();
			}

			@Override
			public void setAuthenticated(boolean isAuthenticated) throws IllegalArgumentException {

			}

			@Override
			public boolean isAuthenticated() {
				return auth.isAuthenticated();
			}

			@Override
			public Object getPrincipal() {
				return empWrapper;
			}

			@Override
			public Object getDetails() {
				return auth.getDetails();
			}

			@Override
			public Object getCredentials() {
				return auth.getCredentials();
			}

			@Override
			public Collection<? extends GrantedAuthority> getAuthorities() {
				return auth.getAuthorities();
			}
		};
		SecurityContextHolder.getContext().setAuthentication(auth2);
		boolean valid = !errors.hasErrors();

		String goPage = null;
		String message = null;
		if (valid) {
//		3. 통과
//		4. 통과한 경우, 로직을 이용한 등록
			ServiceResult result = empservice.modifyEmp(emp);
			switch (result) {
			case FAILED:
				goPage = "board/boardForm";
				message = "서버 문제로 등록이 완료되지 않았습니다 잠시 후 다시 시도해주세요.";
				break;

			default:
//				PostRedirectGet pattern
				goPage = "redirect: mypage";
				break;
			}

		} else {
	   model.addAttribute("emp", emp);
			goPage = "mypage/myPageView";
		}
//		  등록 이후의 경우의 수에 대한 처리
		model.addAttribute("message", message);
		return goPage;
	}
	
	@GetMapping("/token")
	@PreAuthorize("isAuthenticated()")
	public ModelAndView gmailAuth(@RequestParam(name = "code") String code,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp,
			ModelAndView mnv) {
		
		String msg = null;
		EmailAccInfoVO authEmailAccInfo = emailAccInfoService.getEmailAccInfo(emp.getEmpno());
		if (authEmailAccInfo == null) {
			Map<String, Object> resultMap = getAccessToken(code);
			
			EmailAccInfoVO emailAccInfo = setEmailAccInfo(resultMap, emp);
			
			ServiceResult result = emailAccInfoService.registEmailAccInfo(emailAccInfo);
			
			switch (result) {
			case FAILED:
				msg = "서버 문제로 이메일 계정 등록을 실패하였습니다. 잠시 후에 다시 시도해주세요.";
				break;
			case PKDUPLICATED:
				msg = "이미 등록된 이메일 계정입니다.";
				break;
			default:
				EmailAccInfoVO authEmailInfo = emailAccInfoService.getEmailAccInfo(emp.getEmpno());
				System.out.println(authEmailInfo.toString());
				msg = "이메일 계정 등록을 성공했습니다.";
				
//				saveMail(authEmailInfo);
				
				break;
			}
		}
		
		mnv.addObject("msg", msg);
		mnv.setViewName("mypage/myPageView");
		mnv.addObject("emp", emp);
		return mnv;
	}
	
	/**
	 * access_token 발급
	 * @param code
	 * @return
	 */
	public Map<String, Object> getAccessToken(String code) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("redirect_uri", redirect_uri);
		params.put("client_id", client_id);
		params.put("client_secret", client_secret);
		params.put("grant_type", grant_type);
		params.put("code", code);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<HashMap> response = restTemplate.postForEntity(url, params, HashMap.class );
		return response.getBody();
	}
	
	/**
	 * EmailAccInfoVO 세팅
	 * @param resultMap
	 * @param emp
	 * @return
	 */
	public EmailAccInfoVO setEmailAccInfo(Map<String, Object> resultMap, EmpVO emp) {
		String access_token = (String) resultMap.get("access_token");
		String refresh_token = (String) resultMap.get("refresh_token");
		long expires_in = ((Integer) resultMap.get("expires_in")).longValue();
		Integer empno = emp.getEmpno();
		
		EmailAccInfoVO emailAccInfo = new EmailAccInfoVO();
		
		Date today = new Date();
		long emailaccinfodate = today.getTime();
		
		emailAccInfo.setEmpno(empno);
		emailAccInfo.setEmailaccinfodate(emailaccinfodate);
		emailAccInfo.setAccess_token(access_token);
		emailAccInfo.setRefresh_token(refresh_token);
		emailAccInfo.setExpires_in(expires_in);
		
		return emailAccInfo;
	}
	
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
	
	public void disconnect() {
		try {
			if (folder != null)
				folder.close(false);
			store.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
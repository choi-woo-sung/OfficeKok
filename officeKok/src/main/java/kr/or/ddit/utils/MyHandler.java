package kr.or.ddit.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.EmpWrapper;

public class MyHandler extends TextWebSocketHandler {

	@Resource(name = "AlarmList")
	private List<WebSocketSession> alarmList;

	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();

	// 서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 세션에다 담기

		alarmList.add(session);
		String senderEmail = getEmail(session);
		userSessionsMap.put(senderEmail, session);

		// usersessions맵에다가 이메일 형식으로 session을 담아놓음.
	}

	// 소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//			String senderEmail = getEmail(session);
		// 모든 유저에게 보낸다 - 브로드 캐스팅
//			for (WebSocketSession sess : sessions) {
//				sess.sendMessage(new TextMessage(senderNickname + ": " +  message.getPayload()));
//			}

		// protocol : cmd = 메일 , 쪽지, 전자결제, 화상채팅 , 작성자 , seq (reply , user2 , user1 , 12)
		String msg = message.getPayload();
		if (StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");

			if (strs != null) {
				String cmd = strs[0];
				String caller = strs[1];
				String receiver = strs[2]; // 이름이구나?
				String receiverEmail = strs[3];
				String seq =null;
				if (strs.length>=5) {
					seq = strs[4];
				}
				
				String boardno = null;
				
				if (strs.length==6) {
					boardno = strs[5];
				}
				;

				// 작성자가 로그인 해서 있다면 !! 와우 미쳤네;;
				WebSocketSession boardWriterSession = userSessionsMap.get(receiverEmail);

				if ("reply".equals(cmd) && boardWriterSession != null) {
					if (boardno.equals("10")) {
//						TextMessage tmpMsg = new TextMessage("<a href='/officeKok/board/totalRead/" + seq
//								+ "' class='dropdown-item media'><div class='media-left'> <i class='fa fa-envelope media-object bg-silver-darker'></i>"
//								+ "<i class='fab fa-google text-warning media-object-icon f-s-14'></i> "
//								+ "</div> <div class='media-body'>" + "<h6 class='media-heading'>" + caller
//								+ "님이 댓글을 남겼습니다.</h6>");
						
						TextMessage tmpMsg = new TextMessage(caller + "에게 메세지가 왔습니다!@@@@@/officeKok/board/totalRead/" + seq);
						boardWriterSession.sendMessage(tmpMsg);
					} else {
//						TextMessage tmpMsg = new TextMessage("<a href='/officeKok/board/deptRead/" + seq
//								+ "' class='dropdown-item media'><div class='media-left'> <i class='fa fa-envelope media-object bg-silver-darker'></i>"
//								+ "<i class='fab fa-google text-warning media-object-icon f-s-14'></i> "
//								+ "</div> <div class='media-body'>" + "<h6 class='media-heading'>" + caller
//								+ "님이 댓글을 남겼습니다.</h6>");
						TextMessage tmpMsg = new TextMessage(caller + "에게 메세지가 왔습니다!@@@@@/officeKok/board/deptRead/" + seq);
						boardWriterSession.sendMessage(tmpMsg);

					}
					// 님이 당신에게 메일을 보냈습니다.
				} else if ("appr".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver + "님을 팔로우를 시작했습니다.");
					boardWriterSession.sendMessage(tmpMsg);
					// 님께서 결재를 요청했습니다.

					// 님께서 결재를 승인하셨습니다.
				} else if ("note".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " +
					// 변수를 하나더 보낼수 없어서 receiver 변수에 member_seq를 넣어서 썼다.
							"<a type='external' href='/mentor/essayboard/essayboardView?pg=1&seq=" + seq + "&mentors="
							+ receiver + "'>" + seq + "</a>번 에세이를 스크랩 했습니다.");
					boardWriterSession.sendMessage(tmpMsg);

					// 님이 당신에게 쪽지를 보냈습니다.
				}

			}

			// 님께서 화상채팅을 개설하셨습니다. 여기서 
			// 화상채팅 여기로 와야함
			if (strs != null && strs.length == 4) {
				String cmd = strs[0];
				String mail = strs[1];
				String nm = strs[2];
				String room = strs[3];

				// 미쳐버려 진짜
				if (cmd.equals("conf")) {
					for(int i=0; i<alarmList.size(); i++) {
					TextMessage tmpMsg = new TextMessage(nm + "님이 화상채팅방을 개설하셨습니다.!@@@@@/officeKok/conference/main/?room="+room);
					alarmList.get(i).sendMessage(tmpMsg);
					}
				}
			}
		}
	}

	// 연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// System.out.println("afterConnectionClosed " + session + ", " + status);
		Authentication auth = (Authentication) session.getPrincipal();
		EmpWrapper empwrapper = (EmpWrapper) auth.getPrincipal();
		EmpVO empvo = empwrapper.getEmp();

		userSessionsMap.remove(empvo.getEmpmail());
		alarmList.remove(session);
	}

	// 웹소켓 email 가져오기
	private String getEmail(WebSocketSession session) {

		Authentication auth = (Authentication) session.getPrincipal();
		EmpWrapper empwrapper = (EmpWrapper) auth.getPrincipal();
		EmpVO empvo = empwrapper.getEmp();

		EmpVO loginUser = empvo; // loginUser 는 auth의 empvo를 탄다 .

		return loginUser.getEmpmail();
	}

}

package kr.or.ddit.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.EmpWrapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class EchoHandler extends TextWebSocketHandler {

	// 웹소켓 세션을 저장할 리스트를 생성함 (커넥션 정보가 담겨져있음).
	@Resource(name = "accessList")
	private  List<WebSocketSession> accesslist ;
//	private static final String FILE_UPLOAD_PATH = "C:/test/websocket/";
//	static int fileUploadIdx = 0;
//	static String fileUploadSession = "";

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//리스트 쓸때 방법으로
		String str  = session.getUri().getPath();
		 String chatroomno = str.substring(16, str.length());
		 // 이제 여기가 방번호를 뽑은거야.
		 
		 
//		HashMap<String, WebSocketSession>Map = new HashMap<>();
//		if(accessMap.isEmpty() || accessMap.get(chatroomno) ==null) {
//			accesslist.add(session);
//			accessMap.put(chatroomno, accesslist );
//		};
		//Session은 뭐가 들어있지?
		 accesslist.add(session);
		
		System.out.println(session.getId()+"와의 연결 수립");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		accesslist.remove(session);
		System.out.printf("%s와의 연결 종료[%d-%s]\n", session.getId(), status.getCode(), status.getReason());
	}

	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class MessageVO {
		private String message;
		private String sender;
		private String base64Str;
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		Authentication auth = (Authentication) session.getPrincipal();
		EmpWrapper empwrapper = (EmpWrapper) auth.getPrincipal();
		EmpVO empvo = empwrapper.getEmp();
		String base64Str = empvo.getMem_imgBase64();
		String receiveMsg = message.getPayload();

		String sender = empvo.getEmpnm();
		MessageVO msgVO = new MessageVO(receiveMsg, sender, base64Str);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(msgVO);
		TextMessage sendMsg = new TextMessage(json);

		for(int i =0; i<accesslist.size(); i++)
			if(accesslist.get(i).toString() == session.toString()) {
				continue;
			}else {
				accesslist.get(i).sendMessage(sendMsg);
//				session.sendMessage(sendMsg);
			}

	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

	}

//	@Override
//	public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
//	}

}

package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatAttendVO {
	
	private Integer attendno; 
	private Integer empno;
	private String 	empnm;
	private Integer chatrmno;
	private Integer chatrmbuilder;
	private String chatrmnm;
	private Byte[] chatrmprofile;
 	
	
	private String chatrmdate;  //채팅 열린 날짜
	@NotBlank
	@Size(max = 7)
	private String attenddate; //채팅내가 들어온 날짜
	@NotBlank
	@Size(max = 1)
	private String alarmchk;
	
	private Integer chatrmcnt; // 채팅방 사람숫자
	
	private SearchVO searchVO; // 일반 검색용 searchVO
	
	// chatroom에서 방번호로 조회를 하면 거기서 chatattend가 나올꺼고
	// chatattendvo에서 WebsocketSession은  login 할경우 webscket session을 만들어주고 // 로그인단에서
	// chatattend 단에 session 주입.
	
	private String httpSessionId;
	private WebSocketSession session;
}

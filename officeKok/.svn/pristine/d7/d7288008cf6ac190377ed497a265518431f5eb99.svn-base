package kr.or.ddit.vo;

import java.util.List;

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
public class ChatRoomVO {
	@NotBlank
	@Size(max = 22)
	private Integer chatrmno;
	@NotBlank
	@Size(max = 22)
	private Integer chatrmbuilder;
	@NotBlank
	@Size(max = 255)
	private String chatrmnm;
	@NotBlank
	@Size(max = 7)
	private String chatrmdate;
	
	
	private Byte[] chatrmprofile;
	
	
	private List<ChatAttendVO> chatAttendList;
	
	
}

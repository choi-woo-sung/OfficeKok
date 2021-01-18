package kr.or.ddit.chat.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ChatAttendVO;
import kr.or.ddit.vo.ChatRoomVO;

@Repository
public interface IChatAttendDAO {
	

	public List<ChatAttendVO> selectAttendList(ChatAttendVO empno);
	
	public int insertChatRm(ChatRoomVO chatRoomVo);
	
	public int insertChatAttendList(ChatAttendVO chatRoomVo);
	
	
	public int selectattendno();
}

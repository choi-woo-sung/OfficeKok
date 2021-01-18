package kr.or.ddit.chat.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.chat.dao.IChatAttendDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ChatAttendVO;
import kr.or.ddit.vo.ChatRoomVO;

@Service
public class ChatAttendServiceImpl implements IChatAttendService {
	
	@Inject
	private IChatAttendDAO dao;
	
	



	@Override
	public List<ChatAttendVO> selectAttendList(ChatAttendVO chatattendvo) {
		List<ChatAttendVO> Attend = dao.selectAttendList(chatattendvo);
		
		
		return Attend;
	}





	@Override
	public int insertChatRm(ChatRoomVO chatRoomVo) {
		int chatRoom = dao.insertChatRm(chatRoomVo);
	return chatRoom;
	}





	@Override
	public ServiceResult insertChatAttendList(ChatAttendVO chatRoomVo) {
		chatRoomVo.setChatrmno(dao.selectattendno());
		ServiceResult result = null;
		int rowcnt = dao.insertChatAttendList(chatRoomVo);
		if(rowcnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
	}
	return result;
	}

}

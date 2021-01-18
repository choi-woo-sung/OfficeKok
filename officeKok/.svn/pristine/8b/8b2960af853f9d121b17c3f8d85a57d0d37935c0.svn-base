package kr.or.ddit.chat.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ChatAttendVO;
import kr.or.ddit.vo.ChatRoomVO;

public interface IChatAttendService {



	/**
	 *  채팅리스트 가져오기
	 * @param chatattendvo
	 * @returns
	 */
	public List<ChatAttendVO> selectAttendList(ChatAttendVO chatattendvo);
	
	/**
	 *  채팅방 등록하기
	 * @param chatRoomVo
	 * @return
	 */
	public int  insertChatRm(ChatRoomVO chatRoomVo);
	
	/**
	 * 채팅사람 등록하기
	 * @param chatRoomVo
	 * @return
	 */
	public ServiceResult  insertChatAttendList(ChatAttendVO chatRoomVo);
	
	
}

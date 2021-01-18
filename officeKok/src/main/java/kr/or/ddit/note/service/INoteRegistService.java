package kr.or.ddit.note.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.NoteVO;

public interface INoteRegistService {

	/**
	 * 쪽지 작성
	 * @param noteVO
	 * @return
	 */
	public ServiceResult createNote(NoteVO noteVO);
	
	/**
	 * 작성 중인 쪽지 임시보관함으로 이동
	 * @param noteVO
	 * @return
	 */
	public ServiceResult modifyTemp(NoteVO noteVO);
}

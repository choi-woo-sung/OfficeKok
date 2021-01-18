package kr.or.ddit.note.dao;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.NoteVO;

@Repository
public interface INoteRegistDAO {

	/**
	 * 쪽지 작성
	 * @param noteVO
	 * @return
	 */
	public int insertNote(NoteVO noteVO);
	
	/**
	 * 작성 중인 쪽지 임시보관함으로 이동
	 * @param noteVO
	 * @return
	 */
	public int updateTemp(NoteVO noteVO);
}

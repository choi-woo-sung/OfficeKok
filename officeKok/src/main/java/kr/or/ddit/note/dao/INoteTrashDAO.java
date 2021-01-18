package kr.or.ddit.note.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface INoteTrashDAO {

	/**
	 * 검색 조건에 맞는 휴지통 쪽지 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTrashNoteCount(PagingVO<NoteVO> pagingVO);

	/**
	 * 휴지통 쪽지 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoteVO> selectTrashNoteList(PagingVO<NoteVO> pagingVO);
	
	/**
	 * 휴지통 쪽지 상세 조회
	 * @param noteno
	 * @return
	 */
	public NoteVO selectTrashNote(NoteVO noteVO);
}

package kr.or.ddit.note.service;

import java.util.List;

import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

public interface INoteTrashService {

	/**
	 * 검색 조건에 맞는 휴지통 쪽지 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int retrieveTrashNoteCount(PagingVO<NoteVO> pagingVO);

	/**
	 * 휴지통 쪽지 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoteVO> retrieveTrashNoteList(PagingVO<NoteVO> pagingVO);
	
	/**
	 * 휴지통 쪽지 상세 조회
	 * @param noteno
	 * @return
	 */
	public NoteVO retrieveTrashNote(NoteVO noteVO);
}

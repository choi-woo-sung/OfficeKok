package kr.or.ddit.note.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;


@Repository
public interface INoteReceiveDAO {
	
	/**
	 * 검색 조건에 맞는 받은 쪽지 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectNoteCount(PagingVO<NoteVO> pagingVO);

	/**
	 * 받은 쪽지 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoteVO> selectNoteList(PagingVO<NoteVO> pagingVO);
	
	/**
	 * 받은 쪽지 상세 조회
	 * @param noteno
	 * @return
	 */
	public NoteVO selectNote(NoteVO noteVO);
	
	/**
	 * 읽은 쪽지 읽음 표시
	 * @param noteVO
	 * @return
	 */
	public int updateReadNote(NoteVO noteVO);
	
	/**
	 * 받은 쪽지 휴지통으로 이동
	 * @param noteVO
	 * @return
	 */
	public int updateTrashNote(NoteVO noteVO);
	
	public String micNote (int empno);
}

package kr.or.ddit.note.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface INoteTempDAO {

	/**
	 * 검색 조건에 맞는 임시보관함 쪽지 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTempNoteCount(PagingVO<NoteVO> pagingVO);

	/**
	 * 임시보관함 쪽지 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoteVO> selectTempNoteList(PagingVO<NoteVO> pagingVO);
	
	/**
	 * 임시보관함 쪽지 상세 조회
	 * @param noteno
	 * @return
	 */
	public NoteVO selectTempNote(NoteVO noteVO);
	
	/**
	 * 임시보관 쪽지 휴지통으로 이동
	 * @param noteVO
	 * @return
	 */
	public int updateTrashNote(NoteVO noteVO);
}

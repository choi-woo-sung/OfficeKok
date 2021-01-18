package kr.or.ddit.note.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

public interface INoteTempService {

	/**
	 * 검색 조건에 맞는 임시보관함 쪽지 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int retrieveTempNoteCount(PagingVO<NoteVO> pagingVO);

	/**
	 * 임시보관함 쪽지 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoteVO> retrieveTempNoteList(PagingVO<NoteVO> pagingVO);
	
	/**
	 * 임시보관함 쪽지 상세 조회
	 * @param noteno
	 * @return
	 */
	public NoteVO retrieveTempNote(NoteVO noteVO);
	
	/**
	 * 임시보관 쪽지 휴지통으로 이동
	 * @param noteVO
	 * @return
	 */
	public ServiceResult modifyTrashNote(NoteVO noteVO);
}

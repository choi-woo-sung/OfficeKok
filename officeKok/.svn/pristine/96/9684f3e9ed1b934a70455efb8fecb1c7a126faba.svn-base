package kr.or.ddit.note.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

public interface INoteReceiveService {
	
	/**
	 * 검색 조건에 맞는 쪽지 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int retrieveNoteCount(PagingVO<NoteVO> pagingVO);

	/**
	 * 쪽지 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoteVO> retrieveNoteList(PagingVO<NoteVO> pagingVO);
	
	/**
	 * 쪽지 상세 조회
	 * @param noteno
	 * @return
	 */
	public NoteVO retrieveNote(NoteVO noteVO);
	
	/**
	 * 받은 쪽지 읽음 표시
	 * @param noteVO
	 * @return
	 */
	public ServiceResult modifyReadNote(NoteVO noteVO);
	
	/**
	 * 받은 쪽지 휴지통으로 이동
	 * @param noteVO
	 * @return
	 */
	public ServiceResult modifyTrashNote(NoteVO noteVO);

	public String micNote (int empno);
}

package kr.or.ddit.note.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

public interface INoteSendService {

	/**
	 * 검색 조건에 맞는 보낸 쪽지 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int retrieveSendNoteCount(PagingVO<NoteVO> pagingVO);

	/**
	 * 보낸 쪽지 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoteVO> retrieveSendNoteList(PagingVO<NoteVO> pagingVO);
	
	/**
	 * 보낸 쪽지 상세 조회
	 * @param noteno
	 * @return
	 */
	public NoteVO retrieveSendNote(NoteVO noteVO);
	
	/**
	 * 보낸 쪽지 휴지통으로 이동
	 * @param noteVO
	 * @return
	 */
	public ServiceResult modifyTrashNote(NoteVO noteVO);
}

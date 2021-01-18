package kr.or.ddit.note.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.CustomException;
import kr.or.ddit.note.dao.INoteReceiveDAO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class NoteReceiveServiceImpl implements INoteReceiveService {

	@Inject
	private INoteReceiveDAO dao;
	
	@Override
	public int retrieveNoteCount(PagingVO<NoteVO> pagingVO) {
		return dao.selectNoteCount(pagingVO);
	}
	
	@Override
	public List<NoteVO> retrieveNoteList(PagingVO<NoteVO> pagingVO) {
		return dao.selectNoteList(pagingVO);
	}

	@Override
	public NoteVO retrieveNote(NoteVO noteVO) {
		NoteVO note = dao.selectNote(noteVO);
		if(note == null) {
			throw new CustomException(noteVO.getNoteno() + "번 쪽지는 존재하지 않습니다.");
		}
		
		return note;
	}

	@Override
	public ServiceResult modifyReadNote(NoteVO noteVO) {
		int modify = dao.updateReadNote(noteVO);
		ServiceResult result = ServiceResult.FAILED;
		if(modify > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}
	
	@Override
	public ServiceResult modifyTrashNote(NoteVO noteVO) {
		int modifyTrash = dao.updateTrashNote(noteVO);
		ServiceResult result = ServiceResult.FAILED;
		if(modifyTrash > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	public String micNote(int empno) {
		String note = dao.micNote(empno);
		if(note == null) {
			throw new CustomException(note + "없음");
		}
		
		return note;
	}

}

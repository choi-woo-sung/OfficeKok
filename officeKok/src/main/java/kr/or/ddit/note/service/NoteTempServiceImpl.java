package kr.or.ddit.note.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.CustomException;
import kr.or.ddit.note.dao.INoteTempDAO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class NoteTempServiceImpl implements INoteTempService {

	@Inject
	private INoteTempDAO dao;
	
	@Override
	public int retrieveTempNoteCount(PagingVO<NoteVO> pagingVO) {
		return dao.selectTempNoteCount(pagingVO);
	}

	@Override
	public List<NoteVO> retrieveTempNoteList(PagingVO<NoteVO> pagingVO) {
		return dao.selectTempNoteList(pagingVO);
	}

	@Override
	public NoteVO retrieveTempNote(NoteVO noteVO) {
		NoteVO note = dao.selectTempNote(noteVO);
		if(note == null) {
			throw new CustomException(noteVO.getNoteno() + "번 쪽지는 존재하지 않습니다.");
		}
		
		return note;
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

}

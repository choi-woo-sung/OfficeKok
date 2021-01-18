package kr.or.ddit.note.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.CustomException;
import kr.or.ddit.note.dao.INoteSendDAO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class NoteSendServiceImpl implements INoteSendService {

	@Inject
	private INoteSendDAO dao;
	
	@Override
	public int retrieveSendNoteCount(PagingVO<NoteVO> pagingVO) {
		return dao.selectSendNoteCount(pagingVO);
	}

	@Override
	public List<NoteVO> retrieveSendNoteList(PagingVO<NoteVO> pagingVO) {
		return dao.selectSendNoteList(pagingVO);
	}

	@Override
	public NoteVO retrieveSendNote(NoteVO noteVO) {
		NoteVO note = dao.selectSendNote(noteVO);
		if(note == null) {
			throw new CustomException(noteVO.getNoteno() + "번 쪽지는 존재하지 않습니다.");
		}
		
		return note;
	}

	@Override
	public ServiceResult modifyTrashNote(NoteVO noteVO) {
		int modifyTrash = dao.updatetrashNote(noteVO);
		ServiceResult result = ServiceResult.FAILED;
		if(modifyTrash > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

}

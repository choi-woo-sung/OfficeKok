package kr.or.ddit.note.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.exception.CustomException;
import kr.or.ddit.note.dao.INoteTrashDAO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class NoteTrashServiceImpl implements INoteTrashService {

	@Inject
	private INoteTrashDAO dao;
	
	@Override
	public int retrieveTrashNoteCount(PagingVO<NoteVO> pagingVO) {
		return dao.selectTrashNoteCount(pagingVO);
	}

	@Override
	public List<NoteVO> retrieveTrashNoteList(PagingVO<NoteVO> pagingVO) {
		return dao.selectTrashNoteList(pagingVO);
	}

	@Override
	public NoteVO retrieveTrashNote(NoteVO noteVO) {
		NoteVO note = dao.selectTrashNote(noteVO);
		if(note == null)
			throw new CustomException(noteVO.getNoteno() + "번 쪽지는 존재하지 않습니다.");
		
		return note;
	}

}

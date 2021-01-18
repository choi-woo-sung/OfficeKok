package kr.or.ddit.note.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.note.dao.INoteRegistDAO;
import kr.or.ddit.vo.NoteVO;

@Service
public class NoteRegistServiceImpl implements INoteRegistService {

	@Inject
	private INoteRegistDAO dao;
	
	@Override
	public ServiceResult createNote(NoteVO noteVO) {
		int create = dao.insertNote(noteVO);
		
		ServiceResult result = ServiceResult.FAILED;
		if(create > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	public ServiceResult modifyTemp(NoteVO noteVO) {
		int modifyTemp = dao.updateTemp(noteVO);
		ServiceResult result = ServiceResult.FAILED;
		if(modifyTemp > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

}

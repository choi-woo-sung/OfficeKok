package kr.or.ddit.drive.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.drive.dao.IPersonalDriveDAO;
import kr.or.ddit.vo.PersonalDriveVO;

/**
 * @author 이지윤
 * @since 2020. 11. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 19.      이지윤       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */

@Service
public class PersonalDriveServiceImpl implements IPersonalDriveService {

	@Inject
	private IPersonalDriveDAO dao;
	
	@Override
	public List<PersonalDriveVO> selectForder(PersonalDriveVO vo) {
		return dao.selectForder(vo);
	}

	@Override
	public List<PersonalDriveVO> selectAllForderList(int empno) {
		return dao.selectAllForderList(empno);
	}

	@Override
	public int insertFolder(PersonalDriveVO vo) {
		return dao.insertFolder(vo);
	}

	@Override
	public PersonalDriveVO selectInsertFolder(PersonalDriveVO vo) {
		return dao.selectInsertFolder(vo);
	}

	@Override
	public int insertFile(PersonalDriveVO vo) {
		return dao.insertFile(vo);
	}

	@Override
	public PersonalDriveVO selectInsertFile(PersonalDriveVO vo) {
		return dao.selectInsertFile(vo);
	}

	@Override
	public List<PersonalDriveVO> selectFileList(PersonalDriveVO vo) {
		return dao.selectFileList(vo);
	}

}

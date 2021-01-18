package kr.or.ddit.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.main.dao.IMainDAO;
import kr.or.ddit.vo.ApprovalDocVO;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.PagingVO;

/**
 * @author 이지윤
 * @since 2020. 11. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 16.      이지윤       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Service
public class MainServiceImpl implements IMainService {

	@Inject
	private IMainDAO dao;
	
	@Override
	public AttendanceVO selectMainWorkTime(int empno) {
		return dao.selectMainWorkTime(empno);
	}

	@Override
	public List<ApprovalDocVO> getMainApprTodoList(int empno) {
		return dao.selectMainApprTodoList(empno);
	}

	@Override
	public List<NoteVO> selectUnreadCount(int empno) {
		return dao.selectUnreadCount(empno);
	}

}

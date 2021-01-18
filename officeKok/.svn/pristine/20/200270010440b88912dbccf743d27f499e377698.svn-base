package kr.or.ddit.attendance.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.attendance.dao.IAttendanceDAO;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.CominfoVO;

/**
 * @author 이지윤
 * @since 2020. 11. 05.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 05.      이지윤       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Service
public class AttendanceServiceImpl implements IAttendanceService {
	@Inject
	private IAttendanceDAO dao;
	
	@Override
	public int selectDateno(AttendanceVO vo) {
		return dao.selectDateno(vo);
	}

	@Override
	public AttendanceVO selectOnedayAttendance(AttendanceVO vo) {
		return dao.selectOnedayAttendance(vo);
	}
	
	@Transactional
	@Override
	public int insertTime(AttendanceVO vo) {
		return dao.insertTime(vo);
	}
	
	@Transactional
	@Override
	public int updateTime(AttendanceVO vo) {
		return dao.updateTime(vo);
	}

	@Override
	public CominfoVO selectCominfo() {
		return dao.selectCominfo();
	}

	@Override
	public AttendanceVO selectAnnualRefresh(int empno) {
		return dao.selectAnnualRefresh(empno);
	}

	@Override
	public AttendanceVO selectWorkTime(AttendanceVO vo) {
		return dao.selectWorkTime(vo);
	}

	@Override
	public List<AttendanceVO> selectRefreshDetail(int empno) {
		return dao.selectRefreshDetail(empno);
	}

	@Override
	public int selectWeekTime(int empno) {
		return dao.selectWeekTime(empno);
	}

	

}

package kr.or.ddit.calendar.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.calendar.dao.ICalendarDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.CustomException;
import kr.or.ddit.vo.CalendarDetailVO;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.EmpVO;

@Service
public class CalendarServiceImpl implements ICalendarService {

	@Inject
	private ICalendarDAO dao;
	
//	@Inject
//	private ICalendarAttDAO attDao;
	
//	private boolean processAttatchFiles(CalendarDetailVO calendarDetailVO) {
//		List<CalendarAttVO> attList = calendarDetailVO.getCalendarAttList();
//		if(attList == null || attList.size() == 0) 
//	return true;
//		
//		int rowcnt = attDao.insertAtt(calendarDetailVO); // metaData
//		if(rowcnt > 0) {
//			for(CalendarAttVO att : attList) {
//				attList.
//			}
//		}
//		
//		return rowcnt > 0;
//	}
	
	@Override
	public List<EmpVO> retrieveCalList(int empno) {
		return dao.selectCalList(empno);
	}
	
	
	@Override
	public CalendarDetailVO retrieveCal(Integer schedetailno) {
		CalendarDetailVO cal = dao.selectCal(schedetailno);
		if(cal == null) 
			throw new CustomException(schedetailno + "는 존재하지 않는 일정입니다.");
		return cal;
	}
	
	@Override
	public ServiceResult createCal(CalendarVO calendarVO) {
		int create = dao.insertCal(calendarVO);
		
		ServiceResult result = ServiceResult.FAILED;
		if(create > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	public ServiceResult createCalDetail(CalendarDetailVO calendarDetailVO) {
		int create = dao.insertCalDetail(calendarDetailVO);
		
		ServiceResult result = ServiceResult.FAILED;
		if(create > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}


	@Override
	public ServiceResult modifyCal(CalendarVO calendarVO) {
		retrieveCal(calendarVO.getSchedetailno());
		int modify = dao.updateCal(calendarVO);
		ServiceResult result = ServiceResult.FAILED;
		if(modify > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult modifyCalDetail(CalendarDetailVO calendarDetailVO) {
		retrieveCal(calendarDetailVO.getSchedetailno());
		int modifyDetail = dao.updateCalDetail(calendarDetailVO);
		ServiceResult result = ServiceResult.FAILED;
		if(modifyDetail > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}


	@Override
	public List<EmpVO> retrieveCalSubjectList(int empno) {
		return dao.selectCalSubjectList(empno);
	}

}

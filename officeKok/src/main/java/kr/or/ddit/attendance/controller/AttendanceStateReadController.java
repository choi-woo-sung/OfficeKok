package kr.or.ddit.attendance.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.attendance.service.IAttendanceService;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.CominfoVO;
import kr.or.ddit.vo.EmpVO;

/**
 * @author 안승원
 * @since 2020. 10. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 26.      안승원       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/attendance/state")
public class AttendanceStateReadController {
	@Inject
	private IAttendanceService service;
	
	@GetMapping
	@PreAuthorize("isAuthenticated()")
	public ModelAndView list(@AuthenticationPrincipal(expression = "emp") EmpVO empVO) throws Exception {   
        //session에서 empno 받아오기
        int empno = empVO.getEmpno();
        
        //연차             
        AttendanceVO attendance = service.selectAnnualRefresh(empno);
        double amrefresh = attendance.getAmrefresh();
        double parefresh = attendance.getPmrefresh();
        double annualTotal;
        if((amrefresh + parefresh) == 0) {
        	annualTotal = 0;
        }
		annualTotal = (amrefresh + parefresh) / 2;
		
		CominfoVO cominfo = service.selectCominfo();
		int annualstand = cominfo.getAnnualstand();
		List<Map<String, Object>> annualData = new ArrayList<>();
		Map<String, Object> map1 = new HashMap<>();
		map1.put("label", "남은 연차");
		map1.put("value", annualstand - annualTotal);
		annualData.add(map1);
		Map<String, Object> map2 = new HashMap<>();
		map2.put("label", "사용 연차");
		map2.put("value", annualTotal);
		annualData.add(map2);
		
		//휴가
		List<Map<String, Object>> refreshData = new ArrayList<>();
		int vacstand = cominfo.getVacstand();
		int refreshTotal = attendance.getRefresh();
		Map<String, Object> map3 = new HashMap<>();
		map3.put("label", "남은 휴가");
		map3.put("value", vacstand - refreshTotal);
		refreshData.add(map3);
		Map<String, Object> map4 = new HashMap<>();
		map4.put("label", "사용 휴가");
		map4.put("value", refreshTotal);
		refreshData.add(map4);
		
		//월별 근무시간
		List<Map<String, Object>> totalWorkTimeData = new ArrayList<>();
		for(int i = 1; i <= 12; i++) {
			String month; 
			month = Integer.toString(i);
			if(i < 10) {
				month = "0" + i;
			}
			attendance.setEmpno(empno);
			attendance.setMonthly(month);
			attendance = service.selectWorkTime(attendance);
			Map<String, Object> map = new HashMap<>();
			map.put("month", i + "월");
			map.put("근무시간", attendance.getWorktime());
			totalWorkTimeData.add(map);
		}
		
		//월별 연장,휴일 근무시간
		List<Map<String, Object>> totalAddWorkTimeData = new ArrayList<>();
		for(int i = 1; i <= 12; i++) {
			String month; 
			month = Integer.toString(i);
			if(i < 10) {
				month = "0" + i;
			}
			attendance.setEmpno(empno);
			attendance.setMonthly(month);
			attendance = service.selectWorkTime(attendance);
			String year = attendance.getYearly();
			String mValue = year + "-" + month;
			Map<String, Object> map = new HashMap<>();
			map.put("m", mValue);
			map.put("연장 근무시간", attendance.getPlusworktime());
			map.put("휴일 근무시간", attendance.getHolyworktime());
			totalAddWorkTimeData.add(map);
		}
		
		//연차 상세내역
		List<AttendanceVO> refreshDetail = service.selectRefreshDetail(empno);
		for(int i = 0; i < refreshDetail.size(); i++) {
			if(refreshDetail.get(i).getAmrefresh() == 1 && refreshDetail.get(i).getPmrefresh() == 1 ) {
				refreshDetail.get(i).setRefreshName("연차");
			}else if(refreshDetail.get(i).getAmrefresh() == 1) {
				refreshDetail.get(i).setRefreshName("오전반차");				
			}else if(refreshDetail.get(i).getPmrefresh() == 1) {
				refreshDetail.get(i).setRefreshName("오후반차");
			}else if(refreshDetail.get(i).getRefresh() == 1) {
				refreshDetail.get(i).setRefreshName("휴가");
			}
		}
		
		//주간 근무시간
		List<Map<String, Object>> weekTimeData = new ArrayList<>();
		int weekworksd = cominfo.getWeekworksd();
		int weekWorkTime = service.selectWeekTime(empno);
		Map<String, Object> map5 = new HashMap<>();
		map5.put("label", "최대근무");
		map5.put("value", weekworksd - weekWorkTime);
		Map<String, Object> map6 = new HashMap<>();
		map6.put("label", "주간근무");
		map6.put("value", weekWorkTime);
		weekTimeData.add(map5);
		weekTimeData.add(map6);
				
		ObjectMapper mapper = new ObjectMapper();
		String annual = mapper.writeValueAsString(annualData);
		String refresh = mapper.writeValueAsString(refreshData);
		String totalWorkTime = mapper.writeValueAsString(totalWorkTimeData);
		String totalAddWorkTime = mapper.writeValueAsString(totalAddWorkTimeData);
		String totalWeekWorkTime = mapper.writeValueAsString(weekTimeData);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("annual", annual);
		mv.addObject("refresh", refresh);
		mv.addObject("totalWorkTime", totalWorkTime);
		mv.addObject("totalAddWorkTime", totalAddWorkTime);
		mv.addObject("detail", refreshDetail);
		mv.addObject("totalWeekWorkTime", totalWeekWorkTime);
		mv.setViewName("attendance/attendanceState");
		return mv;
	}
	
	
}

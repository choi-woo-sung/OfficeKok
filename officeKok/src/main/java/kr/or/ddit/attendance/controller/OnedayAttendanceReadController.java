package kr.or.ddit.attendance.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.web.authentication.Http403ForbiddenEntryPoint;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
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
@RequestMapping("/attendance/oneday")
public class OnedayAttendanceReadController {
	@Inject
	private IAttendanceService service;
	
	@GetMapping
	@PreAuthorize("isAuthenticated()")
	public String get(@AuthenticationPrincipal(expression = "emp") EmpVO empVO, Model model) {
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		String searchDate[] = mTime.split("-");        
        AttendanceVO vo = new AttendanceVO();
        vo.setYearly(searchDate[0]);
        vo.setMonthly(searchDate[1]);
        vo.setDaily(searchDate[2]);
        
        int dateno = service.selectDateno(vo);        
        vo.setTasddateno(dateno);
        
        int empno = empVO.getEmpno();
        vo.setEmpno(empno);
        AttendanceVO result = service.selectOnedayAttendance(vo);
        model.addAttribute("list", result);       
		return "attendance/attendanceMain";
	}
	
	@GetMapping(value="search.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	public AttendanceVO get(@RequestParam(name="date") String date, @AuthenticationPrincipal(expression = "emp") EmpVO empVO){		
		String searchDate[] = date.split("-");        
        AttendanceVO vo = new AttendanceVO();
        vo.setYearly(searchDate[0]);
        vo.setMonthly(searchDate[1]);
        vo.setDaily(searchDate[2]);
        
        int dateno = service.selectDateno(vo);        
        vo.setTasddateno(dateno);
        
        int empno = empVO.getEmpno();
        vo.setEmpno(empno);
        
        AttendanceVO result = service.selectOnedayAttendance(vo);
		return result;
	}
	
	@PostMapping("inseart.do")
	@PreAuthorize("isAuthenticated()")
	public @ResponseBody void insert(@RequestParam Map<String, Object> param, @AuthenticationPrincipal(expression = "emp") EmpVO empVO) { 
		String year = (String) param.get("year");
		String month = (String) param.get("month");
		String day = (String) param.get("day");
		String hours = (String) param.get("hours");
		String minutes = (String) param.get("minutes");
		String goworktime = hours + ":" + minutes;
		
		AttendanceVO vo = new AttendanceVO();
		vo.setYearly(year);
		vo.setMonthly(month);
		vo.setDaily(day);
		int dateno = service.selectDateno(vo);
        int empno = empVO.getEmpno();
        
        vo.setEmpno(empno);
        vo.setTasddateno(dateno);
		vo.setGoworktime(goworktime);
		
		service.insertTime(vo);
	}
	
	@PostMapping("update.do")
	@PreAuthorize("isAuthenticated()")
	public @ResponseBody void update(@RequestParam Map<String, Object> param, @AuthenticationPrincipal(expression = "emp") EmpVO empVO) { 
		String year = (String) param.get("year");
		String month = (String) param.get("month");
		String day = (String) param.get("day");
		String hours = (String) param.get("hours");
		String minutes = (String) param.get("minutes");
		String afterTime = hours + ":" + minutes;
		
		AttendanceVO vo = new AttendanceVO();
		vo.setYearly(year);
		vo.setMonthly(month);
		vo.setDaily(day);
		int dateno = service.selectDateno(vo);
        int empno = empVO.getEmpno();
        
        vo.setEmpno(empno);
        vo.setTasddateno(dateno);
        
        AttendanceVO vo2 = new AttendanceVO();
        vo2 = service.selectOnedayAttendance(vo);
        String goworktime = vo2.getGoworktime();
        String time[] = goworktime.split(":");
        int goHours = Integer.parseInt(time[0]);
        int goMinutes = Integer.parseInt(time[1]);
        int afterHours = Integer.parseInt(hours);
        int afterMinutes = Integer.parseInt(minutes);
        
        CominfoVO companyInfo = service.selectCominfo();
        String[] goworksd = companyInfo.getGoworksd().split(":");
        String[] aftersd = companyInfo.getAfterworksd().split(":");
        int goworkInfo = Integer.parseInt(goworksd[0]); //출근기준시
        int afterInfo = Integer.parseInt(aftersd[0]); //퇴근기준시
        
        int onedayHoursTime = 0;
        if(goHours > goworkInfo) { 
        	onedayHoursTime = (((afterHours * 60) + afterMinutes  - 60) - ((goHours * 60) + goMinutes)) / 60;     	
        }else {
        	onedayHoursTime = (((afterHours * 60) + afterMinutes  - 60) - (goworkInfo * 60)) / 60;
        }
        
        int plusTime = 0;
        int afterHoursToMinutes = (afterHours * 60);
        int afterMaxMinutes = (afterInfo * 60);
        if(afterHoursToMinutes > afterMaxMinutes) { 
        	int plusMinutes = (afterHours * 60) + afterMinutes;
        	int plus = (plusMinutes - afterMaxMinutes) / 60;
        	plusTime = plus;
        }
        
		vo.setAfterworktime(afterTime);
		vo.setWorktime(onedayHoursTime);
		vo.setPlusworktime(plusTime);
		
		service.updateTime(vo);
	}

}

package kr.or.ddit.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.calendar.service.ICalendarService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.organization.service.IOrganizationService;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CalendarDetailVO;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.DeptVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.OrganizationVO;

/**
 * @author 정재은
 * @since 2020. 11 05.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 05.      정재은       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/cal/calRegistForm")
public class CalRegistController {

   private ICalendarService service;
   private IOrganizationService organizationService;
   
   @Inject
   public void setService(ICalendarService service) {
      this.service = service;
   }
   
   @Inject
	public void setOrganizationService(IOrganizationService organizationService) {
		this.organizationService = organizationService;
	}
   
   @PostMapping(value="/calFormTree", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public List<Map<String, Object>> getNoteTreeFormJSON(@AuthenticationPrincipal(expression="emp") EmpVO emp) 
			throws Exception {
		
		List<DeptVO> dept = organizationService.selectDept();
		List<OrganizationVO> deptEmp = organizationService.selectOrganization();

		List<Map<String, Object>> data = new ArrayList<>();
		
		for(int i = 0; i < dept.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			Map<String, Object> stateMap = new HashMap<>();
			stateMap.put("disabled", true);
			stateMap.put("opened", true);
			
			if(dept.get(i).getRedeptno() == null) {
				map.put("id", dept.get(i).getDeptno());
				map.put("parent", "#");
				map.put("text", dept.get(i).getDeptnm());
				map.put("icon", "fas fa-building");
				map.put("state", stateMap);
				data.add(map);
				
			}else if(dept.get(i).getRedeptno() == 1) {
				map.put("id", dept.get(i).getDeptno());
				map.put("parent", dept.get(i).getRedeptno());
				map.put("text", dept.get(i).getDeptnm());
				map.put("icon", "fas fa-address-book");
				map.put("state", stateMap);
				data.add(map);
			}else {
				map.put("id", dept.get(i).getDeptno());
				map.put("parent", dept.get(i).getRedeptno());
				map.put("text", dept.get(i).getDeptnm());
				map.put("icon", "fas fa-address-book");
				data.add(map);
			}
		}
		
		for(int i = 0; i < deptEmp.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			if(deptEmp.get(i).getCnt() >= 1 && deptEmp.get(i).getEmpno() != null) {
				map.put("id", deptEmp.get(i).getEmpno());
				map.put("parent", deptEmp.get(i).getDeptno());
				map.put("text", deptEmp.get(i).getEmpnm() + " " + deptEmp.get(i).getRanknm());
				map.put("icon", "fas fa-user");
				data.add(map);
			}
		}
		
		return data;
	}
   
   @PostMapping
   @PreAuthorize("isAuthenticated()")
   public String insertSchedule(
         @Validated(InsertGroup.class)
         @ModelAttribute("calDetail") CalendarDetailVO calendarDetailVO,
//         @Validated(InsertGroup.class)
//         @ModelAttribute("cal") CalendarVO calendarVO, 
         @AuthenticationPrincipal(expression = "emp") EmpVO empVO,
         BindingResult errors, HttpServletRequest req){
      
//      Map<Object, Object> map = new HashMap<Object, Object>();
      
      boolean valid = !errors.hasErrors();
      
      String goPage = null;
      String message = null;
      
      CalendarVO calendarVO = new CalendarVO();
      
      // 여기서부터 확인하기
      calendarVO.setEmpno(empVO.getEmpno());
      System.out.println(empVO.getEmpno());
      
      calendarVO.setScheduledate(calendarDetailVO.getStartdate());
      System.out.println(calendarDetailVO.getStartdate());
      
      String openchk = calendarDetailVO.getOpenchk();
      if(openchk == null) {
         openchk = "Y";
         calendarDetailVO.setOpenchk(openchk);
      }
      
      if(valid) {
         ServiceResult result = service.createCal(calendarVO);
         switch (result) {
         case FAILED : 
            goPage = "cal/calRegistForm";
            message = "서버 문제로 등록이 완료되지 않았습니다. 잠시 후 다시 시도해 주세요.";
            break;
            
         default :
            // empno는 session에서 가져오고 scheduleno는 알아서 생성해주면
            // scheduledate만 생성해주면 됨 -> calendarDetailVO의 startdate와 동일
            // 그러면 empno를 session에서 꺼내주는데 그걸 여기서 꺼내줘서 set?
            
//            EmpVO empVO = (EmpVO) session.getAttribute("emp");
            calendarDetailVO.setScheno(calendarVO.getScheduleno());
            result = service.createCalDetail(calendarDetailVO);
            goPage = "redirect:/cal";
         }
      }else {
         goPage = "cal/calRegistForm";
      }
      
      req.setAttribute("message", message);
      return goPage;
   }
   
   @GetMapping
   public String calForm() {
      return "cal/calRegistForm";
   }
}
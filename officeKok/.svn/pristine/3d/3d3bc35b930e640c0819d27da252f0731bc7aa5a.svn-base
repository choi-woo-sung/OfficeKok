package kr.or.ddit.organization.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.organization.service.IOrganizationService;
import kr.or.ddit.vo.DeptVO;
import kr.or.ddit.vo.OrganizationVO;
import kr.or.ddit.vo.SearchVO;

/**
 * @author 이지윤
 * @since 2020. 11. 03.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 03.      이지윤       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/groupTree")
public class OrganizationTreeReadController {
	@Inject
	private IOrganizationService service;
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ModelAndView list() throws Exception {
		List<DeptVO> dept = service.selectDept();
		List<OrganizationVO> deptEmp = service.selectOrganization();
		List<Map<String, Object>> data = new ArrayList<>();
		
		for(int i = 0; i < dept.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			Map<String, Object> map2 = new HashMap<>();
			map2.put("disabled", true);
			map2.put("opened", true);
			if(dept.get(i).getRedeptno() == null) {
				map.put("id", dept.get(i).getDeptno());
				map.put("parent", "#");
				map.put("text", dept.get(i).getDeptnm());
				map.put("icon", "fas fa-building");
				map.put("state", map2);
				data.add(map);
			}else if(dept.get(i).getRedeptno() == 1) {
				map.put("id", dept.get(i).getDeptno());
				map.put("parent", dept.get(i).getRedeptno());
				map.put("text", dept.get(i).getDeptnm());
				map.put("icon", "fas fa-address-book");
				map.put("state", map2);
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
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(data);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", result);
		mv.setViewName("organization/groupTree");
		return mv;
	
	}
}

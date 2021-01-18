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
 * @author 안승원
 * @since 2020. 10. 23.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 10. 23.      안승원       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/groupChart")
public class OrganizationReadController {
	@Inject
	private IOrganizationService service;
	
//	@GetMapping
//	public String get(){
//		return "organization/groupList";
//	}
	
//	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public ModelAndView list() throws Exception {
//		List<DeptVO> dept = service.selectUpperDept();
//		List<OrganizationVO> all = service.selectOrganization();
//		int cnt = service.selectDeptnoMax();
//		List<Map<String, Object>> data = new ArrayList<>();
//		
//		for(int i = 0; i < dept.size(); i++) {
//			Map<String, Object> map = new HashMap<>();
//			List<String> tag = new ArrayList<>();
//			
//			if(dept.get(i).getRedeptno() == null) {
//				tag.add(dept.get(i).getDeptnm());
//			}else if(dept.get(i).getRedeptno() == 1) {
//				tag.add(dept.get(i).getDeptnm());
//				tag.add("부서");
//				map.put("pid", dept.get(0).getDeptnm());
//				map.put("이름", dept.get(i).getDeptnm());
//			}
//	
//			map.put("id", dept.get(i).getDeptnm());
//			map.put("tags", tag);
//			data.add(map);
//		}
//		
//		for(int i = 0; i < all.size(); i++) {
//			Map<String, Object> map2 = new HashMap<>();
//			if(all.get(i).getRedeptno() == null) {
//				map2.put("id", all.get(i).getDeptno());
//				map2.put("stpid", all.get(i).getDeptnm());
//				map2.put("이름", all.get(i).getEmpnm());
//				map2.put("직급", all.get(i).getRanknm());
//				data.add(map2);
//			}else if(all.get(i).getRedeptno() > 1 && all.get(i).getCnt() == 1 ) {			
//					map2.put("id", all.get(i).getDeptno());
//					map2.put("이름", all.get(i).getEmpnm());		
//					if(all.get(i).getRedeptno() == 2) {
//						map2.put("stpid", "경영지원부");						
//					}else if(all.get(i).getRedeptno() == 3) {						
//						map2.put("stpid", "마케팅부");						
//					}
//					data.add(map2);
//			}else if(all.get(i).getMgrno() == 1) {										
//				map2.put("id", all.get(i).getDeptno());
//				map2.put("이름", all.get(i).getEmpnm());		
//				if(all.get(i).getRedeptno() == 2) {
//					map2.put("stpid", "경영지원부");						
//				}else if(all.get(i).getRedeptno() == 3) {						
//					map2.put("stpid", "마케팅부");						
//				}
//				data.add(map2);
//			}
//		}
//		ObjectMapper mapper = new ObjectMapper();
//		String result = mapper.writeValueAsString(data);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("list", result);
//		mv.setViewName("organization/groupList");
//		return mv;
//	
//	}
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ModelAndView list() throws Exception {
		
		OrganizationVO vo = service.selectRoot();
		List<DeptVO> dept = service.selectDept();
		List<OrganizationVO> deptEmp = service.selectOrganization();
		List<Map<String, Object>> data = new ArrayList<>();
		
//		Map<String, Object> map1 = new HashMap<>();
//		map1.put("id", vo.getDeptno());
//		map1.put("name", vo.getEmpnm() + " " + vo.getRanknm()); //name : 이름 + 직함명
//		map1.put("tel", vo.getDeptrepno());
//		map1.put("addr", vo.getDeptadd1() + " " + vo.getDeptadd2());
//		map1.put("mail", vo.getEmpmail());
//		map1.put("fax", vo.getDeptfax());
//		data.add(map1);
		
		for(int i = 0; i < dept.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			if(dept.get(i).getRedeptno() == null) {
				map.put("id", vo.getDeptno());
				map.put("name", vo.getEmpnm() + " " + vo.getRanknm()); //name : 이름 + 직함명
				map.put("tel", vo.getDeptrepno());
				map.put("addr", vo.getDeptadd1() + " " + vo.getDeptadd2());
				map.put("mail", vo.getEmpmail());
				map.put("fax", vo.getDeptfax());
				data.add(map);
			}else {
				map.put("id", dept.get(i).getDeptno());
				map.put("pid", dept.get(i).getRedeptno()); //pid 부모
				map.put("name", dept.get(i).getDeptnm()); 
				map.put("tel", dept.get(i).getDeptrepno());
				map.put("addr", dept.get(i).getDeptadd1() + " " + dept.get(i).getDeptadd2());
				map.put("mail", "dept@gmail.com");
				map.put("fax", dept.get(i).getDeptfax());
				data.add(map);
			}
			
		}
		
		for(int i = 0; i < deptEmp.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			if(deptEmp.get(i).getCnt() > 1) {
				map.put("id", deptEmp.get(i).getEmpno());
				map.put("pid", deptEmp.get(i).getDeptno());
				map.put("name", deptEmp.get(i).getEmpnm() + " " + deptEmp.get(i).getRanknm()); 
				map.put("tel", deptEmp.get(i).getEmphp());
				map.put("addr", deptEmp.get(i).getDeptadd1() + " " + deptEmp.get(i).getDeptadd2());
				map.put("mail", deptEmp.get(i).getEmpmail());
				map.put("fax", deptEmp.get(i).getDeptfax());
				data.add(map);
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(data);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", result);
		mv.setViewName("organization/groupList");
		return mv;
	
	}
	
}



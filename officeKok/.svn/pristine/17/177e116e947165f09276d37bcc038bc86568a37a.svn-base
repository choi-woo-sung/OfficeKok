package kr.or.ddit.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.organization.service.IOrganizationService;
import kr.or.ddit.vo.DeptVO;
import kr.or.ddit.vo.OrganizationVO;

public class OrganizationTree {
	
//	public static String organizationTree(IOrganizationService organizationService) throws Exception {
//		List<DeptVO> dept = organizationService.selectDept();
//		List<OrganizationVO> deptEmp = organizationService.selectOrganization();
//		List<Map<String, Object>> data = new ArrayList<>();
//
//		for (int i = 0; i < dept.size(); i++) {
//			Map<String, Object> map = new HashMap<>();
//			if (dept.get(i).getRedeptno() == null) {
//				map.put("id", dept.get(i).getDeptno());
//				map.put("parent", "#");
//				map.put("text", dept.get(i).getDeptnm());
//				map.put("icon", "fas fa-building");
//				data.add(map);
//			} else {
//				map.put("id", dept.get(i).getDeptno());
//				map.put("parent", dept.get(i).getRedeptno());
//				map.put("text", dept.get(i).getDeptnm());
//				map.put("icon", "fas fa-address-book");
//				data.add(map);
//			}
//
//		}
//
//		for (int i = 0; i < deptEmp.size(); i++) {
//			Map<String, Object> map = new HashMap<>();
//			if (deptEmp.get(i).getCnt() > 1) {
//				map.put("id", deptEmp.get(i).getEmpno());
//				map.put("parent", deptEmp.get(i).getDeptno());
//				map.put("text", deptEmp.get(i).getEmpnm() + " " + deptEmp.get(i).getRanknm());
//				map.put("icon", "fas fa-user");
//				data.add(map);
//			}
//		}
//		
//		ObjectMapper mapper = new ObjectMapper();
//		
//		return mapper.writeValueAsString(data);
//	}
}
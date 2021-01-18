package kr.or.ddit.approval.appr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.approval.appr.service.IApprovalLineService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.organization.service.IOrganizationService;
import kr.or.ddit.vo.ApprovalLineVO;
import kr.or.ddit.vo.DeptVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.OrganizationVO;

@Controller
@RequestMapping("/approval/work/apprLine")
public class ApprLineController {
	
	private String deptCode = "/deptno";
	private String empCode = "/empno";
	
	private IOrganizationService organizationService;
	private IApprovalLineService apprLineService;
	
	@Inject
	public void setOrganizationService(IOrganizationService organizationService) {
		this.organizationService = organizationService;
	}
	
	@Inject
	public void setApprLineService(IApprovalLineService apprLineService) {
		this.apprLineService = apprLineService;
	}
	
	@PostMapping(value = "/regist", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public Map<String, Object> registApprLine(@RequestBody(required = true) ApprovalLineVO apprline,
			@AuthenticationPrincipal(expression = "emp") EmpVO emp) {
		if (apprline.getApprlinenm() == null || "".equals(apprline.getApprlinenm())) {
			apprline.setApprlinenm(UUID.randomUUID().toString());
			apprline.setSaveyn("N");
		}
		apprline.setEmpno(emp.getEmpno());
		
		ServiceResult result = apprLineService.registApprovalLine(apprline);
		Map<String, Object> resMap = new HashMap<>();
		switch (result) {
		case FAILED:
			resMap.put("res", "fail");
			resMap.put("msg", "서버 문제로 실패하였습니다. 잠시 후 다시 시도해주세요.!!");
			break;
		default:
			resMap.put("res", "success");
			resMap.put("msg", "결재선을 저장하였습니다.!");
			resMap.put("apprline", apprLineService.getApprovalLineList(emp.getEmpno()));
			resMap.put("apprlineno", apprline.getApprlineno());
			break;
		}
		return resMap;
	}
	
	@PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<ApprovalLineVO> getApprStepListJSON(@RequestParam(name = "apprlineno", required = true) int apprlineno) {
		List<ApprovalLineVO> approvalLine = apprLineService.getApprovalLine(apprlineno);
		return approvalLine;
	}
	
	@PostMapping(value = "/apprLineList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public List<ApprovalLineVO> getApprLineList(@AuthenticationPrincipal(expression = "emp") EmpVO emp) {
		List<ApprovalLineVO> apprLineList= apprLineService.getApprovalLineList(emp.getEmpno());
		return apprLineList;
	}
	
	@PostMapping(value = "/apprTree", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public List<Map<String, Object>> getApprTreeJSON(@AuthenticationPrincipal(expression = "emp") EmpVO emp) {
		List<Map<String, Object>> data = new ArrayList<>();
		List<OrganizationVO> deptEmp = organizationService.selectOrganization();
		
		List<DeptVO> dept = organizationService.selectDept();
		
		for (int i = 0; i < dept.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			Map<String, Object> stateMap = new HashMap<>();
			stateMap.put("disabled", true);
			stateMap.put("opened", true);
			
			if (dept.get(i).getRedeptno() == null) {
				map.put("id", deptEmp.get(i).getDeptno() + deptCode);
				map.put("parent", "#");
				map.put("text", deptEmp.get(i).getDeptnm());
				map.put("icon", "fas fa-building");
				map.put("state", stateMap);
				data.add(map);
			} else if(dept.get(i).getRedeptno() == 1) {
				map.put("id", dept.get(i).getDeptno() + deptCode);
				map.put("parent", dept.get(i).getRedeptno() + deptCode);
				map.put("text", dept.get(i).getDeptnm());
				map.put("icon", "fas fa-address-book");
				map.put("state", stateMap);
				data.add(map);
			} else {
				map.put("id", dept.get(i).getDeptno() + deptCode);
				map.put("parent", dept.get(i).getRedeptno() + deptCode);
				map.put("text", dept.get(i).getDeptnm());
				map.put("icon", "fas fa-address-book");
				data.add(map);
			}
		}
		
		for (int i = 0; i < deptEmp.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			if (deptEmp.get(i).getCnt() >= 1 && deptEmp.get(i).getEmpno() != null
					&& !deptEmp.get(i).getEmpno().equals(emp.getEmpno())) {
				map.put("id", deptEmp.get(i).getEmpno() + empCode);
				map.put("parent", deptEmp.get(i).getDeptno() + deptCode);
				map.put("text", deptEmp.get(i).getEmpnm() + " " + deptEmp.get(i).getRanknm());
				map.put("icon", "fas fa-user");
				data.add(map);
			}
		}
		return data;
	}
	
	@PostMapping("/delete")
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public Map<String, Object> deleteApprLine(@RequestParam(name = "apprlineno") int apprlineno, @AuthenticationPrincipal(expression = "emp") EmpVO emp) {
		Map<String, Object> resMap = new HashMap<>();
		ServiceResult result = apprLineService.removeApprovalLine(apprlineno);
		
		switch (result) {
		case FAILED:
			resMap.put("msg", "결재선을 갖고 있는 문서가 존재합니다.");
			resMap.put("res", "fail");
			break;
		default:
			List<ApprovalLineVO> apprlineList = apprLineService.getApprovalLineList(emp.getEmpno());
			resMap.put("data", apprlineList);
			resMap.put("res", "success");
			break;
		}
		return resMap;
	}
}
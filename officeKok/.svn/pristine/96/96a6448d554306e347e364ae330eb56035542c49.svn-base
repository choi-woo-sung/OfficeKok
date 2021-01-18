package kr.or.ddit.drive.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.drive.service.IPersonalDriveService;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PersonalDriveVO;

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
@RequestMapping("/drive/personal")
public class PersonalReadController {
	
	@Inject
	private IPersonalDriveService service;
	
	@GetMapping
	public String get() {
		return "drive/personalList";
	}
	
//	@GetMapping
//	public ModelAndView test() throws Exception {
//		
//		List<Map<String, Object>> list = new ArrayList<>();
//		List<Map<String, Object>> list2 = new ArrayList<>();
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("value", "Code");
//		map.put("id", "/Code");
//		map.put("size", 4096);
//		map.put("date", 1605632400);
//		map.put("type", "folder");
//		map.put("data", list2);
//		
//		Map<String, Object> map3 = new HashMap<>();
//		map3.put("value", "accordion.less");
//		map3.put("id", "/Code/accordion.less");
//		map3.put("size", 1969);
//		map3.put("date", 1605632400);
//		map3.put("type", "code");
//		list2.add(map3);
//		System.out.println(list2);
//		
//		list.add(map);
//		
//		ObjectMapper mapper = new ObjectMapper();
//		String result = mapper.writeValueAsString(list);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject(result);
//		mv.setViewName("drive/personalList");
//		return mv;
//	}
	
	@GetMapping(value="files",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	public List<Map<String, Object>> files(
			@RequestParam(name="id") String id, 
			@AuthenticationPrincipal(expression = "emp") EmpVO empVO){		
		int empno = empVO.getEmpno();
		PersonalDriveVO vo = new PersonalDriveVO();
		vo.setEmpno(empno);
		vo.setEmpfolroute(id);
		List<PersonalDriveVO> folder = service.selectForder(vo);
		List<Map<String, Object>> list = new ArrayList<>();
		for(int i = 0; i < folder.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			map.put("value", folder.get(i).getEmpfolnm());
			map.put("id", folder.get(i).getId());
			map.put("size", 4096);
			map.put("date", folder.get(i).getDateinfo());
			map.put("type", folder.get(i).getType());			
			list.add(map);
		}
		
		PersonalDriveVO vo2 = new PersonalDriveVO();
		vo2.setFileroute(id);
		List<PersonalDriveVO> file = service.selectFileList(vo2);
		if(file.size() > 0) {
			for(int i = 0; i < file.size(); i++) {
				Map<String, Object> map = new HashMap<>();
				map.put("value", file.get(i).getEmpfilenm());
				map.put("id", file.get(i).getId());
				map.put("size", file.get(i).getEmpfilesize());
				map.put("date", file.get(i).getCreatedate());
				map.put("type", file.get(i).getEmpfilemime());			
				list.add(map);
			}
		}		
		return list;
	}
	
	@GetMapping(value="folders",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	public List<Map<String, Object>> folder(
			@RequestParam(name="id") String id, 
			@AuthenticationPrincipal(expression = "emp") EmpVO empVO){		
		int empno = empVO.getEmpno();
		PersonalDriveVO vo = new PersonalDriveVO();
		vo.setEmpno(empno);
		vo.setEmpfolroute(id);
		List<PersonalDriveVO> folder = service.selectForder(vo);
		List<Map<String, Object>> list = new ArrayList<>();
		for(int i = 0; i < folder.size(); i++) {			
			Map<String, Object> map = new HashMap<>();
			map.put("value", folder.get(i).getEmpfolnm());
			map.put("id", folder.get(i).getId());
			map.put("size", 4096);
			map.put("date", folder.get(i).getDateinfo());
			map.put("type", folder.get(i).getType());
			System.out.println(list);
			list.add(map);		
		}		
		return list;
	}
	
	@PostMapping("makedir")
	@PreAuthorize("isAuthenticated()")
	public @ResponseBody Map<String, Object> insertFolder(
			@AuthenticationPrincipal(expression = "emp") EmpVO empVO, 
			@RequestParam(name="id") String id, 
			@RequestParam(name="name")String name, HttpServletRequest request) {
		System.out.println(id + name);
		PersonalDriveVO vo = new PersonalDriveVO();
		vo.setEmpfolnm(name);
		vo.setEmpfolroute(id);
		vo.setEmpno(empVO.getEmpno());
		
		service.insertFolder(vo);
		
		if(id != "/") {
			id = id + "/";
		}
		String path = request.getContextPath() + "/drive/personal/" +empVO.getEmpno() + id + name;
		System.out.println(path);
		File newfile = new File(path);
		 
		    if (newfile.mkdirs()){
		      System.out.println("디렉토리 생성 성공");
		    }else{
		      System.out.println("디렉토리 생성 실패");
		    }
		
		PersonalDriveVO vo2 = service.selectInsertFolder(vo);
		Map<String, Object> map = new HashMap<>();
		map.put("value", vo2.getEmpfolnm());
		map.put("id", vo2.getId());
		map.put("size", 4096);
		map.put("date", vo2.getDateinfo());
		map.put("type", vo2.getType());
		return map;
	}
	
	@PostMapping("upload")
	@PreAuthorize("isAuthenticated()")
	public @ResponseBody Map<String, Object> insertFile (
			@AuthenticationPrincipal(expression = "emp") EmpVO empVO,
			@RequestParam(name="id") String id, 
			@RequestParam(name="upload") MultipartFile file, HttpServletRequest request) {
		PersonalDriveVO vo = new PersonalDriveVO();
		vo.setEmpfolroute(id);		
	 	String[] type = file.getContentType().split("/");
		vo.setEmpfilemime(type[0]);
		vo.setEmpfilenm(file.getOriginalFilename());
		vo.setFileroute(id);
		vo.setEmpfilesize(file.getSize());
		
		service.insertFile(vo);
		
		System.out.println("파일 이름 : " + file.getOriginalFilename());
        System.out.println("파일 크기 : " + file.getSize());
        
        if(id != "/") {
			id = id + "/";
		}
        
        try (
                FileOutputStream fos = new FileOutputStream(request.getContextPath() + "/drive/personal/" +empVO.getEmpno() + id + file.getOriginalFilename());
                InputStream is = file.getInputStream();) {
            
            int readCount = 0;
            byte[] buffer = new byte[1024];
            
            while ((readCount = is.read(buffer)) != -1) {
                
                fos.write(buffer, 0, readCount);
            }
        } catch (Exception ex) {
            throw new RuntimeException("file Save Error");
        }
		
		PersonalDriveVO vo2 = service.selectInsertFile(vo);
		Map<String, Object> map = new HashMap<>();
		map.put("value", vo2.getEmpfilenm());
		map.put("id", vo2.getId());
		map.put("size", vo2.getEmpfilesize());
		map.put("date", vo2.getDateinfo());
		map.put("type", vo2.getEmpfilemime());		
		return map;
	}
	
}

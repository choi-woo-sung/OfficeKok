package kr.or.ddit.drive.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import kr.or.ddit.vo.PersonalDriveVO;

/**
 * @author 이지윤
 * @since 2020. 11. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 11. 19.      이지윤       최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IPersonalDriveDAO {
	/**
	 * 폴더 조회
	 * @param vo
	 * @return
	 */
	public List<PersonalDriveVO> selectForder(PersonalDriveVO vo);
	
	public List<PersonalDriveVO> selectAllForderList(int empno);
	
	public int insertFolder(PersonalDriveVO vo);
	
	public PersonalDriveVO selectInsertFolder(PersonalDriveVO vo);
	
	public int insertFile(PersonalDriveVO vo);
	
	public PersonalDriveVO selectInsertFile(PersonalDriveVO vo);
	
	public List<PersonalDriveVO> selectFileList(PersonalDriveVO vo);
}

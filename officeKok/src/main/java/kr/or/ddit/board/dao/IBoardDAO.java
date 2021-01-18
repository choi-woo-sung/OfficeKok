package kr.or.ddit.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.PostVO;

/**
 * 
 * @author 최우성
 * @since 2020.11.02
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
* [[개정이력(Modification Information)]]
* 수정일                          수정자               수정내용
* --------     --------    ----------------------
* 2020. 11. 02.      최우성       최초작성
* Copyright (c) 2020 by DDIT All right reserved
 *      </pre>
 */
@Repository
public interface IBoardDAO {

	public int selectPostCount(PagingVO<PostVO> pagingVO);

	public List<PostVO> selectPostList(PagingVO<PostVO> pagingVO);

	public PostVO selectPost(Integer postno);

	public int insertPost(PostVO postvo);

	public int updatePost(PostVO postvo);

	public int incrementHit(Integer postno);
	
	public int deletePost(Integer postno);	
	
	public PostVO selectPostdept (Integer deptno);
	
	public List<PostVO> mainPost (Integer deptno);
}
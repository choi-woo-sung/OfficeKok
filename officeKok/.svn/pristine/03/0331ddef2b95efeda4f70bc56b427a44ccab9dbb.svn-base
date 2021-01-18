package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.PostAttVO;
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



public interface IBoardService {
	/**
	 * 게시글의 숫자 셀때 사용
	 * @param pagingVO
	 * @return
	 */
	public int readPostCount(PagingVO<PostVO> pagingVO);
	/**
	 * 게시글의 리스트를 담아옴
	 * @param pagingVO
	 * @return
	 */
	public List<PostVO> readPostList(PagingVO<PostVO> pagingVO);
	
	
	/**
	 * 게시글을 불러옴
	 * @param bo_no
	 * @return
	 */
	public PostVO readBoard(int bo_no);
	
	/**
	 * 게시글을 만듬
	 * @param board
	 * @return
	 */
	ServiceResult createBoard(PostVO postvo);
	
	
	public PostAttVO download(int postattno);
	
	/**
	 * 게시판 삭제
	 * @param board
	 * @return
	 */
	public	ServiceResult removeBoard(PostVO postvo);
	
	
	/**
	 *  게시판 부서 관리!
	 * @param deptno
	 * @return
	 */
	public PostVO selectPostdept (Integer deptno);
	
	
	public List<PostVO> mainPost (Integer deptno);
}

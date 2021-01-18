package kr.or.ddit.board.dao;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.PostAttVO;
import kr.or.ddit.vo.PostVO;

@Repository
public interface IPostAttDAO {
	public int insertAttatchs(PostVO board);
	public PostAttVO selectAttatch(int att_no);
	public int deleteAttatchs(PostVO board);
}

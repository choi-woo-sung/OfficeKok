package kr.or.ddit.board.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.board.dao.IBoardDAO;
import kr.or.ddit.board.dao.IPostAttDAO;
import kr.or.ddit.board.dao.IReplyDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.CustomException;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.PostAttVO;
import kr.or.ddit.vo.PostVO;
import kr.or.ddit.vo.ReplyVO;

@Service
public class BoardServiceImpl implements IBoardService {

	@Inject
	IPostAttDAO postattDAO;
	
	
	@Value("#{appInfo.attatchPath}")
	File saveFolder;
	
	@PostConstruct
	public void init() {
		System.out.println(saveFolder.getAbsolutePath());
	}
	@Inject
	IBoardDAO boardDAO;
	
	@Inject
	IReplyDAO replyDAO;

	/**
	 * 신규파일업로드
	 * @param board
	 * @param session
	 * @return
	 * @throws IOException
	 */
	private boolean processAttatchFiles(PostVO postvo) throws IOException{
		// 첨부 파일 존재 여부 확인
		//2. Attatch insert n번
		List<PostAttVO> attatchList = postvo.getAttatchList();
		if(attatchList==null || attatchList.size()==0) return true;
		int rowcnt = postattDAO.insertAttatchs(postvo); // meta
		if(rowcnt>0) {
			for(PostAttVO attatch : attatchList){
				attatch.saveFile(saveFolder);
			}
		}
		return rowcnt>0;
	}
	
	
	
	
	@Override
	public int readPostCount(PagingVO<PostVO> pagingVO) {
		return boardDAO.selectPostCount(pagingVO);
	}

	@Override
	public List<PostVO> readPostList(PagingVO<PostVO> pagingVO) {
		return boardDAO.selectPostList(pagingVO);
	}

	@Override
	public PostVO readBoard(int postno) {
		PostVO board = boardDAO.selectPost(postno);
		if(board==null) throw new CustomException(postno+"번 게시글이 없음.");
		boardDAO.incrementHit(postno);
		return board;
	}
	
	@Transactional
	@Override
	public ServiceResult createBoard(PostVO postvo) {
		int rowcnt = boardDAO.insertPost(postvo);
		//1. Board insert
		
		postvo.setPost_no(postvo.getPostno());
		ServiceResult result = ServiceResult.FAILED;		
		if(rowcnt>0) {
			try {
				processAttatchFiles(postvo);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//3. binary 저장
			result = ServiceResult.OK;
		}
		return result;
	}



/**
 * 다운로드
 */
	@Override
	public PostAttVO download(int postattno) {
		PostAttVO attVO = postattDAO.selectAttatch(postattno);
		if(attVO==null)
			throw new CustomException(postattno+"에 해당하는 파일이 없음.");	
		return attVO;	}




	@Transactional
	@Override
	public ServiceResult removeBoard(PostVO postvo) {
		
		PostVO savedpost = boardDAO.selectPost(postvo.getPostno());
		ServiceResult result = null;
		
			
				
			// 기존 파일 전체 삭제
			List<PostAttVO> attatchList = savedpost.getAttatchList();
			
			deleteAttatchFiles(postvo, attatchList, true);
			
			//reply 전부 삭제
			ReplyVO reply = new ReplyVO();
			reply.setPostno(savedpost.getPostno());
			replyDAO.deleteReply(reply);
			
			
			int rowcnt = boardDAO.deletePost(postvo.getPostno());
			if(rowcnt>0) {
				//3. binary 저장
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
		}
		return result;
	}



/**
 * 
 * 기존 파일 제거
 * @param board
 * @param attatchList
 * @param session
 * @param allFlag
 */
private void deleteAttatchFiles(PostVO postvo, List<PostAttVO> postattList, boolean allFlag) {
	int[] attNos = postvo.getDeleteAttatchNos();
	if(allFlag || (attNos!=null && attNos.length>0)) {
		postattDAO.deleteAttatchs(postvo);
		if(attNos!=null && attNos.length>0) {
			Arrays.sort(attNos);
		}
		for(PostAttVO attatch : postattList) {
			if(allFlag || Arrays.binarySearch(attNos, attatch.getPostattno())>=0) {
				new File(saveFolder, attatch.getPostattsavename()).delete();
			}
		} // for end
	}// if(allFlag || (attNos!=null && attNos.length>0))
}




@Override
public PostVO selectPostdept(Integer deptno) {
	PostVO postvo = boardDAO.selectPostdept(deptno);
	return postvo;
}




@Override
public List<PostVO> mainPost(Integer deptno) {
	List<PostVO> postvo = boardDAO.mainPost(deptno);
	return postvo;
}

}

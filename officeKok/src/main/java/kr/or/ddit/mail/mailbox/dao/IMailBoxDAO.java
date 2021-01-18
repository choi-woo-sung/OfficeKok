package kr.or.ddit.mail.mailbox.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.MailBoxVO;

@Repository
public interface IMailBoxDAO {
	public int insertMailBox(List<MailBoxVO> mailBoxList);
	
	public int selectMailBoxNo();
	
	public List<MailBoxVO> selectMailBoxList(int emailaccinfono);
}
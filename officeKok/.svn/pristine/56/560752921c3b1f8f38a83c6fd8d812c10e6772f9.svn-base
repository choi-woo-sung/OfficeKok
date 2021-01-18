package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoteVO implements Serializable {

	private Integer noteno;				// 쪽지번호
	private Integer notesend;			// 보낸사람
	private Integer notereceive;		// 받는사람
	private Integer notecate;			// 카테고리번호
	private String notesubject;			// 쪽지제목
	private String notecontent;			// 쪽지내용
	private String notedate;			// 작성일자
	private String notesave;			// 저장여부
	private String notedel;				// 삭제여부
	private String noteurgent;			// 긴급여부
	private String noteread;			// 읽음여부
	private String notedeldate;			// 삭제일자
	
	private FilterCateVO filterCateVO;
	private String filtercatenm;		// 카테고리이름
	private String sender;				// 보낸사람이름
	private String receiver;			// 받는사람이름
	
	private Integer empno;
	private Integer senderno;
	private Integer receiverno;
	private String  notechk; 			// 구분자 명
	
	private SearchVO searchVO; // 일반 검색용 searchVO
}

package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostVO implements Serializable {
	private int level;
	private int rnum;
	private Integer postno;
	private Integer repostno;
	private Integer boardno;
	private Integer postwriter;
	
	private Integer post_no;
	
	@NotBlank
	@Size(max = 255)
	private String postsubject;
	@NotBlank
	@Size(max = 4000)
	private String postcontent;
	@Size(max = 7)
	private String postdate;
	private Integer posthit;
	@Size(max = 1)
	private String posthide;

	// 이거 NM임
	private String empnm;
	
	//이건 메일 받는거임
	private String empmail;
	
	
	//이거부턴 첨부파일임.
	
	private List<ReplyVO> replyList;
	private List<PostAttVO> attatchList;
	private List<MultipartFile> attatchFiles;
	
	
	public void setAttatchFiles(List<MultipartFile> attatchFiles) {
		this.attatchFiles = attatchFiles;
		if(attatchFiles!=null && attatchFiles.size()>0) {
			this.attatchList = new ArrayList<>(attatchFiles.size());
			for(MultipartFile tmp : attatchFiles) {
 				if(tmp.getOriginalFilename()==null||tmp.getSize()<=0) continue;
				attatchList.add(new PostAttVO(tmp));
			}
		}
	}
	
	private int firstAttNo; // 첨부 파일을 다중 insert 할때 시작 PK
	
	private int[] deleteAttatchNos;
	
	//이거 부서 조회할떄 씀!!
	private String deptnm;
	
	
	private Integer empno;
	
}

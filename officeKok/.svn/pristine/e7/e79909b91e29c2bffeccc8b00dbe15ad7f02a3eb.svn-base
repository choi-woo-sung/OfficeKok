package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApprovalHistoryVO {

	private Integer rn;
	
	private Integer apprhisno;
	@Size(max = 40)
	private String apprdocno;
	private Integer apprstepno;
	private String apprhisdate;
	private Integer apprhisstate;
	private String apprhisopinion;
	
	private List<ApprovalHisAttVO> apprHisAtt;
	
	private List<MultipartFile> attatchFiles;
	
	private Integer apprstepprior;
	private Integer apprhisattno;

	public void setAttatchFiles(List<MultipartFile> attatchFiles) {
		this.attatchFiles = attatchFiles;
		if (attatchFiles != null && attatchFiles.size() > 0) {
			this.apprHisAtt = new ArrayList<>(attatchFiles.size());
			for (MultipartFile attatchFile : attatchFiles) {
				if (attatchFile.getOriginalFilename() == null || attatchFile.getSize() <= 0)
					continue;
				apprHisAtt.add(new ApprovalHisAttVO(attatchFile));
			}
		}
	}
}
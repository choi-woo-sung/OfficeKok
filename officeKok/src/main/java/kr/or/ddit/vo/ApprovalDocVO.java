package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"apprdocno", "apprattno"})
public class ApprovalDocVO {

	private Integer rn;
	
	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	@Size(max = 40, groups = {UpdateGroup.class, DeleteGroup.class})
	private String apprdocno;
	@Size(max = 40)
	private String docformno;
	private Integer apprlineno;
	private Integer draftno;
	@Size(max = 255)
	private String apprdocsubject;
	@Size(max = 4000)
	private String apprdoccontent;
	private Integer apprdocstate;
	private String apprdocdate;
	
	private String empnm;
	private String deptnm;
	private String docformnm;
	private String apprhisdate;
	private Integer apprstepprior;
	private Integer apprhisstate;
	
	private String start;
	private String end;
	
	private String service;
	private String references;
	private Integer chargerempno;
	private Integer deptno;
	
	private Integer apprattno;

	private List<ApprovalAttVO> apprAttList;

	private List<MultipartFile> attatchFiles;

	public void setAttatchFiles(List<MultipartFile> attatchFiles) {
		this.attatchFiles = attatchFiles;
		if (attatchFiles != null && attatchFiles.size() > 0) {
			this.apprAttList = new ArrayList<>(attatchFiles.size());
			for (MultipartFile attatchFile : attatchFiles) {
				if (attatchFile.getOriginalFilename() == null || attatchFile.getSize() <= 0)
					continue;
				apprAttList.add(new ApprovalAttVO(attatchFile));
			}
		}
	}
}
package kr.or.ddit.vo;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApprovalAttVO {

	private Integer apprattno;
	@Size(max = 40)
	private String apprdocno;
	@Size(max = 255)
	private String apprattoriginalfilename;
	@NotBlank
	@Size(max = 255)
	private String apprattsavefilename;
	@Size(max = 255)
	private String apprattfilesize;
	@Size(max = 40)
	private String apprattmime;
	@Size(max = 255)
	private String apprattfileroute;

	private MultipartFile approvalAttFile;

	public ApprovalAttVO(MultipartFile approvalAttFile) {
		super();
		this.approvalAttFile = approvalAttFile;
		this.apprattoriginalfilename = approvalAttFile.getOriginalFilename();
		this.apprattsavefilename = UUID.randomUUID().toString();
		this.apprattfilesize = Long.toString(approvalAttFile.getSize()) + "byte";
		this.apprattmime = approvalAttFile.getContentType();
	}

	public void saveFile(File folder) throws IOException {
		if (approvalAttFile != null && approvalAttFile.getSize() > 0)
			approvalAttFile.transferTo(new File(folder, apprattsavefilename));
	}
}
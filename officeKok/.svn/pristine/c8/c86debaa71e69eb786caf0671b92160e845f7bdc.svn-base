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
@AllArgsConstructor
@NoArgsConstructor
public class ApprovalHisAttVO {

	private Integer apprhisattno;
	private Integer apprhisno;
	@NotBlank
	@Size(max = 255)
	private String apprhisoriginalfilename;
	@NotBlank
	@Size(max = 255)
	private String apprhissavefilename;
	@NotBlank
	@Size(max = 255)
	private String apprhisfilesize;
	@Size(max = 40)
	private String apprhismime;
	@NotBlank
	@Size(max = 255)
	private String apprhisfileroute;

	private MultipartFile apprHisAttFile;

	public ApprovalHisAttVO(MultipartFile apprHisAttFile) {
		super();
		this.apprHisAttFile = apprHisAttFile;
		this.apprhisoriginalfilename = apprHisAttFile.getOriginalFilename();
		this.apprhissavefilename = UUID.randomUUID().toString();
		this.apprhisfilesize = Long.toString(apprHisAttFile.getSize()) + "bytes";
		this.apprhismime = apprHisAttFile.getContentType();
	}

	public void saveFile(File folder) throws IOException {
		if (apprHisAttFile != null && apprHisAttFile.getSize() > 0)
			apprHisAttFile.transferTo(new File(folder, apprhissavefilename));
	}
}

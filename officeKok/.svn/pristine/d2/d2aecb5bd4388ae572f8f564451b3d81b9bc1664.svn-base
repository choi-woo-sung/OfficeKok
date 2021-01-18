package kr.or.ddit.vo;

import java.io.File;
import java.io.Serializable;

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
public class CalendarAttVO implements Serializable {

	public CalendarAttVO(MultipartFile attFile) {
		super();
		this.attFile = attFile;
		this.scheattoriginalfilename = attFile.getOriginalFilename();
		this.scheattmime = attFile.getContentType();
		this.scheattfilesize = attFile.getSize();
	}

	private Integer scheattno;
	private Integer schedetailno;
	@NotBlank
	@Size(max = 255)
	private String scheattoriginalfilename;
	@NotBlank
	@Size(max = 255)
	private String scheattsavefilename;
	@Size(max = 255)
	private long scheattfilesize;
	@Size(max = 255)
	private String scheattfileroute;
	@Size(max = 40)
	private String scheattmime;

	private MultipartFile attFile;

	public void saveFile(File folder) {
		if (attFile != null && attFile.getSize() > 0) {
		}
//			attFile.transferTo(new File(folder, att));
	}
}

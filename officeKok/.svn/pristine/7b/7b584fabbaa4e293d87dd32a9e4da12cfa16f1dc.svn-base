package kr.or.ddit.vo;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(of = { "postattno", "post_no" })
@NoArgsConstructor
public class PostAttVO implements Serializable {

	public PostAttVO(MultipartFile att_file) {
		super();
		this.att_file = att_file;
		this.postattfilename = att_file.getOriginalFilename();
		this.postattsavename = UUID.randomUUID().toString();
		this.postattsize = att_file.getSize();
		this.postattmime = att_file.getContentType();
	}

	private Integer postattno;
	private Integer post_no;
	@NotBlank
	@Size(max = 255)
	private String postattfilename;
	@Size(max = 4000)
	private String postattsavename;
	@Size(max = 40)
	private String postattmime;

	private Long postattsize;

	private MultipartFile att_file;
	
	
	public void saveFile(File folder) throws IOException {
		if(att_file!=null && att_file.getSize()>0)
			att_file.transferTo(new File(folder, postattsavename));
	}

}

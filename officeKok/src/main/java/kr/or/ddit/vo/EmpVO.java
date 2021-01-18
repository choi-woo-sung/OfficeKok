package kr.or.ddit.vo;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Blob;
import java.util.Base64;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.validate.UpdateGroup;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmpVO implements Serializable {

	private Integer empno; // 사번
	private Integer mgrno; // 상급자사번
	private Integer deptno; // 부서번호
	private Integer rankno; // 직급번호
	private Integer occno; // 용무번호
	@NotBlank
	@Size(max = 40)
	private String empmail; // 이메일
	
	@Size(max = 40)
	private String emppw; // 비밀번호

	private String emppw2; // 출력되는 진짜 비밀번호

	@Size(max = 13)
	private String empregno; // 주민번호
	@Size(max = 30)
	private String emphp; // 휴대전화번호
	@Size(max = 50)
	private String empnm; // 이름
	@NotBlank(groups = UpdateGroup.class)
	@Size(max = 255)
	private String empadd1; // 주소1
	@NotBlank(groups = UpdateGroup.class)
	@Size(max = 255)
	private String empadd2; // 주소2
	@NotBlank(groups = UpdateGroup.class)
	@Size(max = 30)
	private String empzip; // 우편번호
	@Size(max = 1)
	private String empgen; // 성별
	@Size(max = 7)
	private String enterdate; // 입사일
	private String leavedate; // 퇴사일
	@Size(max = 1)
	private String empdel; // 탈퇴 여부

	private String deptnm; // 부서 이름 ex) 오피스콕 경영지원부 관리팀
	private String ranknm; // 직급 이름

	private String empadd; // 주소1, 주소2 합친 거

	private List<NoteVO> noteList;

	private List<CalendarVO> scheList;
	private List<CalendarDetailVO> scheDetailList;

	private SearchVO searchVO; // 일반 검색용 searchVO
	
	private byte[] proimgfile ;  // 이녀석은 이미지 저장하는녀석
	
	private MultipartFile pro_imagefile;
	public void setpro_imagefile(MultipartFile pro_imagefile) throws IOException {
		this.pro_imagefile = pro_imagefile;
		// ????
		if(pro_imagefile!=null) {
			try(
				InputStream is = pro_imagefile.getInputStream();	
				ByteArrayOutputStream baos = new ByteArrayOutputStream();	
			){
				byte[] buffer = new byte[1024];
				int pointer = -1;
				while ((pointer=is.read(buffer)) != -1) {
					baos.write(buffer, 0, pointer);
				}
				baos.flush();
				proimgfile = baos.toByteArray();
			}
		}
			
	}
	
	public String getMem_imgBase64(){
		String base64Str = null;
		if(proimgfile!=null) {
			base64Str = Base64.getEncoder().encodeToString(proimgfile);
		}
		return base64Str;
	}
	
}

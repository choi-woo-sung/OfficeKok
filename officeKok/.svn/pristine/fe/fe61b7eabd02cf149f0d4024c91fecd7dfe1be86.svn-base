package kr.or.ddit.board.view;

import java.io.File;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.vo.PostAttVO;

public class DownloadView extends AbstractView {

	@Value("#{appInfo.attatchPath}")
	File saveFolder;
	
	@PostConstruct
	public void init() {
		System.out.println(saveFolder.getAbsolutePath());
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		PostAttVO attatch = (PostAttVO) model.get("attatch");
		String savename = attatch.getPostattsavename();
		File saveFile = new File(saveFolder, savename);
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Length", attatch.getPostattsize().toString());
		String filename = attatch.getPostattfilename();
		String agent = req.getHeader("User-Agent");
		agent = agent.toLowerCase();
		if(agent.contains("msie") || agent.contains("trident")) {
			filename = URLEncoder.encode(filename, "UTF-8");
		}else {
			filename = new String( filename.getBytes() , "ISO-8859-1");
		}
		resp.setHeader("Content-Disposition", "attatchment;filename=\""+filename+"\"");
		try(
			OutputStream os = resp.getOutputStream();
		){
			FileUtils.copyFile(saveFile, os);
		}

	}
}
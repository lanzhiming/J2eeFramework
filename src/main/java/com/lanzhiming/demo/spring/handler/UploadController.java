package com.lanzhiming.demo.spring.handler;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lanzhiming.demo.spring.entity.Plupload;
import com.lanzhiming.demo.spring.utils.PluploadUtil;

@Controller
public class UploadController {
	public static final String FileDir = "uploadfile/";

	/** 上传界面 */
	@RequestMapping("/uploadui")
	public String uploadUI() {
		return "upload2";
	}

	/** 上传处理方法 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(Plupload plupload, HttpServletRequest request,
			HttpServletResponse response) {

		// System.out.println(plupload.getChunk() + "===" + plupload.getName() +
		// "---" + plupload.getChunks());

		plupload.setRequest(request);
		// 文件存储路径
		File dir = new File(plupload.getRequest().getSession()
				.getServletContext().getRealPath("/")
				+ FileDir);

		System.out.println(dir.getPath());

		try {
			// 上传文件
			PluploadUtil.upload(plupload, dir);
			// 判断文件是否上传成功（被分成块的文件是否全部上传完成）
			if (PluploadUtil.isUploadFinish(plupload)) {
				System.out.println(plupload.getName() + "----");
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "upload";
	}
}
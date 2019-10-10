package com.mycompany.web.controller;

import java.io.File;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/ch08")
public class Ch08Controller {
	private static final Logger logger = LoggerFactory.getLogger(Ch08Controller.class);
	
	@RequestMapping("/content")
	public String content() {
		return "ch08/content";
	}
	
	@PostMapping("/fileUpload")
	public String fileUpload(String title, String description, MultipartFile attach1, MultipartFile attach2, HttpServletRequest request, Model model) throws Exception {
		ServletContext application = request.getServletContext();
		String savePath = application.getRealPath("/resources/upload/"); //파일업로드 경로 지정
		logger.debug(title);
		logger.debug(description);
		if(!attach1.isEmpty()) { //사용자가 이 파라미터로 파일을 보냈다면 logger출력
			logger.debug("---------------------");
			logger.debug("attach1 name : " + attach1.getOriginalFilename()); //DB에 저장하면 좋다
			logger.debug("attach1 type : " + attach1.getContentType()); //DB에 저장하면 좋다
			logger.debug("attach1 size : " + attach1.getSize());
			String saveFileName = new Date().getTime() + "-" + attach1.getOriginalFilename(); //오리지널 파일이름 앞에 시간정보를 붙임 //DB에 저장하면 좋다
			logger.debug("attach1 : " + saveFileName);
			attach1.transferTo(new File(savePath + saveFileName)); //엎어쓰기를 피하기 위해서 파일이름을 오리지널 파일이름으로 저장하면 안된다 → 방법으로 날짜정보를 이용
		}
		if(!attach2.isEmpty()) {
			logger.debug("---------------------");
			logger.debug("attach2 name : " + attach2.getOriginalFilename());
			logger.debug("attach2 type : " + attach2.getContentType());
			logger.debug("attach2 size : " + attach2.getSize());
			String saveFileName = new Date().getTime() + "-" + attach2.getOriginalFilename();
			logger.debug("attach2 : " + saveFileName);
			attach2.transferTo(new File(savePath + saveFileName));
		}
		
		model.addAttribute("title", title);
		model.addAttribute("description", description);
		
		if(!attach1.isEmpty()) {
			model.addAttribute("attach1", attach1.getOriginalFilename());
		}
		if(!attach2.isEmpty()){
			model.addAttribute("attach2", attach2.getOriginalFilename());
		}
		
		return "ch08/fileUpload";
	}
}

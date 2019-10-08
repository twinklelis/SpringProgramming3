package com.mycompany.web.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.web.dto.Ch03Member;
@Controller
@RequestMapping("/ch03")
public class Ch03Controller {
	private static final Logger logger = LoggerFactory.getLogger(Ch03Controller.class);
	
	@RequestMapping("/content")
	public String content() {
		return "ch03/content";
	}
	
	@RequestMapping("/join")
	public String join(String mid, String mname, String mpassword,
			@RequestParam(defaultValue = "0") int mage, @DateTimeFormat(pattern = "yyyy-MM-dd") Date mbirth) {
		//요청 파라미터는 무조건 String으로 받아오는게 정석임! (int형이든 date형이든 받아올 땐 String으로) : null을 출력할 수 있음(int 등은 불가능)
		//date or int를 이용하기위해서는 override 필요(기본값 혹은 기본타입패턴을 정해줘야함)
		logger.debug("mid : " + mid);
		logger.debug("mname : " + mname);
		logger.debug("mpassword : " + mpassword);
		logger.debug("mage : " + mage);
		logger.debug("mbirth : " + mbirth);
		return "ch03/content";
	}
	
	@RequestMapping("/join2")
	public String join2(Ch03Member member) {
		logger.debug("mid : " + member.getMid());
		logger.debug("mname : " + member.getMname());
		logger.debug("mpassword : " + member.getMpassword());
		logger.debug("mage : " + member.getMage());
		logger.debug("mbirth : " + member.getMbirth());
		return "ch03/content";
	}
	
	@RequestMapping("/join3")
	public String join3(Ch03Member member, HttpServletRequest request) {
		logger.debug("mid : " + member.getMid());
		logger.debug("mname : " + member.getMname());
		
		request.setAttribute("mid", member.getMid());
		request.setAttribute("mname", member.getMname());
		
		return "ch03/join3";
	}
}

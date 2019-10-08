package com.mycompany.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ch06")
public class Ch06Controller {
	
	@RequestMapping("/content")
	public String content() {
		return "ch06/content";
	}
	
	@PostMapping("/login")
	public String login(String mid, String mpassword, HttpSession session) {
		String loginResult = "";
		if(mid.equals("admin")) {
			if(mpassword.equals("iot12345")) {
				loginResult = "Success";
			} else {
				loginResult = "wrongPassword";
			}
		} else {
			loginResult = "wrongID";
		}
		
		//응답후에도 유지될 수 있도록 session범위에 저장해야 함
		session.setAttribute("loginResult", loginResult);
		
		return "redirect:/ch06/content";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginResult");
		return "redirect:/ch06/content";
	}
}

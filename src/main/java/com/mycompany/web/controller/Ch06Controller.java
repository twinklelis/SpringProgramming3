package com.mycompany.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.web.dto.Ch06Board;

@Controller
@RequestMapping("/ch06")
public class Ch06Controller {
	private static final Logger logger = LoggerFactory.getLogger(Ch06Controller.class);
	
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
	
	@RequestMapping("/fileDownload")
	public void fileDownload(String fname, HttpServletRequest request, HttpServletResponse response) throws Exception { //void로 하면 return타입이 필요없음, 보통 파일다운로드 할 때는 void로..!
		logger.debug(fname);
		//응답 헤더에 추가
		ServletContext application = request.getServletContext();
		String mimeType = application.getMimeType(fname);
		response.setHeader("Content-Type", mimeType); //response.setContentType("image/png");
		String userAgent = request.getHeader("User-Agent");
		String downloadName;
		
		//브라우저 버전에 따른 한글처리
		if(userAgent.contains("Trident/7.0") || userAgent.contains("MSIE")) { //Trident : IE11, MSIE : IE10 이하
			//IE11 이하 버전에서 한글 처리↓↓
			downloadName = URLEncoder.encode(fname, "UTF-8");
		} else {
			//Webkit 기반 브라우저(Chrome, Safari, Firefox, Opera, Edge)에서 한글처리↓↓
			downloadName = new String(fname.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + downloadName + "\""); //filename을 큰따옴표로 감싸기
		//파일에 대한 절대 경로 얻기
		String realPath = application.getRealPath("/resources/image/" + fname); //getServletContext()에 있는 getRealPath를 쓰라는 뜻
		//그냥 getRealPath는 웬만해선 쓰면 안되는 메소드
		File file = new File(realPath);
		response.setHeader("Content-Length", String.valueOf(file.length())); //파일의 크기를 출력해주기 ex)Desert.jpg(2.97KB)
		
		//응답 본문에 데이터 추가
		OutputStream os = response.getOutputStream();
		InputStream is = new FileInputStream(realPath);
		
		byte[] buffer = new byte[1024];
		while(true) {
			int readByte = is.read(buffer);
			if(readByte == -1) break;
			os.write(buffer, 0, readByte);
		}
		os.flush();
		os.close();
		is.close();
		
		/*PrintWriter pw = response.getWriter();
		pw.print("{\"result\":\"ok\"}"); //JSON의 법칙 : "를 사용하려면 \" 로 써주어야 함
		pw.flush();
		pw.close();*/
	}
	
	@RequestMapping("/jsonDownload1")
	public String jsonDownload1(Model model) {
		Ch06Board board = new Ch06Board();
		board.setBno(100);
		board.setBtitle("오늘의 공부");
		board.setBcontent("스프링을 공부한다");
		board.setWriter("감잡았어");
		board.setDate(new Date());
		board.setHitcount(1);
		
		model.addAttribute("board", board);
		
		return "ch06/jsonDownload1";
	}
	
	@RequestMapping("/jsonDownload2")
	public void jsonDownload2(HttpServletResponse response) throws Exception {
		Ch06Board board = new Ch06Board();
		board.setBno(333);
		board.setBtitle("달빛조각사");
		board.setBcontent("열심히 레벨업을 한다");
		board.setWriter("자동사냥");
		board.setDate(new Date());
		board.setHitcount(1);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("bno", board.getBno()); //속성명, 속성값
		jsonObject.put("btitle", board.getBtitle()); //문자는 자동적으로 큰따옴표가 들어감
		jsonObject.put("bcontent", board.getBcontent());
		jsonObject.put("writer", board.getWriter());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		jsonObject.put("date", sdf.format(board.getDate()));
		jsonObject.put("hitcount", board.getHitcount());
		String json = jsonObject.toString();
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.write(json);
		pw.flush();
		pw.close();
	}
}

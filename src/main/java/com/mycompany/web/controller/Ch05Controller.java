package com.mycompany.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.web.dto.Ch05Board;

@Controller
@RequestMapping("/ch05")
public class Ch05Controller {
	@RequestMapping("/content")
	public String content() {
		return "ch05/content";
	}
	
	@RequestMapping("/getBoardList")
	public String getBoardList(int pageNo, Model model) {
		int startNo = (pageNo-1)*10+1;
		int endNo = pageNo*10;
		
		List<Ch05Board> boardList = new ArrayList<>();
		for(int i=startNo; i<=endNo; i++) {
			Ch05Board board = new Ch05Board();
			board.setBno(i);
			board.setBtitle("졸리지만 공부한다." + i);
			board.setBcontent("꾸준히 반복학습이 중요하다.");
			board.setWriter("감자바");
			board.setDate(new Date());
			board.setHitcount(1);
			boardList.add(board);
		}
		model.addAttribute("boardList", boardList); //model은 request범위에 저장되므로 응답하고 나면 사라진다
		model.addAttribute("totalNo", 100);
		//return "ch05/getBoardList";
		return "ch05/getBoardList2";
	}
}

package com.acorn.racket.match.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.racket.match.domain.Club;
import com.acorn.racket.match.repository.MatchRepository;


@Controller
public class MatchController {
	
	@Autowired
	MatchRepository nr;

	
	//매칭 메인 
	@RequestMapping("/club")
	public String mmain(Model model) {
		List<Club> r_clubs = nr.selectTopClubs(5);
		System.out.println("상위 5개"+r_clubs);
		model.addAttribute("r_data", r_clubs);
		//우선 서비스는 나중에 만들고 레파지토리에서 바로 가져오자 마이바티스도 워스 옮겨서 쓸 것
		List<Club> list = nr.selectAll();
		System.out.println(list);
		model.addAttribute("data", list);
		return "match";
	}
	
	//조회수 증가 관련
	@PostMapping("/updateViews")
    public String updateViews(@RequestParam("p_num") int p_num, @RequestParam("targetUrl") String targetUrl) {
		nr.updateViews(p_num);
        return "redirect:" + targetUrl + "?p_num=" + p_num;
    }
	
	
	//조회수 증가와 동시에 상세페이지 이동
	@RequestMapping("/C_detail")
	public String mdetail(@RequestParam("p_num") int p_num, Model model) {
		Club clubInfo = nr.selectDetail(p_num);
	    model.addAttribute("clubInfo", clubInfo);
		return "matchDetail";
	}


}


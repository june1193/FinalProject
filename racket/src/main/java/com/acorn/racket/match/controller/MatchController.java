package com.acorn.racket.match.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.racket.match.domain.Club;
import com.acorn.racket.match.domain.Stamp;
import com.acorn.racket.match.repository.MatchRepository;

@Controller
public class MatchController {

	@Autowired
	MatchRepository nr;

	// 매칭 메인
	@RequestMapping("/club")
	public String mmain(Model model) {
		List<Club> r_clubs = nr.selectTopClubs(5);
		System.out.println("상위 5개" + r_clubs);
		model.addAttribute("r_data", r_clubs);
		// 우선 서비스는 나중에 만들고 레파지토리에서 바로 가져오자 마이바티스도 워스 옮겨서 쓸 것
		List<Club> list = nr.selectAll();
		System.out.println(list);
		model.addAttribute("data", list);
		return "match";
	}

	// 조회수 증가 관련
	@PostMapping("/updateViews")
	public String updateViews(@RequestParam("p_num") int p_num, @RequestParam("targetUrl") String targetUrl) {
		nr.updateViews(p_num);
		return "redirect:" + targetUrl + "?p_num=" + p_num;
	}

	// 조회수 증가와 동시에 상세페이지 이동
	@RequestMapping("/C_detail")
	public String mdetail(@RequestParam("p_num") int p_num, Model model) {
		Club clubInfo = nr.selectDetail(p_num);
		model.addAttribute("clubInfo", clubInfo);
		return "matchDetail";
	}

	// 스탬프 메인페이지 임시 컨트롤러
	@RequestMapping("/stamp")
	public String StampMain(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(); // 세션 가져오기
		/* String id = (String) session.getAttribute("user_ID"); */ // 세션에서 "id" 속성 값 가져오기
		 String id = "user1";  // 임시로 id 값을 설정

		// 세션에 user_ID가 없으면 뷰만 리턴
		if (id == null) {
			int countzero = 0;
			model.addAttribute("countStamp", countzero);
			return "stampMain";
		}
	
		
		List<Stamp> Slist = nr.StampData(id);
		System.out.println(Slist);
		model.addAttribute("s_data", Slist);
		
		int countS = nr.countStamps(id);
		model.addAttribute("countStamp", countS);
		return "stampMain";
	}

	
	// 스탬프 "로그인이 필요합니다" 페이지 임시 컨트롤러
	@RequestMapping("/needLogin")
	public String Stamplogin(HttpServletRequest request) {
		HttpSession session = request.getSession(); // 세션 가져오기
		// 로그인 컨트롤러에 if문으로 redirectStampingUrl값이 null값이 아니면 stamping으로 매핑
		session.setAttribute("redirectStampingUrl", "/stamping");
		return "needLogin";
	}

	// 스탬프 찍기 페이지 임시 컨트롤러
	@RequestMapping("/stamping")
	public String stamping(HttpServletRequest request) {
		HttpSession session = request.getSession(); // 세션 가져오기
		String id = (String) session.getAttribute("user_ID"); // 세션에서 "id" 속성 값 가져오기
		return "stamping"; // 로그인한 사용자이므로 스탬핑 페이지로 이동
	}
	
	//스탬프 찍기 버튼 누르면 스탬프 테이블에 인서트 하는 컨트롤러 메소드 만들 것 
	
	
}

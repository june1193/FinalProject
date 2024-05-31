package com.acorn.racket.match.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.acorn.racket.match.domain.Club;

import com.acorn.racket.match.domain.Stamp;
import com.acorn.racket.match.repository.MatchRepository;

import com.acorn.racket.match.domain.badmintonDTO;
import com.acorn.racket.match.domain.tabletennisDTO;
import com.acorn.racket.match.domain.tennisDTO;
import com.acorn.racket.match.repository.MatchRepository;
import com.acorn.racket.match.service.MatchService;
import com.google.gson.Gson;


@Controller
public class MatchController {

	@Autowired
	MatchRepository nr;
	@Autowired
	MatchService ms;

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
	@RequestMapping("/needLogin") //이건 url을 알아도 위치검사를 하기때문에 암호화 필요없다
	public String Stamplogin(HttpServletRequest request) {
		HttpSession session = request.getSession(); // 세션 가져오기
		// 로그인 컨트롤러에 if문으로 redirectStampingUrl값이 null값이 아니면 stamping으로 매핑
		session.setAttribute("redirectStampingUrl", "/stamping");
		return "needLogin";
	}

	// 스탬프 찍기 페이지 임시 컨트롤러
	@RequestMapping("/stamping") //암호화 할것
	public String stamping(HttpServletRequest request) {
		HttpSession session = request.getSession(); // 세션 가져오기
		String id = (String) session.getAttribute("user_ID"); // 세션에서 "id" 속성 값 가져오기
		//세션 아이디로 데이터를 추가해야 한다.
		return "stamping"; // 로그인한 사용자이므로 스탬핑 페이지로 이동
	}
	
	// 스탬프 인서트와 동시에 스템프 메인으로 이동 (이촌테니스장)
	@PostMapping("/stampbutton")
	public String stampinginsert(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession(); // 세션 가져오기
		/* String id = (String) session.getAttribute("user_ID"); */ // 세션에서 "id" 속성 값 가져오기
		String id = "user1";  // 임시로 id 값을 설정
		nr.addStamp(id, "S240420102801036476"); // 사용자 ID와 시설번호 추가
		redirectAttributes.addFlashAttribute("message", "스탬프가 추가되었습니다.");
		return "redirect:/stamp";
	}

	
	
	
	
	// 매치 생성 AJAX

	@RequestMapping(value = "/machjoinTennis", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> machjoincreate() {

		List<tennisDTO> list = ms.ts();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		// UTF-8 인코딩
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);

		return new ResponseEntity<>(json, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/matchjoinTableTennis", method = RequestMethod.GET)
	public ResponseEntity<String> matchjoincreate() {

		List<tabletennisDTO> list = ms.tbs();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		// UTF-8 인코딩
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);

		return new ResponseEntity<>(json, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/matchjoinbadminton" , method = RequestMethod.GET)
	public ResponseEntity<String> matchjoincreatea() {

		List<badmintonDTO> list = ms.bad();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		// UTF-8 인코딩
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);

		return new ResponseEntity<>(json, headers, HttpStatus.OK);
	}
	
	//매치생성 form post 
	//날짜 MM-DD / 시간 / 종목 / 지역 / 시설이름 / 모집인원 / 아이디 /
	
	@PostMapping("/matchCreate")
	public String matchCreate(@RequestParam("date") String date , @RequestParam("matchhhour") String hour , @RequestParam("sport") String sport , @RequestParam("region") String region , @RequestParam("place") String place , @RequestParam("membersu") String membersu) {
		
		
		
		return null;
		
	}

	
}

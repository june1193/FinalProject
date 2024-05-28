package com.acorn.racket.match.controller;

import java.util.List;

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

import com.acorn.racket.match.domain.Club;
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

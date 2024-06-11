package com.acorn.racket.match.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.acorn.racket.match.domain.Club;
import com.acorn.racket.match.domain.MatchCreateDTO;
import com.acorn.racket.match.domain.MatchCreateInsertDTO;
import com.acorn.racket.match.domain.MatchDetailInsertDTO;
import com.acorn.racket.match.domain.MatchViewDTO;
import com.acorn.racket.match.domain.Stamp;
import com.acorn.racket.match.repository.MatchRepository;

import com.acorn.racket.match.domain.badmintonDTO;
import com.acorn.racket.match.domain.matchdetailDTO;
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
	public String mmain(Model model, @RequestParam(value = "p", defaultValue = "1") int currentPage) {
		// 인기랭킹
		List<Club> r_clubs = nr.selectTopClubs(5);
		model.addAttribute("r_data", r_clubs);
		// 클럽 게시판
		int pageSize = 8; // 페이지당 보여줄 데이터 수 설정
		int totRecords = nr.getTotalCount();
		PageHandler handler = new PageHandler(currentPage, totRecords, pageSize);
		List<Club> list = nr.selectAll(currentPage, pageSize);
		model.addAttribute("data", list);
		model.addAttribute("handler", handler);
		// 매치 뷰
		List<MatchViewDTO> list2 = ms.mainMatchViewSV();
		model.addAttribute("main", list2);

		return "match";
	}
	
	//검색관련
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, @RequestParam("query") String query) {
	    List<Club> searchResults = nr.searchPosts(query); 
	    System.out.println(searchResults);
	    model.addAttribute("searchResults", searchResults);
	    return "clubSearch"; 
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
		String id = "user1"; // 임시로 id 값을 설정

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
	@RequestMapping("/needLogin") // 이건 url을 알아도 위치검사를 하기때문에 암호화 필요없다
	public String Stamplogin(HttpServletRequest request) {
		HttpSession session = request.getSession(); // 세션 가져오기
		// 로그인 컨트롤러에 if문으로 redirectStampingUrl값이 null값이 아니면 stamping으로 매핑
		session.setAttribute("redirectStampingUrl", "/stamping");
		return "needLogin";
	}

	// 스탬프 찍기 페이지 임시 컨트롤러
	@RequestMapping("/stamping") // 암호화 할것
	public String stamping(HttpServletRequest request) {
		HttpSession session = request.getSession(); // 세션 가져오기
		String id = (String) session.getAttribute("user_ID"); // 세션에서 "id" 속성 값 가져오기
		// 세션 아이디로 데이터를 추가해야 한다.
		return "stamping"; // 로그인한 사용자이므로 스탬핑 페이지로 이동
	}

	// 스탬프 인서트와 동시에 스템프 메인으로 이동 (이촌테니스장)
	@PostMapping("/stampbutton")
	public String stampinginsert(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession(); // 세션 가져오기
		/* String id = (String) session.getAttribute("user_ID"); */ // 세션에서 "id" 속성 값 가져오기
		String id = "user1"; // 임시로 id 값을 설정
		nr.addStamp(id, "S240420102801036476"); // 사용자 ID와 시설번호 추가
		redirectAttributes.addFlashAttribute("message", "스탬프가 추가되었습니다.");
		return "redirect:/stamp";
	}

	// 문의하기 컨트롤러
	@RequestMapping("/qna")
	public String QnA() {
		return "qna";
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

	@RequestMapping(value = "/matchjoinbadminton", method = RequestMethod.GET)
	public ResponseEntity<String> matchjoincreatea() {

		List<badmintonDTO> list = ms.bad();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		// UTF-8 인코딩
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);

		return new ResponseEntity<>(json, headers, HttpStatus.OK);
	}

	// 매치생성 form post
	// 날짜 MM-DD / 시간 / 종목 / 지역 / 시설이름 / 모집인원 / 아이디 /

	@RequestMapping(value = "createMatchBoard", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String matchCreate(@RequestBody MatchCreateDTO data) {

		System.out.println(data);

		ms.createMatchSV(data); // 생성

		return "success";

	}

	// 메치 디테일 표시
	@RequestMapping(value = "/getMatchDetail", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String getMatchDetail(@RequestParam("num") int num) {

		List<matchdetailDTO> list = ms.MatchDetailViewSV(num);

		
	for(matchdetailDTO list2 : list) {
			
			String birthdate = list2.getBirthday();
			  // 현재 날짜 가져오기
	        LocalDate currentDate = LocalDate.now();
	        
	        // 생년월일 파싱
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        LocalDate birthDate = LocalDate.parse(birthdate, formatter);

	        // 현재 연도와 생년월일 연도 차이 계산
	        int currentYear = currentDate.getYear();
	        int birthYear = birthDate.getYear();
	        
	        // 한국식 나이 계산 (생일이 지났는지 여부는 고려하지 않음)
	        int koreanAge = currentYear - birthYear + 1;
	        
	         
			
	        list2.setBirthday(String.valueOf(koreanAge));
		}
		 Gson gson = new Gson();
	     String json = gson.toJson(list);
	        
	     System.out.println(json);
		
	

		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/insertMatchDetail", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String matchDetailInsert(@RequestBody Map<String, Object> request) {

		String user_id = (String) request.get("user_Id");
		int match_num = (int) request.get("match_num");
		
		
		
		
		
		// id 값으로 유저 정보 찾기

		MatchCreateInsertDTO userdata = ms.getUserDataSV(user_id);
		
		// 게시물 중복검사
		
		 String checkNic = userdata.getUser_Nickname();
		 
		 boolean checkMember = ms.matchCheckSV(match_num , checkNic);
		 
		 System.out.println("체크값 : " + checkMember);
		 if(checkMember == true) {
		 

		// match_num 값으로 매치 디테일에 인서트

		MatchDetailInsertDTO insert = new MatchDetailInsertDTO();

		insert.setMatch_num(match_num);
		insert.setUser_Image_Url(userdata.getUser_Image_Url());
		insert.setUser_Nickname(userdata.getUser_Nickname());
		insert.setBirthday(userdata.getBirthday());
		insert.setUser_Level(userdata.getUser_Level());

		LocalDateTime now = LocalDateTime.now();

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		String formattedNow = now.format(formatter);

		insert.setInserttime(formattedNow);

		System.out.println("유저 정보 :" + insert);

		ms.insertMatchDetailSV(insert);

		
		ms.updateMemberSV(match_num);

		return "success";
		 }else {
			 return "err";
		 }
		 
	}
	
	// 시설 상세에서 매칭게시판 넘어오는 부분
	// 매칭 메인
	@RequestMapping("/match")
	public String Matchfacility(Model model, @RequestParam(value = "p", defaultValue = "1") int currentPage , @RequestParam("Match") String data) {
		// 인기랭킹
		List<Club> r_clubs = nr.selectTopClubs(5);
		model.addAttribute("r_data", r_clubs);
		// 클럽 게시판
		int pageSize = 8; // 페이지당 보여줄 데이터 수 설정
		int totRecords = nr.getTotalCount();
		PageHandler handler = new PageHandler(currentPage, totRecords, pageSize);
		List<Club> list = nr.selectAll(currentPage, pageSize);
		model.addAttribute("data", list);
		model.addAttribute("handler", handler);
		
		// 매치 뷰
		
		
		List<MatchViewDTO> list2 = ms.matchFacilitySV(data);
		model.addAttribute("main", list2);

		return "match";
	}
}

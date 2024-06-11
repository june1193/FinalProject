package com.acorn.racket.facility.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.racket.facility.domain.FacDTO;
import com.acorn.racket.facility.domain.ParamDTO;
import com.acorn.racket.facility.domain.ReviewDTO;
import com.acorn.racket.facility.domain.ReviewVO;
import com.acorn.racket.facility.service.FacService;


@Controller
public class FacController {
	@Autowired
	FacService service;
	
	//api db에 저장
	@RequestMapping("/insert")
	public void insertAPI( ) {	
		System.out.println("실행");
		try {
			ArrayList<FacDTO> list = service.getApiData();
			int rows = service.insert(list);
			System.out.println("들어간 레코드 수 : "+rows);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		}
	}
	
 	//시설 찾기 뷰로 이동
   @RequestMapping("/facilityList")
 	public void selectAll() {
 	 
 	}
	
   
   //시설 목록 불러오기 (필터링,검색 포함)
    @ResponseBody
	@RequestMapping("/facilityListData")	 
	public Map selectAll(@RequestBody ParamDTO options, HttpServletRequest request){			
    	int limit = options.getLimit();
    	int offset = options.getOffset();
		System.out.println( "limit = "+ + limit+ ", offset = "  + offset);
		System.out.println(options.getOptions());
		Map<String, Object> parameters = new HashMap<>();
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		//String user = "test3";
		if(user != null) {
			parameters.put("user", user);
		}else {
			parameters.put("user", null);
			//parameters.put("user", "test2");
		}
	    parameters.put("limit", limit);
	    parameters.put("offset", offset);
	    parameters.put("options", options.getOptions());
	    
	    
	    System.out.println(parameters);
	 	    
	    return service.selectFilter(parameters);
	}
	
	//시설 상세보기
	@RequestMapping(value = "/facility/{facID}", method = RequestMethod.GET)
	public String selectAll(Model model, @PathVariable String facID,HttpServletRequest request) {
		Map<String, String> parameters = new HashMap<>();
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		//String user = "test3";
		if(user != null) {
			parameters.put("user", user);
			//유저 정보 받아오기
			Map<String, Object> map = service.selectUser(user); 
			model.addAttribute("userInfo", map);
		}else {
			parameters.put("user", null);
		}
		parameters.put("facID", facID);
		FacDTO facility = service.selectDesc(parameters);
		model.addAttribute("facility", facility);
		return "facDesc";
	}
	
	//북마크 기능
	@ResponseBody
	@RequestMapping(value = "/facility/{facID}/bookmark", method = RequestMethod.GET)
	public int checkBookmark(@PathVariable String facID, HttpServletRequest request) {
		Map<String, String> param = new HashMap<>();
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		//String user = "test3";
		if(user != null) {
			param.put("facID", facID);
			param.put("user", user);
		}else {
			return -1;
		}
		//북마크에 아이디가 있는지 확인
		boolean check = service.checkBookmark(param);
		//아이디가 존재하면 delete, 없으면 insert
		if(check) {
			service.deleteBookmark(param);
		}else {
			service.insertBookmark(param);
		}
		//북마크 다시 로드
		int count = service.countBookmark(facID);
		
		return count;
	}
	
	
	//리뷰 등록
	@ResponseBody
	@RequestMapping(value = "/insertReview/{facID}", method = RequestMethod.POST)
	public Map insertReview(@PathVariable String facID, @RequestBody ReviewVO review, HttpServletRequest request) {
		Map<String, Object> param = new HashMap<>();
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		//String user = "test3";
		param.put("facID", facID);
		param.put("user", user);
		param.put("rating", review.getRating());
		param.put("content", review.getContent());
		System.out.println(review);
	
		service.insertReview(param);
		
		Map<String, Object> response = new HashMap<>();
		response.put("success", true);
				
		return response;
	}
	
	//리뷰 조회
	@ResponseBody
	@RequestMapping(value = "/selectReview/{facID}", method = RequestMethod.GET)
	public List<ReviewDTO> selectReview(@PathVariable String facID) {
		return service.selectReview(facID);
	}
	
	//평균 별점
	@ResponseBody
	@RequestMapping(value = "/avgRating/{facID}", method = RequestMethod.GET)
	public String selectRating(@PathVariable String facID) {
		return service.selectRating(facID);
	}
	
	//리뷰 수정
	@ResponseBody
	@RequestMapping(value = "/updateReview/{facID}", method = RequestMethod.POST)
	public int updateReview(@PathVariable String facID, @RequestBody ReviewVO review, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Map<String, Object> param = new HashMap<>();
		String user = (String)session.getAttribute("user");
		//String user = "test3";
		param.put("facID", facID);
		param.put("user", user);
		param.put("rating", review.getRating());
		param.put("text", review.getContent());
		
		System.out.println(review);
		
		return service.updateReview(param);
	}
	
	//리뷰 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteReview/{facID}", method = RequestMethod.GET)
	public int deleteReview(@PathVariable String facID,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Map<String, String> param = new HashMap<>();
		String user = (String)session.getAttribute("user");
		//String user = "test3";
		param.put("facID", facID);
		param.put("user", user);
		return service.deleteReview(param);
	}
	
	//마이페이지
	@RequestMapping(value = "/mypage/{userID}.do", method = RequestMethod.GET)
	public String mypage(@PathVariable String userID, Model model) {
		Map list = service.selectMyFac(userID);
		Map map = service.selectUser(userID);
		model.addAttribute("list", list);
		model.addAttribute("user", map);
		return "mypage";
	}
	
	//마이페이지에서 시설 북마크 해제
	@ResponseBody
	@RequestMapping(value = "/mypage/{userID}/update", method = RequestMethod.GET) //pathvariable 지우고 세션 받는걸로
	public Map myPageEdit(@PathVariable String userID) {
		return service.selectMyFac(userID);
	}

	
}

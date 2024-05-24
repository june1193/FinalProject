package com.acorn.racket.facility.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.racket.facility.domain.FacDTO;
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
   @RequestMapping("/facilityList2")
 	public void selectAll(Model model) {
 	 
 	}
	
   
   //시설 전체 목록 불러오기
    @ResponseBody
	@RequestMapping("/facilityListData")	 
	public List<FacDTO> selectAll( int limit, int offset){		 
		System.out.println( "limit = "+limit +  ", offset = "  + offset);
		return service.selectAll(limit, offset);
	}
    
    //필터링 추가한 코드
    @ResponseBody
	@RequestMapping(value = "/facilityListData/{sport}", method = RequestMethod.GET)	 
	public List<FacDTO> selectSport( int limit, int offset, @PathVariable String sport){
    	System.out.println("종목 : "+sport);
    	System.out.println( "limit = "+limit +  ", offset = "  + offset);
		return service.selectSport(limit, offset,sport);
	}
	
	//시설 상세보기
	@RequestMapping(value = "/facility/{facID}", method = RequestMethod.GET)
	public String selectAll(Model model, @PathVariable String facID) {
		FacDTO facility = service.selectDesc(facID);
		model.addAttribute("facility", facility);
		return "facDesc";
	}
}

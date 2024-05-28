package com.acorn.racket.facility.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.racket.facility.domain.FacDTO;
import com.acorn.racket.facility.domain.ParamDTO;
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
	
   
   //시설 목록 불러오기 (필터링 포함)
    @ResponseBody
	@RequestMapping("/facilityListData")	 
	public Map selectAll(  @RequestBody ParamDTO options){			
    	int limit = options.getLimit();
    	int offset = options.getOffset();
		System.out.println( "limit = "+ + limit+ ", offset = "  + offset);
		System.out.println(options.getOptions());
		
		Map<String, Object> parameters = new HashMap<>();
	    parameters.put("limit", limit);
	    parameters.put("offset", offset);
	    parameters.put("options", options.getOptions());
	 	    
	    return service.selectFilter(parameters);
	}
	
	//시설 상세보기
	@RequestMapping(value = "/facility/{facID}", method = RequestMethod.GET)
	public String selectAll(Model model, @PathVariable String facID) {
		FacDTO facility = service.selectDesc(facID);
		model.addAttribute("facility", facility);
		return "facDesc";
	}
}

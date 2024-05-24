package com.acorn.racket.community.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.acorn.racket.community.domain.CommunityDetailDTO;
import com.acorn.racket.community.service.CommunityService;


@Controller
public class CommunityController {

	@Autowired
	CommunityService service;
	
	
	@GetMapping("/boarddetail")
	public String writeview(Model model) {
		
		
		int postnum = 1;
		
		
		CommunityDetailDTO list = service.detailview(postnum);
		
	
		model.addAttribute("post", list );
		
		return "CommunityDetail";	
	}
}

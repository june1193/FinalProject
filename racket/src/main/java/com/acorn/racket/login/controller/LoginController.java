package com.acorn.racket.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
//	@RequestMapping( value="/login2" , method=RequestMethod.GET)
//	public String login() {		
//		return "login";		
//	}	
//	
//	
//	@RequestMapping( value="/login" , method=RequestMethod.GET)
//	public String login2(String id, String pw , HttpServletRequest request  ) {	
//		//dao확인 
//		if(id.equals("test3") && pw.equals("0915")) {
//			//세션에 등록 
//		 	HttpSession  session  =request.getSession();
//		 	session.setAttribute("user", id);		
//			return "map";	
//		}
//		return "redirect:/map";
//			
//	}
//	
//	 
}

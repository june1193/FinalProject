package com.acorn.racket.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.acorn.racket.login.domain.UserLoginDTO;

//return 값이  true => 원래요청 흐름으로 진행
//return 값이  false =>원래요청 흐름이 중지됨
// 수정
public class SessionInterceptor extends HandlerInterceptorAdapter {	   
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {
     
  	HttpSession session = request.getSession();
  		UserLoginDTO user = (UserLoginDTO) session.getAttribute("loggedInUser");		
		System.out.println("인터셉터 로그인여부:" + user);
		if (user == null){		 
			response.sendRedirect(request.getContextPath() +"/login");			 
			return false;
		}
		return true;
	} 
  
}

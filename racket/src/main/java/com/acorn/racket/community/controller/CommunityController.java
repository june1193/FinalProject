package com.acorn.racket.community.controller;



import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.racket.community.domain.CommentDTO;
import com.acorn.racket.community.domain.CommentinsertDTO;
import com.acorn.racket.community.domain.CommunityDetailDTO;
import com.acorn.racket.community.domain.CreateCommentDTO;
import com.acorn.racket.community.domain.ReviewlistDTO;
import com.acorn.racket.community.service.CommunityService;



@Controller
public class CommunityController {

	@Autowired
	CommunityService service;
	
	//게시글 상세 요청부분
	@GetMapping("/boarddetail")
	   public String writeview(Model model , @RequestParam("code") int postnum) {
	      
	      
	      
	      
	      
	      CommunityDetailDTO postview = service.detailview(postnum);
	      
	      List<CommentDTO> CommentList = service.commentviewSv(postnum);
	      
	      model.addAttribute("cmList", CommentList);
	      model.addAttribute("post", postview );
	      
	      return "CommunityDetail";   
	   }
	
	
	// 글쓰기
	   @RequestMapping(value = "/postWriter")
	   public String postWriterPage() {
	      
	      return "CommunityWriter";
	      
	   }
	   
	
	//댓글 인서트 부분

	@ResponseBody
	@RequestMapping(value = "/createcomment" , method = RequestMethod.POST)
	public CommentDTO create(@RequestBody CreateCommentDTO comment) {
		
		 	
			System.out.println("post_id: " + comment.getPost_id());
			System.out.println("user_id: " + comment.getUser_id());
			System.out.println("commentcontent: " + comment.getCommentcontent());
		    
			
			
			
		    
		    
		    // 현재 날짜와 시간을 얻습니다.
	        LocalDateTime now = LocalDateTime.now();
	        
	        
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        String formattedDate = now.format(formatter);
		    
		    
		    int post_id = comment.getPost_id();
		    String user_id = comment.getUser_id();
		    String commentcontent = comment.getCommentcontent();
		    String commentdatetime = formattedDate;
		    
		    
		    
		    service.commentInsertSv(post_id, commentcontent, commentdatetime, user_id);
			
		    
		    CommentDTO insertcomment = service.commentInsertviewSv(post_id, user_id , commentdatetime);
		    
		    System.out.println(insertcomment);
		    

		    
		    
		    return insertcomment;
		
	
	}
	
//	커뮤니티 메인 컨트롤러
	@RequestMapping("/Review")
	public String commain(Model model) {
		List<ReviewlistDTO> list = service.commain();
		model.addAttribute("list", list);
		return "review";
		
	}
	
	
//	커뮤니티 메인 검책창 필터
	@RequestMapping("/ReviewFilter")
	public String commain2(Model model, String search ) {
		
		System.out.println( search);
		
		List<ReviewlistDTO> list = service.commainFilter(search);
		model.addAttribute("list", list);
		return "review";
		
	}
	
}

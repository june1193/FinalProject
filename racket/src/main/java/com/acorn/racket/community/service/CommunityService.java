package com.acorn.racket.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.racket.community.domain.CommentDTO;
import com.acorn.racket.community.domain.CommentinsertDTO;
import com.acorn.racket.community.domain.CommunityDetailDTO;
import com.acorn.racket.community.domain.ReviewlistDTO;
import com.acorn.racket.community.repository.CommunityRepository;


@Service
public class CommunityService   implements CommunityServiceI {
	
	@Autowired
	private CommunityRepository cr;
	
	
	//게시글 뷰
	public CommunityDetailDTO detailview(int postnum){
		
		CommunityDetailDTO list =cr.postview(postnum);
		return list;
	}
	
	//게시글 댓글 뷰
	public List<CommentDTO> commentviewSv(int postid){
		
		List<CommentDTO> list = cr.commentview(postid);
		
		return list;
		
	}
	// 커뮤니티 댓글 인서트
	
	public void commentInsertSv(int post_id , String commentcontent, String commentdatetime , String user_id  ){
		
		cr.insertCommentRP(post_id, commentcontent, commentdatetime, user_id);
	}
	//ajax 작성댓글 뷰 리턴
	
	public CommentDTO commentInsertviewSv(int post_id , String user_id , String commentdatetime) {
		
		CommentDTO list = cr.insertCommentviewRP(post_id, user_id , commentdatetime);
		
		return list;
		
	}
	
	//커뮤니티 메인 목록 관련
	public List<ReviewlistDTO> commain(){
		
		
		return cr.selectC();
		
	}
	
	
	//커뮤니티 메인 목록 관련
		public List<ReviewlistDTO> commainFilter( String search){		
			
			return cr.selectCFilter( search );
			
		}
}	

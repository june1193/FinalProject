package com.acorn.racket.community.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.racket.community.domain.CommentDTO;
import com.acorn.racket.community.domain.CommentinsertDTO;
import com.acorn.racket.community.domain.CommunityDetailDTO;
import com.acorn.racket.community.domain.ReviewlistDTO;
import com.acorn.racket.community.domain.ajaxCommentDTO;

@Repository
public class CommunityRepository  implements CommunityRepositoryI {

	@Autowired
	SqlSession session;
	String ns ="com.acorn.boardMapper.";
	
	
	public CommunityDetailDTO postview(int postId){
		
		
		
		 Object o = session.selectOne(ns+"postview", postId);
		System.out.println(o);
	
		
		return session.selectOne(ns+"postview", postId);
	}
	
	public List<CommentDTO> commentview(int postid){
		
		List<CommentDTO> list = session.selectList(ns + "comment" , postid);
		
		System.out.println(list);
		
		return list;
		
	}
	//ajax 댓글 인서트 부분
	public void insertCommentRP(int post_id , String commentcontent , String commentdatetime , String user_id) {
		
		 Map<String, Object> map = new HashMap<>();
		 
		 map.put("post_id" , post_id);
		 map.put("commentcontent", commentcontent);
		 map.put("commentdatetime", commentdatetime);
		 map.put("user_id", user_id);
		 
		 session.selectList(ns+"insertComment", map);
		  
		
	}
	
	public CommentDTO insertCommentviewRP(int post_id , String user_id , String commentdatetime) {
		
		
		
		 Map<String, Object> map = new HashMap<>();
		 map.put("post_id", post_id);
		 map.put("user_id", user_id);
		 map.put("commentdatetime", commentdatetime);
		
		 CommentDTO list = session.selectOne(ns + "insertCommentview" , map);
		
		 
		 
		return list;
	}
	
//	커뮤니티 메인관련 메소드
	public List<ReviewlistDTO> selectC() {	 
		return session.selectList(ns+"selectC");
	}
	
	
//	커뮤니티 메인 검색관련 메소드
	public List<ReviewlistDTO> selectCFilter( String search) {	 
		return session.selectList(ns+"selectCFilter" , search);
	}
	
}

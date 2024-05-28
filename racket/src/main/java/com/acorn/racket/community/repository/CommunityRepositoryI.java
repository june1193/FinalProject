package com.acorn.racket.community.repository;


import java.util.List;

import com.acorn.racket.community.domain.CommentDTO;
import com.acorn.racket.community.domain.CommentinsertDTO;
import com.acorn.racket.community.domain.CommunityDetailDTO;


public interface CommunityRepositoryI {
	
	CommunityDetailDTO postview(int postid);
	
	
	List<CommentDTO> commentview(int postid);
		
	void insertCommentRP(int post_id , String commentcontent , String commentdatetime , String user_id);
	
	CommentDTO insertCommentviewRP(int post_id , String user_id , String commentdatetime);
		
	
}

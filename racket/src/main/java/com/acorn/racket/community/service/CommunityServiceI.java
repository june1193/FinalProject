package com.acorn.racket.community.service;



import java.util.List;

import com.acorn.racket.community.domain.CommentDTO;
import com.acorn.racket.community.domain.CommentinsertDTO;
import com.acorn.racket.community.domain.CommunityDetailDTO;

public interface CommunityServiceI {
	
	CommunityDetailDTO detailview(int postnum);
	
	List<CommentDTO> commentviewSv(int postid);
	
	void commentInsertSv(int post_id , String commentcontent, String commentdatetime , String user_id );
	
	CommentDTO commentInsertviewSv(int post_id , String user_id , String commentdatetime);
}//

package com.acorn.racket.community.domain;



import lombok.Data;

@Data
public class CommentDTO {

	/*
	 * commentNumber, post_id, commentcontent, commentdatetime, user_id
	 * */
	
	int commentNumber;
	int post_id;
	String commentcontent;
	String commentdatetime;
	String  user_id;
	
	
}

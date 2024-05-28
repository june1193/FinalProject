package com.acorn.racket.community.domain;

import lombok.Data;

@Data
public class CommentinsertDTO {
	
	int post_id;
	String commentcontent;
	String commentdatetime;
	String  user_id;

}

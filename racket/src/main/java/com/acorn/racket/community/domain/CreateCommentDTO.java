package com.acorn.racket.community.domain;

import lombok.Data;

@Data
public class CreateCommentDTO {
	
	
	int post_id;
	String user_id;
	String commentcontent;
	
}

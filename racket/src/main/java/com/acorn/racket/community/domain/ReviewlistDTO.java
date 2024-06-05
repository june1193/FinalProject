package com.acorn.racket.community.domain;

import lombok.Data;

@Data
public class ReviewlistDTO {
		
		int post_id;
		String board_name;
		String user_id;
		String post_title;
		String post_content;
		String post_date;
		String post_time;
		int post_views;
	
	}


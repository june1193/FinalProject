package com.acorn.racket.community.domain;

import lombok.Data;

@Data
public class InsertPostDTO {
	
//	CREATE TABLE post (
//		    post_id INT PRIMARY KEY AUTO_INCREMENT,
//		    board_name VARCHAR(255) NOT NULL,
//		    user_id VARCHAR(255) NOT NULL,
//		    post_title VARCHAR(255) NOT NULL,
//		    post_content TEXT NOT NULL,
//		    uppost INT DEFAULT 0,
//		    downpost INT DEFAULT 0,
//		    post_date DATE NOT NULL,
//		    post_time TIME NOT NULL,
//		    post_viewes INT DEFAULT 0
//		);
	String board_name;
	String user_id;
	String post_title;
	String post_content;
	String post_date;
	String post_time;
	
	
}

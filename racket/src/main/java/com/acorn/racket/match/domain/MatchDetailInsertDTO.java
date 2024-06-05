package com.acorn.racket.match.domain;

import lombok.Data;

@Data
public class MatchDetailInsertDTO {
	
//	create table matchdetail(
//			match_num int,
//			user_Image_Url VARCHAR(500),
//		    user_Nickname VARCHAR(100) NOT NULL,
//		    birthday date NOT NULL,
//		    user_Level INT NOT NULL,
//		    inserttime datetime
//		);
	
	int match_num;
	String user_Image_Url;
	String user_Nickname;
	String birthday;
	int user_Level;
	String inserttime;
	
}

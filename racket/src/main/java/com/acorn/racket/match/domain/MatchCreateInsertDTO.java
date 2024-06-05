package com.acorn.racket.match.domain;

import lombok.Data;

@Data
public class MatchCreateInsertDTO {
//	SELECT user_Nickname , birthday , user_Level , user_Image_Url
	
	
	String user_Nickname;
	String birthday;
	int user_Level;
	String user_Image_Url;
	
	
}

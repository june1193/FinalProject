package com.acorn.racket.user.domain;

import lombok.Data;

@Data
public class UserDTO {
	private String user_ID;
	private String user_Nickname;
	private String password;
	private String user_Name;
	private String birthday;
	private String user_Email;
	private String gender;
	private String exercise;
	private String user_Level;
	private String user_Image_Url;
}

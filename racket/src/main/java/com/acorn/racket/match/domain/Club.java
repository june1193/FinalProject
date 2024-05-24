package com.acorn.racket.match.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Club {
	
	private int p_num; 
    private String region;
    private String sport;
    private String id;
    private String c_name;
    private String p_title;
    private String r_date;
    private String maintext;
    private String deadline;
    private String club_thumbnail;
    private int recruit_num;
    private int views;


	/* 총 11개 */
}

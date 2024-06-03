package com.acorn.racket.match.domain;

import lombok.Data;

@Data
public class MatchViewDTO {
	/*
match_num, sprots, region, place, matchdate, matchhhour, membersu, facilityID, intro, user_id
	*/
	
	int match_num;
	String sprots;
	String region;
	String place;
	String matchdate;
	int membersu;
	String facilityID;
	String intro;
	String user_id;
}

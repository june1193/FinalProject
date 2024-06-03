package com.acorn.racket.match.domain;

import lombok.Data;

@Data
public class MatchCreateDTO {
	
	/*
	let matchdate = $('#matchdate').val(); // 매치날짜
	let matchhhour = $('#matchhhour').val();  // 매치시간
	let sprots = $('#sprots ').val(); // 종목
	let region = $('#region').val(); // 지역
	let place = $('#place').val(); // 시설이름
	let membersu = $('#membersu').val(); // 모집인원
	let intro = $('#intro').val();  // 소개글 
	let placeURL = $('#placeURL').val(); // 시설물 
	
	*/
	
	String sprots;
	String region;
	String place;
	String matchdate;
	int membersu;
	String placeURL;
	String intro;
	String user_id;
	
	
	
	
}

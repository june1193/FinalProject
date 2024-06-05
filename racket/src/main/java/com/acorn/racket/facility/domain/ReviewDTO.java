package com.acorn.racket.facility.domain;

import lombok.Data;

@Data
public class ReviewDTO {
	private String userID;
    private String userImageUrl;
    private String userNickname;
    private int rating;
    private String reviewText;
    private String date;
}

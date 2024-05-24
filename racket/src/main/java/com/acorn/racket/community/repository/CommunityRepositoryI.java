package com.acorn.racket.community.repository;


import com.acorn.racket.community.domain.CommunityDetailDTO;


public interface CommunityRepositoryI {
	
	CommunityDetailDTO postview(int postnum);
}

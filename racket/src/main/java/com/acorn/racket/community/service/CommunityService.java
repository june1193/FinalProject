package com.acorn.racket.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.racket.community.domain.CommunityDetailDTO;
import com.acorn.racket.community.repository.CommunityRepository;


@Service
public class CommunityService   implements CommunityServiceI {
	
	@Autowired
	private CommunityRepository cr;
	
	
	public CommunityDetailDTO detailview(int postnum){
		
		CommunityDetailDTO list =cr.postview(postnum);
		return list;
	}
}	

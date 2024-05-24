package com.acorn.racket.community.repository;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.racket.community.domain.CommunityDetailDTO;

@Repository
public class CommunityRepository  implements CommunityRepositoryI {

	@Autowired
	SqlSession session;
	String ns ="com.acorn.boardMapper.";
	
	
	public CommunityDetailDTO postview(int postId){
		
		
		
		 Object o = session.selectOne(ns+"postview", postId);
		System.out.println(o);
	
		
		return session.selectOne(ns+"postview", postId);
	}
	
	
	
}

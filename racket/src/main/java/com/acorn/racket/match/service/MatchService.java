package com.acorn.racket.match.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.racket.match.domain.badmintonDTO;
import com.acorn.racket.match.domain.tabletennisDTO;
import com.acorn.racket.match.domain.tennisDTO;
import com.acorn.racket.match.repository.MatchRepository;

@Service
public class MatchService  {
	
	@Autowired
	MatchRepository MRP;
	// 매치조인 AJAX
	public List<tennisDTO> ts() {
		
		List<tennisDTO> list = MRP.selectTennis();
		
		
		return list;
	}
	
	public List<tabletennisDTO> tbs(){
		
		List<tabletennisDTO> list = MRP.selectTableTennis();
		
		return list;
	}
	
	public List<badmintonDTO> bad(){
		
		List<badmintonDTO> list = MRP.selectBadminton();
		
		return list;
	}
	//매치조인 AJAX
}

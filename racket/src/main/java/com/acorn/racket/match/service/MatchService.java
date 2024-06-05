package com.acorn.racket.match.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.racket.match.domain.MatchCreateDTO;
import com.acorn.racket.match.domain.MatchCreateInsertDTO;
import com.acorn.racket.match.domain.MatchDetailInsertDTO;
import com.acorn.racket.match.domain.MatchViewDTO;
import com.acorn.racket.match.domain.badmintonDTO;
import com.acorn.racket.match.domain.matchdetailDTO;
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
	
	// 매치 게시물 생성 부분
	public void createMatchSV(MatchCreateDTO data) {
		
		MRP.createMatchRP(data);
		
		
		
	}
	
	public MatchViewDTO MatchViewSV(String user_id) {
		
		MatchViewDTO list = MRP.MatchViewRP(user_id);
		
		return list;
	}
	// 처음나올 매치 게시물 조회
	public List<MatchViewDTO> mainMatchViewSV(){
		
		List<MatchViewDTO> list = MRP.mainMatchviewRP();
		
		// list 를 순회해 데이터를 세분화 하기위해 iterator 사용
		Iterator<MatchViewDTO> iterator = list.iterator();
		
		// String 값을 날짜 형식으로 변환
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		//현재 날짜와 시간을 나타냄
		Date now = new Date();
		
		// 리스트를 순회하며 각 항목의 matchdate를 확인
		while( iterator.hasNext()) {
			MatchViewDTO item = iterator.next();
			try {
				// matchdate 문자열을 Date 객체로 변환
				Date matchDate = dateFormat.parse(item.getMatchdate());
				// matchDate가 현재 시간(now)보다 이전인 경우 해당 항목을 리스트에서 제거
				if (matchDate.before(now)) {
                    iterator.remove();
                }
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		for(MatchViewDTO item : list) {
			
			 String originalDate = item.getMatchdate();
			 
			 String modifiedDate = originalDate.substring(5, 16);
			 
			 item.setMatchdate(modifiedDate);
		}
		 
		 return list;
	}
	// 매치 게시물 클릭했을때 나올 상세 조회
	public List<matchdetailDTO> MatchDetailViewSV(int data){
		
		return MRP.MatchDetailViewRP(data);
		
	}
	// 유저정보 불러오기
	public MatchCreateInsertDTO getUserDataSV(String user_id) {
		
		return MRP.userDataRP(user_id);
	}
	//매치 디테일에 인서트
	public void insertMatchDetailSV(MatchDetailInsertDTO data) {
		
		MRP.insertMatchDetailRP(data);
		
	}
	// 맴버업데이트
	public void updateMemberSV(int data) {
		
		MRP.updateMemberRP(data);
	}
}

package com.acorn.racket.match.repository;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.acorn.racket.match.domain.Club;
import com.acorn.racket.match.domain.MatchCreateDTO;
import com.acorn.racket.match.domain.MatchCreateInsertDTO;
import com.acorn.racket.match.domain.MatchDetailInsertDTO;

import com.acorn.racket.match.domain.MatchViewDTO;
import com.acorn.racket.match.domain.Stamp;

import com.acorn.racket.match.domain.badmintonDTO;
import com.acorn.racket.match.domain.matchdetailDTO;
import com.acorn.racket.match.domain.tabletennisDTO;
import com.acorn.racket.match.domain.tennisDTO;


@Repository
public class MatchRepository {

	@Autowired // root설정파일에 있는 빈을 주입
	private SqlSession session;
	private static String namespace = "com.acorn.MatchMapper.";
	String ns ="com.acorn.matchJoinMapper.";
	
	/* 클럽 부분 */
	
	// 클럽 조회하기
	public List<Club> selectAll() {
		List<Club> result = session.selectList(namespace + "selectAll");
		return result;
	}
	
	 // 조회수 업데이트
    public void updateViews(int p_num) {
        session.update(namespace + "updateViews", p_num);
    }

    //인기 모집 공고
    public List<Club> selectTopClubs(int count) {
        return session.selectList(namespace + "selectTopClubs", count);
    }
    
    //상세페이지
    public Club selectDetail(int p_num) {
        return session.selectOne(namespace + "selectDetail", p_num);
    }
    
    // 스탬프 개수 세기 관련
    public int countStamps(String user_ID) {
        List<Stamp> stamps = session.selectList(namespace + "getStampsByUserID", user_ID);
        return stamps.size();
    }
    
    //ID에 일치하는 스탬프데이터 자체를 반환 관련 
    public List<Stamp> StampData(String user_ID) {
        return session.selectList(namespace + "getStampsByUserID", user_ID);
    }

    
   /* 매치 부분 */
    //AJAX 옵션 선택부분
    //테니스
    
    public List<tennisDTO> selectTennis(){
    	
    	List<tennisDTO> list = session.selectList(ns+"tennis");
    	
    	return list;
    }
    //탁구
    
    public List<tabletennisDTO> selectTableTennis(){
    	 List<tabletennisDTO> list = session.selectList(ns+"tabletennis");
    	 
    	 return list;
    }
    
    //배드민턴
    
    public List<badmintonDTO> selectBadminton(){
    	
    	List<badmintonDTO> list = session.selectList(ns+"badminton");
    	
    	return list;
    }
    
    //매치 게시물 등록 부분
    
    public void createMatchRP(MatchCreateDTO data) {
    	// 게시물 번호 받아오기
    	session.selectOne(ns+"insertMatchCreate",data);
    	
    	String user_id = data.getUser_id();
    	String Matchdate = data.getMatchdate();
    	
    	Map<String, Object> params = new HashMap<>();
    	params.put("user_id", user_id);
    	params.put("Matchdate", Matchdate);
    	
    	int match_num = session.selectOne(ns+"matchCreateviewInsert", params);
    	
    	// 게시물 생성자 유저정보 받아오기
    	MatchCreateInsertDTO user_nickName = session.selectOne(ns+"selectuser_nickname", user_id);
    	
    	String user = user_nickName.getUser_Nickname();
    	String getUser_Image_Url = user_nickName.getUser_Image_Url();
    	int getUser_Level =user_nickName.getUser_Level();
    	String getBirthday = user_nickName.getBirthday();
    	
    	MatchDetailInsertDTO create = new MatchDetailInsertDTO();
    	
    	create.setMatch_num(match_num);
    	create.setUser_Nickname(user);
    	create.setUser_Image_Url(getUser_Image_Url);
    	create.setUser_Level(getUser_Level);
    	create.setBirthday(getBirthday);
    	
    	LocalDateTime now = LocalDateTime.now();
        
        // 원하는 형식 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        // 현재 시간을 지정한 형식으로 포맷
        String formattedNow = now.format(formatter);
    	
    	create.setInserttime(formattedNow);
    	
    	
    	System.out.println(create);
    	// 정보 insert
    	
    	session.selectOne(ns+"MatchCreateInsert", create);
    
    	
    	
    	
    	
    }
    
    
    //등록 게시물 뷰에 AJAX 통신
    
    public MatchViewDTO MatchViewRP(String user_id) {
    	
    	MatchViewDTO list = session.selectOne(ns+"matchView" , user_id);
    	
    	return list;
    }
    
    // 처음 메인 데이터
    
    public List<MatchViewDTO> mainMatchviewRP(){
    	
    	return session.selectList(ns+"matchmainview");
    
    }
    //플레이어 상세보기
    public List<matchdetailDTO> MatchDetailViewRP(int data){
    	
    	return session.selectList(ns+"matchdetailview", data);
    }
    // 유저 데이터 받아오기
    public MatchCreateInsertDTO userDataRP(String user_id) {
    	
    	return session.selectOne(ns+"selectuser_nickname", user_id);
    }
    // 매치 디테일 인서트
    
    public void insertMatchDetailRP(MatchDetailInsertDTO data) {
    	
    	session.selectOne(ns+"MatchCreateInsert" , data);
    }
}



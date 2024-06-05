package com.acorn.racket.facility.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.racket.facility.domain.FacDTO;
import com.acorn.racket.facility.domain.ReviewDTO;


@Component
public class FacRepository implements FacRepositoryI {
	@Autowired
    private SqlSession session;
    private static String namespace = "test.facMapper.";
    
    //api db저장
    public int insert(List<FacDTO> facDto) throws Exception {
        return session.insert(namespace+"insert", facDto);
    }
    
    //시설 상세보기
    public FacDTO selectDesc(Map<String, String> param) {
    	return session.selectOne(namespace+"selectDesc", param);
    }

	//총 데이터 건수
	public int selectTotalCount(@Param("parameters") Map<String,Object> parameters) {
		return session.selectOne(namespace+"selectTotalCount", parameters);
	}
	
	//필터링 검색
	public List<FacDTO> selecFilter(@Param("parameters") Map<String,Object> parameters){
		return session.selectList(namespace+"selectFilter", parameters);
	}
	
	//북마크에 아이디 존재 확인
	public int checkBookmark(@Param("param") Map<String, String> param) {
		return session.selectOne(namespace+"checkBookmark", param);
	}
	
	//북마크 수 조회
	public int selectBookmark(String facID) {
		return session.selectOne(namespace+"countBookmark", facID);
	}
	
	//북마크 추가
	public void insertBookmark(@Param("param") Map<String, String> param) {
		session.insert(namespace+"insertBookmark", param);
	}
	
	//북마크 삭제
	public void deleteBookmark(@Param("param") Map<String, String> param) {
		session.delete(namespace+"deleteBookmark", param);
	}
	
	//리뷰 등록
	public void insertReview(@Param("param") Map<String, Object> param) {
		session.insert(namespace+"insertReview", param);
	}
	
	//리뷰 조회
	public List<ReviewDTO> selectReview(String facID){
		return session.selectList(namespace+"selectReview", facID);
	}
	
	//평균 별점
	public String seletRating(String facID) {
		return session.selectOne(namespace+"avgRating", facID);
	}
	
	//회원 정보
	public Map<String,Object> selectUser(String user) {
		return session.selectOne(namespace+"selectUser", user);
	}
	
	//리뷰 수정
	public int updateReview(@Param("param") Map<String, Object> param){
		return session.update(namespace+"updateReview", param);
	}
	
	//리뷰 삭제
	public int deleteReview(Map<String, String> param) {
		return session.delete(namespace+"deleteReview", param);
	}
	
	//찜한 시설 불러오기
	public List<FacDTO> selectMyFac(String userID){
		return session.selectList(namespace+"myFacility", userID);
	}
	
	//특정 시설 북마크한 사용자 리스트 불러오기
	public List<String> selectBookMarkUser(String facID){
		return session.selectList(namespace+"selectBookmarkUser", facID);
	}
   

}

package com.acorn.racket.facility.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.racket.facility.domain.FacDTO;
import com.acorn.racket.facility.domain.ReviewDTO;
import com.acorn.racket.facility.repository.ApiExplorer;
import com.acorn.racket.facility.repository.FacRepository;

@Component
public class FacService {
	@Autowired
	ApiExplorer api;
	@Autowired
	FacRepository repository;
	
	//필터 검색
	public Map selectFilter(Map<String,Object> parameters){
		List<FacDTO> list = repository.selecFilter(parameters);
		int count = repository.selectTotalCount(parameters);
		

		Map<String, Object> map = new HashMap ();		
		map.put("facility", list);
		map.put("count", count);
		
		return map;
	}
	
	//api 받아와서 json으로 가공 후 FacDTO타입으로 리스트 반환
	public ArrayList<FacDTO> getApiData() throws IOException{
		String result = api.getApiData();
		JSONObject rjson  = new JSONObject(result);
        JSONObject a = rjson.getJSONObject("ListPublicReservationSport");
        JSONArray items = a.getJSONArray("row");

        ArrayList<FacDTO> FacDTOList = new ArrayList<FacDTO>();
        for(int i=0; i <items.length(); i++){
            JSONObject itemJson =  items.getJSONObject(i);
            System.out.println( itemJson);
            FacDTO itemDto =  new FacDTO( itemJson);
            FacDTOList.add(itemDto);
        }
	
		return FacDTOList;
	}
	
	//api에서 받아온 데이터 db에 저장
	public int insert(ArrayList<FacDTO> list) throws Exception {
		return repository.insert(list);
	}


	//시설 상세보기
	public FacDTO selectDesc(Map<String,String> param) {
		return repository.selectDesc(param);
	}
	
	//북마크 아이디 확인
	public boolean checkBookmark(Map<String, String> param) {
		boolean check;
		int result = repository.checkBookmark(param);
		if(result > 0) {
			check = true;
		}else {
			check = false;
		}
		return check;
	}
	
	//북마크 수 조회
	public int countBookmark(String facID) {
		return repository.selectBookmark(facID);
	}
	
	//북마크 삭제
	public void deleteBookmark(Map<String, String> param) {
		repository.deleteBookmark(param);
	}
	
	//북마크 추가
	public void insertBookmark(Map<String, String> param) {
		repository.insertBookmark(param);
	}
	
	//리뷰 등록
	public void insertReview(Map<String, Object> param) {
		repository.insertReview(param);
	}
	
	//리뷰 조회
	public List<ReviewDTO> selectReview(String facID){
		return repository.selectReview(facID);
	}
	
	//평균 별점
	public String selectRating(String facID) {
		return repository.seletRating(facID);
	}
	
	//회원 정보
	public Map<String, Object> selectUser(String user){
		return repository.selectUser(user);
	}
}

package com.acorn.racket.facility.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.racket.facility.domain.FacDTO;
import com.acorn.racket.facility.repository.ApiExplorer;
import com.acorn.racket.facility.repository.FacRepository;

@Component
public class FacService {
	@Autowired
	ApiExplorer api;
	@Autowired
	FacRepository repository;
	
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
	
	//시설 전체목록 불러오기
	public List<FacDTO> selectAll(int limit, int offset){
		return repository.selectAll(limit, offset);
	}
	
	//특정 종목 불러오기
	public List<FacDTO> selectSport(int limit, int offset, String sport){
		return repository.selectSport(offset, limit, sport);
	}
	
	//시설 상세보기
	public FacDTO selectDesc(String facID) {
		return repository.selectDesc(facID);
	}
}

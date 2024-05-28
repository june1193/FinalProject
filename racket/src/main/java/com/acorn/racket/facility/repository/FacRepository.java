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


@Component
public class FacRepository implements FacRepositoryI {
	@Autowired
	DataSource ds;
	@Autowired
    private SqlSession session;
    private static String namespace = "test.facMapper.";
    
    //api db저장
    public int insert(List<FacDTO> facDto) throws Exception {
        return session.insert(namespace+"insert", facDto);
    }
    
    //시설 상세보기
    public FacDTO selectDesc(String facID) {
    	return session.selectOne(namespace+"selectDesc", facID);
    }

	@Override
	public List<FacDTO> selectSport(@Param("limit") int offset, @Param("offset") int limit, @Param("sport") String sport) {
		return session.selectList(namespace+"selectSport",  new HashMap<String, Object>() {{
	        put("limit", limit);
	        put("offset", offset);
	        put("sport",sport);
	    }});
	}
	
	//총 데이터 건수
	public int selectTotalCount(@Param("parameters") Map<String,Object> parameters) {
		return session.selectOne(namespace+"selectTotalCount", parameters);
	}
	
	//필터링 검색
	public List<FacDTO> selecFilter(@Param("parameters") Map<String,Object> parameters){
		return session.selectList(namespace+"selectFilter", parameters);
		
	}

	@Override
	public List<FacDTO> selectAll(int offset, int limit) {
		// TODO Auto-generated method stub
		return null;
	}


   

}

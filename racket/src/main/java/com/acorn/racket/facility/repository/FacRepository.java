package com.acorn.racket.facility.repository;

import java.util.HashMap;
import java.util.List;

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
	
//    //시설 전체목록 불러오기
//    public List<FacDTO> selectAll() {
//    	return session.selectList(namespace+"selectAll");
//    }
    
    //시설 상세보기
    public FacDTO selectDesc(String facID) {
    	return session.selectOne(namespace+"selectDesc", facID);
    }

	@Override
	public List<FacDTO> selectAll(@Param("limit") int limit, @Param("offset") int offset) {
		return session.selectList(namespace+"selectAll",  new HashMap<String, Object>() {{
	        put("limit", limit);
	        put("offset", offset);
	    }});
	}

	@Override
	public List<FacDTO> selectSport(@Param("limit") int offset, @Param("offset") int limit, @Param("sport") String sport) {
		return session.selectList(namespace+"selectSport",  new HashMap<String, Object>() {{
	        put("limit", limit);
	        put("offset", offset);
	        put("sport",sport);
	    }});
	}


   

}

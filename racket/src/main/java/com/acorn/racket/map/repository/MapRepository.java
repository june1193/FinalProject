package com.acorn.racket.map.repository;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.racket.map.domain.MapDTO;

@Component
public class MapRepository implements MapRepositoryI {
    @Autowired
    private DataSource ds;
    
    @Autowired
    private SqlSession session;
    
    private static final String NAMESPACE = "test.MainMapper.";

    public List<MapDTO> getUniqueFacilities() {
        return session.selectList(NAMESPACE + "getUniqueFacilities");
    }
    
    public List<MapDTO> getRecommendedPosts() {
        return session.selectList(NAMESPACE + "getRecommendedPosts");
    }
}

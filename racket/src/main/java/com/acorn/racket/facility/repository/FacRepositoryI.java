package com.acorn.racket.facility.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.acorn.racket.facility.domain.FacDTO;

public interface FacRepositoryI {
	
	public int insert(List<FacDTO> facDto) throws Exception;

	public FacDTO selectDesc(Map<String,String> param);
	
	public int selectTotalCount(@Param("parameters") Map<String,Object> parameters);
	
	public List<FacDTO> selecFilter(@Param("parameters") Map<String,Object> parameters);

}

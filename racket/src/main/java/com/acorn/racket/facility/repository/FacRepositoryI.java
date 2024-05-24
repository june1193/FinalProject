package com.acorn.racket.facility.repository;

import java.util.List;

import com.acorn.racket.facility.domain.FacDTO;

public interface FacRepositoryI {
	
	public int insert(List<FacDTO> facDto) throws Exception;
	
	public List<FacDTO> selectAll(int offset, int limit);
	
	//public List<FacDTO> selectAll();
	
	public FacDTO selectDesc(String facID);
	
	public List<FacDTO> selectSport(int offset, int limit, String sport);

}

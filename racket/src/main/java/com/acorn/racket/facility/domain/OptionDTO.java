package com.acorn.racket.facility.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class OptionDTO {
	String sport;
	List<String> region = new ArrayList<>();
	List<String> status = new ArrayList<>();
	String target;
	List<String> payment = new ArrayList<>();
	String search;
	
	public void setTarget(List<String> target) {
		String str = "";		
		for(int i=0;i<target.size();i++) {
			String item = target.get(i);
			if(i < target.size()-1) {
				item += "|";
			}
			str += item;
		}
		this.target = str;
	}
}

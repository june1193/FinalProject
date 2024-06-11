package com.acorn.racket.map.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.acorn.racket.facility.domain.FacDTO;
import com.acorn.racket.facility.service.FacService;
import com.acorn.racket.map.domain.MapDTO;
import com.acorn.racket.map.repository.MapRepository;

@Component
public class MapService {
	@Autowired
	private MapRepository repository;

	public List<MapDTO> getUniqueFacilities() {
		return repository.getUniqueFacilities();
	}

	public List<MapDTO> getRecommendedPosts() {
		// 게시물 목록 부분
		// 커뮤니티 메인 목록 관련

		List<MapDTO> list = repository.getRecommendedPosts();

		// 정규식 패턴 설정
		String regex = "src=\"([^\"]*)\"";
		Pattern pattern = Pattern.compile(regex);

		// HTML 태그 제거 정규식 패턴
		String htmlTagRegex = "<[^>]*>";
		Pattern htmlTagPattern = Pattern.compile(htmlTagRegex);

		// 리스트를 순회하며 각 게시글의 첫 번째 이미지 경로 추출 및 설정
		for (MapDTO dto : list) {
			String postContent = dto.getPost_content();
			Matcher matcher = pattern.matcher(postContent);
			
			// HTML 태그 제거
			Matcher htmlTagMatcher = htmlTagPattern.matcher(postContent);
			String plainTextContent = htmlTagMatcher.replaceAll("");
			dto.setPost_content(plainTextContent);
		}

		return list;

	}
}

package com.acorn.racket.community.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.racket.community.domain.CommentDTO;
import com.acorn.racket.community.domain.CommentinsertDTO;
import com.acorn.racket.community.domain.CommunityDetailDTO;
import com.acorn.racket.community.domain.InsertPostDTO;
import com.acorn.racket.community.domain.ReviewlistDTO;
import com.acorn.racket.community.domain.replyDTO;
import com.acorn.racket.community.repository.CommunityRepository;


@Service
public class CommunityService   implements CommunityServiceI {
	
	@Autowired
	private CommunityRepository cr;
	
	
	//게시글 뷰
	public CommunityDetailDTO detailview(int postnum){
		
		CommunityDetailDTO list =cr.postview(postnum);
		return list;
	}
	
	//게시글 댓글 뷰
	public List<CommentDTO> commentviewSv(int postid){
		
		List<CommentDTO> list = cr.commentview(postid);
		
		return list;
		
	}
	// 커뮤니티 댓글 인서트
	
	public void commentInsertSv(int post_id , String commentcontent, String commentdatetime , String user_id  ){
		
		cr.insertCommentRP(post_id, commentcontent, commentdatetime, user_id);
	}
	//ajax 작성댓글 뷰 리턴
	
	public CommentDTO commentInsertviewSv(int post_id , String user_id , String commentdatetime) {
		
		CommentDTO list = cr.insertCommentviewRP(post_id, user_id , commentdatetime);
		
		return list;
		
	}
	//게시물 작성 부분
	public void insertPostSV(InsertPostDTO data) {
		System.out.println(data);
		
		cr.insertPostRP(data);
	}
	
	public List<replyDTO> getReplySV(int post_id) {
		
		List<replyDTO> reply = cr.getReplyRP(post_id);
		
		return reply;
		
	}
	
	//대댓글 인서트 부분
	
	public void insertReplySV(replyDTO data) {
		
		cr.insertReplyRP(data);
	}
	//게시글 추천/비추천 부분
	
	public void upPostSV(int post_id) {
		cr.upPostRP(post_id);
	}
	public void downPostSV(int post_id) {
		cr.downPostRP(post_id);
	}
	//게시물 목록 부분
	   //커뮤니티 메인 목록 관련
	   public List<ReviewlistDTO> commain(){
	      
	      List<ReviewlistDTO> list =cr.selectC();
	      
	      // 정규식 패턴 설정
	      String regex = "src=\"([^\"]*)\"";
	      Pattern pattern = Pattern.compile(regex);
	      
	      // HTML 태그 제거 정규식 패턴
	      String htmlTagRegex = "<[^>]*>";
	      Pattern htmlTagPattern = Pattern.compile(htmlTagRegex);

	      // 리스트를 순회하며 각 게시글의 첫 번째 이미지 경로 추출 및 설정
	      for (ReviewlistDTO dto : list) {
	          String postContent = dto.getPost_content();
	          Matcher matcher = pattern.matcher(postContent);

	          if (matcher.find()) {
	              String firstImgSrc = matcher.group(1);
	              dto.setImg(firstImgSrc);
	          } else {
	              // 이미지가 없는 경우 null 또는 빈 문자열을 설정
	              dto.setImg(null); // 또는 dto.setImg("");
	          }
	          // HTML 태그 제거
	          Matcher htmlTagMatcher = htmlTagPattern.matcher(postContent);
	          String plainTextContent = htmlTagMatcher.replaceAll("");
	          dto.setPost_content(plainTextContent);
	      }

	      return list;
	      
	   }
	   
	   
	   //커뮤니티 메인 목록 관련
	      public List<ReviewlistDTO> commainFilter( String search){      
	         
	    	  
		      List<ReviewlistDTO> list = cr.selectCFilter( search );
		      
		      // 정규식 패턴 설정
		      String regex = "src=\"([^\"]*)\"";
		      Pattern pattern = Pattern.compile(regex);
		      
		      // HTML 태그 제거 정규식 패턴
		      String htmlTagRegex = "<[^>]*>";
		      Pattern htmlTagPattern = Pattern.compile(htmlTagRegex);

		      // 리스트를 순회하며 각 게시글의 첫 번째 이미지 경로 추출 및 설정
		      for (ReviewlistDTO dto : list) {
		          String postContent = dto.getPost_content();
		          Matcher matcher = pattern.matcher(postContent);

		          if (matcher.find()) {
		              String firstImgSrc = matcher.group(1);
		              dto.setImg(firstImgSrc);
		          } else {
		              // 이미지가 없는 경우 null 또는 빈 문자열을 설정
		              dto.setImg(null); // 또는 dto.setImg("");
		          }
		          // HTML 태그 제거
		          Matcher htmlTagMatcher = htmlTagPattern.matcher(postContent);
		          String plainTextContent = htmlTagMatcher.replaceAll("");
		          dto.setPost_content(plainTextContent);
		      }

		      return list;
		     
	      }
	
}	

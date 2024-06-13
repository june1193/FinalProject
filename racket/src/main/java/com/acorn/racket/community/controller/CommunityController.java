package com.acorn.racket.community.controller;



import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.racket.community.domain.CommentDTO;
import com.acorn.racket.community.domain.CommentinsertDTO;
import com.acorn.racket.community.domain.CommunityDetailDTO;
import com.acorn.racket.community.domain.CreateCommentDTO;
import com.acorn.racket.community.domain.InsertPostDTO;
import com.acorn.racket.community.domain.ReviewlistDTO;
import com.acorn.racket.community.domain.replyDTO;
import com.acorn.racket.community.service.CommunityService;



@Controller
public class CommunityController {

	@Autowired
	CommunityService service;
	 @Autowired
	private ServletContext servletContext;
	 
	//게시글 상세 요청부분
	@GetMapping("/boarddetail")
	public String writeview(Model model , int postnum) {
		
		
		
		
		
		CommunityDetailDTO postview = service.detailview(postnum);
		
		List<CommentDTO> CommentList = service.commentviewSv(postnum);
		List<replyDTO> reply = service.getReplySV(postnum);
		
		System.out.println(reply);
		
		model.addAttribute("cmList", CommentList);
		model.addAttribute("post", postview );
		model.addAttribute("reply", reply);
		
		return "CommunityDetail";	
	}
	
	//댓글 인서트 부분

	@ResponseBody
	@RequestMapping(value = "/createcomment" , method = RequestMethod.POST)
	public CommentDTO create(@RequestBody CreateCommentDTO comment) {
		
		 	
			System.out.println("post_id: " + comment.getPost_id());
			System.out.println("user_id: " + comment.getUser_id());
			System.out.println("commentcontent: " + comment.getCommentcontent());
		    
			
			
			
		    
		    
		    // 현재 날짜와 시간을 얻습니다.
	        LocalDateTime now = LocalDateTime.now();
	        
	        
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        String formattedDate = now.format(formatter);
		    
		    
		    int post_id = comment.getPost_id();
		    String user_id = comment.getUser_id();
		    String commentcontent = comment.getCommentcontent();
		    String commentdatetime = formattedDate;
		    
		    
		    
		    service.commentInsertSv(post_id, commentcontent, commentdatetime, user_id);
			
		    
		    CommentDTO insertcomment = service.commentInsertviewSv(post_id, user_id , commentdatetime);
		    
		    System.out.println(insertcomment);
		    

		    
		    
		    return insertcomment;
		
	
	}
	// 게시물 작성 페이지 뷰
	@RequestMapping(value = "/postWrite")
	public String getWritePage() {
		
		
		return "CommunityWriter";
	}
	
	//게시물 인설트 부분
	@RequestMapping(value = "/insertPost" , method = RequestMethod.POST , produces="text/plain;charset=UTF-8")
	public String insertPost(@RequestParam("user_id") String user_id , @RequestParam("board_name") String board_name , @RequestParam("post_title") String post_title ,@RequestParam("post_content") String post_content) {
		
		InsertPostDTO insert = new InsertPostDTO();
		insert.setBoard_name(board_name);
		insert.setUser_id(user_id);
		insert.setPost_title(post_title);
		insert.setPost_content(post_content);
		//
		// 현재 날짜와 시간을 얻습니다.
        LocalDateTime now = LocalDateTime.now();
        
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = now.format(formatter);
        insert.setPost_date(formattedDate);
        
        DateTimeFormatter formattertime = DateTimeFormatter.ofPattern("HH:mm:ss");
        String formattedtime = now.format(formattertime);
        
        insert.setPost_time(formattedtime);
        
        
        
        service.insertPostSV(insert);
		
        return "ab";
	}
	
	//summernote 이미지 업로드 부분
	
	 @RequestMapping(value = "/imgUpload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	    public ResponseEntity<String> imageUpload(@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {

	        System.out.println("Received file: " + file.getOriginalFilename());

	        try {
	            // 서버에 저장할 경로 설정 (ServletContext를 사용하여 절대 경로를 얻음)
	            String uploadDirectory = servletContext.getRealPath("/resources/boardimg/");
	            File uploadDir = new File(uploadDirectory);

	            // 디렉토리가 존재하지 않을 경우 생성
	            if (!uploadDir.exists()) {
	                uploadDir.mkdirs();
	            }

	            // 업로드 된 파일의 이름
	            String originalFileName = file.getOriginalFilename();

	            // 업로드 된 파일의 확장자
	            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

	            // 업로드 될 파일의 이름 재설정 (중복 방지를 위해 UUID 사용)
	            String uuidFileName = UUID.randomUUID().toString() + fileExtension;

	            // 위에서 설정한 서버 경로에 이미지 저장
	            File destFile = new File(uploadDirectory, uuidFileName);
	            file.transferTo(destFile);

	            System.out.println("************************ 업로드 컨트롤러 실행 ************************");
	            System.out.println("저장된 파일 경로: " + destFile.getAbsolutePath());

	            // 저장된 파일의 URL 생성
	            String fileUrl = servletContext.getContextPath() + "/resources/boardimg/" + uuidFileName;

	            // 업로드 된 파일의 URL을 응답으로 반환
	            return ResponseEntity.ok(fileUrl);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ResponseEntity.badRequest().body("이미지 업로드 실패");
	        }
	    }
	// 대댓글 인서트 부분
	 @RequestMapping(value = "/insertreply" , method = RequestMethod.POST , produces = "text/plain;charset=UTF-8")
	 @ResponseBody
	 public String insertReply(@RequestBody replyDTO replyDTO) {
		 
		 service.insertReplySV(replyDTO);
		 
		 return "success";
	 }
	 
	 @RequestMapping(value = "/uppost" , method = RequestMethod.POST)
	 @ResponseBody
	 public String upPost(@RequestBody Map<String , Integer> data) {
		 
		 int post_id = data.get("post_id");
		 
		 service.upPostSV(post_id);
		 
		 return "success";
	 }
	 
	 @RequestMapping(value = "/downpost" , method = RequestMethod.POST)
	 @ResponseBody
	 public String downPost(@RequestBody Map<String , Integer> data) {
		 
		 int post_id = data.get("post_id");
		 service.downPostSV(post_id);
		 
		 return "success";
	 }

	 
// 목록부분
//   커뮤니티 메인 컨트롤러
   
	@RequestMapping("/Review")
   public String commain(Model model) {
      
      List<ReviewlistDTO> list = service.commain();
      
      model.addAttribute("list", list);
      
      
      return "review";
      
   }

   
   
//   커뮤니티 메인 검책창 필터
   @RequestMapping("/ReviewFilter")
   public String commain2(Model model, String search ) {
      
      System.out.println( search);
      
      List<ReviewlistDTO> list = service.commainFilter(search);
      model.addAttribute("list", list);
      return "review";
      
   }
	 
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        .container {
            width: 1240px;
            margin: 0 auto;
        }

        /* 페이지 상단 카테고리 */
        .category {
            width: 100%;
            height: 80px;
            display: flex;
            align-items: center;
            padding: 5px;
        }

        a {
            text-decoration: none;
        }

        /* 제목 */
        .title_container {
            width: 100%;
            height: 100%;
            border-top: 2px solid #d3eaff;
            border-bottom: 1px solid #d3eaff;
            padding-bottom: 10px;
            padding-top: 20px;
        }

        .title {
            margin-bottom: 40px;
            padding-top: 5px;
            text-align: center;

        }

        .data {
            width: 100%;
            display: flex;
            font-size: 13px;

        }

        .date {
            border-left: 1px solid #d3eaff;
            padding-left: 10px;
        }

        .data_board {
            width: 30%;

            margin-left: auto;
            display: flex;
            justify-content: space-between;
            padding-right: 100px;
        }

        /* 내용 */
        .content {
            width: 80%;
            height: 100%;

            margin: 0 auto;

            margin-bottom: 100px;
        }

        .realcontent {
            margin-top: 80px;
        }

        .report_container {
            margin: 0 auto;
            width: 200px;
            height: 100%;
            border: 1px solid #d3eaff;
            display: flex;
            border-radius: 10pt;
            margin-bottom: 100px;
            margin-top: 200px;
        }

        /* 본문 바로아래 추천 기능 */
        .inner {
            width: 100%;
            height: 100%;

            display: flex;
            justify-content: space-between;
            text-align: center;
            align-items: center;
        }

        .inner div {
            width: 50%;
            height: 100%;

        }

        .inner p {
            font-size: 12pt;
            margin-bottom: 15px;
        }

        .inner button {
            width: 50px;
            height: 50px;
            background: none;
            border: none;
        }

        /* 댓글 */
        .comment_container {
            width: 80%;
            height: 100%;

            margin-top: 20px;
            margin: 0 auto;
        }

        .commnet_content_box {
            width: 100%;
            height: 100%;
            display: flex;
            border-bottom: 1px solid #d3eaff;
            margin-bottom: 10px;
            align-items: center;
        }

        .commnet_content_box:hover {
            background-color: #d3eaff;
        }

        .commnet_content_box div {
            padding: 5px;
        }

        .commnet_id {
            width: 10%;
            height: 100%;
            text-align: center;
            font-size: 10pt;
        }

        .commnet_content {
            width: 80%;
            height: 100%;
            font-size: 10pt;


        }

        .comment_date {
            width: 10%;
            height: 100%;
        }

        .comment_write_box {
            width: 100%;
            height: 100%;
            display: flex;
            margin-top: 20px;
            padding-top: 20px;

            align-items: center;
            background-color: #d3eaff;
            border-radius: 10px;
        }

        .write_id {
            width: 10%;
            height: 100%;
            text-align: center;
            font-size: 10pt;
        }

        .write_content {
            width: 70%;
            height: 100%;
            display: flex;
            align-items: center;
        }

        .write_function {
            width: 20%;
            height: 100%;
            display: flex;
            align-items: center;
        }

        textarea {
            width: 95%;
            height: 90px;
            margin: 0 auto;
            padding: 5px;
            margin-bottom: 15px;
            border-radius: 3px;
            resize: none;
        }

        .write_button {
            width: 100%;
            height: 100%;
        }

        .write_button button {
            width: 90px;
            height: 90px;

            border-radius: 10px;
            border: none;
            background-color: white;
        }

        .write_button button:hover {
            color: #d3eaff;
            transition: 0.3s;
        }

        .view_controller {
            width: 100%;
            height: 100%;
            margin-top: 15px;
            display: flex;
        }

        .view_controller button {
            margin-left: 5px;
            height: 26px;
            background: none;
            border: none;
            width: 70px;
            height: 30px;
        }

        button {
            cursor: pointer;
        }

        img {
            cursor: pointer;
        }
    </style>

</head>
<body>
    <!-- 글 제목 부분-->
    <div class="container" data-post-id="${post.post_id}">
        <div class="category"><a href="#" style="font-size: 2rem; font-weight: bold; color: rgb(0, 0, 0);">${post.board_name}</a>
        </div>
        <div class="title_container">
            <div class="title">
                <h2 style="font-size: 2.5rem; font-weight: bold;">${post.post_title}</h2>
            </div>
            <div class="data">
                <div class="user_id">
                    <h6>${post.user_id}</h6>
                </div>
                <div class="date" style="margin-left: 10px;">
                    <h6>${post.post_date} ${post.post_time}</h6>
                </div>
                <div class="data_board">
                    <div class="1">조회 ${post.post_views}</div>
                    <div class="2">추천 ${post.uppost}</div>
                    <div class="3">댓글 (25)</div>
                </div>
            </div>
        </div>
        <!-- 글 내용 부분 -->
        <div class="content">
            <div class="realcontent" style="padding: 0 10px;">${post.post_content}</div>
        </div>
        <div class="report_container">
            <!-- 추천 , 비추천 -->
            <div class="inner">
                <div>
                    <p style="margin-top: 5px; color: #d31900;">${post.uppost}</p>
                    <button onclick=""
                        style="background-image: url('${pageContext.request.contextPath}/resources/img/좋아요.png'); background-position: center; background-size: 100% 100%;">
                    </button>
                </div>
                <div>
                    <p style="margin-top: 5px;">${post.downpost}</p>
                    <button onclick=""
                        style="background-image: url('${pageContext.request.contextPath}/resources/img/싫어요.png'); background-position: center; background-size: 100% 100%;">
                    </button>
                </div>
            </div>
        </div>
        <!-- 댓글 부분 -->
        <div class="comment_container">
            <div class="comment">
                <ul id="commentul">
                <c:forEach items="${cmList}" var="comment">
                    <li data-comment-id="${comment.commentNumber}">
                        <div class="commnet_content_box">
                            <div class="commnet_id">${comment.user_id}</div>
                            <div class="commnet_content" style="font-size: 10pt;">
                                 ${comment.commentcontent}
                                <img src="${pageContext.request.contextPath}/resources/img/답글.png" style="height: 16px; margin-left: 5px; margin-top: 5px;"
                                    class="recomment">
                            </div>
                            <div class="comment_date" style="font-size: 10pt;">${comment.commentdatetime}</div>
                        </div>
                    </li>
                    <c:forEach items="${reply}" var="reply">
                    <c:if test="${comment.commentNumber} == ${reply.commentnumber}">
                    <li data-comment-id="${comment.commentNumber}">
                        <div class="commnet_content_box">
                            <div class="commnet_id">${reply.user_id}</div>
                            <div class="commnet_content" style="font-size: 10pt;">
                                 ${reply.commentcontent}
                                <img src="${pageContext.request.contextPath}/resources/img/답글.png" style="height: 16px; margin-left: 5px; margin-top: 5px;"
                                    class="recomment">
                            </div>
                            <div class="comment_date" style="font-size: 10pt;">${reply.commentdatetime}</div>
                        </div>
                    </li>
                    </c:if>
                    </c:forEach>
                   </c:forEach>
                </ul>
            </div>
            <!-- 댓글 작성 부분 -->
        
                <div class="comment_write_box">
                    <div class="write_id">아이디</div>
                    <div class="write_content"><textarea name="content"  id="content"
                            placeholder="커뮤니티의 품격을 유지하고 모든 사용자가 쾌적한 환경에서 소통할 수 있도록, 선정적이거나 극단적인 내용, 비속어 등의 부적절한 언어 사용은 사전 통지 없이 삭제 처리될 수 있습니다. 이러한 조치는 공공의 이익을 위해 필요하며, 모든 사용자가 서로를 존중하는 문화 속에서 자유롭게 의견을 교환할 수 있는 공간을 만드는 데 기여합니다. 이용 약관을 준수하시어 모두가 안전하고 존중받는 경험을 할 수 있도록 협조 부탁드립니다."></textarea>
                    </div>
                    <div class="write_function">
                        <div class="write_button">
                            <button onclick="createcomment()">등록</button>
                            <button>추천 + 등록</button>
                        </div>
                    </div>
                </div>
            
        </div>
        <!-- 글목록 부분 -->
        <form action="">
            <div class="view_controller">
                <button
                    style="background-image: url('${pageContext.request.contextPath}/resources/img/글목록.png'); background-position: center; background-size: 100% 100%;"></button>
                <button
                    style="margin-left: 30px; background-image: url('${pageContext.request.contextPath}/resources/img/이전글.png'); background-position: center; background-size: 100% 100%;"></button>
                <button
                    style="background-image: url('${pageContext.request.contextPath}/resources/img/다음글.png'); background-position: center; background-size: 100% 100%;"></button>
                <button
                    style="margin-left: auto; margin-right: 5px; background-image: url('${pageContext.request.contextPath}/resources/img/글쓰기.png'); background-position: center; background-size: 100% 100%;"></button>
            </div>
        </form>
    </div>
</body>

<!-- 댓글insert 스크립트 -->
<script>

function createcomment(){
	
	// 댓글 인서트
	var div = document.querySelector('div[data-post-id]');
			
	
	var postid =  div.getAttribute('data-post-id') ;		
	var user_id = "jungkiwon";
	var commentcontent = document.querySelector('#content').value;
	
	
	var commentdata = {
			post_id: postid,
			user_id: user_id,
			commentcontent: commentcontent	
	}
		
	$.ajax({
		
			url: "/racket/createcomment" ,
			type: "POST" ,
			data: JSON.stringify(commentdata) ,
			contentType: "application/json",
			dataType: "json" ,
			
			success: function(data){
						
	                updateCommentList(data);
		
					},

			error: function(err){
				console.log(err);
			}
		
	});
}

function updateCommentList(ajaxdata){
	
	let comment = `
        <li>
           <div class="commnet_content_box">
               <div class="commnet_id">${ajaxdata.user_id}</div>
               <div class="commnet_content" style="font-size: 10pt;">
                    ${ajaxdata.commentcontent}
                   <img src="${pageContext.request.contextPath}/resources/img/답글.png" style="height: 16px; margin-left: 5px; margin-top: 5px;"
                       class="recomment">
               </div>
               <div class="comment_date" style="font-size: 10pt;">${ajaxdata.commentdatetime}</div>
           </div>
       </li>
		
		`;
	$("#commentul").append(comment);
	location.reload();
}
</script>
<!-- 대댓글 스크립트 -->

<script>

    document.addEventListener('DOMContentLoaded', () => {
		
    	
        class CommentForm {
            constructor() {
                this.formHTML = `
                    <div class="comment_write_box" id="replyForm">
                        <div class="write_id">아이디</div>
                        <div class="write_content">
                            <textarea id="replyTextarea" placeholder="커뮤니티의 품격을 유지하고 모든 사용자가 쾌적한 환경에서 소통할 수 있도록, 선정적이거나 극단적인 내용, 비속어 등의 부적절한 언어 사용은 사전 통지 없이 삭제 처리될 수 있습니다. 이러한 조치는 공공의 이익을 위해 필요하며, 모든 사용자가 서로를 존중하는 문화 속에서 자유롭게 의견을 교환할 수 있는 공간을 만드는 데 기여합니다. 이용 약관을 준수하시어 모두가 안전하고 존중받는 경험을 할 수 있도록 협조 부탁드립니다."></textarea>
                        </div>
                        <div class="write_function">
                            <div class="write_button">
                                <button>등록</button>
                                <button>추천 + 등록</button>
                            </div>
                        </div>
                    </div>
                `;

            }

        }
    	
    	
    	
        let commentform = new CommentForm();
        let recomment = document.querySelectorAll('.recomment');
        let replyFormExists = false;

        recomment.forEach(recomment => {
            recomment.addEventListener('click', function () {

                let target = recomment.parentElement.parentElement;
                let replyForm = document.getElementById('replyForm');
                if (replyForm) {
                    replyForm.remove();
                } else {
                    target.insertAdjacentHTML('afterend', commentform.formHTML);
                }

            });
        });
    }); 
</script>

</html>
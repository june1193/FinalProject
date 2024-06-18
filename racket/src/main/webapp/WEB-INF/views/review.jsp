<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
       * {
            padding: 0px;
            margin: 0px;
        }
        
        a{
        text-decoration:  none;
        color: black;
        }

        #wrap {
            width: 1240px;
            margin: 0 auto;
            box-sizing: border-box;
            padding-left: 45px;
            padding-right: 45px;
        }


      
        #top-nav {
            font-weight: bold;
            text-align: center;
            margin-top: 60px;
        }

        /* 공지사항 바 */
        #top-nav #notice {
            background-color: #bdf2ff;
            cursor: pointer;
            display: inline-block;
            width: 49%;
            height: 60px;
            line-height: 60px;
            font-size: 20px;

            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        /* 문의하기 바*/
        #top-nav  #qna {
            background-color: #e4f9ff;
            cursor: pointer;
            display: inline-block;
            width: 49%;
            height: 60px;
            line-height: 60px;
            font-size: 20px;

            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        /* 검색창 바 */
        /* #search-nav {
            background-color: #ffd8d8;
            padding: 10px;
            text-align: right;

            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        } */

        /*  art-1 공지사항 글목록 */
        #board {
            width: 100%;
            border-collapse: collapse;
        }

        #board td,
        th {
            border-bottom: 1.2px solid #c9c9c9;
            padding: 8px;
            height: 50px;
        }

        /* 개별 글 a태그 */
        #board td a {
            text-decoration: none;
            color: black;
        }

        #board td a:hover {
            text-decoration: underline;
        }

        /* 첫번째 행 설정 */
        #board th {
            border-top: 1.2px solid #c9c9c9;
            border-bottom: 1.2px solid #d3eaff;
        }

        /* 첫번째, 두번째 열 설정 */
        #board td:nth-child(1),
        #board td:nth-child(2) {
            text-align: center;
            width: 200px;

        }

        /* 네번째 열 설정 */
        #board td:nth-child(4) {
            text-align: center;
            width: 250px;
        }

        /* 세번째 열 설정 */
        #board td:nth-child(3) {
            padding-left: 80px;
            text-align: left;
        }


        /* art-2 문의하기 글목록 */
        #board-2 {
            width: 100%;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .post {
            padding: 20px;
            border-bottom: 1px solid #ccc;
            height: 100px;
            margin-bottom: 5px;

        }


        .post .content{
            
            /* Webkit 기반 브라우저를 위한 예시 */
            display: -webkit-box;
            -webkit-line-clamp: 3; /* 보여줄 줄 수 */
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis; 
        }
        
       /* .post > div{
            border:1px solid black;
        }
        */
        /*
        .post:last-child {
            border-bottom: none;
        }
        
        */

        .post h2 {
            margin-top: 0;
            margin-left: 20px;
        }

        .post p {
            margin-bottom: 5px;
            margin-left: 15px;
        }

        .post .meta {
            font-size: 0.8em;
            color: #666;
        }

        #art-2 #board-2 .post {
            cursor: pointer;
        }

        #art-2 #board-2 .post h2 {
            margin-bottom: 23px;
        }

        /*리뷰 이미지*/
        .image{
            
            width: 150px; /* 이미지 크기 */
            height: 100px;
            float: left;
            margin-right: 10px;
            border: 1px solid lightgrey;
            margin-bottom: 10px;
        }

         

        .meta{
            line-height: 30px;
            margin-top: 20px;
        }


        .search-area{
            display: flex;
            align-items: center;
            margin-left: auto;
            border-bottom: 1px solid #ccc;


            height: 70px;
            position: relative;
            
            
        }

        /*  검색바*/
        .search{
            width: 270px;
            background-image: linear-gradient(to left, #FBB9AB 0%, #68D2E8 100%);
            height: 35px;
            border-radius: 20px;
            display: flex;
            overflow: hidden;
            padding: 2px;
            margin: 10px;


            position: absolute;  /* 부모의 position: relative  , 주의  부모의 크기가 있어야 함 */
            right: 0px;
            top:5px;
        }

        .search-in{
            display: flex;
            align-items: center;
            border-radius: 25px;
            background: #fff;
            width: 100%;
        }

        .search-in > input{
            height: 31px;
            border: none;
            margin-left: 15px;
            font-size: 16px;
            width: 217px;
            font-family: 'Pretendard';
            font-weight: 300;
        }

        .search-in > input:focus{
            outline: none;
        }

        .search-in > button{
            display: flex;
            border: none;
            height: 100%;
            align-items: center;
            background: transparent;
        }

        .tabler--search {
            display: inline-block;
            width: 1.4em;
            height: 1.4em;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='none' stroke='%23FBB9AB' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M3 10a7 7 0 1 0 14 0a7 7 0 1 0-14 0m18 11l-6-6'/%3E%3C/svg%3E");
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


        /* 임시 페이징 형태 */
        #paging {
            margin: 50px;
            text-align: center;
            font-size: 17px;
        }

        /* 초기 상태 */
        #art-2 {
            display: none;
        }


        .item{
            height: 100px;
        }
        
        
    </style>

    <!-- nav 클릭 로직 함수 -->
    <script>
        // 공지사항 클릭했을 때 호출되는 함수
        function ArtOne() {
            document.getElementById("art-1").style.display = "block";
            document.getElementById("art-2").style.display = "none";
            document.getElementById("notice").style.backgroundColor = "#bdf2ff";
            document.getElementById("qna").style.backgroundColor = "#e4f9ff";
        }

        // 문의하기 클릭했을 때 호출되는 함수
        function ArtTwo() {
            document.getElementById("art-1").style.display = "none";
            document.getElementById("art-2").style.display = "block";
            document.getElementById("notice").style.backgroundColor = "#e4f9ff";
            document.getElementById("qna").style.backgroundColor = "#bdf2ff";
        }
        
        
        function search(){
           
           //검색어 가져오기
           
           let searchContentTag =document.querySelector("#searchContent");
           let searchValue = searchContentTag.value;
           
           
           //요청한다.
        //   let searchValue="탁구";
           window.location.href="/racket/ReviewFilter?search=" + searchValue;
           
           
        }

    </script>
</head>

<body>

    <div id=wrap>


        <!-- 선택창 -->
        <nav>
            <div id="top-nav">
                <div id="notice" onclick=ArtOne()>후기 게시판</div>
                <div id="qna" onclick=ArtTwo()>종목별 게시판</div>
            </div>
            <!-- <div id="search-nav">검색창ㅁㅁㅁㅁㅁㅁ</div> -->
                   
            <div class="search-area">
                <div class="search">
                    <div class="search-in">
                        <input type="text" placeholder="검색어를 입력하세요"  id="searchContent">
                        <button  onclick="search()">
                            <span class="tabler--search"></span>
                        </button>
                        <div class="view_controller">
                    </div>
                    </div>
                </div>
                <a href="/racket/postWrite">
                
                <div class="view_controller">
                  <a href="/racket/postWrite"><button  type="button" style="margin-left: auto; margin-right: 5px; background-image: url('/racket/resources/img/글쓰기.png'); background-position: center; background-size: 100% 100%;"></button>
                  </a>                        
               </div>
               </a>
            </div>
        </nav> 


        <!--전체 섹션  -->
        <section>

            <!-- 후기 게시판 -->
            <article id="art-1">           

                   <div class="review_wrap">     
                                  
                    
                    <!-- 반복 -->
                    <c:forEach var="item" items="${list}">
                   <a href="/racket/boarddetail?postnum=${item.post_id}">
                       <div class="post">
                           <div class="image">
                               <c:choose>
                                   <c:when test="${not empty item.img}">
                                       <img src="${item.img}" style="width: 150px; height: 100px;">
                                   </c:when>
                                   <c:otherwise>
                                       <img src="/racket/resources/img/Noimg.jpg" style="width: 150px; height: 100px;">
                                   </c:otherwise>
                               </c:choose>
                           </div>
                           <div>
                               <div class="content">${item.post_content}</div>
                               <p class="meta">작성자: ${item.user_id} | 작성일: ${item.post_date}</p>
                           </div>
                       </div>
                   </a>
               </c:forEach>                 
                         <!--   -->
                        
                       
                     </div> 
                
            </article>


            <!-- 종목별 게시판 -->

            <article id="art-2">

                <div id="board-2">
                    <div class="post">
                        <h2>배드민턴 초심입니다</h2>
                        <p>배드민턴 우습게 봤는데 생각보다 어렵네요? 레슨을 받아야 할 것 같아요 ㅠㅠ</p>
                        <p class="meta">작성자: 민턴사랑 | 작성일: 2024-06-13</p>
                    </div>

                    <div class="post">
                        <h2>테니스는 급수가 어떻게되나요?</h2>
                        <p>배드민턴은 급수가 딱 정해져 있는것 같은데 테니스는 급수 이름이 요란하네요? 아시는분 알려주세요</p>
                        <p class="meta">작성자: 테스형 | 작성일: 2024-06-07</p>
                    </div>

                    <div class="post">
                        <h2>탁구 어렵네요</h2>
                        <p>탁구 복식은 꼭 번갈아 쳐야하나요 한번씩 치기 빡시네요 ㅠㅠ</p>
                        <p class="meta">작성자: 제빵왕김탁구 | 작성일: 2024-06-06</p>
                    </div>

                    <div class="post">
                        <h2>배드민턴 혼복 파트너 구해요</h2>
                        <p>배드민턴 여복은 파트너가 있는데.. 파트너 해주실 남성분 있나요?</p>
                        <p class="meta">작성자: 민턴사랑 | 작성일: 2024-05-25</p>
                    </div>

                    <div class="post">
                        <h2>테니스 레슨비용</h2>
                        <p>테니스 배우시는 회원님들 보통 레슨비용은 어떻게되나요?</p>
                        <p class="meta">작성자: 테스형 | 작성일: 2024-05-20</p>
                    </div>

                    <div class="post">
                        <h2>탁구 복식</h2>
                        <p>탁구 복식은 꼭 번갈아 쳐야하나요 한번씩 치기 빡시네요 ㅠㅠ</p>
                        <p class="meta">작성자: 제빵왕김탁구 | 작성일: 2024-05-17</p>
                    </div>

                    <div class="post">
                        <h2>배드민턴 신발추천</h2>
                        <p>배드민턴 신발을 바꿔야할것 같은데 요즘 유행하는 브랜드나 이쁜 운동화 추천부탁드려요</p>
                        <p class="meta">작성자: 민턴사랑 | 작성일: 2024-05-13</p>
                    </div>

                    <div class="post">
                        <h2>마포구 체육관</h2>
                        <p>마포구 배드민턴장 4코트 이상 있는 체육관 정보 알려주세요</p>
                        <p class="meta">작성자: 테스형 | 작성일: 2024-05-07</p>
                    </div>

                    <div class="post">
                        <h2>탁구...좀 알려주세요</h2>
                        <p>탁구 혼자는 실만한것 같은데 복식은.. 진짜 위치도 그렇게 넘 어려워요 잘치고 싶어요 !!</p>
                        <p class="meta">작성자: 제빵왕김탁구 | 작성일: 2024-05-07</p>
                    </div>

                    <div class="post">
                        <h2>배드민턴 고수가 되고싶어요</h2>
                        <p>배드민턴 레슨을 꼭 받아야하나봐요 ㅠㅠ 왜이렇게 어렵죠 ?? 입문하는 사람은 레슨없이는 힘들것같아요..ㅜㅜ</p>
                        <p class="meta">작성자: 민턴사랑 | 작성일: 2024-05-03</p>
                    </div>

                </div>


            </article>

        </section>

        <div id="paging">[ 1 2 3 4 5 ]</div> <!-- 페이징 -->
    </div>
</body>

</html>

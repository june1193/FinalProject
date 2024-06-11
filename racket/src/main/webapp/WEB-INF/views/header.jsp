<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <script src="https://kit.fontawesome.com/353e3b9f74.js" crossorigin="anonymous"></script>
      <header>
         <div class="wrap">
            <div class="logo">
               <a href="">
                  <h3><i class="fa-solid fa-table-tennis-paddle-ball"></i> 코트 메이트</h3>
               </a>
               <!-- 타이틀 정하기 -->
            </div>
            <nav class="nav">
               <div class="tab-container">
                  <input type="radio" name="tab" id="tab1" class="tab tab--1" data-url="/racket/club" />
                  <label class="tab_label" for="tab1">매칭</label>

                  <input type="radio" name="tab" id="tab2" class="tab tab--2" data-url="/racket/facilityList" />
                  <label class="tab_label" for="tab2">시설찾기</label>

                  <input type="radio" name="tab" id="tab3" class="tab tab--3" data-url="/racket/community" />
                  <label class="tab_label" for="tab3">커뮤니티</label>

                  <button class="button" id="user_btn"><i class="fa-regular fa-circle-user"></i></button>

                  <div class="indicator"></div>
               </div>
               <div class="user_container">
                  <div class="logout_box">
                     <div class="logout_user"><i class="fa-regular fa-face-frown"></i></div>
                     <a href="#" class="login_form">로그인</a>
                     <a href="#" class="register_form">회원가입</a>
                  </div>
                  <div class="login_box">
                     <div class="login_wrap">
                        <div class="login_user"><i class="fa-regular fa-face-smile"></i></div>
                        <div id="user_name">사용자명</div>
                        <div class="bookmark_settings">
                           <a href="#" class="user_bookmark"><i class="fa-solid fa-bookmark"></i></a>
                           <a href="#" class="user_settings"><i class="fa-solid fa-gear"></i></a>
                        </div>
                     </div>
                     <a href="#" class="user_logout">로그아웃</a>
                  </div>
               </div>
            </nav>
         </div>
      </header>
      <script>
         // 탭 변경 이벤트 리스너 추가
         var tabs = document.querySelectorAll('.tab');
         tabs.forEach(function (tab) {
            tab.addEventListener('change', function () {
               var url = this.getAttribute('data-url'); // 선택된 탭의 URL을 가져옵니다.
               if (url) {
                  document.body.classList.add('fade-out');

                  setTimeout(function () {
                     window.location = url; // 0.5초 후 페이지 이동
                  }, 600); // 탭 변화 효과를 보여준 후 페이지 이동을 위해 0.5초 대기
               }
            });
         });

         // 스탬프 페이지 이동 부드러운 효과
         var links = document.querySelectorAll('a');
         links.forEach(function (link) {
            link.addEventListener('click', function (event) {
               var href = link.getAttribute('href');
               if (href && (href.startsWith('/') || href.startsWith(location.origin))) {
                  event.preventDefault();
                  document.body.classList.add('fade-out');
                  setTimeout(function () {
                     window.location.href = href;
                  }, 500);
               }
            });
         });
         // 버튼과 사용자 컨테이너 요소를 선택
         var userButton = document.querySelector('#user_btn');
         var userContainer = document.querySelector('.user_container');

         // userButton 클릭 이벤트 리스너 추가
         userButton.addEventListener('click', function () {
            // userContainer의 표시 상태를 토글
            userContainer.classList.toggle('visible');

            // 'visible' 클래스가 있을 때에만 userContainer를 표시
            if (userContainer.classList.contains('visible')) {
               userContainer.style.visibility = 'visible';
            } else {
               userContainer.style.display = 'hidden';
            }
         });
      </script>

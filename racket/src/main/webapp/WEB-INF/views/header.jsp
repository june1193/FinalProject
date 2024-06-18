<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://kit.fontawesome.com/353e3b9f74.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/racket/resources/css/header-style.css" />
<header>
	<div class="wrap">
		<div class="logo">
			<a href="/racket/map">
				<h3>
					<i class="fa-solid fa-table-tennis-paddle-ball"></i> 코트 메이트
				</h3>
			</a>
			<!-- 타이틀 정하기 -->
		</div>
		<nav class="nav">
			<div class="tab-container">
				<a href="/racket/club" class="tab tab--1">
					<div class="tab_label">매칭</div>
				</a> <a href="/racket/facilityList" class="tab tab--2">
					<div class="tab_label">시설찾기</div>
				</a> <a href="/racket/Review" class="tab tab--3">
					<div class="tab_label">커뮤니티</div>
				</a>

				<button class="button" id="user_btn">
					<i class="fa-regular fa-circle-user"></i>
				</button>

				<div class="indicator"></div>
			</div>

			<div class="user_container">
				<c:choose>
					<c:when test="${isLoggedIn}">
						<div class="login_box">
							<div class="login_wrap">
								<div class="login_user">
									<i class="fa-regular fa-face-smile"></i>
								</div>
								<div id="user_name">${user_ID.userNickname}</div>
								<div class="bookmark_settings">
									<a href="#" class="user_bookmark"><i
										class="fa-solid fa-bookmark"></i></a> <a href="#"
										class="user_settings"><i class="fa-solid fa-gear"></i></a>
								</div>
							</div>
							<a href="#" class="user_logout" onclick="logout()">로그아웃</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="logout_box">
							<div class="logout_user">
								<i class="fa-regular fa-face-frown"></i>
							</div>
							<a href="/racket/login" class="login_form">로그인</a> <a
								href="/racket/register" class="register_form">회원가입</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</nav>
	</div>
</header>
<script>
	// 탭 변경 이벤트 리스너 추가
	var tabs = document.querySelectorAll('.tab');
	tabs.forEach(function(tab) {
		tab.addEventListener('change', function() {
			var url = this.getAttribute('data-url'); // 선택된 탭의 URL을 가져옵니다.
			if (url) {
				document.body.classList.add('fade-out');

				setTimeout(function() {
					window.location = url; // 0.5초 후 페이지 이동
				}, 600); // 탭 변화 효과를 보여준 후 페이지 이동을 위해 0.5초 대기
			}
		});
	});

	// 페이지 이동 부드러운 효과
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
       if (userContainer.classList.contains('visible')) {
          userContainer.classList.remove('visible');
          setTimeout(function () {
             userContainer.style.display = 'none';
          }, 300); // opacity 트랜지션이 완료될 시간 후에 display 변경
       } else {
          userContainer.style.display = 'block';
          requestAnimationFrame(function () {
             requestAnimationFrame(function () {
                userContainer.classList.add('visible');
             });
          });
       }
    });
       
       function logout() {
    	   fetch('/racket/logout')
    	      .then((response) => {
    	         if (response.ok) {
    	            location.reload(); // 페이지 새로고침
    	         } else {
    	            console.error('로그아웃 실패');
    	         }
    	      })
    	      .catch((error) => console.error('로그아웃 중 오류 발생:', error));
    	}
</script>

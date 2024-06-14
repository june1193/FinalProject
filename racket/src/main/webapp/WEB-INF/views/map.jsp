<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="/racket/resources/css/style.css" />
<link rel="stylesheet" href="/racket/resources/css/font.css">
<script src="https://kit.fontawesome.com/353e3b9f74.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Swiper 라이브러리 추가 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

<style>
.swiper-slide {
	width: 362px;
}
</style>
<script>
	var facmarkers = JSON.parse('${facmarkers}');
</script>
</head>
<body>
	<aside class="btn_wrap">
		<a href="/racket/stamp">
			<div class="stamp_box">
				<div class="img_box">
					<img src="/racket/resources/imgs/스탬프.png" alt="" class="stamp_img" />
				</div>
				<div class="title_box">
					스탬프 투어 <br /> 하러가기 !
				</div>
			</div>
		</a>
		<button class="top_btn" id="top_btn">
			TOP <i class="fa-solid fa-caret-up"></i>
		</button>
	</aside>
	<header>
		<div id="wrap">
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
									href="#" class="register_form">회원가입</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</nav>
		</div>
	</header>

	<div id="mapContainer">
		<div id="map"></div>
		<div id="mapContent-container"></div>
		<div class="mapImg">
			<div class="map_left"></div>
			<div class="map_right"></div>
		</div>
		<div class="mapLogo"></div>
	</div>

	<!-- Swiper -->
	<div class="facility_container">
		<div class="facility_title">
			<h3>이런 시설은 어때요?</h3>
			<p class="sub_title">사용자들이 가장 좋아하는 시설을 모아봤습니다 !</p>
		</div>
		<div class="swiper">
			<div class="swiper-wrapper">
				<c:forEach var="facility" items="${facilities}">
					<div class="swiper-slide">
						<a href="/racket/facility/${facility.facilityID}"> <img
							src="${facility.image}" alt="${facility.facName}" />
							<h3>${facility.facName}</h3>
							<p>${facility.minclassname}</p>
							<p>${facility.place}</p>
						</a>
					</div>
				</c:forEach>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
			<!-- Add Navigation -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-scrollbar"></div>
		</div>
	</div>

	<div class="post_container">
		<div class="post_title">
			<h3>가장 인기많은 게시글들을 추천해요 !</h3>
			<p style="font-weight: lighter">사용자 여러분들의 평점을 기준으로 한 상위 4개
				게시글이에요.</p>
		</div>

		<div class="post_best">
			<c:forEach var="post" items="${posts}">
				<div class="best_post${post.post_id}">
					<div class="post${post.post_id}_title">

						<div class="title_text">
							<h3>${post.post_title}</h3>
						</div>
						<div class="title_id">${post.user_id}</div>
					</div>
					<div class="post${post.post_id}_contents">
						<div class="contents_text">${post.post_content}</div>
					</div>
					<div class="post${post.post_id}_footer">
						<div class="post_date">${post.post_date}</div>
						<div class="post_right">
							<label class="container"> <input type="checkbox"
								id="checkbox${post.post_id}" />
								<div class="checkmark">
									<svg viewBox="0 0 256 256">
                                    <rect fill="none" height="256"
											width="256"></rect>
                                    <path
											d="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z"
											stroke-width="20px" stroke="#FFF" fill="none"></path>
                                </svg>
								</div>
								<div class="check_num" id="check_num${post.post_id}"
									style="font-size: 15px; font-weight: lighter">${post.uppost}</div>
							</label>
							<div class="post${post.post_id}_detail">
								<a href="/racket/boarddetail?postnum=${post.post_id}">자세히 보기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<footer>
		<div class="footer_left">
			<div class="footer_top">
				<div class="left_title">
					<a href="/racket/map" style="font-size: 24px">코트 메이트</a>
				</div>
				<div class="right_title">
					<nav class="right_nav">
						<ul class="right_list">
							<li><a href="/racket/club">매칭</a></li>
							<li><a href="/racket/facilityList">시설찾기</a></li>
							<li><a href="/racket/qna">문의하기</a></li>
							<li><a href="/racket/Review">커뮤니티</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="footer_middle">
				(04038)서울특별시 마포구 양화로 122 3층, 4층 (서교동) <br /> <i
					class="fa-solid fa-phone"></i> Tel. 02-2231-6412 (에이콘아카데미 홍대학원)
			</div>
			<div class="footer_bottom">© 2024 코트 메이트(CourtMate). All rights
				reserved.</div>
		</div>
		<div class="footer_right">
			<div class="right_logo">
				<a href="https://www.acorncampus.co.kr/"><img
					src="/racket/resources/imgs/logo3.png" alt="" /></a>
			</div>
			<div class="right_logo2">
				<a href="https://www.seoul.go.kr/main/index.jsp"><img
					src="/racket/resources/imgs/서울특별시_CI_좌우조합_서울특별시.png" alt=""
					style="width: 200px" /></a>
			</div>
		</div>
	</footer>

	<script src="/racket/resources/js/main.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAY8wsx0LtLG5OxLSA5UzXpbEAbUjnPEE0&callback=initMap"></script>
</body>
</html>

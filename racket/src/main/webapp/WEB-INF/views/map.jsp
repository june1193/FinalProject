<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="/racket/resources/css/style.css" />
<script src="https://kit.fontawesome.com/353e3b9f74.js"
	crossorigin="anonymous"></script>
<!-- Swiper 라이브러리 추가 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

<style>
.swiper-slide {
	width: 362px;
}
,
</style>
</head>
<body>
	<aside class="btn_wrap">
		<a href="/racket/stamp.jsp">
			<div class="stamp_box">
				<div class="img_box">
					<img src="/imgs/스탬프.png" alt="" class="stamp_img" />
				</div>
				<div class="title_box">
					스탬프 <br /> 찍으러가기 !
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
				<a href="">
					<h3>
						<i class="fa-solid fa-table-tennis-paddle-ball"></i> 라켓스포츠 동호회
					</h3>
				</a>
				<!-- 타이틀 정하기 -->
			</div>
			<nav class="nav">
				<div class="tab-container">
					<input type="radio" name="tab" id="tab1" class="tab tab--1"
						data-url="/racket/club" /> <label class="tab_label" for="tab1">매칭</label>

					<input type="radio" name="tab" id="tab2" class="tab tab--2"
						data-url="/racket/facility" /> <label class="tab_label"
						for="tab2">시설찾기</label> <input type="radio" name="tab" id="tab3"
						class="tab tab--3" data-url="/racket/community" /> <label
						class="tab_label" for="tab3">커뮤니티</label>

					<button class="button">
						<i class="fa-regular fa-circle-user"></i>
					</button>

					<div class="indicator"></div>
				</div>
			</nav>
		</div>
	</header>

	<div id="mapContainer">
		<div id="map"></div>
		<div class="mapImg">
			<div class="map_left"></div>
			<div class="map_right"></div>
		</div>
		<div class="mapLogo"></div>
	</div>
	<div class="facility_container">
		<div class="facility_title">
			<h3>이런 시설은 어때요?</h3>
			<p class="sub_title">사용자들이 가장 좋아하는 시설을 모아봤습니다 !</p>
		</div>
		<div class="swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="/img/트라이보울.jpg" alt="" />
					<h3>트라이볼</h3>
					<p>인천문화재단에서 운영하는 송도 트라이볼(tri-bowl)은 각종 공연, 전시, 교육프로그램을 위한
						복합문화예술공간입니다.</p>
				</div>
				<div class="swiper-slide">
					<img src="/img/the BLACK.jpg" alt="" />
					<h3>the BLACK</h3>
					<p>the BLACK은 2021년에 설립되어 아티스트와 관객이 함께 호흡하고 즐길 수 있는 공연 문화 공간으로
						다양한 장르의 공연 예술을 선보이고 있습니다.</p>
				</div>
				<div class="swiper-slide">
					<img src="/img/신포아트홀.jpg" alt="" />
					<h3>신포아트홀</h3>
					<p>김구 문화의 거리에 위치한 연극 전용공간 입니다. 4층 연습실 사용도 가능한 공간으로 극단 십년후 에서
						운영하는 공간입니다.</p>
				</div>
				<div class="swiper-slide">
					<img src="/img/흐르는 물.jpg" alt="" />
					<h3>흐르는 물</h3>
					<p>신포동 LP카페 흐르는 물</p>
				</div>
				<div class="swiper-slide">
					<img src="/img/인천수봉문화회관 소극장.jpg" alt="" />
					<h3>인천수봉문화회관 소극장</h3>
					<p>수봉공원에 위치해 다양한 연령층이 함께 즐길 수 있는 공연을 선보이고자 합니다.</p>
				</div>
				<div class="swiper-slide">
					<div class="img_box">
						<img src="/img/애관극장.jpg" alt="" />
					</div>
					<div class="text_box">
						<h3>애관극장</h3>
						<p>대한민국 최초의 극장, 애관극장입니다.</p>
					</div>
				</div>

				<div class="swiper-slide">
					<div class="img_box">
						<img src="/img/제물포도서관.jpg" alt="" />
					</div>
					<div class="text_box">
						<h3>제물포도서관</h3>
						<p>숭의동에 위치한 미추홀구립 제물포도서관</p>
					</div>
				</div>
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
			<div class="best_post1">
				<div class="post1_title">
					<h3>게시글 1 제목</h3>
				</div>
				<div class="post1_contents">
					게시글 1 <br /> 내용입니다.
					<p></p>
				</div>
				<div class="post1_footer">
					<label class="container"> <input type="checkbox" />
						<div class="checkmark">
							<svg viewBox="0 0 256 256">
                           <rect fill="none" height="256" width="256"></rect>
                           <path
									d="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z"
									stroke-width="20px" stroke="#FFF" fill="none"></path>
                        </svg>
						</div>
					</label>
					<div class="post1_detail">
						<a href="">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="best_post2">
				<div class="post2_title">
					<h3>게시글 2 제목</h3>
				</div>
				<div class="post2_detail">
					게시글 2 <br /> 내용입니다.
					<p></p>
				</div>
				<div class="post2_footer">
					<label class="container"> <input type="checkbox" />
						<div class="checkmark">
							<svg viewBox="0 0 256 256">
                           <rect fill="none" height="256" width="256"></rect>
                           <path
									d="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z"
									stroke-width="20px" stroke="#FFF" fill="none"></path>
                        </svg>
						</div>
					</label>
					<div class="post2_detail">
						<a href="">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="best_post3">
				<div class="post3_title">
					<h3>게시글 3 제목</h3>
				</div>
				<div class="post3_detail">
					게시글 3 <br /> 내용입니다.
					<p></p>
				</div>
				<div class="post3_footer">
					<label class="container"> <input type="checkbox" />
						<div class="checkmark">
							<svg viewBox="0 0 256 256">
                           <rect fill="none" height="256" width="256"></rect>
                           <path
									d="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z"
									stroke-width="20px" stroke="#FFF" fill="none"></path>
                        </svg>
						</div>
					</label>
					<div class="post3_detail">
						<a href="">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="best_post4">
				<div class="post4_title">
					<h3>게시글 4 제목</h3>
				</div>
				<div class="post4_detail">
					게시글 4 <br /> 내용입니다.
					<p></p>
				</div>
				<div class="post4_footer">
					<label class="container"> <input type="checkbox" />
						<div class="checkmark">
							<svg viewBox="0 0 256 256">
                           <rect fill="none" height="256" width="256"></rect>
                           <pathd
									="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z"stroke-width="20px"
									stroke="#FFF" fill="none">
								</path>
                        </svg>
						</div>
					</label>

					<div class="post3_detail">
						<a href="">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="foot_left">
			<div class="left_title">
				<a href=""><i class="fa-solid fa-table-tennis-paddle-ball"
					style="font-size: 32px"></i> 라켓스포츠 동호회</a>
			</div>
		</div>
		<div class="foot_right">
			<div class="right_title">
				<nav class="right_nav">
					<ul class="right_list">
						<li><a href="#">매칭</a></li>
						<li><a href="#">시설찾기</a></li>
						<li><a href="#">서울특별시</a></li>
						<li><a href="#">커뮤니티</a></li>
						<li><i class="fa-regular fa-circle-user"
							style="font-size: 32px; color: #fff"></i></li>
						<!-- 프로필 AJAX 처리 -->
					</ul>
				</nav>
			</div>
		</div>
	</footer>

	<script src="/racket/resources/js/main.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAY8wsx0LtLG5OxLSA5UzXpbEAbUjnPEE0&callback=initMap"></script>
</body>
</html>
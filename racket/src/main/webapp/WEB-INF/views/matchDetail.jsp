<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="/racket/resources/css/header-style.css">
   <link rel="stylesheet" href="/racket/resources/css/footer-style.css">
<style>
* {
	padding: 0px;
	margin: 0px;
}

#wrap {
	width: 1240px;
	margin: 0 auto;
	box-sizing: border-box;
	padding-left: 45px;
	padding-right: 45px;
}

#top_box {
	margin: 0 auto;
	border: 1px solid #eaf5ff;
	width: 100%;
	height: 180px;
	background-color: #eaf5ff;
}

#title_box {
	border: 1px solid #eaf5ff;
	width: 750px;
	height: 138px;
	margin: 0 auto;
}

#rounded_box {
	height: 35px;
}

#title_box p {
	margin-top: 8px;
}

/* 로고 이미지와 옆에 설명을 감싸는 div */
#logo_box {
	/* border: 1px solid black; */
	display: flex;
	margin-top: 8px;
}

#img_box {
	border: 1px solid black;
	width: 70px;
	height: 70px;
}

#img_box img {
	width: 100%;
	height: 100%;
	object-fit: fill;
}

#club_info {
	flex-direction: column;
	justify-content: center;
}

#club_info h2, #club_info p {
	margin: 0;
	margin-left: 13px;
}

#club_info h2 {
	margin-top: 8px;
}

#event-box {
	/* border: 1px solid black; */
	width: 750px;
	margin: 0 auto;
	height: 40px;
	/* margin-top: 140px; */
	text-align: center;
}

.event {
	/* border: 1px solid black; */
	font-size: 17px;
	display: inline-block;
	margin-top: 0px;
	padding: 0 94px 14px 94px;
}

.event:hover {
	border-bottom: 5px solid rgb(0, 255, 166);
	cursor: pointer;
}

.event:nth-child(1) {
	border-bottom: 5px solid rgb(0, 255, 166);
}

#Recruitment_period {
	box-sizing: border-box;
	background-color: #eaf5ff;
	/* border: 1px solid black; */
	width: 750px;
	height: 70px;
	margin: 0 auto;
	margin-top: 15px;
	margin-bottom: 15px;
	padding: 15px 0 15px 10px;
}

#poster {
	box-sizing: border-box;
	border: 1px solid black;
	width: 750px;
	height: 850px;
	margin: 0 auto;
}

#poster img {
	width: 100%;
	height: 100%;
	object-fit: fill;
}

#main_text {
	box-sizing: border-box;
	/* 	border: 1px solid black; */
	width: 750px;
	height: 1500px;
	margin: 0 auto;
	margin-top: 15px;
	background-color: #eaf5ff;
	padding-top: 30px;
}

#main_post {
	/* 	border: 1px solid black; */
	box-sizing: border-box;
	width: 700px;
	height: 1400px;
	margin: 0 auto;
}

#p_title_box {
	/* 	border: 1px solid black; */
	height: 40px;
}

#three_b {
	width: 750px;
	height: 40px;
	margin: 0 auto;
	margin-top: 25px;
}

.b {
	box-sizing: border-box;
	border: 1px solid black;
	padding: 5px;
	margin-right: 10px;
	text-decoration: none;
	/* 밑줄 제거 */
	color: navy;
	/* 글씨 색상 변경 */
}

/* 폰트, 글자 스타일 */
.johwesu {
	color: #787878;
	font-size: 12px;
}

.rounded {
	margin-top: 10px;
	border-radius: 15px;
	padding: 3px;
	background-color: #c6c6c6;
}
</style>

<script>
        function section_One() {
            document.querySelectorAll(".event:nth-child(1)")[0].style.borderBottom = "5px solid rgb(0, 255, 166)";
            document.querySelectorAll(".event:nth-child(2)")[0].style.borderBottom = "5px solid #eaf5ff";
            document.querySelectorAll(".event:nth-child(3)")[0].style.borderBottom = "5px solid #eaf5ff";
        }

        function section_Two() {
            document.querySelectorAll(".event:nth-child(1)")[0].style.borderBottom = "5px solid #eaf5ff";
            document.querySelectorAll(".event:nth-child(2)")[0].style.borderBottom = "5px solid rgb(0, 255, 166)";
            document.querySelectorAll(".event:nth-child(3)")[0].style.borderBottom = "5px solid #eaf5ff";
        }

        function section_Three() {
            document.querySelectorAll(".event:nth-child(1)")[0].style.borderBottom = "5px solid #eaf5ff";
            document.querySelectorAll(".event:nth-child(2)")[0].style.borderBottom = "5px solid #eaf5ff";
            document.querySelectorAll(".event:nth-child(3)")[0].style.borderBottom = "5px solid rgb(0, 255, 166)";
        }

        //날짜 형식 바꾸는 함수
    function formatDate(dateString) {
        var date = new Date(dateString);
        var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고, 두 자리로 만듬
        var day = date.getDate().toString().padStart(2, '0'); // 일은 두 자리로 만듬
        return { month: month, day: day }; // 형식화된 월과 일을 객체로 반환
    }
        
    </script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div id="top_box">

		<div id="title_box">
			<p id="rounded_box">
				<span class="rounded">${clubInfo.sport}</span> <span class="rounded">
					${clubInfo.region}</span> <span class="rounded">${clubInfo.recruit_num}명</span>
			</p>
			<div id="logo_box">
				<div id="img_box">
					<img src="resources/images/${clubInfo.club_thumbnail}" alt="이미지 설명">
				</div>
				<div id="club_info">
					<h2>${clubInfo.c_name}</h2>
					<p class="johwesu">조회수: ${clubInfo.views}</p>
				</div>
			</div>
		</div>

		<div id="event-box">
			<div class="event" onclick=section_One()>모집공고</div>
			<div class="event" onclick=section_Two()>클럽소개</div>
			<div class="event" onclick=section_Three()>댓글</div>
		</div>
	</div>

	<div id=wrap>

		<!-- 모집기간 -->
		<div id="Recruitment_period">
			<h3>모집기간</h3>
			<p>
				<span id="T_month"></span>월 <span id="T_day"></span>일 ~ <span
					id="R_month"></span>월 <span id="R_day"></span>일
			</p>
		</div>

		<script>    
			 // 오늘 날짜를 가져와서 형식화.
		    var today = new Date();
		    var todayMonth = (today.getMonth() + 1).toString().padStart(2, '0');
		    var todayDay = today.getDate().toString().padStart(2, '0');
	
		    document.getElementById('T_month').textContent = todayMonth;
		    document.getElementById('T_day').textContent = todayDay;
		
			 // formatDate 함수 호출
			var formattedDate = formatDate('${clubInfo.deadline}'); 
			document.getElementById('R_month').textContent = formattedDate.month; // 월을 설정
			document.getElementById('R_day').textContent = formattedDate.day; // 일을 설정
		</script>

		<!-- 큰 로고 포스터 -->
		<div id="poster">
			<img src="resources/images/${clubInfo.club_thumbnail}" alt="이미지 설명">
		</div>

		<!-- 본문 -->
		<div id="main_text">
			<div id="main_post">
				<div id="p_title_box">
					<h3>${clubInfo.p_title}</h3>
				</div>
				49년 전통의 연합 테니스 클럽 TC에서 2024년 상반기 신입 회원(58기)를 모집합니다!<br> TC는
				1975년부터 무려 48년이라는 시간의 전통 클럽으로 멋진 회원님들이 계신 가족같은 분위기의 클럽입니다!<br>
				테니스를 통해 인연이 되어 평생을 함께할 신입 가족을 찾고 있습니다.<br>
				<br> 운동을 통한 체력증진, 동기들과 회원들 간 친목 도모를 목표로 하고 있습니다.<br>
				<br> TC활동<br> 기간 중 주 1회 금요잉ㄹ 5시 ~ 7시 코트모임과 운동후 애프터 모임(식사,
				뒤풀이)으로 단순한 인맥관리가 아닌 끈끈한 정을 쌓을 수 있습니다.<br> 코트 모임뿐만 아니라 매해 다양한
				행사로 회원님들과 만남을 가질 수 있습니다.<br>
				<br> [코트 위치] 반포종합운동장 테니스 코트 (9호선 신반포역 4번 출구에서 도보 3분)<br>
				<br> 각종 행사들(여름, 겨울 강화훈련MT TC오픈) 준비되어 있습니다!<br> 추후에 준비되어 있는
				행사들을 변경될 수 있는 점 참고해주세요!<br>
				<br> 이러한 다양한 활동 속에서 끈끈한 정을 느끼며<br> 이번 학기 즐겁게 활동하는 것이
				목표입니다!<br>
				<br> -모집일정-<br>
				<br> 서류 접수 : 2월 18일 (일) 23:59까지<br> fowenfow@gmail.com<br>
				지원서 보내기<br> (밑에 링크로 들어가시면 "2024 상반기 TC지원서" 게시물의 첨부파일로 올려드렸습니다!)<br>
				https://cafe.naver.com/fowenf/24<br>
				<br> 혹시 그럼에도 불구하고 지원서를 다운 받기 힘드시면 아래 번호로 연락주시면 됩니다.<br>
				<br> 서류 합격 발표: 7월 21일 (수) (개별 통보)<br>
				<br> 면접 : 8월 25일 (일), 8월 26일 (월) 중 1일<br>
				<br> 최종 합격 발표: 8월 28일 (개별 통보) <br>
				<br> 첫 코트모임: 3월 8일 (금)<br>
				<br> 문의 : 010-1010-1010/ 010-1111-0000 (언제든 자유롭게 문의해주세요)<br>
				<br> 인스타그램: https://www.insragram.com/toporpincw/<br>
				<br>
				<br> -지원 자격-<br>
				<br> 테니스에 관심이 있는 서울 소재에 거주중인 성인이라면 누구나 가능합니다!<br> 테니스를 못
				친다고 걱정하지 마세요! 선배님들의 지도로 테니스에 쉽게 재미를 붙이실 수 있습니다!<br> 테니스를 잘 치시는
				구력자분 들도 대환영입니다~~^^<br> 테니스에 관심도 있고 꾸준히 나오실 수 있는 분을 우대해서 선발하도록
				하겠습니다!<br>
				<br> 신입 기수 분들은 매주 금요일에 진행되는 코트 모임에 필수 참석입니다. (무단 3회이상 경고)<br>
				<br> TC오픈 (2024.10.03(목)개천절 휴일), 테니스 MT(중간고사 이후)는 필참입니다.<br>
				<br> 기본적으로 저희 클럽은 1년 이상은 꾸준하게 활동하셔야 정회원 선발이 되실 수 있으니 이점 꼭 참고하셔셔
				지원해주시길 바랍니다<br>
				<br> 회비: 2달 10만원<br> (예산 운영 내역은 클럽원에게 투명하게 공개됩니다.)<br>
				<br> *면접은 모두 대면으로 진행됨을 알려드립니다.<br>

			</div>
		</div>

		<div id="three_b">
			<a href="#" class="b">웹사이트 바로가기</a> <a href="#" class="b">스크랩</a> <a
				href="#" class="b">공유</a>
		</div>

	</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#rounded_box{
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
	height: 2000px;
	margin: 0 auto;
	margin-top: 15px;
	background-color: #eaf5ff;
	padding-top: 30px;
}

#main_post {
	/* 	border: 1px solid black; */
	box-sizing: border-box;
	width: 700px;
	height: 1900px;
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
			</div>
		</div>

		<div id="three_b">
			<a href="#" class="b">웹사이트 바로가기</a> <a href="#" class="b">스크랩</a> <a
				href="#" class="b">공유</a>
		</div>

	</div>
</body>
</html>
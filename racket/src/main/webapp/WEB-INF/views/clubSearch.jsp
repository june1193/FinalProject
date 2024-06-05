<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

#outer-nav {
	border: 1px solid rgb(255, 255, 255);
	background-color: #d3eaff;
	width: 99.9%;
	/*99퍼로 하면 스크롤바 사라짐*/
	height: 120px;
}

#outer-board {
	margin: 0 auto;
	margin-top: 19px;
	/* border: 1px solid black; */
	width: 1000px;
	height: 100px;
}

/* 검색창 관련 */
.search-area {
	display: flex;
	align-items: center;
	margin-left: auto;
}

.search {
	width: 400px;
	background-image: linear-gradient(to left, #FBB9AB 0%, #68D2E8 100%);
	height: 35px;
	border-radius: 20px;
	margin: 0 auto;
	display: flex;
	overflow: hidden;
	padding: 2px;
}

.search-in {
	display: flex;
	align-items: center;
	border-radius: 25px;
	background: #fff;
	width: 100%;
}
.search-in>form{
display: flex;
    align-items: center;
    }

.search-in input {
	height: 31px;
	border: none;
	margin-left: 15px;
	font-size: 16px;
	width: 350px;
	font-family: 'Pretendard';
	font-weight: 300;
}

.search-in input:focus {
	outline: none;
}

.search-in button {
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
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='none' stroke='%23FBB9AB' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M3 10a7 7 0 1 0 14 0a7 7 0 1 0-14 0m18 11l-6-6'/%3E%3C/svg%3E");
}

/* 검색창 끝 */
#event-box {
	/* border: 1px solid black; */
	width: 500px;
	margin: 0 auto;
	height: 40px;
	margin-top: 20px;
	text-align: center;
}

.event {
	font-size: 17px;
	display: inline-block;
	margin: 25px;
	margin-top: 0px;
	padding: 0 0 14px 0;
}

.event:hover {
	border-bottom: 5px solid rgb(0, 255, 166);
	cursor: pointer;
}

.event:nth-child(1) {
	border-bottom: 5px solid rgb(0, 255, 166);
}

.box-1-textarea {
	box-sizing: border-box;
	/* border: 1px solid black; */
	height: 180px;
	width: 310px;
	margin: 0px;
	padding: 5px;
}

.rounded {
	margin-top: 10px;
	border-radius: 15px;
	padding: 3px;
	background-color: #f0f0f0;
}

.box-link {
	box-sizing: border-box;
	display: flex;
	margin: 10px;
	margin-top: 10px;
	border: 1px solid rgb(199, 199, 199);
	border-radius: 9px;
	height: 230px;
	width: 500px;
	padding: 23px;
	text-decoration: none;
	color: black;
	background-color: #ffffff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.magamill {
	color: #00c8ff;
	font-weight: bold;
}

.thumbnail {
	/* border: 1px solid black; */
	height: 180px;
	width: 140px;
	margin: 0px;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	object-fit: fill;
}

#board {
	margin: 0 auto;
	width: 1050px;
	height: auto; /* 높이를 자동으로 조정하여 내용에 맞춤 */
	display: flex;
	flex-wrap: wrap; /* 여러 줄에 걸쳐 표시되도록 설정 */
	margin-bottom: 30px;
}

/* 폰트, 강조, 사이즈 */
.johwesu {
	color: #9c9c9c;
	font-size: 12px;
}

.magamill {
	color: #00c8ff;
	font-weight: bold;
}
</style>
<script>
 //마감일 계산 함수1
	function getRemainingDays(deadline, elementId) {
	console.log("deadline: " + deadline);
	var today = new Date();
	var deadlineDate = new Date(deadline);
	console.log("deadlineDate: " + deadlineDate);
	var timeDiff = deadlineDate.getTime() - today.getTime();
	console.log("timeDiff: " + timeDiff);
	var daysRemaining = Math.ceil(timeDiff / (1000 * 3600 * 24));
	console.log("daysRemaining: " + daysRemaining);
	
	var element = document.getElementById(elementId);
	 if (element) {
	 element.innerHTML = daysRemaining;
	    } else {
	         console.error(`Element with ID '${elementId}' not found.`);
	     }
	      }
</script>
</head>
<body>
	<!-- 최 상단바 -->
	<nav>
		<div id="outer-nav">
			<div id="outer-board">

				<!-- 				<div class="search-area">
					<div class="search">
						<div class="search-in">
							<input id="searchinput" type="text" placeholder="찾으시는 클럽이 있나요?">
							<button id="searchbutton">
								<span class="tabler--search"></span>
							</button>
						</div>
					</div>
				</div> -->

				<div class="search-area">
					<div class="search">
						<div class="search-in">
							<form action="/racket/search" method="get">
								<input type="text" name="query" placeholder="찾으시는 클럽이 있나요?">
								<button type="submit">
									<span class="tabler--search"></span>
								</button>
							</form>
						</div>
					</div>
				</div>

				<div id="event-box">
					<div class="event" onclick=section_One()>전체</div>
					<div class="event" onclick=section_Two()>테니스</div>
					<div class="event" onclick=section_Three()>탁구</div>
					<div class="event" onclick=section_Four()>배드민턴</div>
				</div>

			</div>
		</div>
	</nav>


	<div id="board">
		<c:forEach var="result" items="${searchResults}" varStatus="status">
			<form action="updateViews" method="post" class="update-views-form">
				<input type="hidden" name="p_num" value="${result.p_num}"> <input
					type="hidden" name="targetUrl" value="C_detail"> <a
					href="#" class="box-link"
					onclick="this.closest('form').submit(); return false;">
					<div class="box-1-textarea">
						<span class="rounded">${result.region}</span> <span
							class="rounded">${result.sport}</span>
						<h3>${result.c_name}</h3>
						<p>${result.p_title}</p>
						<br> <span class="magamill"> D-<span
							id="d_day_${status.index}"></span>
						</span> <span class="johwesu">조회수: ${result.views}</span>
					</div>
					<div class="thumbnail">
						<img src="resources/images/${result.club_thumbnail}" alt="이미지 설명">
					</div>
				</a>
			</form>
			<script>
        document.addEventListener('DOMContentLoaded', function() {
            getRemainingDays('${result.deadline}', 'd_day_${status.index}');
        });
    </script>
		</c:forEach>
	</div>
</body>
</html>
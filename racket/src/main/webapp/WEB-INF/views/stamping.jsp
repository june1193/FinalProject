<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모바일 전용 웹페이지</title>
<style>
/* 기본 스타일 설정 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
	color: #333;
}

#centerbox {
	width: 90%; /* 모바일에서는 전체 너비의 90%를 사용 */
	margin: 20px auto; /* 상하 여백 20px, 중앙 정렬 */
	padding: 10px;
	background-color: rgb(255, 255, 255);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	text-align: center; /* 텍스트 가운데 정렬 */
}

#stamp-space {
	margin: 0 auto;
	width: 200px;
	height: 200px;
	border: 3px solid red;
}

#img-space {
	margin: 0 auto;
	margin-top: 10px;
	width: 180px;
	height: 180px;
}

#img-space img {
	width: 100%; /* 이미지의 너비를 div에 맞춤 */
	height: auto; /* 자동 높이 조정 */
	display: block; /* 인라인 여백 제거 */
}

#box0 {
	margin-bottom: 20px; /* 하단 여백 추가 */
}

#box1 img {
	width: 50px; /* 이미지 크기 조정 */
	height: auto;
	display: block;
	margin: 0 auto 10px; /* 이미지 중앙 정렬 및 하단 여백 */
}

button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

#underbox {
	box-sizing: border-box;
	margin: 0 auto;
	height: 1350px;
	padding: 30px;
	background-color: rgb(255, 249, 241);
	display: flex;
	flex-direction: column;
}

#info1 {
	box-sizing: border-box;
	padding: 10px;
	border: 3px solid rgb(255, 205, 140);
	width: 410px;
	margin-top: 50px;
	border-radius: 15px;
	background-color: rgb(255, 255, 255);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

#info2 {
	box-sizing: border-box;
	padding: 10px;
	border: 3px solid rgb(255, 205, 140);
	width: 440px;
	margin-top: 150px;
	border-radius: 15px;
	background-color: rgb(255, 255, 255);
	align-self: flex-end;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

#info3 {
	box-sizing: border-box;
	padding: 10px;
	border: 3px solid rgb(255, 205, 140);
	width: 410px;
	margin-top: 150px;
	border-radius: 15px;
	background-color: rgb(255, 255, 255);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

#info1 img {
	width: 150px; /* 이미지 너비 조절 */
	height: auto; /* 이미지 비율 유지 */
	margin-bottom: 20px; /* 이미지 아래 여백 */
	display: block;
	margin: 0 auto;
}

#info2 img {
	width: 350px; /* 이미지 너비 조절 */
	height: auto; /* 이미지 비율 유지 */
	margin-bottom: 30px; /* 이미지 아래 여백 */
	display: block;
	margin: 0 auto;
	border-radius: 75px;
}

#info3 img {
	width: 200px; /* 이미지 너비 조절 */
	height: auto; /* 이미지 비율 유지 */
	display: block;
	margin: 0 auto;
}

#stampButton{
    margin-bottom: 50px;
}
</style>
</head>
<body>
	<%
	String contextPath = request.getContextPath(); // 현재 애플리케이션의 컨텍스트 경로를 가져와 변수에 저장합니다.
	%>
	<div id="wrap">
		<div id="centerbox">
			<h1 id="change"></h1>
			<p>유저 아이디</p>
			<div id="stamp-space">
				<div id="img-space">
					<img src="resources/images/tennis_stamp.jpg" alt="">
				</div>
			</div>
			<div id="box0">
				<p>시설명: 이촌 테니스장</p>
				<p id="current-time"></p> <!-- 현재 시간을 표시할 요소 -->
			</div>
			<div id="box1">
				<form id="stampForm" action="<%=contextPath%>/stampbutton"
					method="post">
					<button id="stampButton" type="submit">스탬프 찍기</button>
				</form>
			</div>
		</div>

		<div id="underbox">
			<div id="info1">
				<img src="resources/images/handstamp.png" alt="인증 아이콘">
				<p>
					시설을 방문하고 스탬프를 찍어보세요. <br> 시설별로 스탬프를 찍을 수 있는 횟수는 한 시설당 한번으로
					제한됩니다.
				</p>
			</div>

			<div id="info2">
				<img src="resources/images/qrhuman.jpg" alt="인증 아이콘">
				<p>
					지정된 시설에 방문하여 qr코드를 스마트폰으로 찍어서 인증하세요. <br> 단, 주의할 점은 해당 시설과
					200m이내 거리에서 인증이 가능합니다. 시설과의 거리를 확인 후 인증을 진행해 주세요.
				</p>
			</div>


			<div id="info3">
				<img src="resources/images/present.jpg" alt="인증 아이콘">
				<p>2024년 07월 30일 까지 모든 스탬프를 모은 모두에게 상품을 드립니다!</p>
			</div>
		</div>

	</div>

	<script>
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function (position) {
            var lat = position.coords.latitude; // 위도
            var lon = position.coords.longitude; // 경도

            // 위치 정보를 출력합니다
            console.log("현재 위치의 위도: " + lat + ", 경도: " + lon);

            // 위치가 특정 범위 내에 있는지 확인합니다
            var inRange = checkLocationRange(lat, lon);

            // 범위 내에 위치하면 폼을 제출합니다
            if (inRange) {
                document.getElementById("change").innerHTML = "스탬프 투어 완료!";
            } else {
                // 범위 밖에 위치하면 알람을 표시합니다
                alert("인증할 수 없는 위치입니다.");
                document.getElementById("change").innerHTML = "시설에 위치하지 않으면 <br> 인증이 불가합니다.";
                document.querySelector("#stampForm").style.display = "none";
            }
        });

        // 특정 범위 내에 위치하는지 확인하는 함수
        function checkLocationRange(lat, lon) {

           
            // 이촌 테니스장 200m 범위     
            var minLat = 37.509911;
            var maxLat = 37.520481;
            var minLon = 126.972446;
            var maxLon = 126.995433; 
            


            //서울 전체 범위
        /*      var minLat = 37.466681;
            var maxLat = 37.611778;
            var minLon = 126.866408;
            var maxLon = 127.094280; */



            // 현재 위치가 범위 내에 있는지 확인합니다
            if (lat >= minLat && lat <= maxLat && lon >= minLon && lon <= maxLon) {
                return true; // 범위 내에 위치함
            } else {
                return false; // 범위 밖에 위치함
            }
        }
        
        // 현재 시간을 가져와서 표시하는 함수
        function updateTime() {
            var now = new Date();
            var hours = now.getHours().toString().padStart(2, '0');
            var minutes = now.getMinutes().toString().padStart(2, '0');
            var seconds = now.getSeconds().toString().padStart(2, '0');
            var currentTime = hours + ':' + minutes + ':' + seconds;
            document.getElementById('current-time').textContent = currentTime;
        }

        // 페이지 로드 시와 매초마다 현재 시간을 업데이트합니다
        updateTime();
        setInterval(updateTime, 1000);
    </script>

</body>
</html>
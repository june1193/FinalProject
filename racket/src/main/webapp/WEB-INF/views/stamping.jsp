<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#wrap {
	width: 1240px;
	margin: 0 auto;
	box-sizing: border-box;
}

#centerbox {
	margin: 0 auto;
	width: 700px;
	height: 350px;
	border: 2px solid rgb(82, 63, 255);
	margin-top: 70px;
	margin-bottom: 30px;
	display: flex;
	flex-direction: column;
	align-items: center;
	/* 수직 가운데 정렬 */
	text-align: center;
	/* 텍스트 가운데 정렬 */
	border-radius: 5px;
	background-color: #dff9ff;
}

#centerbox h1 {
	margin-top: 10px;
	/* 제목 위의 여백 */
}

#centerbox h2 {
	margin-top: 60px;
	/* 제목 위의 여백 */
}

#stampButton {
	padding: 10px 20px;
	/* 버튼 패딩 */
	font-size: 16px;
	/* 버튼 글자 크기 */
	cursor: pointer;
	/* 포인터 커서 */
	border: none;
	/* 버튼 테두리 제거 */
	border-radius: 5px;
	/* 버튼 모서리 둥글게 */
	background-color: rgb(82, 63, 255);
	/* 버튼 배경색 */
	color: white;
	/* 버튼 글자색 */
	text-decoration: none;
}

#centerbox img {
	width: 50px;
	height: 50px;
	margin-right: 15px;
	/* 텍스트와 이미지 사이의 간격 조정 */
}

#box1 {
	margin-top: 50px;
	display: flex;
	align-items: center;
}

#chage {
	color: #333;
	/* 텍스트 색상 */
	font-size: 2em;
	/* 글꼴 크기 */
	font-weight: bold;
	/* 글꼴 두껍게 */
	text-align: center;
	/* 텍스트 가운데 정렬 */
	margin-top: 20px;
	/* 위 여백 */
	margin-bottom: 20px;
	/* 아래 여백 */
}

#underbox {
	box-sizing: border-box;
	margin: 0 auto;
	width: 700px;
	height: 1300px;
	border: 1px solid rgb(153, 153, 153);
	margin-top: 10px;
	margin-bottom: 50px;
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
}

#info3 {
	box-sizing: border-box;
	padding: 10px;
	border: 3px solid rgb(255, 205, 140);
	width: 410px;
	margin-top: 150px;
	border-radius: 15px;
	background-color: rgb(255, 255, 255);
}

#info1 img {
    width: 150px; /* 이미지 너비 조절 */
    height: auto; /* 이미지 비율 유지 */
    margin-bottom: 20px; /* 이미지 아래 여백 */
    display: block; margin: 0 auto;
}

#info2 img {
    width: 350px; /* 이미지 너비 조절 */
    height: auto; /* 이미지 비율 유지 */
    margin-bottom: 30px; /* 이미지 아래 여백 */
    display: block; margin: 0 auto;
    border-radius: 75px;
}

#info3 img {
    width: 200px; /* 이미지 너비 조절 */
    height: auto; /* 이미지 비율 유지 */
    display: block; margin: 0 auto;
}

@media (max-width: 767px) {
         #wrap{
             width: 100%;
         }

		 #centerbox {
	margin: 0 auto;
	width: 100%;
	height: 350px;
	border: 2px solid rgb(82, 63, 255);
	margin-top: 70px;
	margin-bottom: 30px;
	display: flex;
	flex-direction: column;
	align-items: center;
	/* 수직 가운데 정렬 */
	text-align: center;
	/* 텍스트 가운데 정렬 */
	border-radius: 5px;
	background-color: #dff9ff;
}

#underbox {
	box-sizing: border-box;
	margin: 0 auto;
	width: 100%;
	height: 1400px;
	border: 1px solid rgb(153, 153, 153);
	margin-top: 10px;
	margin-bottom: 50px;
	padding: 30px;
	background-color: rgb(255, 249, 241);
display: flex;
    flex-direction: column;
}

		 #centerbox h1 {
	margin-top: 10px;
	/* 제목 위의 여백 */
	font-size: 40px;
}

#centerbox h2 {
	margin-top: 60px;
	/* 제목 위의 여백 */
	font-size: 30px;
}

#stampButton {
	padding: 10px 20px;
	/* 버튼 패딩 */
	font-size: 20px;
	/* 버튼 글자 크기 */
	cursor: pointer;
	/* 포인터 커서 */
	border: none;
	/* 버튼 테두리 제거 */
	border-radius: 5px;
	/* 버튼 모서리 둥글게 */
	background-color: rgb(82, 63, 255);
	/* 버튼 배경색 */
	color: white;
	/* 버튼 글자색 */
	text-decoration: none;
}

#info1 p{
	margin-top: 30px;
}

#info2 p{
	margin-top: 30px;
}

#info3 p{
	margin-top: 30px;
}

#info1 {
	box-sizing: border-box;
	padding: 10px;
	border: 3px solid rgb(255, 205, 140);
	width: 410px;
	margin-top: 50px;
	border-radius: 15px;
	background-color: rgb(255, 255, 255);
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
}

#info3 {
	box-sizing: border-box;
	padding: 10px;
	border: 3px solid rgb(255, 205, 140);
	width: 65%;
	margin-top: 150px;
	border-radius: 15px;
	background-color: rgb(255, 255, 255);
}

#info1 img {
    width: 45%;/* 이미지 너비 조절 */
    height: auto; /* 이미지 비율 유지 */
    margin-bottom: 20px; /* 이미지 아래 여백 */
    display: block; margin: 0 auto;
}

#info2 img {
    width: 65%;/* 이미지 너비 조절 */
    height: auto; /* 이미지 비율 유지 */
    margin-bottom: 30px; /* 이미지 아래 여백 */
    display: block; margin: 0 auto;
    border-radius: 75px;
}

     }

</style>
</head>


<body>
<%
    String contextPath = request.getContextPath(); // 현재 애플리케이션의 컨텍스트 경로를 가져와 변수에 저장합니다.
%>
	<div id="wrap">
		<div id="centerbox">
			<h2>-이촌테니스장-</h2>
			<h1 id="change"></h1>
			<div id="box1">
				<img src="resources/images/stampimg.png" alt="인증 아이콘">
				<form id="stampForm" action="<%= contextPath %>/stampbutton" method="post">
					<button id="stampButton" type="submit">스탬프 찍기</button>
				</form>
			</div>
		</div>

		<div id="underbox">
			<div id="info1">
				<img src="resources/images/handstamp.png" alt="인증 아이콘">
				<p>시설을 방문하고 스탬프를 찍어보세요. <br> 시설별로 스탬프를 찍을 수 있는 횟수는 한 시설당 한번으로 제한됩니다.
				</p>
			</div>

			<div id="info2">
				<img src="resources/images/qrhuman.jpg" alt="인증 아이콘">
				<p>지정된 시설에 방문하여 qr코드를 스마트폰으로 찍어서 인증하세요. <br> 단, 주의할 점은 해당 시설 내에서만 인증이
					가능합니다. gps기능을 통해 위치 검증을 통과해야지만 스탬프가 부여됩니다.</p>
			</div>


			<div id="info3">
				<img src="resources/images/present.jpg" alt="인증 아이콘">
				<p>2024년 07월 30일 까지 모든 스탬프를 모은 모두에게 "~~"를 드립니다!</p>
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
					document.getElementById("change").innerHTML = "시설에 위치하지 않으면 인증이 불가합니다";
					document.querySelector("#stampForm").style.display = "none";
				}
			});

			// 특정 범위 내에 위치하는지 확인하는 함수
			function checkLocationRange(lat, lon) {

				/* 
				// 이촌 테니스장 범위     
				  var minLat = 37.509911;
				var maxLat = 37.520481;
				var minLon = 126.972446;
				var maxLon = 126.995433; 
				*/


				//서울 전체 범위
				var minLat = 37.466681;
				var maxLat = 37.611778;
				var minLon = 126.866408;
				var maxLon = 127.094280;



				// 현재 위치가 범위 내에 있는지 확인합니다
				if (lat >= minLat && lat <= maxLat && lon >= minLon && lon <= maxLon) {
					return true; // 범위 내에 위치함
				} else {
					return false; // 범위 밖에 위치함
				}
			}
		</script>

</body>

</html>
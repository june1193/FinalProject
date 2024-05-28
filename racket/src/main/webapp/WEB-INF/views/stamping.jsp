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
	margin-top: 100px;
	margin-bottom: 50px;
	display: flex;
	flex-direction: column;
	align-items: center; /* 수직 가운데 정렬 */
	text-align: center; /* 텍스트 가운데 정렬 */
	border-radius: 5px;
	background-color: #dff9ff;
}

#centerbox h1 {
	margin-top: 70px; /* 제목 위의 여백 */
}

#centerbox button {
	padding: 10px 20px; /* 버튼 패딩 */
	font-size: 16px; /* 버튼 글자 크기 */
	cursor: pointer; /* 포인터 커서 */
	border: none; /* 버튼 테두리 제거 */
	border-radius: 5px; /* 버튼 모서리 둥글게 */
	background-color: rgb(82, 63, 255); /* 버튼 배경색 */
	color: white; /* 버튼 글자색 */
}

#centerbox img {
	width: 50px;
	height: 50px;
	margin-right: 15px; /* 텍스트와 이미지 사이의 간격 조정 */
}

#box1 {
	margin-top: 50px;
	display: flex;
	align-items: center;
}
</style>
</head>

<body>
	<div id="wrap">
		<div id="centerbox">
			<h2> -시설명- </h2>
			<h1>스탬프 투어 완료!!!</h1>
			<div id="box1">
				<img src="resources/images/stampimg.png" alt="인증 아이콘">
				<button onclick="location.href='#'">스탬프 찍기</button>
			</div>
		</div>
	</div>
</body>

</html>
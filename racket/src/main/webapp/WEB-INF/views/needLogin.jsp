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
	width: 400px;
	height: 150px;
	border: 2px solid rgb(82, 63, 255);
	margin-top: 100px;
	margin-bottom: 50px;
	display: flex;
	flex-direction: column;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	text-align: center; /* 텍스트 가운데 정렬 */
	border-radius: 5px;
	background-color: #dff9ff;
}

.button-container {
	margin-top: 20px;
}

.button-container button {
	padding: 5px 10px;
	margin: 5px;
	cursor: pointer;
}
</style>
</head>
<body>

	<div id="wrap">
		<div id="centerbox">
			로그인이 필요한 페이지 입니다
			<div class="button-container">
				<button onclick="location.href='#'">로그인</button>
				<button onclick="location.href='#'">회원가입</button>
			</div>
		</div>
	</div>


</body>
</html>
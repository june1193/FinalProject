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

#wrap {
	width: 1240px;
	margin: 0 auto;
	box-sizing: border-box;
}

#main-box {
	box-sizing: border-box;
	display: flex;
	justify-content: space-between;
	width: 1230px;
	height: 250px;
	padding: 30px;
	padding-left: 40px;
	padding-right: 40px;
}

#box-L {
	display: flex;
	box-sizing: border-box;
	width: 550px;
	height: 200px;
	background-color: rgb(241, 241, 241);
	padding: 30px;
	border-radius: 4px;
}

#box-R {
	display: flex;
	box-sizing: border-box;
	width: 550px;
	height: 200px;
	background-color: rgb(241, 241, 241);
	padding: 30px;
	border-radius: 4px;
}

#L-imgbox {
	background-color: white;
	border-radius: 50%;
	display: flex; /* Flexbox를 사용하여 자식 요소를 중앙에 배치 */
	justify-content: center; /* 가로 방향 중앙 배치 */
	align-items: center; /* 세로 방향 중앙 배치 */
	width: 100px;
	height: 100px;
	margin-top: 20px;
	margin-left: 10px;
}

#L-imgbox img {
	width: 65%; /* 이미지의 너비를 div의 너비에 맞추기 */
	object-fit: cover; /* 이미지가 div를 꽉 채우도록 설정 */
}

#R-imgbox {
	background-color: white;
	border-radius: 50%;
	display: flex; /* Flexbox를 사용하여 자식 요소를 중앙에 배치 */
	justify-content: center; /* 가로 방향 중앙 배치 */
	align-items: center; /* 세로 방향 중앙 배치 */
	width: 100px;
	height: 100px;
	margin-top: 20px;
	margin-left: 10px;
}

#R-imgbox img {
	width: 60%; /* 이미지의 너비를 div의 너비에 맞추기 */
	object-fit: cover; /* 이미지가 div를 꽉 채우도록 설정 */
}

#L-content {
	box-sizing: border-box;
	width: 450px;
	height: 150px;
	padding-left: 20px;
}

#R-content {
	box-sizing: border-box;
	width: 450px;
	height: 150px;
	padding-left: 20px;
}

#L-content a {
	text-decoration: none; /* 밑줄 제거 */
	color: black; /* 텍스트 색상 검정색으로 설정 */
}

#R-content a {
	text-decoration: none; /* 밑줄 제거 */
	color: black; /* 텍스트 색상 검정색으로 설정 */
}

.container {
	box-sizing: border-box;
	width: 1230px;
	display: flex;
	align-items: center;
	padding: 40px 50px;
}

#space {
	height: 70px;
}

.container img {
	width: 50px;
	height: 50px;
	margin-right: 15px; /* 텍스트와 이미지 사이의 간격 조정 */
}

.privacy {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	margin-bottom: 15px;
}

.box-p {
	border: 1px solid rgb(242, 242, 255);
	background-color: rgb(242, 242, 255);
	border-radius: 8px;
	height: 360px;
	width: 1230px;
	margin: 30px;
	padding: 30px;
}

.Rtext {
	color: red;
	margin-bottom: 7px;
}

#aram{
    border-radius: 50%;
    height: 25px;
	width: 25px;
    background-color: rgb(228, 228, 228);
    margin-left: 10px;
    margin-top: 5px;
    font-weight: bold;
    display: flex; /* Flexbox 사용 */
    justify-content: center; /* 가로 방향 가운데 정렬 */
}
</style>

</head>

<body>

	<div id="wrap">

		<div class="container">
			<h1>문의하기</h1><div id="aram">2</div>
		</div>

		<div id="main-box">
			<div id="box-L">
				<div id="L-imgbox">
					<img src="resources/images/post.png" alt="">
				</div>
				<div id="L-content">
					<br>
					<h4>문의 게시 (서비스 이용 문의, 제휴 문의, 광고 문의)</h4>
					<p>상담시간: 365일 24시간</p>
					<p class="Rtext">※ 간단한 상담은 카카오 채널을 이용해 보세요</p>
					<a href="#">에이콘 상담 게시판 ></a>
				</div>
			</div>
			<div id="box-R">
				<div id="R-imgbox">
					<img src="resources/images/kakao.png" alt="">
				</div>
				<div id="L-content">
					<br>
					<h4>카카오톡 채널 (상담원과 1:1 상담)</h4>
					<p>상담시간: 365일 24시간</p>
					<p class="Rtext">※ "라켓매니아" 채널로 더 편리하게 상담가능</p>

					<div id="kakao-talk-channel-chat-button"
						data-channel-public-id="_xgYytG" data-title="consult"
						data-size="small" data-color="yellow" data-shape="pc"
						data-support-multiple-densities="true"></div>
				</div>
			</div>
		</div>

		<div class="privacy">
			<div class="box-p">
				<h3>1. 개인정보의 수집 및 이용 목적 (개인정보보호법 제15조)</h3>
				<p>국민콜110은 관계법령 등에서 정하는 소관 업무의 수행을 위하여 다음과 같이 개인정보를 수집 및 이용합니다.
					수집된 개인정보는 정해진 목적(채팅 상담업무 처리·분석·관리) 이외의 용도로는 이용되지 않으며, 수집 목적이 변경될 경우
					사전에 알리고 동의를 받을 예정입니다. ※ 관계법령 등 : 부패방지 및 국민권익위원회의 설치와 운영에 관한 법률 등</p>
				<br>

				<h3>2. 수집하는 개인정보의 항목 (개인정보보호법 제15조, 제16조)</h3>
				<p>가. 채팅(필수항목) : 연락처, 상담내용, IP주소(자동수집) 나. 카카오톡(필수항목) :
					카카오톡ID(자동수집), 상담내용</p>
				<br>

				<h3>3. 개인정보의 보유 및 이용기간 (공공기록물 관리에 관한 법률 시행령 제26조)</h3>
				<p>국민콜110은 원칙적으로 개인정보 보존기간(5년)이 경과하거나, 처리목적이 달성된 경우에는 지체 없이
					개인정보를 파기합니다. 다만, 다른 법령에 따라 보존하여야 하는 경우에는 그러하지 않을 수 있습니다.</p>
				<br>

				<h3>4. 동의를 거부할 권리가 있다는 사실 및 동의 거부에 따른 불이익 내용 (개인정보보호법제16조)</h3>
				<p>상담 신청시 수집하는 필요한 최소한의 정보 외의 개인정보 수집 동의를 거부할 권리가 있으나 최소한의 개인정보
					수집동의 거부 시에는 상담 서비스가 제한됩니다.</p>
			</div>
		</div>

		<div id="space"></div>

	</div>
</body>
<script>
	window.kakaoAsyncInit = function() {
		Kakao.Channel.createChatButton({
			container : '#kakao-talk-channel-chat-button',
		});
	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.channel.min.js';
		js.integrity = 'sha384-PFe+C2S6aXd8v5j//vBqNPP8DMpEqLOw05p9BBajfh7IDWnUTHhNlu+Uxj3wxNej';
		js.crossOrigin = 'anonymous';
		fjs.parentNode.insertBefore(js, fjs);
	})(document, 'script', 'kakao-js-sdk');
</script>
</html>
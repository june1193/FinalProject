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

#map {
	border: 1px solid black;
	width: 1230px;
	height: 500px;
}

.container {
	box-sizing: border-box;
	width: 1230px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border: 1px solid #ccc;
	padding: 40px 50px;
}

#space {
	height: 100px;
}

.counter {
	display: flex;
	align-items: center;
	font-size: 19px;
}

.container img {
	width: 50px;
	height: 50px;
	margin-right: 15px; /* 텍스트와 이미지 사이의 간격 조정 */
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=02a3290c5ec365335da06f6391baec02"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		const container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
		const options = { // 지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(37.529436, 126.965166), // 지도의 중심좌표33′ 06.890

			level : 8
		// 지도의 레벨(확대, 축소 정도)
		};
		const map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴

		//마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [ {
			title : '동작테니스장',
			latlng : new kakao.maps.LatLng(37.485923, 126.968399),
			facilityID : 'S231228105044310997'
		}, {
			title : '보라매공원',
			latlng : new kakao.maps.LatLng(37.495626, 126.918866),
			facilityID : 'S240430143839936049'
		}, {
			title : '서울숲',
			latlng : new kakao.maps.LatLng(37.546371, 127.042286),
			facilityID : 'S231114091643721746'
		}, {
			title : '삼청테니스장',
			latlng : new kakao.maps.LatLng(37.588782, 126.982964),
			facilityID : 'S240318091634106408'
		}, {
			title : '계남실내테니스장',
			latlng : new kakao.maps.LatLng(37.509217, 126.857535),
			facilityID : 'S240330153058560898'
		}, {
			title : '반포종합운동장테니스장',
			latlng : new kakao.maps.LatLng(37.501058, 126.995617),
			facilityID : 'S240407122407438519'
		}, {
			title : '이촌테니스장',
			latlng : new kakao.maps.LatLng(37.505650, 126.985253),
			facilityID : 'S240420102801036476'
		}, {
			title : '신도림테니스장',
			latlng : new kakao.maps.LatLng(37.512664, 126.880685),
			facilityID : 'S240426093708885843'
		}, {
			title : '한남테니스장',
			latlng : new kakao.maps.LatLng(37.545665, 127.003412),
			facilityID : 'S240513123743669722'
		} ];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "resources/images/flag.png";
		var stampedimageSrc = "resources/images/checked.png";

		//DB에서 온 데이터를 배열에 넣기
		var S_array = [];
		<c:forEach var="stamp" items="${s_data}">
		S_array.push("${stamp.facilityID}");
		</c:forEach>

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(35, 35);
			/* 예비 크기 var imageSize2 = new kakao.maps.Size(40, 40); */

			// 마커 이미지를 생성합니다. jstl을 사용하여 시설번호를 비교	
			var markerImage;

			// 스탬프된 시설인지 배열에서 확인
			if (S_array.includes(positions[i].facilityID)) {
				markerImage = new kakao.maps.MarkerImage(stampedimageSrc,
						imageSize);
			} else {
				markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			}

			/* 	테스트용
			 <c:forEach var="stamp" items="${s_data}">
			 console.log("${stamp.facilityID}");
			 </c:forEach> */

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
			// 마커 이미지 
			});

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : '<div style="padding:5px;">' + positions[i].title
						+ '</div>', // 인포윈도우에 표시할 내용
				removable : true
			});

			// 마커에 클릭 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', (function(marker,
					infowindow) {
				return function() {
					infowindow.open(map, marker);
				};
			})(marker, infowindow));
		}

	});
</script>
</head>

<body>

	<div id="wrap">

		<div class="container">
			<h1>내 스탬프</h1>

			<div class="counter">
				<img src="resources/images/stampimg.png" alt="인증 아이콘"> 인증수:
				${countStamp}회
			</div>
		</div>

		<div id="map"></div>

		<div id="space"></div>

	</div>
	
	<!-- 스탬프 추가시 알람 -->
	  <script>
        // 서버로부터 받은 메시지를 변수에 저장
        var message = "${message}";

        // 메시지가 비어 있지 않은 경우에만 alert 함수를 사용하여 메시지를 표시
        if (message.trim() !== "") {
            alert(message);
        }
    </script>
</body>

</html>
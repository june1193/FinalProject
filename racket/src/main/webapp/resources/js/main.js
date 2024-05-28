function initMap() {
   const mapElement = document.getElementById('map');
   if (!mapElement) {
      console.error('Element with id "map" not found.');
      return;
   }

   // Google Maps 동적 지도 초기화
   const map = new google.maps.Map(document.getElementById('map'), {
      center: { lat: 37.5665, lng: 126.978 }, // 서울 중심 좌표
      zoom: 11, // 초기 줌 레벨
      disableDefaultUI: true,
   });

   const mapStyle = [
      {
         featureType: 'administrative',
         elementType: 'geometry.stroke',
         stylers: [
            {
               color: '#005eff', // 파란색 테두리
               weight: 100, // 선의 두께
            },
         ],
      },
      {
         featureType: 'administrative.locality',
         elementType: 'geometry.fill',
         stylers: [
            { visibility: 'on' }, // 해당 요소 표시
            { color: 'rgba(255, 255, 255, 0)' }, // 투명한 색상
         ],
      },
      {
         elementType: 'geometry', //지도의 기본적인 지리적 요소 스타일
         stylers: [
            {
               //color: '#d3eaff', // 전체적인 지도의 색감 설정
            },
         ],
      },
      {
         featureType: 'water',
         elementType: 'geometry',
         stylers: [
            //{ color: '#d3d3d3' }, // 강 등의 색상
         ],
      },
      {
         featureType: 'road',
         elementType: 'geometry',
         stylers: [
            { color: '#d3d3d3' }, // 도로 등의 색상
         ],
      },
      {
         featureType: 'poi.park',
         elementType: 'geometry',
         stylers: [
            { color: '#c8e6c9' }, // 공원 등의 색상
         ],
      },
      {
         elementType: 'labels.text.fill',
         stylers: [
            {
               color: '#87DBC0', // 텍스트 라벨의 색상
            },
         ],
      },
      {
         featureType: 'administrative.locality',
         elementType: 'labels.text',
         stylers: [{ visibility: 'on' }], // '동' 라벨 숨기기
      },
      {
         featureType: 'administrative.neighborhood',
         elementType: 'labels.text',
         stylers: [{ visibility: 'on' }], // '구' 라벨 표시하기
      },
      {
         featureType: 'road', //도로의 라벨에 대한 스타일 설정
         elementType: 'labels',
         stylers: [
            {
               visibility: 'off',
            },
         ],
      },
      {
         featureType: 'water',
         elementType: 'labels.text', //물의 텍스트 라벨에 대한 스타일 설정
         stylers: [
            {
               visibility: 'off',
            },
         ],
      },
      {
         featureType: 'poi',
         elementType: 'labels.icon',
         stylers: [
            { visibility: 'off' }, // 모든 아이콘 숨기기
         ],
      },
   ];
   // 스타일 적용
   map.setOptions({ styles: mapStyle });

   // 기존 마커 삭제
   // yourMarker.setMap(null); // 예시: yourMarker를 정의한 후 사용
}

document.addEventListener('DOMContentLoaded', function () {
   // Swiper 초기화
   var mySwiper = new Swiper('.swiper', {
      direction: 'horizontal',
      autoplay: {
         delay: 2500,
         disableOnInteraction: false,
      },
      loop: true,
      loopAdditionalSlides: 1,
      slidesPerView: 'auto',
      speed: 600,
      centeredSlides: true,
      spaceBetween: 120,
      slidesOffsetBefore: 0,
      effect: 'slide',
      pagination: {
         el: '.swiper-pagination',
         type: 'bullets',
         clickable: true,
      },
      navigation: {
         nextEl: '.swiper-button-next',
         prevEl: '.swiper-button-prev',
      },
   });

   // 마커 버튼 이벤트 리스너
   var markerBtn = document.querySelectorAll('.marker_button');
   markerBtn.forEach(function (marker) {
      marker.addEventListener('click', function (e) {
         e.preventDefault();
         var markerText = e.target.textContent;
         displayMarkerFacility(markerText);
      });
   });
});

function displayMarkerFacility(marker_button) {
   var markerFacility = document.getElementById('marker_facility');
   markerFacility.innerHTML = `
   <div class="map_detail">
      <img src="/img/트라이보울.jpg" alt="예시" />
      <h4>송도 트라이볼</h4>
      <p><i class="fas fa-location-arrow"></i> 인천광역시 연수구 인천타워대로250</p>
      <p><i class="fas fa-phone"></i> 032-732-7996</p>
      <p><i class="fas fa-calendar-check"></i> 13:00-17:30 (월요일 정기휴무)</p>
      <hr />
      <div class="direction">
         <div class="direction_comment"><i class="fas fa-map-location-dot"></i> 길찾기</div>
         <div class="direction_icon"><i class="fas fa-paper-plane"></i> <i class="fab fa-google"></i></div>
      </div>
   </div>
   `;
   setTimeout(function () {
      markerFacility.style.opacity = 1;
   }, 10);
}

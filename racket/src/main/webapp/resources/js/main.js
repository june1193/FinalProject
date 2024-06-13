function initMap() {
   const mapElement = document.getElementById('map');
   if (!mapElement) {
      console.error('Element with id "map" not found.');
      return;
   }
   

   // Google Maps 동적 지도 초기화
   const map = new google.maps.Map(mapElement, {
      center: { lat: 37.5665, lng: 127.028 }, // 서울 중심 좌표
      zoom: 11.3, // 초기 줌 레벨
      disableDefaultUI: true,
   });
   
    const iconBase = '/racket/resources/imgs/'; // 아이콘 파일들이 저장된 기본 경로

    const icons = {
        '테니스장': {
            url: iconBase + 'tennis.png',
            size: new google.maps.Size(64, 64), // 원본 이미지의 크기
            scaledSize: new google.maps.Size(64, 64), // 스케일링된 크기
            anchor: new google.maps.Point(64, 64) // 앵커 포인트 설정
        },
        '배드민턴장': {
            url: iconBase + 'badminton.png',
            size: new google.maps.Size(64, 64),
            scaledSize: new google.maps.Size(64, 64),
            anchor: new google.maps.Point(64, 64)
        },
        '탁구장': {
            url: iconBase + 'pingpong.png',
            size: new google.maps.Size(64, 64),
            scaledSize: new google.maps.Size(64, 64),
            anchor: new google.maps.Point(64, 64)
        }
    };

    facmarkers.forEach(function (facmarker) {
      const lat = parseFloat(facmarker.location_y);
      const lng = parseFloat(facmarker.location_x);

      if (isNaN(lat) || isNaN(lng)) {
         console.error('Invalid coordinates:', facmarker);
         return;
      }

      const markerIcon = icons[facmarker.minclassname] || icons['default'];

      const marker = new google.maps.Marker({
         position: { lat: lat, lng: lng },
         map: map,
         icon: markerIcon
      });

      marker.addListener('click', function () {
         fetchFacilityDetails(facmarker.facilityID);
      });
   });



   function fetchFacilityDetails(id) {
   console.log('Fetching details for facility ID:', id);

	   $.ajax({
        url: '/racket/facilityDetails',
        method: 'GET',
        data: { id: id },       
        success: function(data) {
            console.log('Facility details retrieved:', data);
            updateFacilityDetails(data);
        },
        error: function(err) {
            console.error('Error fetching facility details:', err);
        }
    });
	}

	function updateFacilityDetails(facility) {
	   if (!facility) {
	      console.error('No facility data provided');
	      return;
	   }
	
	   $('.map_detail').show();
	   $('.detail_title').text(facility.facName);
	   $('.detail_address').html(`<i class="fas fa-location-arrow"></i> ${facility.region_name}`);
	   $('.detail_tel').html(`<i class="fas fa-phone"></i> ${facility.tel_num}`);
	   $('.detail_time').html(`<i class="fas fa-calendar-check"></i> ${facility.service_start_time} - ${facility.service_end_time}`);
       $('.detail_img').html(`<img src="${facility.image}" alt="예시" id="detail_img" />`);
	}


   // GeoJSON 데이터 로드
   map.data.loadGeoJson('/racket/resources/json/Seoul_MapData.geojson');

   // GeoJSON 데이터 로드 후 이벤트
   const districts = {
      종로구: { lat: 37.57805, lng: 126.979189 },
      중구: { lat: 37.56029, lng: 126.99794 },
      용산구: { lat: 37.5311, lng: 126.978388 },
      성동구: { lat: 37.553333, lng: 127.036389 },
      광진구: { lat: 37.544377, lng: 127.082366 },
      동대문구: { lat: 37.579229, lng: 127.05057 },
      중랑구: { lat: 37.59632, lng: 127.092582 },
      성북구: { lat: 37.600389, lng: 127.016646 },
      도봉구: { lat: 37.668774, lng: 127.03104 },
      노원구: { lat: 37.654358, lng: 127.076247 },
      은평구: { lat: 37.612722, lng: 126.929231 },
      마포구: { lat: 37.559757, lng: 126.908421 },
      강서구: { lat: 37.559956, lng: 126.819532 },
      구로구: { lat: 37.495985, lng: 126.847953 },
      금천구: { lat: 37.456767, lng: 126.904 },
      영등포구: { lat: 37.526371, lng: 126.91369 },
      동작구: { lat: 37.504409, lng: 126.943343 },
      관악구: { lat: 37.470406, lng: 126.949613 },
      서초구: { lat: 37.483575, lng: 127.012661 },
      강남구: { lat: 37.487236, lng: 127.072325 },
      송파구: { lat: 37.511543, lng: 127.10588 },
      강동구: { lat: 37.550125, lng: 127.14377 },
      양천구: { lat: 37.5168, lng: 126.859 },
      서대문구: { lat: 37.5792, lng: 126.9368 },
      강북구: { lat: 37.6283, lng: 127.0253 },
   };
   
 
   

   for (const [name, coords] of Object.entries(districts)) {
      new google.maps.Marker({
         position: coords,
         map: map,
         label: {
            text: name,
            fontSize: '12px',
            fontWeight: 'light',
         },
         icon: {
            path: google.maps.SymbolPath.CIRCLE,
            scale: 0,
         },
      });
   }

   // 지도 스타일 설정
   const initialMapStyle = [
      {
         elementType: 'geometry',
         stylers: [{ color: '#d3eaff' }], // 전체적으로 어두운 색상
      },
      {
         elementType: 'labels.text.stroke',
         stylers: [{ color: '#d3eaff' }],
      },
      {
         elementType: 'labels.text.fill',
         stylers: [{ color: '#746855' }],
      },

      {
         featureType: 'all',
         elementType: 'labels',
         stylers: [{ visibility: 'off' }],
      },
      {
         featureType: 'all',
         elementType: 'labels.icon',
         stylers: [{ visibility: 'off' }],
      },
      {
         featureType: 'all',
         elementType: 'labels.text.fill',
         stylers: [{ visibility: 'off' }],
      },
      {
         featureType: 'all',
         elementType: 'labels.text.stroke',
         stylers: [{ visibility: 'off' }],
      },
      // 추가 스타일 설정
   ];

   const zoomedMapStyle = [
      {
         featureType: 'administrative.locality',
         elementType: 'geometry.fill',
         stylers: [
            { visibility: 'on' }, // 해당 요소 표시
            { color: 'rgba(255, 255, 255, 0)' }, // 투명한 색상
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

   // 지도에 zoom_changed 이벤트 리스너 추가
   function setMapStyleAndOverlay() {
      let zoomLevel = map.getZoom(); // 현재 줌 레벨 가져오기
      if (zoomLevel < 12) {
         // 줌 레벨이 12 미만일 때 초기 스타일 설정
         map.setOptions({ styles: initialMapStyle });
         map.data.setStyle({
            fillColor: '#87DBC0',
            strokeWeight: 0.6,
            fillOpacity: 1.0,
         });
      } else {
         // 줌 레벨이 12 이상일 때 확대 스타일 설정
         map.setOptions({ styles: zoomedMapStyle });
         map.data.setStyle({
            fillColor: '#d3eaff',
            strokeWeight: 0.2,
            fillOpacity: 0.6,
         });
      }
   }

   // 줌 변경 이벤트 리스너 추가
   map.addListener('zoom_changed', setMapStyleAndOverlay);

   // 초기 줌 레벨에 따른 스타일과 오버레이 설정
   setMapStyleAndOverlay();
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
   
   // 'top_btn' ID를 가진 요소를 찾아서 변수에 저장합니다.
   var topButton = document.getElementById('top_btn');

   // 버튼에 클릭 이벤트 리스너를 추가합니다.
   topButton.addEventListener('click', function () {
      // 페이지 최상단으로 부드럽게 스크롤합니다.
      window.scrollTo({ top: 0, behavior: 'smooth' });
   });

   // 탭 변경 이벤트 리스너 추가
   var tabs = document.querySelectorAll('.tab');
   tabs.forEach(function (tab) {
      tab.addEventListener('change', function () {
         var url = this.getAttribute('data-url'); // 선택된 탭의 URL을 가져옵니다.
         if (url) {
            document.body.classList.add('fade-out');

            setTimeout(function () {
               window.location = url; // 0.5초 후 페이지 이동
            }, 600); // 탭 변화 효과를 보여준 후 페이지 이동을 위해 0.5초 대기
         }
      });
   });

    // 페이지 이동 부드러운 효과
    var links = document.querySelectorAll('a');
    links.forEach(function (link) {
      link.addEventListener('click', function (event) {
        var href = link.getAttribute('href');
        if (href && (href.startsWith('/') || href.startsWith(location.origin))) {
          event.preventDefault();
          document.body.classList.add('fade-out');
          setTimeout(function () {
            window.location.href = href;
          }, 500);
        }
      });
    });

   
   // 버튼과 사용자 컨테이너 요소를 선택
   var userButton = document.querySelector('#user_btn');
   var userContainer = document.querySelector('.user_container');
   
   // userButton 클릭 이벤트 리스너 추가
   userButton.addEventListener('click', function () {
      // userContainer의 표시 상태를 토글
      if (userContainer.classList.contains('visible')) {
         userContainer.classList.remove('visible');
         setTimeout(function () {
            userContainer.style.display = 'none';
         }, 300); // opacity 트랜지션이 완료될 시간 후에 display 변경
      } else {
         userContainer.style.display = 'block';
         requestAnimationFrame(function () {
            requestAnimationFrame(function () {
               userContainer.classList.add('visible');
            });
         });
      }
   });
   
   const checkboxes = document.querySelectorAll('[id^="checkbox"]');
   const checkNumElements = document.querySelectorAll('[id^="check_num"]');

   checkboxes.forEach((checkbox, index) => {
      const checkNumElement = checkNumElements[index];
      let checkNum = parseInt(checkNumElement.innerText);

      checkbox.addEventListener('change', () => {
         if (checkbox.checked) {
            checkNum += 1;
         } else {
            checkNum -= 1;
         }
         checkNumElement.innerText = checkNum;
      });
   });


});

function login() {
   fetch('/racket/login?user_Id=Test123') // user_Id에 기본값을 설정
      .then((response) => {
         if (response.ok) {
            location.reload(); // 페이지 새로고침
         } else {
            console.error('로그인 실패');
         }
      })
      .catch((error) => console.error('로그인 중 오류 발생:', error));
}

function logout() {
   fetch('/racket/logout')
      .then((response) => {
         if (response.ok) {
            location.reload(); // 페이지 새로고침
         } else {
            console.error('로그아웃 실패');
         }
      })
      .catch((error) => console.error('로그아웃 중 오류 발생:', error));
}

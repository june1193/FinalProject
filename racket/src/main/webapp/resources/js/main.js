document.addEventListener('DOMContentLoaded', function () {
   var mySwiper = new Swiper('.swiper', {
      // Optional parameters
      direction: 'horizontal', //수평 방향 (기본값)
      autoplay: {
         delay: 2500, // 시간 설정
         disableOnInteraction: false, // false-스와이프 후 자동 재생
      },

      loop: true,
      loopAdditionalSlides: 1,

      slidesPerView: 'auto', // 슬라이드 뷰 개수
      speed: 600,
      centeredSlides: true, //센터모드
      spaceBetween: 120, //슬라이드 사이 여백
      slidesOffsetBefore: 0,
      effect: 'slide',

      // If we need pagination
      pagination: {
         el: '.swiper-pagination',
         type: 'bullets',
         clickable: true,
      },

      // Navigation arrows
      navigation: {
         nextEl: '.swiper-button-next',
         prevEl: '.swiper-button-prev',
      },
   });
});

document.addEventListener('DOMContentLoaded', function () {
   var hashtags = document.querySelectorAll('.hashtag');

   hashtags.forEach(function (tag) {
      tag.addEventListener('click', function (e) {
         e.preventDefault(); // 기본 이벤트를 방지합니다.
         var hashtagText = e.target.textContent; // 클릭된 해시태그의 텍스트를 가져옵니다.
         displayFacilityList(hashtagText); // 시설 목록을 표시하는 함수를 호출합니다.
      });
   });
});

function displayFacilityList(hashtag) {
   var facilityList = document.getElementById('facilityList');
   facilityList.innerHTML = `
   <ul>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
   </ul>
   
   `;
}

document.addEventListener('DOMContentLoaded', function () {
   var markerBtn = document.querySelectorAll('.marker_button');

   markerBtn.forEach(function (marker) {
      marker.addEventListener('click', function (e) {
         e.preventDefault(); // 기본 이벤트를 방지합니다.
         var markerText = e.target.textContent; // 클릭된 해시태그의 텍스트를 가져옵니다.
         displayMarkerFacility(markerText); // 시설 목록을 표시하는 함수를 호출합니다.
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
   }, 10); // innerHTML이 적용되는데 시간이 조금 필요하기 때문에 setTimeout을 사용합니다.
}

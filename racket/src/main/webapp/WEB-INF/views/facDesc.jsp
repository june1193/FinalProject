<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/racket/resources/css/font.css">
<link rel="stylesheet" href="/racket/resources/css/spaceDesc-style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa33c4d6f8e26463d3f4c1d31afd3571"></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'/>
<script>
	$(document).ready(function(){
		
		var facID = "${facility.facilityID}";
		//별점
		var rating = "${facility.rating}";
		var table = document.querySelector('.RatingStar');
		var totalRating = 5;
		function rateIt(rating) {
			ratingPercentage = rating * 20;
			ratingPercentage + 1.5;
			star = table.querySelector(".inner-star");
			numberRating = table.querySelector(".numberRating");
			star.style.width = ratingPercentage+"%";
		}
		rateIt(rating);
	
	    //서브 탭 메뉴 전환
	    $(".sub-tab > li").click(function(){
	        $(".sub-tab > li").removeClass("active");
	        $(this).addClass("active");
	        let val = $(this).attr('id');
	        if(val == 'detail'){
	            $(".sub-review").css("display","none");
	            $(".sub-desc").css("display","block");
	        }else if(val == 'review'){
	        	$(".review-content > ul").children().remove();
	        	//리뷰조회
	        	loadReview(facID);
	            $(".sub-review").css("display","block");
	            $(".sub-desc").css("display","none");
	        }
	    });
	    
	    //평균 별점 갱신
	    function avgRating(){
	    	$.ajax({
	    		method : "get",
	    		url : "/racket/avgRating/"+facID,
	    		success : function(rating){
	    			rateIt(rating);
	    		},
	    		error : function(error){
	    			console.error(error);
	    		}
	    	});
	    }
   	
	    //리뷰 수정
	    $(document).on("click",".edit,.update", function(){
	    	$("input[name='rating']").attr("onclick", "return true;");
	    	$(".star-rating").removeClass("readonly");
	    	$(".sb-writer > textarea").prop("readonly", false);
	    	$(".sb-writer > textarea").focus();
	    	$(".update").addClass("edit");
	    	$(".update").css("background-color","#87DBC0");
	    	$(".update").text("등록");
	    });
	    
	    //리뷰 수정 요청
	    $(document).on("click", ".update.edit", function(){
	    	let rating = $("input[name='rating']:checked").val();
	    	console.log("별점"+rating);
	    	let text = $(".sb-writer > textarea").val();
	    	let check = checkReview(rating, text)
	    	if(check){
	    		let data = {rating : rating, content : text};
		    	let dataJSON = JSON.stringify(data);
		    	$.ajax({
		    		method : "post",
		    		url : "/racket/updateReview/"+facID,
		    		data : dataJSON,
					contentType : "application/json",
					success : function(data){
						avgRating();
						$(".review-content > ul").children().remove();
						loadReview(facID);
					},
					error : function(error){
						console.log(error);
					}
		    	});
	    	}
	    	
	    });
	    
	    //리뷰 조회
	    function loadReview(facID){
	    	let str = '';
	    	$.ajax({
	    		method : "get",
	    		url : "/racket/selectReview/"+facID,
	    		success : function(data){
	    			console.log(data);
	    			//input hidden의 userid값 받아오기
	    			let uID = $("input[name='uId']").val();
	    			if(data.length <= 0){
	    				str = "<p class='default'>등록된 후기가 없습니다.</p>"
	    				$(".review-content").append(str);
	    			}else {
	    				$(".review-content > p").remove();
	    			for(let i=0;i<data.length;i++){
	    				console.log()
	    				let user = data[i];
	    				let userRating = user.rating;
	    				//세션 아이디값과 데이터의 유저 아이디가 같으면
	    				if(uID == user.userID){
	    					let srating = user.rating;
	 						let u_rating = '#'+srating+'-s';
	 						let s_rating = '#'+srating+'-stars';
	 						console.log(s_rating);
	    					$(u_rating).prevAll().addBack().addClass("full");
	 						$(s_rating).prop("checked",true);
	    					$(".star-rating").addClass("readonly");
	    					
	    					let text = user.reviewText;
	    					$(".sb-writer > textarea").val(text);
	    					$(".sb-writer > textarea").prop("readonly", true);
	    					$("input[name='rating']").attr("onclick", "return false;");
	    					
	    					$(".delete-btn").css("display","block");
	    					$(".submit").remove();
	    					$(".write-review").append("<button type='button' class='update'>수정</button>");
	    					    					
	    				}
	    				str = `<li>
	    				<a href="/racket/mypage/\${user.userID}">
	                        <div class="profile">
		                        <div class="img-in">
		                            <img src="\${user.userImageUrl}" alt="">
		                        </div>
	                    	<span>\${user.userNickname}</span>
	                		</div>
	                	</a>
		               		 <div class="sa2">
		                    	<div class='reviewStar'>
							  		<div class='reviewScore'>
							    		<div class='outer-star'><div class='inner-star rating-\${userRating}'></div></div>
							  	</div>
							</div>
	                    	<div class="speech-bubble">
	                        	<p>\${user.reviewText}</p>
	                        	<div class="sb-footer">
	                            	<span class="date">\${user.date}</span>
	                            `;
	    				if(uID == user.userID){
		    				str += `<div class="sb-icon">
                            	<span class="fluent--slide-text-edit-20-regular edit"></span>
                            	<span class="mingcute--delete-2-fill delete"></span>
                        	</div>`;
		    			}
	                            
	                        		str += `</div>
	                    	</div>
	                	</div>
	           			 </li>`;
	            		$(".review-content > ul").append(str);
	    			}
	    		}	
	    		},
	    		error : function(error){
	    			console.error(error);
	    		}
	    	});
	    }
	    
	    //리뷰 유효성 검사
	    function checkReview(rating, text){
	    	if(rating === undefined){
	    		alert("별점을 입력해주세요");
	    		return false;
	    	}else if(text == ''){
	    		alert("내용을 입력해주세요");
	    		$(".sb-writer > textarea").focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
	    }
	   
	    
	    //리뷰 등록
	    $(document).on("click",".submit", function(){
	    	let rating = '';
	    	rating = $("input[name='rating']:checked").val();
	    	let text = $(".sb-writer > textarea").val();
	    	let check = checkReview(rating, text);
	    	if(check){
	    		let data = {rating : rating, content : text};
		    	let dataJSON = JSON.stringify(data);
		    	
		    	$.ajax({
		    		method : "post",
					url : "/racket/insertReview/"+facID,
		    		data : dataJSON,
					contentType : "application/json",
		    		success : function(res){
		    			if(res.success){
		    				$(".review-content > ul").children().remove();
		    				//평균 별점 조회
		    				avgRating();
		    				loadReview(facID);
		    			}else{
		    				console.log("리뷰 등록 실패");
		    			}
		    		},
		    		error : function(error){
		    			console.error(error);
		    		}
		    	});
	    	}
	    	
	    	
	    });	
	
	    //댓글 수정
	    $(".edit").click(function (){
	        let sb = $(this).parent().parent().parent();
	        let text = sb.children("p").text();
	        sb.empty();
	        let $textarea = $("<textarea class='edit-area' rows='3' cols='30'></textarea>");
	        $textarea.val(text); // 텍스트 값 설정
	        sb.append($textarea);
	        sb.append("<button>수정</button>");
	        $textarea.focus();
	    });	
	    
	    //리뷰 삭제
	    $(document).on("click",".delete, .delete-btn",function(){
	    	$.ajax({
	    		method:"get",
	    		url : "/racket/deleteReview/"+facID,
	    		success : function(data){
	    			$(".delete-btn").css("display","none");
	    			$(".star-rating input, .star-rating label").removeClass("full");
	    			$("input[name='rating']").prop("checked",false);
	    			$("input[name='rating']").attr("onclick", "return true;");
	    			$(".sb-writer > textarea").val('');
	    			$(".sb-writer > textarea").prop("readonly", false);
					$(".star-rating").removeClass("readonly");
					$(".submit").remove();
					$(".write-review").append("<button type='button' class='submit'>등록</button>");
	    			avgRating();
					$(".review-content > ul").children().remove();
					loadReview(facID);
	    		},
	    		error : function(error){
	    			console.log(error);
	    		}
	    		
	    	});
	    });
	    
	 	//별점 선택 기능
	    $('.star').click(function(){
	        if (!$(".star-rating").hasClass("readonly")) {
	        	// 클릭된 별과 그 이전 별들에게 .full 클래스를 추가
		        $(this).prevAll().addBack().addClass('full');
		        
		        // 클릭된 별 다음에 있는 별들에게 .full 클래스를 제거
		        $(this).nextAll().removeClass('full');
	        }	   
	    });
	 	
	 	
	 	//북마크
	 	$(".bookmark").click(function(){
			$.ajax({
				method : "get",
				url : "/racket/facility/"+facID+"/bookmark",
				success : function(data){
					if(data === -1){
						alert("로그인 후 이용 가능합니다.")
					}else{
						$('.basil--heart-outline').toggleClass("full");
						$(".bookmark-count").empty();
						$(".bookmark-count").append(data);
					}
				}
			});
	 	});
	});
</script>

</head>
<body>
	<input type="hidden" value="${userInfo.user_ID }" name="uId">
    <div class="wrap">
        <div class="sub-main">
        	<div class="title-area">
        		<h4>${facility.facName }</h4>
        		<div class="badge">
        			<c:choose>
                			<c:when test="${facility.service_status == '접수중'}">
                				<span class="status1">${facility.service_status }</span>
                			</c:when>
                			<c:when test="${facility.service_status == '접수종료' }">
                				<span class="status2">${facility.service_status }</span>
                			</c:when>
                			<c:when test="${facility.service_status == '예약마감' }">
                				<span class="status3">${facility.service_status }</span>
                			</c:when>
                			<c:when test="${facility.service_status == '예약일시중지' }">
                				<span class="status4">${facility.service_status }</span>
                			</c:when>
                			<c:when test="${facility.service_status == '안내중' }">
                				<span class="status5">${facility.service_status }</span>
                			</c:when>
                		</c:choose>
                		<span class="${facility.payment == '무료' ? 'free' : 'pay'}">${facility.payment}</span>   
                		<span>${facility.liked }, ${facility.count }</span>
        		</div>
        	</div>
            <div class="sub">
                <div class="sub-visual">
                    <div class="space-img">
                        <img src="${facility.image }" alt="">
                        <div class='RatingStar'>
							  <div class='RatingScore'>
							    <div class='outer-star'><div class='inner-star'></div></div>
							    <!--  <div class="numberRating"></div>-->
							  </div>
						</div>
                    </div>
                    <div id="map" class="map">
    					<div class="road">
    						<a href="https://map.kakao.com/link/to/${facility.place },${facility.location_y },${facility.location_x }">길찾기</a>
    					</div>
                    </div>
                </div>
                <div class="sub-right">
                    <div class="desc">
                        <ul class="space-desc">
                            <li>
                                <span>지역</span> ${facility.region_name }
                            </li>
                            <li>
                                <span>대상</span> ${facility.service_target }
                            </li>
                            <li>
                                <span>장소</span> ${facility.place }
                            </li>
                            <li>
                                <span>이용기간</span> ${facility.service_start_day } ~ ${facility.service_end_day }
                            </li>
                            <li>
                                <span>접수기간</span> ${facility.reception_start_date } ~ ${facility.reception_end_date }
                            </li>
                            <li>
                                <span>이용요금</span> ${facility.payment }
                            </li>
                            <li>
                                <span>이용시간</span> ${facility.service_start_time } ~ ${facility.service_end_time }
                            </li>
                            <li>
                                <span>문의전화</span> ${facility.tel_num }
                            </li>
                        </ul>
                    </div>
                    <div class="btn">
	                    <div class="bookmark">
	                    <c:choose>
	                    	<c:when test="${facility.liked eq '0'}">
	                    		<span class="basil--heart-outline"></span>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<span class="basil--heart-outline full"></span>
	                    	</c:otherwise>
	                    </c:choose>
	                		<span class="bookmark-count">${facility.count }</span>
	                    </div>
	                    <div class="match-btn">
	                        <button>매칭 찾기</button>
	                    </div>
                    </div> 
                </div>
            </div>
        </div>
        <div class="sub-content">
            <ul class="sub-tab">
                <li class="detail active" id="detail">
                    <div class="text">
                        상세정보 ▼
                    </div>
                </li>
                <li class="review" id="review">
                    <div class="text">
                        방문후기 ▼
                    </div>
                </li>
            </ul>
            <div class="sub-desc">          
                <ul>
                    <li>
                        <span>상세설명</span>
                        <div class="text">
                            ${fn:replace(facility.details, replaceChar, "<br/>")}
                        </div>
                    </li>
                </ul>
            </div>
            <div class="sub-review">             
                    	<c:choose>
                    		
                    		<c:when test="${not empty userInfo.user_ID }">
	                    		<div class="write-review">
	                    			<div class="profile sa-profile">
	                            <div class="img-in">
	                                <img src="${userInfo.user_Image_Url }" alt="">
	                            </div>
	                            <span>${userInfo.user_Nickname}</span>
	                        </div>
	                        <div class="sa">
	                        	<div class="star-rating">
	                                <input type="radio" id="1-stars" name="rating" value="1" class="input-star"/>
									<label for="1-stars" class="star" id="1-s"></label>
									<input type="radio" id="2-stars" name="rating" value="2" class="input-star"/>
									<label for="2-stars" class="star" id="2-s"></label>
									<input type="radio" id="3-stars" name="rating" value="3" class="input-star"/>
									<label for="3-stars" class="star" id="3-s"></label>
									<input type="radio" id="4-stars" name="rating" value="4" class="input-star"/>
									<label for="4-stars" class="star" id="4-s"></label>
									<input type="radio" id="5-stars" name="rating" value="5" class="input-star"/>
									<label for="5-stars" class="star" id="5-s"></label>
	                            </div>
	                            <div class="speech-bubble sb-writer">
	                                <textarea name="" id="" cols="30" rows="10"></textarea>
	                            </div>
	                        </div>
							<button type="button" class="delete-btn">삭제</button>
	                        <button type="button" class="submit">등록</button>
	                        </div>
                    		</c:when>
                    		<c:otherwise>
                    		<div class="write-review RS">
                    				<div class='RatingStar RS'>
									  <div class='RatingScore RSC'>
									    <div class='outer-star'><div class='inner-star'></div></div>
									    <div class="numberRating"></div>
									  </div>
									  <p>후기를 작성하려면 <span><a>로그인</a></span> 하세요.</p>
									</div>                    	
                        		
                        		</div>
                        	</c:otherwise>
                    	</c:choose>
                    
                    
                <div class="review-content">
					<ul>              
                	</ul>                
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(${facility.location_y}, ${facility.location_x}), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	var imageSrc = '/racket/resources/images/TableTennis.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(40, 40); // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(0, 0)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(${facility.location_y}, ${facility.location_x}); // 마커가 표시될 위치입니다
	

	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	position: markerPosition
	//image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null); 
	
</script>
<script type="text/javascript">
var rating = "${facility.rating}";
var table = document.querySelector('.RS');
var totalRating = 5;
function rateIt(rating) {
	ratingPercentage = rating * 20;
	ratingPercentage + 1.5;
	star = table.querySelector(".inner-star");
	numberRating = table.querySelector(".numberRating");
	star.style.width = ratingPercentage+"%";
	numberRating.innerText = rating;
}
rateIt(rating);
</script>
</body>
</html>